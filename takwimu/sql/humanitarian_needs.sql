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

ALTER TABLE IF EXISTS ONLY public.humanitarian_needs DROP CONSTRAINT IF EXISTS pk_humanitarian_needs;
DROP TABLE IF EXISTS public.humanitarian_needs;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: humanitarian_needs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.humanitarian_needs (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    category character varying(128) NOT NULL,
    total numeric
);


--
-- Data for Name: humanitarian_needs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.humanitarian_needs (geo_level, geo_code, geo_version, category, total) FROM stdin;
country	NG	2009	Internally Displaced	1.8
country	NG	2009	Returnees	1.6
country	NG	2009	Host Community	2.9
country	NG	2009	Inaccessible	0.8
\.


--
-- Name: humanitarian_needs pk_humanitarian_needs; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.humanitarian_needs
    ADD CONSTRAINT pk_humanitarian_needs PRIMARY KEY (geo_level, geo_code, geo_version, category);


--
-- PostgreSQL database dump complete
--
