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

ALTER TABLE IF EXISTS ONLY public.jica DROP CONSTRAINT IF EXISTS pk_jica;
DROP TABLE IF EXISTS public.jica;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: jica; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.jica (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    project character varying(128) NOT NULL,
    total numeric
);


--
-- Data for Name: jica; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.jica (geo_level, geo_code, geo_version, project, total) FROM stdin;
country	KE	2009	Transport and Storage	99099000000
country	KE	2009	Energy Generation and Supply	68330000000
country	KE	2009	Unallocated / Unspecified	50449000000
country	KE	2009	Agriculture	49102000000
country	KE	2009	Emergency Response	27231000000
country	KE	2009	Others	224000000000
\.


--
-- Name: jica pk_jica; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.jica
    ADD CONSTRAINT pk_jica PRIMARY KEY (geo_level, geo_code, geo_version, project);


--
-- PostgreSQL database dump complete
--
