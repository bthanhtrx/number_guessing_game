#!/bin/bash

PSQL='psql -X --username=freecodecamp --dbname=number_guess --tuples-only -c'

echo "Enter your username:"
read USERNAME

USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'");

TARGET_NUMBER=$(( (RANDOM % 1000) + 1 ))
echo target is $TARGET_NUMBER
if [[ -z $USER_ID ]]
then
  echo Welcome, $USERNAME! It looks like this is your first time here.
  INSERT_USER_RESULT=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")
  BEST_GAME=1000
else
  GAMES_PLAYED=$($PSQL "SELECT games_played FROM users WHERE user_id=$USER_ID")
  BEST_GAME=$($PSQL "SELECT best_game FROM users WHERE user_id = $USER_ID")

  echo Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses.
fi

GUESSING_NUMBER=0
GUESS_TRIES=0
(( GAMES_PLAYED++ ))

while [[ $GUESSING_NUMBER -ne $TARGET_NUMBER ]]
do
  echo -e "\nGuess the secret number between 1 and 1000:\n"
  read GUESSING_NUMBER

  if [[ ! $GUESSING_NUMBER =~ ^[0-9]+$ ]]
  then 
    echo -e "\nThat is not an integer, guess again:"
    continue
  fi

  (( GUESS_TRIES++ ))

  if [[ $GUESSING_NUMBER -gt $TARGET_NUMBER ]]
  then
    echo -e "\nIt's lower than that, guess again:"
  elif [[ $GUESSING_NUMBER -lt $TARGET_NUMBER ]]
  then
    echo -e "\nIt's higher than that, guess again:"
  else
    echo -e "\nYou guessed it in $GUESS_TRIES tries. The secret number was $TARGET_NUMBER. Nice job!"
    if [[ $GUESS_TRIES -lt $BEST_GAME ]]
    then
      BEST_GAME=$GUESS_TRIES
    fi

    UPDATE_USER_DATA_RESULT=$($PSQL "UPDATE users SET games_played = $GAMES_PLAYED, best_game = $BEST_GAME WHERE username='$USERNAME'")
  fi

done