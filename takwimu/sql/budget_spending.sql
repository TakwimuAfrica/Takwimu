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

ALTER TABLE IF EXISTS ONLY public.budget_spending DROP CONSTRAINT IF EXISTS pk_budget_spending;
DROP TABLE IF EXISTS public.budget_spending;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: budget_spending; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.budget_spending (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    financial_year character varying(128) NOT NULL,
    total numeric
);


--
-- Data for Name: budget_spending; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.budget_spending (geo_level, geo_code, geo_version, financial_year, total) FROM stdin;
country	KE	2009	2015/16	1583822.92
country	KE	2009	2016/17	1734402.94
country	KE	2009	2017/18	2107177.12
country	KE	2009	2018/19	2402157.75
\.


--
-- Name: budget_spending pk_budget_spending; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.budget_spending
    ADD CONSTRAINT pk_budget_spending PRIMARY KEY (geo_level, geo_code, geo_version, financial_year);


--
-- PostgreSQL database dump complete
--
