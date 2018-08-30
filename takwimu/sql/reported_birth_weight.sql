--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.13
-- Dumped by pg_dump version 9.6.7

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET search_path = public, pg_catalog;

ALTER TABLE IF EXISTS ONLY public.reported_birth_weight DROP CONSTRAINT IF EXISTS pk_reported_birth_weight;
DROP TABLE IF EXISTS public.reported_birth_weight;
SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: reported_birth_weight; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE reported_birth_weight (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    reported_birth_weight character varying(128) NOT NULL,
    total integer
);


--
-- Data for Name: reported_birth_weight; Type: TABLE DATA; Schema: public; Owner: -
--

COPY reported_birth_weight (geo_level, geo_code, geo_version, reported_birth_weight, total) FROM stdin;
level1	NG_1_001	2009	birth weight	57
level1	NG_1_002	2009	birth weight	15
level1	NG_1_003	2009	birth weight	18
level1	NG_1_004	2009	birth weight	67
level1	NG_1_005	2009	birth weight	2
level1	NG_1_006	2009	birth weight	12
level1	NG_1_007	2009	birth weight	6
level1	NG_1_008	2009	birth weight	5
level1	NG_1_009	2009	birth weight	13
level1	NG_1_010	2009	birth weight	34
level1	NG_1_011	2009	birth weight	17
level1	NG_1_012	2009	birth weight	47
level1	NG_1_013	2009	birth weight	41
level1	NG_1_014	2009	birth weight	47
level1	NG_1_015	2009	birth weight	43
level1	NG_1_016	2009	birth weight	4
level1	NG_1_017	2009	birth weight	55
level1	NG_1_018	2009	birth weight	1
level1	NG_1_019	2009	birth weight	22
level1	NG_1_020	2009	birth weight	3
level1	NG_1_021	2009	birth weight	1
level1	NG_1_022	2009	birth weight	1
level1	NG_1_023	2009	birth weight	30
level1	NG_1_024	2009	birth weight	26
level1	NG_1_025	2009	birth weight	54
level1	NG_1_026	2009	birth weight	5
level1	NG_1_027	2009	birth weight	7
level1	NG_1_028	2009	birth weight	34
level1	NG_1_029	2009	birth weight	12
level1	NG_1_030	2009	birth weight	75
level1	NG_1_031	2009	birth weight	30
level1	NG_1_032	2009	birth weight	9
level1	NG_1_033	2009	birth weight	32
level1	NG_1_034	2009	birth weight	2
level1	NG_1_035	2009	birth weight	10
level1	NG_1_036	2009	birth weight	1
level1	NG_1_037	2009	birth weight	0
country	NG	2009	birth weight	16
\.


--
-- Name: reported_birth_weight pk_reported_birth_weight; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY reported_birth_weight
    ADD CONSTRAINT pk_reported_birth_weight PRIMARY KEY (geo_level, geo_code, geo_version, reported_birth_weight);


--
-- PostgreSQL database dump complete
--