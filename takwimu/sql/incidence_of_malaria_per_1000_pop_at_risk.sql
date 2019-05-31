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

ALTER TABLE IF EXISTS ONLY public.incidence_of_malaria_per_1000_pop_at_risk DROP CONSTRAINT IF EXISTS pk_incidence_of_malaria_per_1000_pop_at_risk;
DROP TABLE IF EXISTS public.incidence_of_malaria_per_1000_pop_at_risk;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: incidence_of_malaria_per_1000_pop_at_risk; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.incidence_of_malaria_per_1000_pop_at_risk (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    incidence_of_malaria_per_1000_pop_at_risk_year character varying(128) NOT NULL,
    total integer
);


--
-- Data for Name: incidence_of_malaria_per_1000_pop_at_risk; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.incidence_of_malaria_per_1000_pop_at_risk (geo_level, geo_code, geo_version, incidence_of_malaria_per_1000_pop_at_risk_year, total) FROM stdin;
country	ET	2009	2017	37
country	ET	2009	2016	42
country	ET	2009	2015	53
country	ET	2009	2014	58
country	ET	2009	2013	80
country	ET	2009	2012	83
country	ET	2009	2011	83
country	ET	2009	2010	129
country	ET	2009	2000	111
country	KE	2009	2017	71
country	KE	2009	2016	71
country	KE	2009	2015	73
country	KE	2009	2014	85
country	KE	2009	2013	84
country	KE	2009	2012	75
country	KE	2009	2011	69
country	KE	2009	2010	69
country	KE	2009	2000	217
country	NG	2009	2017	281
country	NG	2009	2016	282
country	NG	2009	2015	291
country	NG	2009	2014	336
country	NG	2009	2013	361
country	NG	2009	2012	368
country	NG	2009	2011	372
country	NG	2009	2010	383
country	NG	2009	2000	378
country	SN	2009	2017	65
country	SN	2009	2016	54
country	SN	2009	2015	79
country	SN	2009	2014	46
country	SN	2009	2013	80
country	SN	2009	2012	61
country	SN	2009	2011	53
country	SN	2009	2010	61
country	SN	2009	2000	185
country	TZ	2009	2017	113
country	TZ	2009	2016	114
country	TZ	2009	2015	113
country	TZ	2009	2014	113
country	TZ	2009	2013	114
country	TZ	2009	2012	119
country	TZ	2009	2011	132
country	TZ	2009	2010	142
country	TZ	2009	2000	295
country	ZA	2009	2017	4
country	ZA	2009	2016	1
country	ZA	2009	2015	0
country	ZA	2009	2014	2
country	ZA	2009	2013	2
country	ZA	2009	2012	1
country	ZA	2009	2011	2
country	ZA	2009	2010	2
country	ZA	2009	2000	4
\.


--
-- Name: incidence_of_malaria_per_1000_pop_at_risk pk_incidence_of_malaria_per_1000_pop_at_risk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.incidence_of_malaria_per_1000_pop_at_risk
    ADD CONSTRAINT pk_incidence_of_malaria_per_1000_pop_at_risk PRIMARY KEY (geo_level, geo_code, geo_version, incidence_of_malaria_per_1000_pop_at_risk_year);


--
-- PostgreSQL database dump complete
--

