--
-- PostgreSQL database dump
--

-- Dumped from database version 10.0
-- Dumped by pg_dump version 10.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;

ALTER TABLE IF EXISTS ONLY public.hiv_health_centers DROP CONSTRAINT IF EXISTS pk_hiv_health_centers;
DROP TABLE IF EXISTS public.hiv_health_centers;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: hiv_health_centers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.hiv_health_centers (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    centers character varying(128) NOT NULL,
    total integer
);


--
-- Data for Name: hiv_health_centers; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.hiv_health_centers (geo_level, geo_code, geo_version, centers, total) FROM stdin;
level1	TZ_1_001	2009	hiv centers	68
level1	TZ_1_003	2009	hiv centers	138
level1	TZ_1_002	2009	hiv centers	55
level1	TZ_1_004	2009	hiv centers	53
level1	TZ_1_005	2009	hiv centers	125
level1	TZ_1_006	2009	hiv centers	269
level1	TZ_1_009	2009	hiv centers	46
level1	TZ_1_010	2009	hiv centers	84
level1	TZ_1_011	2009	hiv centers	52
level1	TZ_1_014	2009	hiv centers	102
level1	TZ_1_015	2009	hiv centers	87
level1	TZ_1_016	2009	hiv centers	87
level1	TZ_1_017	2009	hiv centers	317
level1	TZ_1_018	2009	hiv centers	70
level1	TZ_1_019	2009	hiv centers	97
level1	TZ_1_020	2009	hiv centers	276
level1	TZ_1_021	2009	hiv centers	27
level1	TZ_1_022	2009	hiv centers	204
level1	TZ_1_023	2009	hiv centers	112
level1	TZ_1_024	2009	hiv centers	81
level1	TZ_1_025	2009	hiv centers	91
level1	TZ_1_026	2009	hiv centers	34
level1	TZ_1_027	2009	hiv centers	113
level1	TZ_1_029	2009	hiv centers	84
level1	TZ_1_028	2009	hiv centers	0
level1	TZ_1_007	2009	hiv centers	0
level1	TZ_1_008	2009	hiv centers	0
level1	TZ_1_012	2009	hiv centers	0
level1	TZ_1_013	2009	hiv centers	0
level1	TZ_1_030	2009	hiv centers	0
country	TZ	2009	hiv centers	2672
\.


--
-- Name: hiv_health_centers pk_hiv_health_centers; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.hiv_health_centers
    ADD CONSTRAINT pk_hiv_health_centers PRIMARY KEY (geo_level, geo_code, geo_version, centers);


--
-- PostgreSQL database dump complete
--

