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

ALTER TABLE IF EXISTS ONLY public.poverty_age_residence DROP CONSTRAINT IF EXISTS pk_poverty_age_residence;
DROP TABLE IF EXISTS public.poverty_age_residence;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: poverty_age_residence; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.poverty_age_residence (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    age character varying(128) NOT NULL,
    residence character varying(128) NOT NULL,
    total integer
);


--
-- Data for Name: poverty_age_residence; Type: TABLE DATA; Schema: public; Owner: -
--
-- Legend:
-- N National
-- P Peri-Urban
-- R Rural
-- U Urban

COPY public.poverty_age_residence (geo_level, geo_code, geo_version, age, residence, total) FROM stdin;
country	KE	2009	15 - 19	R	26
country	KE	2009	15 - 19	U	32
country	KE	2009	15 - 19	P	9
country	KE	2009	15 - 19	N	28
country	KE	2009	20 - 29	R	21
country	KE	2009	20 - 29	U	13
country	KE	2009	20 - 29	P	8
country	KE	2009	20 - 29	N	16
country	KE	2009	30 - 39	R	30
country	KE	2009	30 - 39	U	22
country	KE	2009	30 - 39	P	19
country	KE	2009	30 - 39	N	26
country	KE	2009	40 - 49	R	37
country	KE	2009	40 - 49	U	22
country	KE	2009	40 - 49	P	21
country	KE	2009	40 - 49	N	31
country	KE	2009	50 - 59	R	34
country	KE	2009	50 - 59	U	25
country	KE	2009	50 - 59	P	25
country	KE	2009	50 - 59	N	31
country	KE	2009	60 - 69	R	37
country	KE	2009	60 - 69	U	32
country	KE	2009	60 - 69	P	32
country	KE	2009	60 - 69	N	35
country	KE	2009	70 +	R	37
country	KE	2009	70 +	U	41
country	KE	2009	70 +	P	33
country	KE	2009	70 +	N	37
\.


--
-- Name: poverty_age_residence pk_poverty_age_residence; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.poverty_age_residence
    ADD CONSTRAINT pk_poverty_age_residence PRIMARY KEY (geo_level, geo_code, geo_version, age, residence);


--
-- PostgreSQL database dump complete
--

