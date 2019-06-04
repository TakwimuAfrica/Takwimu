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

ALTER TABLE IF EXISTS ONLY public.infant_under5_mortality DROP CONSTRAINT IF EXISTS pk_infant_under5_mortality;
DROP TABLE IF EXISTS public.infant_under5_mortality;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: infant_under5_mortality; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.infant_under5_mortality (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    mortality_year character varying(128) NOT NULL,
    infant_under5 character varying(128) NOT NULL,
    total integer
);


--
-- Data for Name: infant_under5_mortality; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.infant_under5_mortality (geo_level, geo_code, geo_version, mortality_year, infant_under5, total) FROM stdin;
country	KE	2009	2000	infant	64
country	KE	2009	2000	under_5	105
country	KE	2009	2001	infant	62
country	KE	2009	2001	under_5	100
country	KE	2009	2002	infant	59
country	KE	2009	2002	under_5	95
country	KE	2009	2003	infant	56
country	KE	2009	2003	under_5	90
country	KE	2009	2004	infant	54
country	KE	2009	2004	under_5	85
country	KE	2009	2005	infant	50
country	KE	2009	2005	under_5	79
country	KE	2009	2006	infant	48
country	KE	2009	2006	under_5	74
country	KE	2009	2007	infant	46
country	KE	2009	2007	under_5	70
country	KE	2009	2008	infant	43
country	KE	2009	2008	under_5	65
country	KE	2009	2009	infant	41
country	KE	2009	2009	under_5	61
country	KE	2009	2010	infant	40
country	KE	2009	2010	under_5	58
country	KE	2009	2011	infant	39
country	KE	2009	2011	under_5	56
country	KE	2009	2012	infant	38
country	KE	2009	2012	under_5	54
country	KE	2009	2013	infant	37
country	KE	2009	2013	under_5	52
country	KE	2009	2014	infant	36
country	KE	2009	2014	under_5	51
country	KE	2009	2015	infant	35
country	KE	2009	2015	under_5	49
country	KE	2009	2016	infant	34
country	KE	2009	2016	under_5	47
country	KE	2009	2017	infant	34
country	KE	2009	2017	under_5	46
\.


--
-- Name: infant_under5_mortality pk_infant_under5_mortality; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.infant_under5_mortality
    ADD CONSTRAINT pk_infant_under5_mortality PRIMARY KEY (geo_level, geo_code, geo_version, mortality_year, infant_under5);


--
-- PostgreSQL database dump complete
--
