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

ALTER TABLE IF EXISTS ONLY public.gini_index DROP CONSTRAINT IF EXISTS pk_gini_index;
DROP TABLE IF EXISTS public.gini_index;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: gini_index; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.gini_index (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    gini_index_year character varying(128) NOT NULL,
    total integer
);


--
-- Data for Name: gini_index; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.gini_index (geo_level, geo_code, geo_version, gini_index_year, total) FROM stdin;
country	ET	2009	2015	39
country	ET	2009	2010	33
country	ET	2009	2004	30
country	KE	2009	2015	41
country	KE	2009	2005	47
country	NG	2009	2009	43
country	NG	2009	2003	40
country	SN	2009	2011	40
country	SN	2009	2005	39
country	SN	2009	2001	41
country	TZ	2009	2011	38
country	TZ	2009	2007	40
country	TZ	2009	2000	37
country	ZA	2009	2014	63
country	ZA	2009	2010	63
country	ZA	2009	2008	63
country	ZA	2009	2005	65
country	ZA	2009	2000	58
\.


--
-- Name: gini_index pk_gini_index; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.gini_index
    ADD CONSTRAINT pk_gini_index PRIMARY KEY (geo_level, geo_code, geo_version, gini_index_year);


--
-- PostgreSQL database dump complete
--

