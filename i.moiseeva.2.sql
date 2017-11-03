--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.5
-- Dumped by pg_dump version 9.6.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: countries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE countries (
    country_id integer NOT NULL,
    name_of_country text NOT NULL
);


ALTER TABLE countries OWNER TO postgres;

--
-- Name: countries_country_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE countries_country_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE countries_country_id_seq OWNER TO postgres;

--
-- Name: countries_country_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE countries_country_id_seq OWNED BY countries.country_id;


--
-- Name: films; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE films (
    film_id integer NOT NULL,
    name_of_film text NOT NULL,
    film_genre text NOT NULL,
    country_id integer NOT NULL,
    group_id integer NOT NULL,
    year_of_creation integer NOT NULL,
    CONSTRAINT year CHECK ((year_of_creation <= 2017))
);


ALTER TABLE films OWNER TO postgres;

--
-- Name: films_film_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE films_film_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE films_film_id_seq OWNER TO postgres;

--
-- Name: films_film_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE films_film_id_seq OWNED BY films.film_id;


--
-- Name: genres; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE genres (
    genre_id integer NOT NULL,
    musical_genres text NOT NULL,
    country_id integer,
    first_performers text,
    year_of_creation integer,
    CONSTRAINT year CHECK ((year_of_creation <= 2017))
);


ALTER TABLE genres OWNER TO postgres;

--
-- Name: genres_genre_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE genres_genre_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE genres_genre_id_seq OWNER TO postgres;

--
-- Name: genres_genre_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE genres_genre_id_seq OWNED BY genres.genre_id;


--
-- Name: genres_instruments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE genres_instruments (
    genre_id integer NOT NULL,
    instrument_id integer NOT NULL,
    genre_instrument_id integer NOT NULL
);


ALTER TABLE genres_instruments OWNER TO postgres;

--
-- Name: genres_instruments_genres_instruments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE genres_instruments_genres_instruments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE genres_instruments_genres_instruments_id_seq OWNER TO postgres;

--
-- Name: genres_instruments_genres_instruments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE genres_instruments_genres_instruments_id_seq OWNED BY genres_instruments.genre_instrument_id;


--
-- Name: groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE groups (
    group_id integer NOT NULL,
    name_of_group text NOT NULL,
    number_of_members integer NOT NULL,
    number_of_albums integer NOT NULL,
    country_id integer NOT NULL,
    ended_career boolean NOT NULL,
    year_of_creation integer NOT NULL,
    CONSTRAINT albums CHECK ((number_of_albums > 0)),
    CONSTRAINT members CHECK ((number_of_members > 1)),
    CONSTRAINT year CHECK ((year_of_creation <= 2017))
);


ALTER TABLE groups OWNER TO postgres;

--
-- Name: groups_genres; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE groups_genres (
    group_id integer NOT NULL,
    genre_id integer NOT NULL,
    group_genre integer NOT NULL
);


ALTER TABLE groups_genres OWNER TO postgres;

--
-- Name: groups_genres_group_genre_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE groups_genres_group_genre_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE groups_genres_group_genre_seq OWNER TO postgres;

--
-- Name: groups_genres_group_genre_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE groups_genres_group_genre_seq OWNED BY groups_genres.group_genre;


--
-- Name: groups_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE groups_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE groups_group_id_seq OWNER TO postgres;

--
-- Name: groups_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE groups_group_id_seq OWNED BY groups.group_id;


--
-- Name: instruments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE instruments (
    instrument_id integer NOT NULL,
    name_of_instrument text NOT NULL
);


ALTER TABLE instruments OWNER TO postgres;

--
-- Name: instruments_instrument_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE instruments_instrument_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE instruments_instrument_id_seq OWNER TO postgres;

--
-- Name: instruments_instrument_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE instruments_instrument_id_seq OWNED BY instruments.instrument_id;


--
-- Name: countries country_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY countries ALTER COLUMN country_id SET DEFAULT nextval('countries_country_id_seq'::regclass);


--
-- Name: films film_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY films ALTER COLUMN film_id SET DEFAULT nextval('films_film_id_seq'::regclass);


--
-- Name: genres genre_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY genres ALTER COLUMN genre_id SET DEFAULT nextval('genres_genre_id_seq'::regclass);


--
-- Name: genres_instruments genre_instrument_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY genres_instruments ALTER COLUMN genre_instrument_id SET DEFAULT nextval('genres_instruments_genres_instruments_id_seq'::regclass);


--
-- Name: groups group_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY groups ALTER COLUMN group_id SET DEFAULT nextval('groups_group_id_seq'::regclass);


--
-- Name: groups_genres group_genre; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY groups_genres ALTER COLUMN group_genre SET DEFAULT nextval('groups_genres_group_genre_seq'::regclass);


--
-- Name: instruments instrument_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY instruments ALTER COLUMN instrument_id SET DEFAULT nextval('instruments_instrument_id_seq'::regclass);


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY countries (country_id, name_of_country) FROM stdin;
1	Jamaica
2	USA
3	Italy
4	France
5	Argentina
6	Austria
7	Germany
8	Portugal
9	Spain
10	Brazil
11	Great_Britain
12	Russian_Federation
13	Latin_America
\.


--
-- Name: countries_country_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('countries_country_id_seq', 13, true);


--
-- Data for Name: films; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY films (film_id, name_of_film, film_genre, country_id, group_id, year_of_creation) FROM stdin;
2	Lilya_4ever	drama	12	1	2002
3	Equipage	thriller	12	2	2016
4	Thor:Ragnarok	fantasy	2	3	2017
5	Stilyagi	melodrama	12	5	2008
6	Freejack	thriller	2	6	1992
7	Sorcerer's_Apprentice	fantasy	2	7	2010
8	Valetine's_Day	melodrama	2	8	2010
9	99_francs	drama	4	9	2007
10	Let_It_Be	documental	11	10	1970
11	Cocain	criminal	2	11	2001
12	Ghost_Rider	fantasy	2	12	2007
13	TRON	fantasy	2	13	2010
14	Rubbeldiekatz	comedy	7	14	2011
15	Mike_and_Molly	comedy	2	15	2010
16	Pan	fantasy	2	4	2015
\.


--
-- Name: films_film_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('films_film_id_seq', 16, true);


--
-- Data for Name: genres; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY genres (genre_id, musical_genres, country_id, first_performers, year_of_creation) FROM stdin;
5	Folk	\N	Bob_Dylan	\N
6	Classical_music	\N	Mihail_Glinka	\N
7	Blues	2	Hart_Wand	1912
8	Musica_latinoamericana	13	Victor_Hara	1600
9	Rhythm_and_Blues	2	Arthur_Crudup	1940
10	Jazz	2	Charles_Parker	1910
11	Country_music	2	\N	1920
12	Chanson	4	Edith_Piaf	1860
13	Electronic_music	12	Lev_Termen	1919
14	Rock	2	Fats_Domino	1950
15	Reggae	1	Bob_Marley	1970
16	Pop-music	2	Michael_Jackson	1950
17	Disco	2	Diana_Ross	1970
18	Hip-hop	2	DJ_Kool_Herc	1974
19	Ska	1	Prince_Buster	1950
\.


--
-- Name: genres_genre_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('genres_genre_id_seq', 19, true);


--
-- Data for Name: genres_instruments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY genres_instruments (genre_id, instrument_id, genre_instrument_id) FROM stdin;
5	1	1
5	10	2
5	19	3
5	20	4
5	21	5
5	22	6
6	2	7
6	9	8
6	13	9
6	15	10
6	18	11
7	1	12
7	2	13
7	20	14
8	1	15
7	6	16
9	6	17
9	1	18
9	12	19
10	6	20
10	1	21
10	5	22
10	2	23
10	15	24
10	16	25
10	3	26
11	1	27
11	7	28
11	20	29
12	1	30
12	2	31
12	9	32
12	13	33
13	4	34
14	1	35
14	4	36
14	5	37
14	14	38
15	1	39
15	5	40
15	14	41
16	1	42
16	4	43
16	2	44
16	5	45
16	9	46
17	1	47
17	3	48
17	4	49
17	9	50
17	11	51
18	1	52
18	4	53
18	5	54
19	6	55
19	11	56
19	12	57
19	5	58
19	13	59
\.


--
-- Name: genres_instruments_genres_instruments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('genres_instruments_genres_instruments_id_seq', 59, true);


--
-- Data for Name: groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY groups (group_id, name_of_group, number_of_members, number_of_albums, country_id, ended_career, year_of_creation) FROM stdin;
12	ZZ_Top	3	15	2	f	1969
13	Daft_Punk	2	4	4	f	1993
10	Beatles	4	13	11	t	1960
14	The_Bosshoss	9	8	7	f	2004
15	Oak_Ridge_Boys	4	31	2	f	1947
4	Nirvana	2	5	2	t	1967
5	Kino	4	8	12	t	1982
11	Rolling_Stones	4	7	11	f	1962
3	Led_Zeppelin	4	9	11	t	1968
8	Black_Eyed_Peas	3	8	2	f	1995
9	De-Phazz	7	12	7	f	1997
6	Scorpions	5	18	7	f	1967
7	One_Republic	5	4	2	f	2002
2	Red_Hot_Chili_Peppers	4	11	2	f	1983
1	Rammstein	6	6	7	f	1994
\.


--
-- Data for Name: groups_genres; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY groups_genres (group_id, genre_id, group_genre) FROM stdin;
1	14	1
2	14	2
3	14	3
3	5	4
4	14	5
5	14	6
6	14	7
7	16	8
8	16	9
8	18	10
9	10	11
10	14	12
11	14	13
11	9	14
12	7	15
13	13	16
14	11	17
15	9	18
\.


--
-- Name: groups_genres_group_genre_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('groups_genres_group_genre_seq', 18, true);


--
-- Name: groups_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('groups_group_id_seq', 15, true);


--
-- Data for Name: instruments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY instruments (instrument_id, name_of_instrument) FROM stdin;
1	guitar
2	piano
3	flute
4	synthesizer
5	drum
6	saxophone
7	harmonic
8	accordion
9	violin
10	balalaika
11	trumpet
12	trombone
13	contrabass
14	bass_guitar
15	clarinet
16	french_horn
17	tambourine
18	clavecin
19	domra
20	banjo
21	lute
22	zither
\.


--
-- Name: instruments_instrument_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('instruments_instrument_id_seq', 22, true);


--
-- Name: countries countries_name_of_country_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY countries
    ADD CONSTRAINT countries_name_of_country_key UNIQUE (name_of_country);


--
-- Name: countries countries_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY countries
    ADD CONSTRAINT countries_pk PRIMARY KEY (country_id);


--
-- Name: films films_name_of_film_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY films
    ADD CONSTRAINT films_name_of_film_key UNIQUE (name_of_film);


--
-- Name: films films_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY films
    ADD CONSTRAINT films_pk PRIMARY KEY (film_id);


--
-- Name: genres_instruments genres_instruments_genres_instruments_id_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY genres_instruments
    ADD CONSTRAINT genres_instruments_genres_instruments_id_pk PRIMARY KEY (genre_instrument_id);


--
-- Name: genres genres_musical_genres_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY genres
    ADD CONSTRAINT genres_musical_genres_key UNIQUE (musical_genres);


--
-- Name: genres genres_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY genres
    ADD CONSTRAINT genres_pk PRIMARY KEY (genre_id);


--
-- Name: groups_genres groups_genres_group_genre_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY groups_genres
    ADD CONSTRAINT groups_genres_group_genre_pk PRIMARY KEY (group_genre);


--
-- Name: groups groups_name_of_group_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY groups
    ADD CONSTRAINT groups_name_of_group_key UNIQUE (name_of_group);


--
-- Name: groups groups_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY groups
    ADD CONSTRAINT groups_pk PRIMARY KEY (group_id);


--
-- Name: instruments instruments_name_of_instrument_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY instruments
    ADD CONSTRAINT instruments_name_of_instrument_key UNIQUE (name_of_instrument);


--
-- Name: instruments instruments_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY instruments
    ADD CONSTRAINT instruments_pk PRIMARY KEY (instrument_id);


--
-- Name: films films_fk0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY films
    ADD CONSTRAINT films_fk0 FOREIGN KEY (country_id) REFERENCES countries(country_id);


--
-- Name: films films_fk1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY films
    ADD CONSTRAINT films_fk1 FOREIGN KEY (group_id) REFERENCES groups(group_id);


--
-- Name: genres genres_fk0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY genres
    ADD CONSTRAINT genres_fk0 FOREIGN KEY (country_id) REFERENCES countries(country_id);


--
-- Name: genres_instruments genres_instruments_fk0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY genres_instruments
    ADD CONSTRAINT genres_instruments_fk0 FOREIGN KEY (genre_id) REFERENCES genres(genre_id);


--
-- Name: genres_instruments genres_instruments_fk1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY genres_instruments
    ADD CONSTRAINT genres_instruments_fk1 FOREIGN KEY (instrument_id) REFERENCES instruments(instrument_id);


--
-- Name: groups groups_fk1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY groups
    ADD CONSTRAINT groups_fk1 FOREIGN KEY (country_id) REFERENCES countries(country_id);


--
-- Name: groups_genres groups_genres_fk0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY groups_genres
    ADD CONSTRAINT groups_genres_fk0 FOREIGN KEY (group_id) REFERENCES groups(group_id);


--
-- Name: groups_genres groups_genres_fk1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY groups_genres
    ADD CONSTRAINT groups_genres_fk1 FOREIGN KEY (genre_id) REFERENCES genres(genre_id);


--
-- PostgreSQL database dump complete
--

