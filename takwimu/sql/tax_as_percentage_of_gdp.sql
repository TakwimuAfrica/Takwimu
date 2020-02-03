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

ALTER TABLE IF EXISTS ONLY public.tax_as_percentage_of_gdp DROP CONSTRAINT IF EXISTS pk_tax_as_percentage_of_gdp;
DROP TABLE IF EXISTS public.tax_as_percentage_of_gdp;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: tax_as_percentage_of_gdp; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tax_as_percentage_of_gdp (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    tax_as_percentage_of_gdp_year character varying(128) NOT NULL,
    total numeric
);


--
-- Data for Name: tax_as_percentage_of_gdp; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.tax_as_percentage_of_gdp (geo_level, geo_code, geo_version, tax_as_percentage_of_gdp_year, total) FROM stdin;
country	BF	2009	2002	11
country	BF	2009	2003	11
country	BF	2009	2004	13
country	BF	2009	2005	12
country	BF	2009	2006	12
country	BF	2009	2007	13
country	BF	2009	2008	12
country	BF	2009	2009	13
country	BF	2009	2010	13
country	BF	2009	2011	14
country	BF	2009	2012	16
country	BF	2009	2013	17
country	BF	2009	2014	15
country	BF	2009	2015	15
country	BF	2009	2016	16
country	CD	2009	1997	4
country	CD	2009	1998	5
country	CD	2009	1999	3
country	CD	2009	2000	1
country	CD	2009	2001	3
country	CD	2009	2002	4
country	CD	2009	2003	4
country	CD	2009	2004	5
country	CD	2009	2005	6
country	CD	2009	2006	7
country	CD	2009	2007	7
country	CD	2009	2008	9
country	CD	2009	2009	8
country	CD	2009	2010	8
country	ET	2009	2013	9
country	ET	2009	2012	9
country	ET	2009	2011	9
country	ET	2009	2010	8
country	ET	2009	2009	7
country	ET	2009	2008	8
country	ET	2009	2007	8
country	ET	2009	2006	8
country	ET	2009	2005	9
country	ET	2009	2004	10
country	ET	2009	2003	9
country	ET	2009	2002	10
country	ET	2009	2001	8
country	KE	2009	2016	16
country	KE	2009	2015	16
country	KE	2009	2014	17
country	NG	2009	2010	7.3
country	NG	2009	2011	9.6
country	NG	2009	2012	9.4
country	NG	2009	2013	8.3
country	NG	2009	2014	7.6
country	NG	2009	2015	6.1
country	NG	2009	2016	5.3
country	NG	2009	2017	5.7
country	SN	2009	2017	15
country	SN	2009	2016	16
country	SN	2009	2015	16
country	SN	2009	2014	15
country	SN	2009	2012	15
country	SN	2009	2011	15
country	SN	2009	2010	15
country	SN	2009	2009	14
country	SN	2009	2001	13
country	SN	2009	2000	13
country	TZ	2009	2014	12
country	ZA	2009	2016	27
country	ZA	2009	2015	27
country	ZA	2009	2014	27
country	ZA	2009	2013	26
country	ZA	2009	2012	26
country	ZA	2009	2011	25
country	ZA	2009	2010	25
country	ZA	2009	2009	24
country	ZA	2009	2008	27
country	ZA	2009	2007	28
country	ZA	2009	2006	27
country	ZA	2009	2005	26
country	ZA	2009	2004	24
country	ZA	2009	2003	23
country	ZA	2009	2002	23
country	ZA	2009	2001	24
country	ZA	2009	2000	23
country	ZM	2009	1996	16
country	ZM	2009	1997	16
country	ZM	2009	1998	16
country	ZM	2009	1999	17
country	ZM	2009	2001	17
country	ZM	2009	2002	15
country	ZM	2009	2003	15
country	ZM	2009	2004	15
country	ZM	2009	2005	15
country	ZM	2009	2006	14
country	ZM	2009	2007	14
country	ZM	2009	2008	14
country	ZM	2009	2009	12
country	ZM	2009	2010	13
country	ZM	2009	2011	17
country	ZM	2009	2012	16
country	ZM	2009	2013	16
country	ZM	2009	2014	17
country	ZM	2009	2015	17
country	ZM	2009	2016	15
\.


--
-- Name: tax_as_percentage_of_gdp pk_tax_as_percentage_of_gdp; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tax_as_percentage_of_gdp
    ADD CONSTRAINT pk_tax_as_percentage_of_gdp PRIMARY KEY (geo_level, geo_code, geo_version, tax_as_percentage_of_gdp_year);


--
-- PostgreSQL database dump complete
--
