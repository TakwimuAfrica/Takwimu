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

ALTER TABLE IF EXISTS ONLY public.youth_unemployment DROP CONSTRAINT IF EXISTS pk_youth_unemployment;
DROP TABLE IF EXISTS public.youth_unemployment;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: youth_unemployment; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.youth_unemployment (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    youth_unemployment_year character varying(128) NOT NULL,
    sex character varying(128) NOT NULL,
    total integer
);


--
-- Data for Name: youth_unemployment; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.youth_unemployment (geo_level, geo_code, geo_version, youth_unemployment_year, sex, total) FROM stdin;
country	ET	2009	2018		5
country	ET	2009	2017		5
country	ET	2009	2016		5
country	ET	2009	2015		5
country	ET	2009	2014		5
country	ET	2009	2013		5
country	ET	2009	2012		5
country	ET	2009	2011		5
country	ET	2009	2010		5
country	ET	2009	2009		5
country	ET	2009	2008		4
country	ET	2009	2007		4
country	ET	2009	2006		4
country	ET	2009	2005		4
country	ET	2009	2004		5
country	ET	2009	2003		5
country	ET	2009	2002		6
country	ET	2009	2001		7
country	ET	2009	2000		7
country	KE	2009	2018		20
country	KE	2009	2017		20
country	KE	2009	2016		20
country	KE	2009	2015		20
country	KE	2009	2014		20
country	KE	2009	2013		20
country	KE	2009	2012		20
country	KE	2009	2011		20
country	KE	2009	2010		20
country	KE	2009	2009		20
country	KE	2009	2008		18
country	KE	2009	2007		18
country	KE	2009	2006		17
country	KE	2009	2005		17
country	KE	2009	2004		17
country	KE	2009	2003		16
country	KE	2009	2002		16
country	KE	2009	2001		16
country	KE	2009	2000		15
country	NG	2009	2018		12
country	NG	2009	2017		12
country	NG	2009	2016		12
country	NG	2009	2015		7
country	NG	2009	2014		8
country	NG	2009	2013		9
country	NG	2009	2012		9
country	NG	2009	2011		9
country	NG	2009	2010		9
country	NG	2009	2009		9
country	NG	2009	2008		9
country	NG	2009	2007		9
country	NG	2009	2006		9
country	NG	2009	2005		9
country	NG	2009	2004		9
country	NG	2009	2003		9
country	NG	2009	2002		9
country	NG	2009	2001		9
country	NG	2009	2000		9
country	SN	2009	2018		5
country	SN	2009	2017		5
country	SN	2009	2016		5
country	SN	2009	2015		5
country	SN	2009	2014		6
country	SN	2009	2013		7
country	SN	2009	2012		8
country	SN	2009	2011		8
country	SN	2009	2010		9
country	SN	2009	2009		10
country	SN	2009	2008		11
country	SN	2009	2007		11
country	SN	2009	2006		12
country	SN	2009	2005		11
country	SN	2009	2004		10
country	SN	2009	2003		8
country	SN	2009	2002		7
country	SN	2009	2001		7
country	SN	2009	2000		7
country	TZ	2009	2018		3
country	TZ	2009	2017		3
country	TZ	2009	2016		3
country	TZ	2009	2015		3
country	TZ	2009	2014		3
country	TZ	2009	2013		4
country	TZ	2009	2012		5
country	TZ	2009	2011		6
country	TZ	2009	2010		5
country	TZ	2009	2009		4
country	TZ	2009	2008		6
country	TZ	2009	2007		6
country	TZ	2009	2006		7
country	TZ	2009	2005		7
country	TZ	2009	2004		7
country	TZ	2009	2003		6
country	TZ	2009	2002		6
country	TZ	2009	2001		8
country	TZ	2009	2000		7
country	ZA	2009	2018		50
country	ZA	2009	2017		49
country	ZA	2009	2016		49
country	ZA	2009	2015		46
country	ZA	2009	2014		48
country	ZA	2009	2013		48
country	ZA	2009	2012		48
country	ZA	2009	2011		46
country	ZA	2009	2010		48
country	ZA	2009	2009		45
country	ZA	2009	2008		42
country	ZA	2009	2007		41
country	ZA	2009	2006		42
country	ZA	2009	2005		43
country	ZA	2009	2004		46
country	ZA	2009	2003		52
country	ZA	2009	2002		49
country	ZA	2009	2001		47
country	ZA	2009	2000		41
country	ET	2009	2018	female	10
country	ET	2009	2017	female	10
country	ET	2009	2016	female	10
country	ET	2009	2015	female	9
country	ET	2009	2014	female	9
country	ET	2009	2013	female	9
country	ET	2009	2012	female	10
country	ET	2009	2011	female	10
country	ET	2009	2010	female	10
country	ET	2009	2009	female	10
country	ET	2009	2008	female	11
country	ET	2009	2007	female	11
country	ET	2009	2006	female	11
country	ET	2009	2005	female	11
country	ET	2009	2004	female	12
country	ET	2009	2003	female	13
country	ET	2009	2002	female	14
country	ET	2009	2001	female	16
country	ET	2009	2000	female	17
country	KE	2009	2018	female	33
country	KE	2009	2017	female	33
country	KE	2009	2016	female	33
country	KE	2009	2015	female	33
country	KE	2009	2014	female	33
country	KE	2009	2013	female	33
country	KE	2009	2012	female	33
country	KE	2009	2011	female	33
country	KE	2009	2010	female	33
country	KE	2009	2009	female	33
country	KE	2009	2008	female	29
country	KE	2009	2007	female	29
country	KE	2009	2006	female	28
country	KE	2009	2005	female	28
country	KE	2009	2004	female	27
country	KE	2009	2003	female	27
country	KE	2009	2002	female	26
country	KE	2009	2001	female	26
country	KE	2009	2000	female	25
country	NG	2009	2018	female	16
country	NG	2009	2017	female	15
country	NG	2009	2016	female	15
country	NG	2009	2015	female	9
country	NG	2009	2014	female	10
country	NG	2009	2013	female	11
country	NG	2009	2012	female	11
country	NG	2009	2011	female	11
country	NG	2009	2010	female	11
country	NG	2009	2009	female	11
country	NG	2009	2008	female	11
country	NG	2009	2007	female	11
country	NG	2009	2006	female	11
country	NG	2009	2005	female	11
country	NG	2009	2004	female	11
country	NG	2009	2003	female	11
country	NG	2009	2002	female	11
country	NG	2009	2001	female	11
country	NG	2009	2000	female	11
country	SN	2009	2018	female	6
country	SN	2009	2017	female	6
country	SN	2009	2016	female	6
country	SN	2009	2015	female	5
country	SN	2009	2014	female	9
country	SN	2009	2013	female	13
country	SN	2009	2012	female	16
country	SN	2009	2011	female	19
country	SN	2009	2010	female	19
country	SN	2009	2009	female	20
country	SN	2009	2008	female	20
country	SN	2009	2007	female	20
country	SN	2009	2006	female	20
country	SN	2009	2005	female	18
country	SN	2009	2004	female	16
country	SN	2009	2003	female	14
country	SN	2009	2002	female	12
country	SN	2009	2001	female	12
country	SN	2009	2000	female	12
country	TZ	2009	2018	female	5
country	TZ	2009	2017	female	5
country	TZ	2009	2016	female	5
country	TZ	2009	2015	female	4
country	TZ	2009	2014	female	4
country	TZ	2009	2013	female	7
country	TZ	2009	2012	female	8
country	TZ	2009	2011	female	8
country	TZ	2009	2010	female	7
country	TZ	2009	2009	female	6
country	TZ	2009	2008	female	8
country	TZ	2009	2007	female	9
country	TZ	2009	2006	female	10
country	TZ	2009	2005	female	10
country	TZ	2009	2004	female	9
country	TZ	2009	2003	female	9
country	TZ	2009	2002	female	8
country	TZ	2009	2001	female	11
country	TZ	2009	2000	female	10
country	ZA	2009	2018	female	59
country	ZA	2009	2017	female	59
country	ZA	2009	2016	female	59
country	ZA	2009	2015	female	55
country	ZA	2009	2014	female	55
country	ZA	2009	2013	female	56
country	ZA	2009	2012	female	57
country	ZA	2009	2011	female	55
country	ZA	2009	2010	female	55
country	ZA	2009	2009	female	52
country	ZA	2009	2008	female	50
country	ZA	2009	2007	female	53
country	ZA	2009	2006	female	53
country	ZA	2009	2005	female	55
country	ZA	2009	2004	female	57
country	ZA	2009	2003	female	59
country	ZA	2009	2002	female	56
country	ZA	2009	2001	female	52
country	ZA	2009	2000	female	52
\.


--
-- Name: youth_unemployment pk_youth_unemployment; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.youth_unemployment
    ADD CONSTRAINT pk_youth_unemployment PRIMARY KEY (geo_level, geo_code, geo_version, youth_unemployment_year, sex);


--
-- PostgreSQL database dump complete
--

