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

ALTER TABLE IF EXISTS ONLY public.highest_education_level_reached DROP CONSTRAINT IF EXISTS pk_highest_education_level_reached;
DROP TABLE IF EXISTS public.highest_education_level_reached;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: highest_education_level_reached; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.highest_education_level_reached (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    "highest education level reached" character varying(128) NOT NULL,
    total integer
);


--
-- Data for Name: highest_education_level_reached; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.highest_education_level_reached (geo_level, geo_code, geo_version, "highest education level reached", total) FROM stdin;
\.


--
-- Name: highest_education_level_reached pk_highest_education_level_reached; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.highest_education_level_reached
    ADD CONSTRAINT pk_highest_education_level_reached PRIMARY KEY (geo_level, geo_code, geo_version, "highest education level reached");


--
-- PostgreSQL database dump complete
--

