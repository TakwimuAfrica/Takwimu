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

DROP TABLE IF EXISTS public.disability_sex;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: disability_sex; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.disability_sex (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    disability character varying(128) NOT NULL,
    sex character varying(128) NOT NULL,
    total integer
);


--
-- Data for Name: disability_sex; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.disability_sex (geo_level, geo_code, geo_version, disability, sex, total) FROM stdin;
country	KE	2009	visual	male	46
country	KE	2009	hearing	male	48
country	KE	2009	speech	male	54
country	KE	2009	physical	male	48
country	KE	2009	mental	male	55
country	KE	2009	albino	male	47
country	KE	2009	others	male	44
country	KE	2009	visual	female	54
country	KE	2009	hearing	female	52
country	KE	2009	speech	female	46
country	KE	2009	physical	female	52
country	KE	2009	mental	female	45
country	KE	2009	albino	female	53
country	KE	2009	others	female	56
\.


--
-- PostgreSQL database dump complete
--

