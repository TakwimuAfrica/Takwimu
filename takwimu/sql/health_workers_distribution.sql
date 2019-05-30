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
country	KE	2009	2016	Medical Officers	10376
country	KE	2009	2016	Dentists	1149
country	KE	2009	2016	Pharmacists	3169
country	KE	2009	2016	Pharmaceutical Technologists	8673
country	KE	2009	2016	(BSc) Nurses	4002
country	KE	2009	2016	Registered Nurses	47480
country	KE	2009	2016	Enrolled Nurses	22820
country	KE	2009	2016	Clinical Officers	17092
country	KE	2009	2016	Public Health officers	12564
country	KE	2009	2016	Public Health Technicians	6752
country	KE	2009	2016	Laboratory Technologists	6651
country	KE	2009	2016	Laboratory Technicians	1734
country	KE	2009	2016	Nutritionists & Dieticians	2107
country	KE	2009	2016	Nutrition & Dietetic Technologists	2300
country	KE	2009	2016	Nutrition & Dietetic Technicians	570
country	KE	2009	2017	Medical Officers	10921
country	KE	2009	2017	Dentists	1206
country	KE	2009	2017	Pharmacists	3373
country	KE	2009	2017	Pharmaceutical Technologists	9358
country	KE	2009	2017	(BSc) Nurses	4819
country	KE	2009	2017	Registered Nurses	51420
country	KE	2009	2017	Enrolled Nurses	23068
country	KE	2009	2017	Clinical Officers	18759
country	KE	2009	2017	Public Health officers	14855
country	KE	2009	2017	Public Health Technicians	6752
country	KE	2009	2017	Laboratory Technologists	7298
country	KE	2009	2017	Laboratory Technicians	2024
country	KE	2009	2017	Nutritionists & Dieticians	2598
country	KE	2009	2017	Nutrition & Dietetic Technologists	3681
country	KE	2009	2017	Nutrition & Dietetic Technicians	617
\.


--
-- Name: health_workers_distribution pk_health_workers_distribution; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.health_workers_distribution
    ADD CONSTRAINT pk_health_workers_distribution PRIMARY KEY (geo_level, geo_code, geo_version, year, workers);


--
-- PostgreSQL database dump complete
--

