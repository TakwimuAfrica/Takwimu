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

ALTER TABLE IF EXISTS ONLY public.effect_boko_haram DROP CONSTRAINT IF EXISTS pk_effect_boko_haram;
DROP TABLE IF EXISTS public.effect_boko_haram;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: effect_boko_haram; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.effect_boko_haram (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    effect character varying(128) NOT NULL,
    total integer
);


--
-- Data for Name: effect_boko_haram; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.effect_boko_haram (geo_level, geo_code, geo_version, effect, total) FROM stdin;
country	NG	2009	Nigerian refugees	244000
country	NG	2009	People in need of humanitarian assistance	7100000
country	NG	2009	People facing food insecurity	3000000
\.


--
-- Name: effect_boko_haram pk_effect_boko_haram; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.effect_boko_haram
    ADD CONSTRAINT pk_effect_boko_haram PRIMARY KEY (geo_level, geo_code, geo_version, effect);


--
-- PostgreSQL database dump complete
--

