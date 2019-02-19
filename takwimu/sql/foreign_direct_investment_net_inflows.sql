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

ALTER TABLE IF EXISTS ONLY public.foreign_direct_investment_net_inflows DROP CONSTRAINT IF EXISTS pk_foreign_direct_investment_net_inflows;
DROP TABLE IF EXISTS public.foreign_direct_investment_net_inflows;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: foreign_direct_investment_net_inflows; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.foreign_direct_investment_net_inflows (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    foreign_direct_investment_net_inflows_year character varying(128) NOT NULL,
    total integer
);


--
-- Data for Name: foreign_direct_investment_net_inflows; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.foreign_direct_investment_net_inflows (geo_level, geo_code, geo_version, foreign_direct_investment_net_inflows_year, total) FROM stdin;
country	ET	2009	2017	5
country	ET	2009	2016	5
country	ET	2009	2015	4
country	ET	2009	2014	3
country	ET	2009	2013	3
country	ET	2009	2012	1
country	ET	2009	2011	2
country	ET	2009	2010	1
country	ET	2009	2009	1
country	ET	2009	2008	0
country	ET	2009	2007	1
country	ET	2009	2006	4
country	ET	2009	2005	2
country	ET	2009	2004	5
country	ET	2009	2003	5
country	ET	2009	2002	3
country	ET	2009	2001	4
country	ET	2009	2000	2
country	KE	2009	2017	1
country	KE	2009	2016	1
country	KE	2009	2015	1
country	KE	2009	2014	1
country	KE	2009	2013	2
country	KE	2009	2012	3
country	KE	2009	2011	3
country	KE	2009	2010	0
country	KE	2009	2009	0
country	KE	2009	2008	0
country	KE	2009	2007	2
country	KE	2009	2006	0
country	KE	2009	2005	0
country	KE	2009	2004	0
country	KE	2009	2003	1
country	KE	2009	2002	0
country	KE	2009	2001	0
country	KE	2009	2000	1
country	NG	2009	2017	1
country	NG	2009	2016	1
country	NG	2009	2015	1
country	NG	2009	2014	1
country	NG	2009	2013	1
country	NG	2009	2012	2
country	NG	2009	2011	2
country	NG	2009	2010	2
country	NG	2009	2009	3
country	NG	2009	2008	2
country	NG	2009	2007	2
country	NG	2009	2006	2
country	NG	2009	2005	3
country	NG	2009	2004	1
country	NG	2009	2003	2
country	NG	2009	2002	2
country	NG	2009	2001	2
country	NG	2009	2000	2
country	SN	2009	2017	3
country	SN	2009	2016	2
country	SN	2009	2015	2
country	SN	2009	2014	2
country	SN	2009	2013	2
country	SN	2009	2012	2
country	SN	2009	2011	2
country	SN	2009	2010	2
country	SN	2009	2009	2
country	SN	2009	2008	3
country	SN	2009	2007	2
country	SN	2009	2006	2
country	SN	2009	2005	2
country	SN	2009	2004	1
country	SN	2009	2003	1
country	SN	2009	2002	1
country	SN	2009	2001	1
country	SN	2009	2000	1
country	TZ	2009	2017	2
country	TZ	2009	2016	3
country	TZ	2009	2015	4
country	TZ	2009	2014	3
country	TZ	2009	2013	5
country	TZ	2009	2012	5
country	TZ	2009	2011	4
country	TZ	2009	2010	6
country	TZ	2009	2009	3
country	TZ	2009	2008	5
country	TZ	2009	2007	3
country	TZ	2009	2006	2
country	TZ	2009	2005	6
country	TZ	2009	2004	3
country	TZ	2009	2003	3
country	TZ	2009	2002	4
country	TZ	2009	2001	5
country	TZ	2009	2000	5
country	ZA	2009	2017	0
country	ZA	2009	2016	1
country	ZA	2009	2015	0
country	ZA	2009	2014	2
country	ZA	2009	2013	2
country	ZA	2009	2012	1
country	ZA	2009	2011	1
country	ZA	2009	2010	1
country	ZA	2009	2009	3
country	ZA	2009	2008	3
country	ZA	2009	2007	2
country	ZA	2009	2006	0
country	ZA	2009	2005	3
country	ZA	2009	2004	0
country	ZA	2009	2003	0
country	ZA	2009	2002	1
country	ZA	2009	2001	6
country	ZA	2009	2000	1
\.


--
-- Name: foreign_direct_investment_net_inflows pk_foreign_direct_investment_net_inflows; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.foreign_direct_investment_net_inflows
    ADD CONSTRAINT pk_foreign_direct_investment_net_inflows PRIMARY KEY (geo_level, geo_code, geo_version, foreign_direct_investment_net_inflows_year);


--
-- PostgreSQL database dump complete
--

