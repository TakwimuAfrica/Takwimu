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

ALTER TABLE IF EXISTS ONLY public.national_debt DROP CONSTRAINT IF EXISTS pk_national_debt;
DROP TABLE IF EXISTS public.national_debt;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: national_debt; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.national_debt (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    national_debt_year character varying(128) NOT NULL,
    total numeric
);


--
-- Data for Name: national_debt; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.national_debt (geo_level, geo_code, geo_version, national_debt_year, total) FROM stdin;
country	NG	2009	2012	7.554258
country	NG	2009	2013	10.044198
country	NG	2009	2014	11.243120
country	NG	2009	2015	12.603705
country	NG	2009	2016	17.360009
country	NG	2009	2017	21.725773
country	NG	2009	2018	24.387071
\.


--
-- Name: national_debt pk_national_debt; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.national_debt
    ADD CONSTRAINT pk_national_debt PRIMARY KEY (geo_level, geo_code, geo_version, national_debt_year);


--
-- PostgreSQL database dump complete
--
