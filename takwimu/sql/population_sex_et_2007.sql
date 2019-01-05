--
-- PostgreSQL database dump
--

-- Dumped from database version 10.4
-- Dumped by pg_dump version 10.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;

ALTER TABLE IF EXISTS ONLY public.population_sex DROP CONSTRAINT IF EXISTS pk_population_sex;
DROP TABLE IF EXISTS public.population_sex;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: population_sex; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.population_sex (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    "Population_Sex" character varying(128) NOT NULL,
    total integer
);


--
-- Data for Name: population_sex; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.population_sex (geo_level, geo_code, geo_version, "Population_Sex", total) FROM stdin;
country	ET	2009	male	37296657
level1	ET_1_011	2009	male	2124853
level1	ET_1_002	2009	male	786338
level1	ET_1_003	2009	male	8636875
level1	ET_1_008	2009	male	13676159
level1	ET_1_010	2009	male	2468784
level1	ET_1_004	2009	male	340378
level1	ET_1_009	2009	male	7482051
level1	ET_1_006	2009	male	159679
level1	ET_1_007	2009	male	92258
level1	ET_1_001	2009	male	1304518
level1	ET_1_005	2009	male	171930
country	ET	2009	female	36621848
level1	ET_1_011	2009	female	2189603
level1	ET_1_002	2009	female	624754
level1	ET_1_003	2009	female	8577181
level1	ET_1_008	2009	female	13482312
level1	ET_1_010	2009	female	1970363
level1	ET_1_004	2009	female	330469
level1	ET_1_009	2009	female	7560480
level1	ET_1_006	2009	female	147237
level1	ET_1_007	2009	female	91086
level1	ET_1_001	2009	female	1433730
level1	ET_1_005	2009	female	170897
\.


--
-- Name: population_sex pk_population_sex; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.population_sex
    ADD CONSTRAINT pk_population_sex PRIMARY KEY (geo_level, geo_code, geo_version, "Population_Sex");


--
-- PostgreSQL database dump complete
--

