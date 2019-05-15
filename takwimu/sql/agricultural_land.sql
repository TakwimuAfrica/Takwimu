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

ALTER TABLE IF EXISTS ONLY public.agricultural_land DROP CONSTRAINT IF EXISTS pk_agricultural_land;
DROP TABLE IF EXISTS public.agricultural_land;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: agricultural_land; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.agricultural_land (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    agricultural_land_year character varying(128) NOT NULL,
    total integer
);


--
-- Data for Name: agricultural_land; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.agricultural_land (geo_level, geo_code, geo_version, agricultural_land_year, total) FROM stdin;
country	BF	2009	2016	44
country	BF	2009	2015	44
country	BF	2009	2014	44
country	BF	2009	2013	45
country	BF	2009	2012	44
country	BF	2009	2011	43
country	BF	2009	2010	44
country	BF	2009	2009	43
country	BF	2009	2008	44
country	BF	2009	2007	40
country	BF	2009	2006	39
country	BF	2009	2005	40
country	BF	2009	2004	39
country	BF	2009	2003	41
country	BF	2009	2002	39
country	BF	2009	2001	39
country	BF	2009	2000	36
country	BF	2009	1999	36
country	BF	2009	1998	36
country	BF	2009	1997	36
country	CD	2009	2016	12
country	CD	2009	2015	12
country	CD	2009	2014	12
country	CD	2009	2013	12
country	CD	2009	2012	12
country	CD	2009	2011	11
country	CD	2009	2010	11
country	CD	2009	2009	11
country	CD	2009	2008	11
country	CD	2009	2007	11
country	CD	2009	2006	11
country	CD	2009	2005	11
country	CD	2009	2004	11
country	CD	2009	2003	11
country	CD	2009	2002	11
country	CD	2009	2001	11
country	CD	2009	2000	11
country	CD	2009	1999	11
country	CD	2009	1998	11
country	CD	2009	1997	11
country	ET	2009	2016	36
country	ET	2009	2015	36
country	ET	2009	2014	36
country	ET	2009	2013	36
country	ET	2009	2012	36
country	ET	2009	2011	36
country	ET	2009	2010	36
country	ET	2009	2009	35
country	ET	2009	2008	35
country	ET	2009	2007	35
country	ET	2009	2006	34
country	ET	2009	2005	34
country	ET	2009	2004	33
country	ET	2009	2003	32
country	ET	2009	2002	30
country	ET	2009	2001	31
country	ET	2009	2000	31
country	ET	2009	1999	31
country	ET	2009	1998	31
country	ET	2009	1997	30
country	KE	2009	2016	49
country	KE	2009	2015	49
country	KE	2009	2014	49
country	KE	2009	2013	49
country	KE	2009	2012	49
country	KE	2009	2011	49
country	KE	2009	2010	48
country	KE	2009	2009	48
country	KE	2009	2008	48
country	KE	2009	2007	48
country	KE	2009	2006	48
country	KE	2009	2005	47
country	KE	2009	2004	47
country	KE	2009	2003	47
country	KE	2009	2002	47
country	KE	2009	2001	47
country	KE	2009	2000	47
country	NG	2009	2016	78
country	NG	2009	2015	78
country	NG	2009	2014	78
country	NG	2009	2013	78
country	NG	2009	2012	79
country	NG	2009	2011	78
country	NG	2009	2010	77
country	NG	2009	2009	76
country	NG	2009	2008	80
country	NG	2009	2007	81
country	NG	2009	2006	80
country	NG	2009	2005	80
country	NG	2009	2004	79
country	NG	2009	2003	79
country	NG	2009	2002	78
country	NG	2009	2001	76
country	NG	2009	2000	78
country	SN	2009	2016	46
country	SN	2009	2015	46
country	SN	2009	2014	46
country	SN	2009	2013	46
country	SN	2009	2012	47
country	SN	2009	2011	47
country	SN	2009	2010	49
country	SN	2009	2009	49
country	SN	2009	2008	48
country	SN	2009	2007	44
country	SN	2009	2006	44
country	SN	2009	2005	46
country	SN	2009	2004	45
country	SN	2009	2003	45
country	SN	2009	2002	45
country	SN	2009	2001	46
country	SN	2009	2000	47
country	TZ	2009	2016	45
country	TZ	2009	2015	45
country	TZ	2009	2014	45
country	TZ	2009	2013	45
country	TZ	2009	2012	45
country	TZ	2009	2011	43
country	TZ	2009	2010	42
country	TZ	2009	2009	42
country	TZ	2009	2008	42
country	TZ	2009	2007	40
country	TZ	2009	2006	40
country	TZ	2009	2005	40
country	TZ	2009	2004	40
country	TZ	2009	2003	39
country	TZ	2009	2002	39
country	TZ	2009	2001	38
country	TZ	2009	2000	38
country	UG	2009	2016	72
country	UG	2009	2015	72
country	UG	2009	2014	72
country	UG	2009	2013	72
country	UG	2009	2012	72
country	UG	2009	2011	72
country	UG	2009	2010	71
country	UG	2009	2009	71
country	UG	2009	2008	70
country	UG	2009	2007	68
country	UG	2009	2006	67
country	UG	2009	2005	66
country	UG	2009	2004	66
country	UG	2009	2003	66
country	UG	2009	2002	64
country	UG	2009	2001	63
country	UG	2009	2000	63
country	UG	2009	1999	61
country	UG	2009	1998	61
country	UG	2009	1997	61
country	UG	2009	1996	61
country	ZA	2009	2016	80
country	ZA	2009	2015	80
country	ZA	2009	2014	80
country	ZA	2009	2013	80
country	ZA	2009	2012	80
country	ZA	2009	2011	79
country	ZA	2009	2010	80
country	ZA	2009	2009	80
country	ZA	2009	2008	80
country	ZA	2009	2007	80
country	ZA	2009	2006	80
country	ZA	2009	2005	80
country	ZA	2009	2004	80
country	ZA	2009	2003	81
country	ZA	2009	2002	81
country	ZA	2009	2001	81
country	ZA	2009	2000	81
country	ZA	2009	1999	81
country	ZA	2009	1998	81
country	ZA	2009	1997	81
country	ZM	2009	2016	45
country	ZM	2009	2015	32
country	ZM	2009	2014	32
country	ZM	2009	2013	32
country	ZM	2009	2012	32
country	ZM	2009	2011	32
country	ZM	2009	2010	32
country	ZM	2009	2009	32
country	ZM	2009	2008	31
country	ZM	2009	2007	31
country	ZM	2009	2006	31
country	ZM	2009	2005	31
country	ZM	2009	2004	31
country	ZM	2009	2003	31
country	ZM	2009	2002	30
country	ZM	2009	2001	30
country	ZM	2009	2000	30
country	ZM	2009	1999	30
country	ZM	2009	1998	30
country	ZM	2009	1997	30
country	ZM	2009	1996	29
\.


--
-- Name: agricultural_land pk_agricultural_land; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.agricultural_land
    ADD CONSTRAINT pk_agricultural_land PRIMARY KEY (geo_level, geo_code, geo_version, agricultural_land_year);


--
-- PostgreSQL database dump complete
--
