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
-- Name: user_info; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.user_info (
    username character varying(22),
    games_played integer,
    best_game integer,
    user_id integer NOT NULL
);


ALTER TABLE public.user_info OWNER TO freecodecamp;

--
-- Name: user_info_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.user_info_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_info_user_id_seq OWNER TO freecodecamp;

--
-- Name: user_info_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.user_info_user_id_seq OWNED BY public.user_info.user_id;


--
-- Name: user_info user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.user_info ALTER COLUMN user_id SET DEFAULT nextval('public.user_info_user_id_seq'::regclass);


--
-- Data for Name: user_info; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.user_info VALUES ('Lucas', 0, NULL, 4);
INSERT INTO public.user_info VALUES ('user_1728153828183', 0, NULL, 5);
INSERT INTO public.user_info VALUES ('user_1728153828182', 0, NULL, 6);
INSERT INTO public.user_info VALUES ('dANIEL', 0, NULL, 7);
INSERT INTO public.user_info VALUES ('user_1728155873641', 0, NULL, 8);
INSERT INTO public.user_info VALUES ('user_1728155873640', 0, NULL, 9);
INSERT INTO public.user_info VALUES ('user_1728157035214', 2, 137, 19);
INSERT INTO public.user_info VALUES ('user_1728156654277', 2, 64, 11);
INSERT INTO public.user_info VALUES ('user_1728156654278', 5, 91, 10);
INSERT INTO public.user_info VALUES ('Daniel', 3, 1, 3);
INSERT INTO public.user_info VALUES ('user_1728157035215', 6, 256, 18);
INSERT INTO public.user_info VALUES ('user_1728156745507', 2, 733, 13);
INSERT INTO public.user_info VALUES ('user_1728157067600', 2, 61, 21);
INSERT INTO public.user_info VALUES ('user_1728156745508', 6, 137, 12);
INSERT INTO public.user_info VALUES ('user_1728157067601', 6, 413, 20);
INSERT INTO public.user_info VALUES ('user_1728156830784', 2, 157, 15);
INSERT INTO public.user_info VALUES ('user_1728157085598', 2, 738, 23);
INSERT INTO public.user_info VALUES ('user_1728156830785', 6, 68, 14);
INSERT INTO public.user_info VALUES ('user_1728157085599', 6, 137, 22);
INSERT INTO public.user_info VALUES ('user_1728156907107', 2, 356, 17);
INSERT INTO public.user_info VALUES ('user_1728156907108', 6, 375, 16);


--
-- Name: user_info_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.user_info_user_id_seq', 23, true);


--
-- Name: user_info user_info_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.user_info
    ADD CONSTRAINT user_info_pkey PRIMARY KEY (user_id);


--
-- PostgreSQL database dump complete
--

