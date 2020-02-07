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

ALTER TABLE IF EXISTS ONLY public.un_funding DROP CONSTRAINT IF EXISTS pk_un_funding;
DROP TABLE IF EXISTS public.un_funding;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: un_funding; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.un_funding (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    project character varying(128) NOT NULL,
    total numeric
);


--
-- Data for Name: un_funding; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.un_funding (geo_level, geo_code, geo_version, project, total) FROM stdin;
country	NG	2009	Governance, Human Rights, Peace & Security	1401093828
country	NG	2009	Equitable Quality Basic Services	2374718000
country	NG	2009	Sustainable and Inclusive Economic Growth & Development	519920072
\.


--
-- Name: un_funding pk_un_funding; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.un_funding
    ADD CONSTRAINT pk_un_funding PRIMARY KEY (geo_level, geo_code, geo_version, project);


--
-- PostgreSQL database dump complete
--

