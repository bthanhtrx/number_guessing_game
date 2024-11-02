--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22),
    games_played integer DEFAULT 0,
    best_game integer DEFAULT 0
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (27, 'user_1730522382923', 2, 649);
INSERT INTO public.users VALUES (26, 'user_1730522382924', 5, 335);
INSERT INTO public.users VALUES (29, 'user_1730522395426', 2, 713);
INSERT INTO public.users VALUES (28, 'user_1730522395427', 5, 171);
INSERT INTO public.users VALUES (31, 'user_1730522410986', 2, 332);
INSERT INTO public.users VALUES (30, 'user_1730522410987', 5, 588);
INSERT INTO public.users VALUES (33, 'user_1730533953092', 2, 441);
INSERT INTO public.users VALUES (32, 'user_1730533953093', 5, 63);
INSERT INTO public.users VALUES (62, 'user_1730536329990', 2, 141);
INSERT INTO public.users VALUES (35, 'user_1730534348297', 2, 71);
INSERT INTO public.users VALUES (61, 'user_1730536329991', 5, 51);
INSERT INTO public.users VALUES (34, 'user_1730534348298', 5, 38);
INSERT INTO public.users VALUES (37, 'user_1730534420981', 2, 546);
INSERT INTO public.users VALUES (64, 'user_1730536414902', 2, 57);
INSERT INTO public.users VALUES (36, 'user_1730534420982', 5, 112);
INSERT INTO public.users VALUES (38, 'layton', 1, 5);
INSERT INTO public.users VALUES (63, 'user_1730536414903', 5, 146);
INSERT INTO public.users VALUES (40, 'user_1730534475618', 2, 145);
INSERT INTO public.users VALUES (25, 'nero', 5, 3);
INSERT INTO public.users VALUES (39, 'user_1730534475619', 5, 161);
INSERT INTO public.users VALUES (41, 'batman', 1, 5);
INSERT INTO public.users VALUES (42, 'andy', 0, 1000);
INSERT INTO public.users VALUES (43, 'nana', 0, 0);
INSERT INTO public.users VALUES (44, 'user_1730535622296', 0, 0);
INSERT INTO public.users VALUES (45, 'user_1730535622295', 0, 0);
INSERT INTO public.users VALUES (46, 'haha', 0, 0);
INSERT INTO public.users VALUES (47, 'hlea', 0, 0);
INSERT INTO public.users VALUES (48, 'good', 0, 0);
INSERT INTO public.users VALUES (49, 'great', 0, 0);
INSERT INTO public.users VALUES (50, 'mee', 0, 0);
INSERT INTO public.users VALUES (52, 'user_1730535991206', 2, 721);
INSERT INTO public.users VALUES (51, 'user_1730535991207', 5, 25);
INSERT INTO public.users VALUES (53, 'user_1730536114900', 0, 0);
INSERT INTO public.users VALUES (54, 'user_1730536114899', 0, 0);
INSERT INTO public.users VALUES (56, 'user_1730536178882', 2, 83);
INSERT INTO public.users VALUES (55, 'user_1730536178883', 5, 258);
INSERT INTO public.users VALUES (58, 'user_1730536244705', 2, 136);
INSERT INTO public.users VALUES (57, 'user_1730536244706', 5, 73);
INSERT INTO public.users VALUES (60, 'user_1730536268111', 2, 276);
INSERT INTO public.users VALUES (59, 'user_1730536268112', 5, 6);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 64, true);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- PostgreSQL database dump complete
--

