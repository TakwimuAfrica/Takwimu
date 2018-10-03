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

COPY public.poverty_age_residence (geo_level, geo_code, geo_version, age, residence, total) FROM stdin;
country	KE	2009	15 - 19	Rural	26
country	KE	2009	15 - 19	Urban	32
country	KE	2009	15 - 19	Peri-Urban	9
country	KE	2009	15 - 19	National	28
country	KE	2009	20 - 29	Rural	21
country	KE	2009	20 - 29	Urban	13
country	KE	2009	20 - 29	Peri-Urban	8
country	KE	2009	20 - 29	National	16
country	KE	2009	30 - 39	Rural	30
country	KE	2009	30 - 39	Urban	22
country	KE	2009	30 - 39	Peri-Urban	19
country	KE	2009	30 - 39	National	26
country	KE	2009	40 - 49	Rural	37
country	KE	2009	40 - 49	Urban	22
country	KE	2009	40 - 49	Peri-Urban	21
country	KE	2009	40 - 49	National	31
country	KE	2009	50 - 59	Rural	34
country	KE	2009	50 - 59	Urban	25
country	KE	2009	50 - 59	Peri-Urban	25
country	KE	2009	50 - 59	National	31
country	KE	2009	60 - 69	Rural	37
country	KE	2009	60 - 69	Urban	32
country	KE	2009	60 - 69	Peri-Urban	32
country	KE	2009	60 - 69	National	35
country	KE	2009	70 +	Rural	37
country	KE	2009	70 +	Urban	41
country	KE	2009	70 +	Peri-Urban	33
country	KE	2009	70 +	National	37
\.


--
-- Name: poverty_age_residence pk_poverty_age_residence; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.poverty_age_residence
    ADD CONSTRAINT pk_poverty_age_residence PRIMARY KEY (geo_level, geo_code, geo_version, age, residence);


--
-- PostgreSQL database dump complete
--

