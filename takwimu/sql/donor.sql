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

ALTER TABLE IF EXISTS ONLY public.donor DROP CONSTRAINT IF EXISTS pk_donor;
DROP TABLE IF EXISTS public.donor;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: donor; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.donor (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    donor character varying(128) NOT NULL,
    total integer
);


--
-- Data for Name: donor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.donor (geo_level, geo_code, geo_version, donor, total) FROM stdin;
country	KE	2009	Denmark	58
country	KE	2009	France	103
country	KE	2009	Germany	71
country	KE	2009	Sweden	65
country	KE	2009	UK	238
country	KE	2009	USA	714
country	KE	2009	Japan	224
country	KE	2009	IDA	472
country	KE	2009	ADF	260
country	KE	2009	EU	131
country	KE	2009	GAVI	69
country	KE	2009	GF	115
country	KE	2009	BMGF	53
\.


--
-- Name: donor pk_donor; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.donor
    ADD CONSTRAINT pk_donor PRIMARY KEY (geo_level, geo_code, geo_version, donor);


--
-- PostgreSQL database dump complete
--

