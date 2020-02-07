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

ALTER TABLE IF EXISTS ONLY public.mobile_money_transfer DROP CONSTRAINT IF EXISTS pk_mobile_money_transfer;
DROP TABLE IF EXISTS public.mobile_money_transfer;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: mobile_money_transfer; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.mobile_money_transfer (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    year character varying(128) NOT NULL,
    total numeric
);


--
-- Data for Name: mobile_money_transfer; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.mobile_money_transfer (geo_level, geo_code, geo_version, year, total) FROM stdin;
country	KE	2009	2007	16.32
country	KE	2009	2008	166.57
country	KE	2009	2009	473.41
country	KE	2009	2010	732.22
country	KE	2009	2011	1169.15
country	KE	2009	2012	1544.81
country	KE	2009	2013	1901.56
country	KE	2009	2014	2371.79
country	KE	2009	2015	2816.10
country	KE	2009	2016	3355.11
country	KE	2009	2017	3638.47
country	KE	2009	2018	3984.37
country	KE	2009	2019	3236.67
\.


--
-- Name: mobile_money_transfer pk_mobile_money_transfer; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mobile_money_transfer
    ADD CONSTRAINT pk_mobile_money_transfer PRIMARY KEY (geo_level, geo_code, geo_version, year);


--
-- PostgreSQL database dump complete
--
