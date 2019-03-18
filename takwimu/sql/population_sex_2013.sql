--
-- PostgreSQL database dump
--

-- Dumped from database version 10.5
-- Dumped by pg_dump version 10.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;

ALTER TABLE IF EXISTS ONLY public.population_sex_2013 DROP CONSTRAINT IF EXISTS pk_population_sex_2013;
DROP TABLE IF EXISTS public.population_sex_2013;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: population_sex_2013; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.population_sex_2013 (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    population_sex_2013 character varying(128) NOT NULL,
    total integer
);


--
-- Data for Name: population_sex_2013; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.population_sex_2013 (geo_level, geo_code, geo_version, population_sex_2013, total) FROM stdin;
country	SN	2009	male	6735421
country	SN	2009	female	6773294
level1	SN_1_001	2009	male	1466748
level1	SN_1_001	2009	female	1460674
level1	SN_1_002	2009	male	748250
level1	SN_1_002	2009	female	813727
level1	SN_1_003	2009	male	428902
level1	SN_1_003	2009	female	432346
level1	SN_1_004	2009	male	316401
level1	SN_1_004	2009	female	321898
level1	SN_1_005	2009	male	445084
level1	SN_1_005	2009	female	465256
level1	SN_1_006	2009	male	72517
level1	SN_1_006	2009	female	76367
level1	SN_1_007	2009	male	347161
level1	SN_1_007	2009	female	344101
level1	SN_1_008	2009	male	482001
level1	SN_1_008	2009	female	499092
level1	SN_1_009	2009	male	300538
level1	SN_1_009	2009	female	320392
level1	SN_1_010	2009	male	503665
level1	SN_1_010	2009	female	521247
level1	SN_1_011	2009	male	244380
level1	SN_1_011	2009	female	249185
level1	SN_1_012	2009	male	372837
level1	SN_1_012	2009	female	373281
level1	SN_1_013	2009	male	945267
level1	SN_1_013	2009	female	943070
level1	SN_1_014	2009	male	403799
level1	SN_1_014	2009	female	405006
\.


--
-- Name: population_sex_2013 pk_population_sex_2013; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.population_sex_2013
    ADD CONSTRAINT pk_population_sex_2013 PRIMARY KEY (geo_level, geo_code, geo_version, population_sex_2013);


--
-- PostgreSQL database dump complete
--

