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

ALTER TABLE IF EXISTS ONLY public.revenue_allocation DROP CONSTRAINT IF EXISTS pk_revenue_allocation;
DROP TABLE IF EXISTS public.revenue_allocation;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: revenue_allocation; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.revenue_allocation (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    allocation character varying(128) NOT NULL,
    total numeric
);


--
-- Data for Name: revenue_allocation; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.revenue_allocation (geo_level, geo_code, geo_version, allocation, total) FROM stdin;
country	NG	2009	Federal Government	295.74
country	NG	2009	State Government	192.7
country	NG	2009	Local Government	144.99
\.


--
-- Name: revenue_allocation pk_revenue_allocation; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.revenue_allocation
    ADD CONSTRAINT pk_revenue_allocation PRIMARY KEY (geo_level, geo_code, geo_version, allocation);


--
-- PostgreSQL database dump complete
--

