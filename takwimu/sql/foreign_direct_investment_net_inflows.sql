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
    total double precision
);


--
-- Data for Name: foreign_direct_investment_net_inflows; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.foreign_direct_investment_net_inflows (geo_level, geo_code, geo_version, foreign_direct_investment_net_inflows_year, total) FROM stdin;
country	BF	2009	1997	0
country	BF	2009	1998	0
country	BF	2009	1999	0
country	BF	2009	2000	1
country	BF	2009	2001	0
country	BF	2009	2002	1
country	BF	2009	2003	1
country	BF	2009	2004	0
country	BF	2009	2005	1
country	BF	2009	2006	1
country	BF	2009	2007	0
country	BF	2009	2008	0
country	BF	2009	2009	1
country	BF	2009	2010	0
country	BF	2009	2011	1
country	BF	2009	2012	3
country	BF	2009	2013	4
country	BF	2009	2014	3
country	BF	2009	2015	2
country	BF	2009	2016	3
country	CD	2009	1997	-1
country	CD	2009	1998	1
country	CD	2009	1999	0
country	CD	2009	2000	0
country	CD	2009	2001	1
country	CD	2009	2002	2
country	CD	2009	2003	4
country	CD	2009	2004	4
country	CD	2009	2005	2
country	CD	2009	2006	2
country	CD	2009	2007	11
country	CD	2009	2008	9
country	CD	2009	2009	-1
country	CD	2009	2010	13
country	CD	2009	2011	6
country	CD	2009	2012	10
country	CD	2009	2013	5
country	CD	2009	2014	4
country	CD	2009	2015	3
country	CD	2009	2016	2
country	CD	2009	2017	3
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
country	NG	2009	1998	1.93
country	NG	2009	1999	1.69
country	NG	2009	2000	1.64
country	NG	2009	2001	1.61
country	NG	2009	2002	1.96
country	NG	2009	2003	1.91
country	NG	2009	2004	1.37
country	NG	2009	2005	2.83
country	NG	2009	2006	2.06
country	NG	2009	2007	2.19
country	NG	2009	2008	2.43
country	NG	2009	2009	2.93
country	NG	2009	2010	1.66
country	NG	2009	2011	2.15
country	NG	2009	2012	1.54
country	NG	2009	2013	1.08
country	NG	2009	2014	0.82
country	NG	2009	2015	0.63
country	NG	2009	2016	1.1
country	NG	2009	2017	0.93
country	NG	2009	2018	0.5
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
country	SN	2009	1997	4
country	SN	2009	1998	1
country	SN	2009	1999	3
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
country	ZM	2009	1996	3
country	ZM	2009	1997	5
country	ZM	2009	1998	6
country	ZM	2009	1999	5
country	ZM	2009	2000	3
country	ZM	2009	2001	4
country	ZM	2009	2002	7
country	ZM	2009	2003	7
country	ZM	2009	2004	6
country	ZM	2009	2005	4
country	ZM	2009	2006	5
country	ZM	2009	2007	9
country	ZM	2009	2008	5
country	ZM	2009	2009	5
country	ZM	2009	2010	9
country	ZM	2009	2011	5
country	ZM	2009	2012	7
country	ZM	2009	2013	7
country	ZM	2009	2014	6
country	ZM	2009	2015	7
country	ZM	2009	2016	3
country	ZM	2009	2017	3
\.


--
-- Name: foreign_direct_investment_net_inflows pk_foreign_direct_investment_net_inflows; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.foreign_direct_investment_net_inflows
    ADD CONSTRAINT pk_foreign_direct_investment_net_inflows PRIMARY KEY (geo_level, geo_code, geo_version, foreign_direct_investment_net_inflows_year);


--
-- PostgreSQL database dump complete
--
