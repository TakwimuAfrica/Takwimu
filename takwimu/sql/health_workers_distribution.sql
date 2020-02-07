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

ALTER TABLE IF EXISTS ONLY public.health_workers_distribution DROP CONSTRAINT IF EXISTS pk_health_workers_distribution;
DROP TABLE IF EXISTS public.health_workers_distribution;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: health_workers_distribution; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.health_workers_distribution (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    year character varying(128) NOT NULL,
    workers character varying(128) NOT NULL,
    total integer
);


--
-- Data for Name: health_workers_distribution; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.health_workers_distribution (geo_level, geo_code, geo_version, year, workers, total) FROM stdin;
country	KE	2009	2014	(BSc) Nurses	2406
country	KE	2009	2015	(BSc) Nurses	2904
country	KE	2009	2016	(BSc) Nurses	4002
country	KE	2009	2017	(BSc) Nurses	4819
country	KE	2009	2018	(BSc) Nurses	4974
country	KE	2009	2014	Clinical officers	15960
country	KE	2009	2015	Clinical officers	15443
country	KE	2009	2016	Clinical officers	18674
country	KE	2009	2017	Clinical officers	20680
country	KE	2009	2018	Clinical officers	22626
country	KE	2009	2014	Dentists	1090
country	KE	2009	2015	Dentists	1094
country	KE	2009	2016	Dentists	1149
country	KE	2009	2017	Dentists	1206
country	KE	2009	2018	Dentists	1270
country	KE	2009	2014	Enrolled nurses	22101
country	KE	2009	2015	Enrolled nurses	22305
country	KE	2009	2016	Enrolled nurses	22820
country	KE	2009	2017	Enrolled nurses	23068
country	KE	2009	2018	Enrolled nurses	23112
country	KE	2009	2014	Laboratory technicians	0
country	KE	2009	2015	Laboratory technicians	1363
country	KE	2009	2016	Laboratory technicians	1734
country	KE	2009	2017	Laboratory technicians	3065
country	KE	2009	2018	Laboratory technicians	3622
country	KE	2009	2014	Laboratory technologists	0
country	KE	2009	2015	Laboratory technologists	4230
country	KE	2009	2016	Laboratory technologists	6651
country	KE	2009	2017	Laboratory technologists	10603
country	KE	2009	2018	Laboratory technologists	11688
country	KE	2009	2014	Medical officers	9149
country	KE	2009	2015	Medical officers	9605
country	KE	2009	2016	Medical officers	10376
country	KE	2009	2017	Medical officers	10921
country	KE	2009	2018	Medical officers	11667
country	KE	2009	2014	Nutrition & dietetic technicians	277
country	KE	2009	2015	Nutrition & dietetic technicians	378
country	KE	2009	2016	Nutrition & dietetic technicians	500
country	KE	2009	2017	Nutrition & dietetic technicians	619
country	KE	2009	2018	Nutrition & dietetic technicians	813
country	KE	2009	2014	Nutrition & dietetic technologists	1499
country	KE	2009	2015	Nutrition & dietetic technologists	2066
country	KE	2009	2016	Nutrition & dietetic technologists	2608
country	KE	2009	2017	Nutrition & dietetic technologists	3122
country	KE	2009	2018	Nutrition & dietetic technologists	4430
country	KE	2009	2014	Nutritionists & dieticians	1471
country	KE	2009	2015	Nutritionists & dieticians	1691
country	KE	2009	2016	Nutritionists & dieticians	1853
country	KE	2009	2017	Nutritionists & dieticians	2106
country	KE	2009	2018	Nutritionists & dieticians	3066
country	KE	2009	2014	Pharmaceutical technologists	7041
country	KE	2009	2015	Pharmaceutical technologists	7895
country	KE	2009	2016	Pharmaceutical technologists	8673
country	KE	2009	2017	Pharmaceutical technologists	9358
country	KE	2009	2018	Pharmaceutical technologists	10126
country	KE	2009	2014	Pharmacists	2355
country	KE	2009	2015	Pharmacists	2994
country	KE	2009	2016	Pharmacists	3169
country	KE	2009	2017	Pharmacists	3373
country	KE	2009	2018	Pharmacists	3582
country	KE	2009	2014	Public health officers	9039
country	KE	2009	2015	Public health officers	10110
country	KE	2009	2016	Public health officers	12564
country	KE	2009	2017	Public health officers	13895
country	KE	2009	2018	Public health officers	14879
country	KE	2009	2014	Public health technicians	5969
country	KE	2009	2015	Public health technicians	5969
country	KE	2009	2016	Public health technicians	6752
country	KE	2009	2017	Public health technicians	7078
country	KE	2009	2018	Public health technicians	7239
country	KE	2009	2014	Registered nurses	38802
country	KE	2009	2015	Registered nurses	41178
country	KE	2009	2016	Registered nurses	47480
country	KE	2009	2017	Registered nurses	51420
country	KE	2009	2018	Registered nurses	52587
\.


--
-- Name: health_workers_distribution pk_health_workers_distribution; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.health_workers_distribution
    ADD CONSTRAINT pk_health_workers_distribution PRIMARY KEY (geo_level, geo_code, geo_version, year, workers);


--
-- PostgreSQL database dump complete
--

