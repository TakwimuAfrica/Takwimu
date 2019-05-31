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

ALTER TABLE IF EXISTS ONLY public.gini_index DROP CONSTRAINT IF EXISTS pk_gini_index;
DROP TABLE IF EXISTS public.gini_index;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: gini_index; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.gini_index (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    gini_index_year character varying(128) NOT NULL,
    total integer
);


--
-- Data for Name: gini_index; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.gini_index (geo_level, geo_code, geo_version, gini_index_year, total) FROM stdin;
country	BF	2009	1994	48
country	BF	2009	1998	50
country	BF	2009	2003	43
country	BF	2009	2009	40
country	BF	2009	2014	35
country	CD	2009	2004	42
country	CD	2009	2012	42
country	ET	2009	2015	39
country	ET	2009	2010	33
country	ET	2009	2004	30
country	ET	2009	1995	45
country	ET	2009	1999	30
country	KE	2009	2015	41
country	KE	2009	2005	47
country	KE	2009	1997	45
country	NG	2009	2009	43
country	NG	2009	2003	40
country	NG	2009	1992	45
country	NG	2009	1996	52
country	SN	2009	2011	40
country	SN	2009	2005	39
country	SN	2009	2001	41
country	SN	2009	1991	54
country	SN	2009	1994	41
country	TZ	2009	2011	38
country	TZ	2009	2007	40
country	TZ	2009	2000	37
country	TZ	2009	1991	35
country	UG	2009	1996	39
country	UG	2009	1999	43
country	UG	2009	2002	45
country	UG	2009	2005	43
country	UG	2009	2009	44
country	UG	2009	2012	41
country	UG	2009	2016	43
country	ZA	2009	2014	63
country	ZA	2009	2010	63
country	ZA	2009	2008	63
country	ZA	2009	2005	65
country	ZA	2009	2000	58
country	ZA	2009	1993	59
country	ZA	2009	1996	61
country	ZM	2009	1996	48
country	ZM	2009	1998	49
country	ZM	2009	2002	42
country	ZM	2009	2004	54
country	ZM	2009	2006	55
country	ZM	2009	2010	56
country	ZM	2009	2015	57
\.


--
-- Name: gini_index pk_gini_index; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.gini_index
    ADD CONSTRAINT pk_gini_index PRIMARY KEY (geo_level, geo_code, geo_version, gini_index_year);


--
-- PostgreSQL database dump complete
--
