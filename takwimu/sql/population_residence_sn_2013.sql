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

ALTER TABLE IF EXISTS ONLY public.population_residence_sn_2013 DROP CONSTRAINT IF EXISTS pk_population_residence_sn_2013;
DROP TABLE IF EXISTS public.population_residence_sn_2013;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: population_residence_sn_2013; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.population_residence_sn_2013 (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    "Population_Residence_Sn_2013" character varying(128) NOT NULL,
    total integer
);


--
-- Data for Name: population_residence_sn_2013; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.population_residence_sn_2013 (geo_level, geo_code, geo_version, "Population_Residence_Sn_2013", total) FROM stdin;
country	SN	2009	urban	6102800
country	SN	2009	rural	7405915
level1	SN_1_001	2009	urban	2845954
level1	SN_1_001	2009	rural	81468
level1	SN_1_002	2009	urban	241416
level1	SN_1_002	2009	rural	1320561
level1	SN_1_003	2009	urban	113130
level1	SN_1_003	2009	rural	748118
level1	SN_1_004	2009	urban	76183
level1	SN_1_004	2009	rural	562116
level1	SN_1_005	2009	urban	288289
level1	SN_1_005	2009	rural	622051
level1	SN_1_006	2009	urban	24407
level1	SN_1_006	2009	rural	124477
level1	SN_1_007	2009	urban	145120
level1	SN_1_007	2009	rural	546142
level1	SN_1_008	2009	urban	181072
level1	SN_1_008	2009	rural	800021
level1	SN_1_009	2009	urban	105066
level1	SN_1_009	2009	rural	515864
level1	SN_1_010	2009	urban	105066
level1	SN_1_010	2009	rural	515864
level1	SN_1_011	2009	urban	76841
level1	SN_1_011	2009	rural	416724
level1	SN_1_012	2009	urban	155388
level1	SN_1_012	2009	rural	590730
level1	SN_1_013	2009	urban	834185
level1	SN_1_013	2009	rural	1054152
level1	SN_1_014	2009	urban	381420
level1	SN_1_014	2009	rural	427385
\.


--
-- Name: population_residence_sn_2013 pk_population_residence_sn_2013; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.population_residence_sn_2013
    ADD CONSTRAINT pk_population_residence_sn_2013 PRIMARY KEY (geo_level, geo_code, geo_version, "Population_Residence_Sn_2013");


--
-- PostgreSQL database dump complete
--

