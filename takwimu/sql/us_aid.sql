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

ALTER TABLE IF EXISTS ONLY public.us_aid DROP CONSTRAINT IF EXISTS pk_us_aid;
DROP TABLE IF EXISTS public.us_aid;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: us_aid; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.us_aid (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    project character varying(128) NOT NULL,
    total numeric
);


--
-- Data for Name: us_aid; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.us_aid (geo_level, geo_code, geo_version, project, total) FROM stdin;
country	NG	2009	President’s Emergency Plan for AIDS Relief (PEPFAR) 	44
country	NG	2009	Northeast Nigeria agricultural productivity and economic growth 	15
country	NG	2009	Education 	11
country	NG	2009	Good governance 	10.5
country	NG	2009	Water and sanitation infrastructure 	9
\.


--
-- Name: us_aid pk_us_aid; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.us_aid
    ADD CONSTRAINT pk_us_aid PRIMARY KEY (geo_level, geo_code, geo_version, project);


--
-- PostgreSQL database dump complete
--

