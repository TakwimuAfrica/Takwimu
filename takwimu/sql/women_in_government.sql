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

ALTER TABLE IF EXISTS ONLY public.women_in_government DROP CONSTRAINT IF EXISTS pk_women_in_government;
DROP TABLE IF EXISTS public.women_in_government;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: women_in_government; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.women_in_government (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    position character varying(128) NOT NULL,
    total integer
);


--
-- Data for Name: women_in_government; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.women_in_government (geo_level, geo_code, geo_version, position, total) FROM stdin;
country	KE	2009	Governor	3
country	KE	2009	Deputy Governor	7
country	KE	2009	County Rep	47
country	KE	2009	National Assembly	76
country	KE	2009	Senator	21
country	KE	2009	Member of the County Assembly	745
\.


--
-- Name: women_in_government pk_women_in_government; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.women_in_government
    ADD CONSTRAINT pk_women_in_government PRIMARY KEY (geo_level, geo_code, geo_version, position);


--
-- PostgreSQL database dump complete
--

