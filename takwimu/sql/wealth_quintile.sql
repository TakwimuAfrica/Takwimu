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

DROP TABLE IF EXISTS public.wealth_quintile;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: wealth_quintile; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.wealth_quintile (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    wealth_quintile character varying(128) NOT NULL,
    total integer
);


--
-- Data for Name: wealth_quintile; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.wealth_quintile (geo_level, geo_code, geo_version, wealth_quintile, total) FROM stdin;
country	KE	2009	lowest	10
country	KE	2009	second	11
country	KE	2009	middle	8
country	KE	2009	fourth	11
country	KE	2009	highest	6
\.


--
-- PostgreSQL database dump complete
--

