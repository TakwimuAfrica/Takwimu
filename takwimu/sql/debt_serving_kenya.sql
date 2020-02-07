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

ALTER TABLE IF EXISTS ONLY public.debt_serving_kenya DROP CONSTRAINT IF EXISTS pk_debt_serving_kenya;
DROP TABLE IF EXISTS public.debt_serving_kenya;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: debt_serving_kenya; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.debt_serving_kenya (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    financial_year character varying(128) NOT NULL,
    total numeric
);


--
-- Data for Name: debt_serving_kenya; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.debt_serving_kenya (geo_level, geo_code, geo_version, financial_year, total) FROM stdin;
country	KE	2009	2013/14	345.77926
country	KE	2009	2014/15	400.32371
country	KE	2009	2015/16	438.22522
country	KE	2009	2016/17	450.6541
country	KE	2009	2017/18	668.22504
\.


--
-- Name: debt_serving_kenya pk_debt_serving_kenya; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.debt_serving_kenya
    ADD CONSTRAINT pk_debt_serving_kenya PRIMARY KEY (geo_level, geo_code, geo_version, financial_year);


--
-- PostgreSQL database dump complete
--
