--
-- PostgreSQL database dump
--

-- Dumped from database version 10.0
-- Dumped by pg_dump version 10.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;

ALTER TABLE IF EXISTS ONLY public.health_workers DROP CONSTRAINT IF EXISTS pk_health_workers;
DROP TABLE IF EXISTS public.health_workers;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: health_workers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.health_workers (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    workers character varying(128) NOT NULL,
    total integer
);


--
-- Data for Name: health_workers; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.health_workers (geo_level, geo_code, geo_version, workers, total) FROM stdin;
\.


--
-- Name: health_workers pk_health_workers; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.health_workers
    ADD CONSTRAINT pk_health_workers PRIMARY KEY (geo_level, geo_code, geo_version, workers);


--
-- PostgreSQL database dump complete
--

