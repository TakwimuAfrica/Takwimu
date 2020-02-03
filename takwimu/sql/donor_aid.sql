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

ALTER TABLE IF EXISTS ONLY public.donor_aid DROP CONSTRAINT IF EXISTS pk_donor_aid;
DROP TABLE IF EXISTS public.donor_aid;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: donor_aid; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.donor_aid (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    sector character varying(128) NOT NULL,
    total numeric
);


--
-- Data for Name: donor_aid; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.donor_aid (geo_level, geo_code, geo_version, sector, total) FROM stdin;
country	NG	2009	Action Relating to Debt	24.57
country	NG	2009	Agriculture	7.36
country	NG	2009	Water Supply and Sanitation	5.47
country	NG	2009	Policies, Programmes and Reproductive Health	5.07
country	NG	2009	Industry	4.4
country	NG	2009	Others	35.48
\.


--
-- Name: donor_aid pk_donor_aid; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.donor_aid
    ADD CONSTRAINT pk_donor_aid PRIMARY KEY (geo_level, geo_code, geo_version, sector);


--
-- PostgreSQL database dump complete
--

