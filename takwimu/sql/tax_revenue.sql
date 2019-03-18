--
-- PostgreSQL database dump
--

-- Dumped from database version 10.6
-- Dumped by pg_dump version 10.6

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;

ALTER TABLE IF EXISTS ONLY public.tax_revenue DROP CONSTRAINT IF EXISTS pk_tax_revenue;
DROP TABLE IF EXISTS public.tax_revenue;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: tax_revenue; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tax_revenue (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    tax_revenue_year character varying(128) NOT NULL,
    total integer
);


--
-- Data for Name: tax_revenue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.tax_revenue (geo_level, geo_code, geo_version, tax_revenue_year, total) FROM stdin;
\.


--
-- Name: tax_revenue pk_tax_revenue; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tax_revenue
    ADD CONSTRAINT pk_tax_revenue PRIMARY KEY (geo_level, geo_code, geo_version, tax_revenue_year);


--
-- PostgreSQL database dump complete
--

