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

ALTER TABLE IF EXISTS ONLY public.defence_budget DROP CONSTRAINT IF EXISTS pk_defence_budget;
DROP TABLE IF EXISTS public.defence_budget;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: defence_budget; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.defence_budget (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    budget_year character varying(128) NOT NULL,
    total integer
);


--
-- Data for Name: defence_budget; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.defence_budget (geo_level, geo_code, geo_version, budget_year, total) FROM stdin;
country	NG	2009	2013	364
country	NG	2009	2014	340
country	NG	2009	2015	357
country	NG	2009	2016	443
country	NG	2009	2017	469
country	NG	2009	2018	576
country	NG	2009	2019	590
country	NG	2009	2020	975
\.


--
-- Name: defence_budget pk_defence_budget; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.defence_budget
    ADD CONSTRAINT pk_defence_budget PRIMARY KEY (geo_level, geo_code, geo_version, budget_year);


--
-- PostgreSQL database dump complete
--

