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

ALTER TABLE IF EXISTS ONLY public.human_dev_indices DROP CONSTRAINT IF EXISTS pk_human_dev_indices;
DROP TABLE IF EXISTS public.human_dev_indices;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: human_dev_indices; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.human_dev_indices (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    human_dev_indices character varying(5) NOT NULL,
    total numeric
);


--
-- Data for Name: human_dev_indices; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.human_dev_indices (geo_level, geo_code, geo_version, human_dev_indices, total) FROM stdin;
country	NG	2009	HDI	0.4643
level1	NG_1_001	2009	HDI	0.5406
level1	NG_1_002	2009	HDI	0.4286
level1	NG_1_003	2009	HDI	0.5642
level1	NG_1_004	2009	HDI	0.4709
level1	NG_1_005	2009	HDI	0.3238
level1	NG_1_006	2009	HDI	0.5909
level1	NG_1_007	2009	HDI	0.4624
level1	NG_1_008	2009	HDI	0.3276
level1	NG_1_009	2009	HDI	0.551
level1	NG_1_010	2009	HDI	0.5564
level1	NG_1_011	2009	HDI	0.4343
level1	NG_1_012	2009	HDI	0.5299
level1	NG_1_013	2009	HDI	0.5608
level1	NG_1_014	2009	HDI	0.5405
level1	NG_1_015	2009	HDI	0.6289
level1	NG_1_016	2009	HDI	0.401
level1	NG_1_017	2009	HDI	0.5182
level1	NG_1_018	2009	HDI	0.3596
level1	NG_1_019	2009	HDI	0.4043
level1	NG_1_020	2009	HDI	0.3592
level1	NG_1_021	2009	HDI	0.3031
level1	NG_1_022	2009	HDI	0.3815
level1	NG_1_023	2009	HDI	0.4509
level1	NG_1_024	2009	HDI	0.5112
level1	NG_1_025	2009	HDI	0.6515
level1	NG_1_026	2009	HDI	0.5063
level1	NG_1_027	2009	HDI	0.3991
level1	NG_1_028	2009	HDI	0.5493
level1	NG_1_029	2009	HDI	0.5002
level1	NG_1_030	2009	HDI	0.5123
level1	NG_1_031	2009	HDI	0.4401
level1	NG_1_032	2009	HDI	0.4629
level1	NG_1_033	2009	HDI	0.5422
level1	NG_1_034	2009	HDI	0.291
level1	NG_1_035	2009	HDI	0.4613
level1	NG_1_036	2009	HDI	0.3249
level1	NG_1_037	2009	HDI	0.3392
\.


--
-- Name: human_dev_indices pk_human_dev_indices; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.human_dev_indices
    ADD CONSTRAINT pk_human_dev_indices PRIMARY KEY (geo_level, geo_code, geo_version, human_dev_indices);


--
-- PostgreSQL database dump complete
--
