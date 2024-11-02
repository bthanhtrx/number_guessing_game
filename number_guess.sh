#!/bin/bash

PSQL='psql -X --username=freecodecamp --dbname=number_guess --tuples-only -c'

echo "Enter your username:"
read USER_INPUT

USERNAME=$($PSQL "SELECT username FROM users WHERE username='$USER_INPUT'");
USERNAME=$(echo $USERNAME | sed 's/^ *//')

TARGET_NUMBER=$(( (RANDOM % 1000) + 1 ))
echo target is $TARGET_NUMBER

if [[ -z $USERNAME ]]
then
  INSERT_USER_RESULT=$($PSQL "INSERT INTO users(username) VALUES('$USER_INPUT')")
  if [[ $INSERT_USER_RESULT == 'INSERT 0 1' ]]
  then
    USERNAME=$($PSQL "SELECT username FROM users WHERE username='$USER_INPUT'");
  fi
  USERNAME=$(echo $USERNAME | sed 's/^ *//')

  echo Welcome, $USERNAME! It looks like this is your first time here.
  BEST_GAME=1000
else
  GAMES_PLAYED=$($PSQL "SELECT games_played FROM users WHERE username='$USER_INPUT'")
  BEST_GAME=$($PSQL "SELECT best_game FROM users WHERE username='$USER_INPUT'")

  echo games: $GAMES_PLAYED, $BEST_GAME
  echo Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses.
fi

GUESSING_NUMBER=0
GUESS_TRIES=0
(( GAMES_PLAYED++ ))

echo -e "\nGuess the secret number between 1 and 1000:\n"
while [[ $GUESSING_NUMBER -ne $TARGET_NUMBER ]]
do
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
    if [[ $GUESS_TRIES -lt $BEST_GAME ]]
    then
      BEST_GAME=$GUESS_TRIES
    fi
    
    UPDATE_USER_DATA_RESULT=$($PSQL "UPDATE users SET games_played = $GAMES_PLAYED, best_game = $BEST_GAME WHERE username='$USERNAME'")
   
    echo -e "\nYou guessed it in $GUESS_TRIES tries. The secret number was $TARGET_NUMBER. Nice job!"
  fi

done