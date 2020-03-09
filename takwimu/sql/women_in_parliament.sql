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

ALTER TABLE IF EXISTS ONLY public.women_in_parliament DROP CONSTRAINT IF EXISTS pk_women_in_parliament;
DROP TABLE IF EXISTS public.women_in_parliament;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: women_in_parliament; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.women_in_parliament (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    women_parliament_year character varying(128) NOT NULL,
    total numeric
);


--
-- Data for Name: women_in_parliament; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.women_in_parliament (geo_level, geo_code, geo_version,  women_parliament_year, total) FROM stdin;
country	KE	2009	1999	3.6
country	KE	2009	2000	3.6
country	KE	2009	2001	3.6
country	KE	2009	2002	3.6
country	KE	2009	2003	7.1
country	KE	2009	2004	7.1
country	KE	2009	2005	7.1
country	KE	2009	2006	7.3
country	KE	2009	2007	7.2
country	KE	2009	2008	9.8
country	KE	2009	2009	9.8
country	KE	2009	2010	9.8
country	KE	2009	2011	9.8
country	KE	2009	2012	9.8
country	KE	2009	2013	18.6
country	KE	2009	2014	19.1
country	KE	2009	2015	19.7
country	KE	2009	2016	19.7
country	KE	2009	2017	21.8
country	KE	2009	2018	21.8
country	KE	2009	2019	21.8
country	NG	2009	2000	3.4
country	NG	2009	2001	3.4
country	NG	2009	2002	3.4
country	NG	2009	2003	4.9
country	NG	2009	2004	4.7
country	NG	2009	2005	6.4
country	NG	2009	2006	6.1
country	NG	2009	2007	7
country	NG	2009	2008	7
country	NG	2009	2009	7
country	NG	2009	2010	7
country	NG	2009	2011	6.8
country	NG	2009	2012	6.7
country	NG	2009	2013	6.7
country	NG	2009	2014	6.7
country	NG	2009	2015	5.6
country	NG	2009	2016	5.6
country	NG	2009	2017	5.6
country	NG	2009	2018	5.6
country	NG	2009	2019	3.38
country	ZA	2009	1999	30
country	ZA	2009	2000	29.8
country	ZA	2009	2001	29.8
country	ZA	2009	2002	29.8
country	ZA	2009	2003	29.8
country	ZA	2009	2004	32.8
country	ZA	2009	2005	32.8
country	ZA	2009	2006	32.8
country	ZA	2009	2007	33
country	ZA	2009	2008	33
country	ZA	2009	2009	44.5
country	ZA	2009	2010	44.5
country	ZA	2009	2011	42.3
country	ZA	2009	2012	42.3
country	ZA	2009	2013	42.3
country	ZA	2009	2014	41.5
country	ZA	2009	2015	42
country	ZA	2009	2016	41.8
country	ZA	2009	2017	42
country	ZA	2009	2018	42.3
country	ZA	2009	2019	45.7
country	ET	2009	1999	2
country	ET	2009	2000	7.7
country	ET	2009	2001	7.7
country	ET	2009	2002	7.7
country	ET	2009	2003	7.7
country	ET	2009	2004	7.7
country	ET	2009	2005	21.4
country	ET	2009	2006	21.9
country	ET	2009	2007	21.9
country	ET	2009	2008	21.9
country	ET	2009	2009	21.9
country	ET	2009	2010	27.8
country	ET	2009	2011	27.8
country	ET	2009	2012	27.8
country	ET	2009	2013	27.8
country	ET	2009	2014	27.8
country	ET	2009	2015	38.8
country	ET	2009	2016	38.8
country	ET	2009	2017	38.8
country	ET	2009	2018	38.8
country	ET	2009	2019	38.8
country	SN	2009	1999	12.1
country	SN	2009	2000	12.1
country	SN	2009	2001	16.7
country	SN	2009	2002	19.2
country	SN	2009	2003	19.2
country	SN	2009	2004	19.2
country	SN	2009	2005	19.2
country	SN	2009	2006	19.2
country	SN	2009	2007	22
country	SN	2009	2008	22
country	SN	2009	2009	22.7
country	SN	2009	2010	22.7
country	SN	2009	2011	22.7
country	SN	2009	2012	42.7
country	SN	2009	2013	42.7
country	SN	2009	2014	43.3
country	SN	2009	2015	42.7
country	SN	2009	2016	42.7
country	SN	2009	2017	41.8
country	SN	2009	2018	41.8
country	SN	2009	2019	41.8
\.


--
-- Name: women_in_parliament pk_women_in_parliament; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.women_in_parliament
    ADD CONSTRAINT pk_women_in_parliament PRIMARY KEY (geo_level, geo_code, geo_version,  women_parliament_year);


--
-- PostgreSQL database dump complete
--
