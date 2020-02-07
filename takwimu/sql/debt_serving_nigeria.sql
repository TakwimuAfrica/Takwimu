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

ALTER TABLE IF EXISTS ONLY public.debt_serving_nigeria DROP CONSTRAINT IF EXISTS pk_debt_serving_nigeria;
DROP TABLE IF EXISTS public.debt_serving_nigeria;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: debt_serving_nigeria; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.debt_serving_nigeria (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    financial_year character varying(128) NOT NULL,
    total numeric
);


--
-- Data for Name: debt_serving_nigeria; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.debt_serving_nigeria (geo_level, geo_code, geo_version, financial_year, total) FROM stdin;
country	NG	2009	2016	1.48
country	NG	2009	2017	1.8
country	NG	2009	2018	2.014
country	NG	2009	2019	2.14
country	NG	2009	2020	2.45
\.


--
-- Name: debt_serving_nigeria pk_debt_serving_nigeria; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.debt_serving_nigeria
    ADD CONSTRAINT pk_debt_serving_nigeria PRIMARY KEY (geo_level, geo_code, geo_version, financial_year);


--
-- PostgreSQL database dump complete
--
