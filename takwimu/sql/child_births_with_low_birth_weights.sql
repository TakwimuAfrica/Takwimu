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

ALTER TABLE IF EXISTS ONLY public.child_births_with_low_birth_weights DROP CONSTRAINT IF EXISTS pk_child_births_with_low_birth_weights;
DROP TABLE IF EXISTS public.child_births_with_low_birth_weights;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: child_births_with_low_birth_weights; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.child_births_with_low_birth_weights (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    low_birth_weights character varying(128) NOT NULL,
    total integer
);


--
-- Data for Name: child_births_with_low_birth_weights; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.child_births_with_low_birth_weights (geo_level, geo_code, geo_version, low_birth_weights, total) FROM stdin;
country	NG	2009	low birth weights	15
level1	NG_1_015	2009	low birth weights	5
level1	NG_1_007	2009	low birth weights	4
level1	NG_1_023	2009	low birth weights	7
level1	NG_1_024	2009	low birth weights	2
level1	NG_1_026	2009	low birth weights	21
level1	NG_1_027	2009	low birth weights	14
level1	NG_1_032	2009	low birth weights	9
level1	NG_1_002	2009	low birth weights	20
level1	NG_1_005	2009	low birth weights	9
level1	NG_1_008	2009	low birth weights	11
level1	NG_1_016	2009	low birth weights	13
level1	NG_1_035	2009	low birth weights	10
level1	NG_1_019	2009	low birth weights	36
level1	NG_1_020	2009	low birth weights	3
level1	NG_1_034	2009	low birth weights	0
level1	NG_1_001	2009	low birth weights	2
level1	NG_1_004	2009	low birth weights	2
level1	NG_1_011	2009	low birth weights	8
level1	NG_1_014	2009	low birth weights	7
level1	NG_1_017	2009	low birth weights	5
level1	NG_1_003	2009	low birth weights	10
level1	NG_1_006	2009	low birth weights	12
level1	NG_1_009	2009	low birth weights	13
level1	NG_1_010	2009	low birth weights	8
level1	NG_1_012	2009	low birth weights	9
level1	NG_1_033	2009	low birth weights	18
level1	NG_1_013	2009	low birth weights	7
level1	NG_1_025	2009	low birth weights	4
level1	NG_1_028	2009	low birth weights	4
level1	NG_1_029	2009	low birth weights	8
level1	NG_1_030	2009	low birth weights	1
level1	NG_1_031	2009	low birth weights	3
\.


--
-- Name: child_births_with_low_birth_weights pk_child_births_with_low_birth_weights; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.child_births_with_low_birth_weights
    ADD CONSTRAINT pk_child_births_with_low_birth_weights PRIMARY KEY (geo_level, geo_code, geo_version, low_birth_weights);


--
-- PostgreSQL database dump complete
--

