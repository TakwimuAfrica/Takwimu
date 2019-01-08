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

ALTER TABLE IF EXISTS ONLY public.population_sex_2011 DROP CONSTRAINT IF EXISTS pk_population_sex_2011;
DROP TABLE IF EXISTS public.population_sex_2011;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: population_sex_2011; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.population_sex_2011 (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    "Population_Sex" character varying(128) NOT NULL,
    total integer
);


--
-- Data for Name: population_sex_2011; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.population_sex_2011 (geo_level, geo_code, geo_version, "Population_Sex", total) FROM stdin;
country	TZ	2009	male	21869990
level1	ZA_1_008	2009	Male	3096457
level1	ZA_1_008	2009	Female	3183273
level1	ZA_1_003	2009	Male	3327495
level1	ZA_1_003	2009	Female	3669481
level1	ZA_1_006	2009	Male	596421
level1	ZA_1_006	2009	Female	597359
level1	ZA_1_002	2009	Male	1379965
level1	ZA_1_002	2009	Female	1454749
level1	ZA_1_001	2009	Male	5306295
level1	ZA_1_001	2009	Female	5758945
level1	ZA_1_007	2009	Male	1909589
level1	ZA_1_007	2009	Female	1838846
level1	ZA_1_009	2009	Male	6753269
level1	ZA_1_009	2009	Female	6646455
level1	ZA_1_004	2009	Male	2139187
level1	ZA_1_004	2009	Female	2196776
level1	ZA_1_005	2009	Male	2738547
level1	ZA_1_005	2009	Female	3060543
country	ZA	2009	Male	27247226
country	ZA	2009	Female	28406428
\.


--
-- Name: population_sex pk_population_sex_2011; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.population_sex_2011
    ADD CONSTRAINT pk_population_sex_2011 PRIMARY KEY (geo_level, geo_code, geo_version, "Population_Sex");


--
-- PostgreSQL database dump complete
--

