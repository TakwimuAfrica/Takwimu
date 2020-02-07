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

ALTER TABLE IF EXISTS ONLY public.out_of_pocket_expenditure DROP CONSTRAINT IF EXISTS pk_out_of_pocket_expenditure;
DROP TABLE IF EXISTS public.out_of_pocket_expenditure;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: out_of_pocket_expenditure; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.out_of_pocket_expenditure (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    year character varying(128) NOT NULL,
    total numeric
);


--
-- Data for Name: out_of_pocket_expenditure; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.out_of_pocket_expenditure (geo_level, geo_code, geo_version, year, total) FROM stdin;
country	NG	2009	2000	72.929
country	NG	2009	2001	74.309
country	NG	2009	2002	77.231
country	NG	2009	2003	83.145
country	NG	2009	2004	75.046
country	NG	2009	2005	77.733
country	NG	2009	2006	77.379
country	NG	2009	2007	73.234
country	NG	2009	2008	72.545
country	NG	2009	2009	75.624
country	NG	2009	2010	77.747
country	NG	2009	2011	75.432
country	NG	2009	2012	73.434
country	NG	2009	2013	71.416
country	NG	2009	2014	72.293
country	NG	2009	2015	72.079
country	NG	2009	2016	75.208
\.


--
-- Name: out_of_pocket_expenditure pk_out_of_pocket_expenditure; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.out_of_pocket_expenditure
    ADD CONSTRAINT pk_out_of_pocket_expenditure PRIMARY KEY (geo_level, geo_code, geo_version, year);


--
-- PostgreSQL database dump complete
--
