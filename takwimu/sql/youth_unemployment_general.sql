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

ALTER TABLE IF EXISTS ONLY public.youth_unemployment_general DROP CONSTRAINT IF EXISTS pk_youth_unemployment_general;
DROP TABLE IF EXISTS public.youth_unemployment_general;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: youth_unemployment_general; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.youth_unemployment_general (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    youth_unemployment_period character varying(128) NOT NULL,
    total numeric
);


--
-- Data for Name: youth_unemployment_general; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.youth_unemployment_general (geo_level, geo_code, geo_version, youth_unemployment_period, total) FROM stdin;
\.


--
-- Name: youth_unemployment_general pk_youth_unemployment_general; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.youth_unemployment_general
    ADD CONSTRAINT pk_youth_unemployment_general PRIMARY KEY (geo_level, geo_code, geo_version, youth_unemployment_period);


--
-- PostgreSQL database dump complete
--
