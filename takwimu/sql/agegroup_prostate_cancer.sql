--
-- PostgreSQL database dump
--

-- Dumped from database version 10.6
-- Dumped by pg_dump version 10.6

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;

DROP TABLE IF EXISTS public.agegroup_prostate_cancer;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: agegroup_prostate_cancer; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.agegroup_prostate_cancer (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    agegroup character varying(128) NOT NULL,
    prostate_cancer character varying(128) NOT NULL,
    total integer
);


--
-- Data for Name: agegroup_prostate_cancer; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.agegroup_prostate_cancer (geo_level, geo_code, geo_version, agegroup, prostate_cancer, total) FROM stdin;
country	KE	2009	15-19	heard of prostate cancer	41
country	KE	2009	20-24	heard of prostate cancer	67
country	KE	2009	25-29	heard of prostate cancer	71
country	KE	2009	30-34	heard of prostate cancer	72
country	KE	2009	35-39	heard of prostate cancer	70
country	KE	2009	40-44	heard of prostate cancer	75
country	KE	2009	45-49	heard of prostate cancer	78
country	KE	2009	50-54	heard of prostate cancer	66
country	KE	2009	15-19	screened for prostate cancer	1
country	KE	2009	20-24	screened for prostate cancer	2
country	KE	2009	25-29	screened for prostate cancer	4
country	KE	2009	30-34	screened for prostate cancer	3
country	KE	2009	35-39	screened for prostate cancer	3
country	KE	2009	40-44	screened for prostate cancer	4
country	KE	2009	45-49	screened for prostate cancer	3
country	KE	2009	50-54	screened for prostate cancer	3
\.


--
-- PostgreSQL database dump complete
--

