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

ALTER TABLE IF EXISTS ONLY public.public_debt DROP CONSTRAINT IF EXISTS pk_public_debt;
DROP TABLE IF EXISTS public.public_debt;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: public_debt; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.public_debt (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    public_debt_year character varying(128) NOT NULL,
    total numeric
);


--
-- Data for Name: public_debt; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.public_debt (geo_level, geo_code, geo_version, public_debt_year, total) FROM stdin;
country	KE	2009	1999	1.005807
country	KE	2009	2000	4.77513446
country	KE	2009	2001	7.27556377
country	KE	2009	2002	7.40827715
country	KE	2009	2003	8.11047381
country	KE	2009	2004	8.79671256
country	KE	2009	2005	8.91937976
country	KE	2009	2006	9.32769214
country	KE	2009	2007	9.83056428
country	KE	2009	2008	10.56769989
country	KE	2009	2009	12.58725607
country	KE	2009	2010	14.74436528
country	KE	2009	2011	17.67575426
country	KE	2009	2012	19.79674162
country	KE	2009	2013	23.33231881
country	KE	2009	2014	27.50905039
country	KE	2009	2015	34.12671348
country	KE	2009	2016	42.39194774
country	KE	2009	2017	51.72715934
country	KE	2009	2018	60.54810309
country	KE	2009	2019	51.13606015
\.


--
-- Name: public_debt pk_public_debt; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.public_debt
    ADD CONSTRAINT pk_public_debt PRIMARY KEY (geo_level, geo_code, geo_version, public_debt_year);


--
-- PostgreSQL database dump complete
--
