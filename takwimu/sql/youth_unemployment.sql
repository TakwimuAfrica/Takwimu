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
country	BF	2009	1997	M	3
country	BF	2009	1998	M	3
country	BF	2009	1999	M	3
country	BF	2009	2000	M	4
country	BF	2009	2001	M	4
country	BF	2009	2002	M	4
country	BF	2009	2003	M	4
country	BF	2009	2004	M	5
country	BF	2009	2005	M	5
country	BF	2009	2006	M	4
country	BF	2009	2007	M	5
country	BF	2009	2008	M	5
country	BF	2009	2009	M	5
country	BF	2009	2010	M	5
country	BF	2009	2011	M	5
country	BF	2009	2012	M	5
country	BF	2009	2013	M	5
country	BF	2009	2014	M	5
country	BF	2009	2015	M	5
country	BF	2009	2016	M	5
country	BF	2009	2017	M	5
country	CD	2009	1997	M	7
country	CD	2009	1998	M	7
country	CD	2009	1999	M	7
country	CD	2009	2000	M	7
country	CD	2009	2001	M	7
country	CD	2009	2002	M	7
country	CD	2009	2003	M	7
country	CD	2009	2004	M	7
country	CD	2009	2005	M	7
country	CD	2009	2006	M	7
country	CD	2009	2007	M	7
country	CD	2009	2008	M	7
country	CD	2009	2009	M	7
country	CD	2009	2010	M	7
country	CD	2009	2011	M	7
country	CD	2009	2012	M	7
country	CD	2009	2013	M	7
country	CD	2009	2014	M	7
country	CD	2009	2015	M	7
country	CD	2009	2016	M	7
country	CD	2009	2017	M	7
country	ET	2009	2018	M	5
country	ET	2009	2017	M	5
country	ET	2009	2016	M	5
country	ET	2009	2015	M	5
country	ET	2009	2014	M	5
country	ET	2009	2013	M	5
country	ET	2009	2012	M	5
country	ET	2009	2011	M	5
country	ET	2009	2010	M	5
country	ET	2009	2009	M	5
country	ET	2009	2008	M	4
country	ET	2009	2007	M	4
country	ET	2009	2006	M	4
country	ET	2009	2005	M	4
country	ET	2009	2004	M	5
country	ET	2009	2003	M	5
country	ET	2009	2002	M	6
country	ET	2009	2001	M	7
country	ET	2009	2000	M	7
country	KE	2009	2018	M	20
country	KE	2009	2017	M	20
country	KE	2009	2016	M	20
country	KE	2009	2015	M	20
country	KE	2009	2014	M	20
country	KE	2009	2013	M	20
country	KE	2009	2012	M	20
country	KE	2009	2011	M	20
country	KE	2009	2010	M	20
country	KE	2009	2009	M	20
country	KE	2009	2008	M	18
country	KE	2009	2007	M	18
country	KE	2009	2006	M	17
country	KE	2009	2005	M	17
country	KE	2009	2004	M	17
country	KE	2009	2003	M	16
country	KE	2009	2002	M	16
country	KE	2009	2001	M	16
country	KE	2009	2000	M	15
country	NG	2009	2018	M	12
country	NG	2009	2017	M	12
country	NG	2009	2016	M	12
country	NG	2009	2015	M	7
country	NG	2009	2014	M	8
country	NG	2009	2013	M	9
country	NG	2009	2012	M	9
country	NG	2009	2011	M	9
country	NG	2009	2010	M	9
country	NG	2009	2009	M	9
country	NG	2009	2008	M	9
country	NG	2009	2007	M	9
country	NG	2009	2006	M	9
country	NG	2009	2005	M	9
country	NG	2009	2004	M	9
country	NG	2009	2003	M	9
country	NG	2009	2002	M	9
country	NG	2009	2001	M	9
country	NG	2009	2000	M	9
country	SN	2009	2018	M	5
country	SN	2009	2017	M	5
country	SN	2009	2016	M	5
country	SN	2009	2015	M	5
country	SN	2009	2014	M	6
country	SN	2009	2013	M	7
country	SN	2009	2012	M	8
country	SN	2009	2011	M	8
country	SN	2009	2010	M	9
country	SN	2009	2009	M	10
country	SN	2009	2008	M	11
country	SN	2009	2007	M	11
country	SN	2009	2006	M	12
country	SN	2009	2005	M	11
country	SN	2009	2004	M	10
country	SN	2009	2003	M	8
country	SN	2009	2002	M	7
country	SN	2009	2001	M	7
country	SN	2009	2000	M	7
country	TZ	2009	2018	M	3
country	TZ	2009	2017	M	3
country	TZ	2009	2016	M	3
country	TZ	2009	2015	M	3
country	TZ	2009	2014	M	3
country	TZ	2009	2013	M	4
country	TZ	2009	2012	M	5
country	TZ	2009	2011	M	6
country	TZ	2009	2010	M	5
country	TZ	2009	2009	M	4
country	TZ	2009	2008	M	6
country	TZ	2009	2007	M	6
country	TZ	2009	2006	M	7
country	TZ	2009	2005	M	7
country	TZ	2009	2004	M	7
country	TZ	2009	2003	M	6
country	TZ	2009	2002	M	6
country	TZ	2009	2001	M	8
country	TZ	2009	2000	M	7
country	UG	2009	1996	M	3
country	UG	2009	1997	M	3
country	UG	2009	1998	M	3
country	UG	2009	1999	M	4
country	UG	2009	2000	M	4
country	UG	2009	2001	M	4
country	UG	2009	2002	M	5
country	UG	2009	2003	M	4
country	UG	2009	2004	M	3
country	UG	2009	2005	M	3
country	UG	2009	2006	M	3
country	UG	2009	2007	M	4
country	UG	2009	2008	M	5
country	UG	2009	2009	M	6
country	UG	2009	2010	M	5
country	UG	2009	2011	M	5
country	UG	2009	2012	M	5
country	UG	2009	2013	M	2
country	UG	2009	2014	M	2
country	UG	2009	2015	M	2
country	UG	2009	2016	M	2
country	UG	2009	2017	M	2
country	ZA	2009	2018	M	50
country	ZA	2009	2017	M	49
country	ZA	2009	2016	M	49
country	ZA	2009	2015	M	46
country	ZA	2009	2014	M	48
country	ZA	2009	2013	M	48
country	ZA	2009	2012	M	48
country	ZA	2009	2011	M	46
country	ZA	2009	2010	M	48
country	ZA	2009	2009	M	45
country	ZA	2009	2008	M	42
country	ZA	2009	2007	M	41
country	ZA	2009	2006	M	42
country	ZA	2009	2005	M	43
country	ZA	2009	2004	M	46
country	ZA	2009	2003	M	52
country	ZA	2009	2002	M	49
country	ZA	2009	2001	M	47
country	ZA	2009	2000	M	41
country	ZM	2009	1996	M	27
country	ZM	2009	1997	M	24
country	ZM	2009	1998	M	22
country	ZM	2009	1999	M	23
country	ZM	2009	2000	M	23
country	ZM	2009	2001	M	23
country	ZM	2009	2002	M	22
country	ZM	2009	2003	M	21
country	ZM	2009	2004	M	20
country	ZM	2009	2005	M	19
country	ZM	2009	2006	M	18
country	ZM	2009	2007	M	17
country	ZM	2009	2008	M	15
country	ZM	2009	2009	M	20
country	ZM	2009	2010	M	26
country	ZM	2009	2011	M	20
country	ZM	2009	2012	M	15
country	ZM	2009	2013	M	15
country	ZM	2009	2014	M	15
country	ZM	2009	2015	M	15
country	ZM	2009	2016	M	15
country	ZM	2009	2017	M	15
country	BF	2009	1997	F	4
country	BF	2009	1998	F	4
country	BF	2009	1999	F	4
country	BF	2009	2000	F	4
country	BF	2009	2001	F	4
country	BF	2009	2002	F	4
country	BF	2009	2003	F	4
country	BF	2009	2004	F	5
country	BF	2009	2005	F	6
country	BF	2009	2006	F	3
country	BF	2009	2007	F	5
country	BF	2009	2008	F	6
country	BF	2009	2009	F	7
country	BF	2009	2010	F	9
country	BF	2009	2011	F	10
country	BF	2009	2012	F	11
country	BF	2009	2013	F	12
country	BF	2009	2014	F	13
country	BF	2009	2015	F	13
country	BF	2009	2016	F	13
country	BF	2009	2017	F	13
country	CD	2009	1997	F	8
country	CD	2009	1998	F	8
country	CD	2009	1999	F	8
country	CD	2009	2000	F	8
country	CD	2009	2001	F	8
country	CD	2009	2002	F	8
country	CD	2009	2003	F	8
country	CD	2009	2004	F	8
country	CD	2009	2005	F	8
country	CD	2009	2006	F	8
country	CD	2009	2007	F	8
country	CD	2009	2008	F	8
country	CD	2009	2009	F	8
country	CD	2009	2010	F	8
country	CD	2009	2011	F	8
country	CD	2009	2012	F	8
country	CD	2009	2013	F	8
country	CD	2009	2014	F	8
country	CD	2009	2015	F	8
country	CD	2009	2016	F	8
country	CD	2009	2017	F	8
country	ET	2009	2018	F	10
country	ET	2009	2017	F	10
country	ET	2009	2016	F	10
country	ET	2009	2015	F	9
country	ET	2009	2014	F	9
country	ET	2009	2013	F	9
country	ET	2009	2012	F	10
country	ET	2009	2011	F	10
country	ET	2009	2010	F	10
country	ET	2009	2009	F	10
country	ET	2009	2008	F	11
country	ET	2009	2007	F	11
country	ET	2009	2006	F	11
country	ET	2009	2005	F	11
country	ET	2009	2004	F	12
country	ET	2009	2003	F	13
country	ET	2009	2002	F	14
country	ET	2009	2001	F	16
country	ET	2009	2000	F	17
country	KE	2009	2018	F	33
country	KE	2009	2017	F	33
country	KE	2009	2016	F	33
country	KE	2009	2015	F	33
country	KE	2009	2014	F	33
country	KE	2009	2013	F	33
country	KE	2009	2012	F	33
country	KE	2009	2011	F	33
country	KE	2009	2010	F	33
country	KE	2009	2009	F	33
country	KE	2009	2008	F	29
country	KE	2009	2007	F	29
country	KE	2009	2006	F	28
country	KE	2009	2005	F	28
country	KE	2009	2004	F	27
country	KE	2009	2003	F	27
country	KE	2009	2002	F	26
country	KE	2009	2001	F	26
country	KE	2009	2000	F	25
country	NG	2009	2018	F	16
country	NG	2009	2017	F	15
country	NG	2009	2016	F	15
country	NG	2009	2015	F	9
country	NG	2009	2014	F	10
country	NG	2009	2013	F	11
country	NG	2009	2012	F	11
country	NG	2009	2011	F	11
country	NG	2009	2010	F	11
country	NG	2009	2009	F	11
country	NG	2009	2008	F	11
country	NG	2009	2007	F	11
country	NG	2009	2006	F	11
country	NG	2009	2005	F	11
country	NG	2009	2004	F	11
country	NG	2009	2003	F	11
country	NG	2009	2002	F	11
country	NG	2009	2001	F	11
country	NG	2009	2000	F	11
country	SN	2009	2018	F	6
country	SN	2009	2017	F	6
country	SN	2009	2016	F	6
country	SN	2009	2015	F	5
country	SN	2009	2014	F	9
country	SN	2009	2013	F	13
country	SN	2009	2012	F	16
country	SN	2009	2011	F	19
country	SN	2009	2010	F	19
country	SN	2009	2009	F	20
country	SN	2009	2008	F	20
country	SN	2009	2007	F	20
country	SN	2009	2006	F	20
country	SN	2009	2005	F	18
country	SN	2009	2004	F	16
country	SN	2009	2003	F	14
country	SN	2009	2002	F	12
country	SN	2009	2001	F	12
country	SN	2009	2000	F	12
country	TZ	2009	2018	F	5
country	TZ	2009	2017	F	5
country	TZ	2009	2016	F	5
country	TZ	2009	2015	F	4
country	TZ	2009	2014	F	4
country	TZ	2009	2013	F	7
country	TZ	2009	2012	F	8
country	TZ	2009	2011	F	8
country	TZ	2009	2010	F	7
country	TZ	2009	2009	F	6
country	TZ	2009	2008	F	8
country	TZ	2009	2007	F	9
country	TZ	2009	2006	F	10
country	TZ	2009	2005	F	10
country	TZ	2009	2004	F	9
country	TZ	2009	2003	F	9
country	TZ	2009	2002	F	8
country	TZ	2009	2001	F	11
country	TZ	2009	2000	F	10
country	UG	2009	1996	F	3
country	UG	2009	1997	F	4
country	UG	2009	1998	F	4
country	UG	2009	1999	F	5
country	UG	2009	2000	F	5
country	UG	2009	2001	F	5
country	UG	2009	2002	F	6
country	UG	2009	2003	F	5
country	UG	2009	2004	F	4
country	UG	2009	2005	F	3
country	UG	2009	2006	F	4
country	UG	2009	2007	F	5
country	UG	2009	2008	F	6
country	UG	2009	2009	F	7
country	UG	2009	2010	F	7
country	UG	2009	2011	F	6
country	UG	2009	2012	F	6
country	UG	2009	2013	F	3
country	UG	2009	2014	F	3
country	UG	2009	2015	F	3
country	UG	2009	2016	F	4
country	UG	2009	2017	F	4
country	ZA	2009	2018	F	59
country	ZA	2009	2017	F	59
country	ZA	2009	2016	F	59
country	ZA	2009	2015	F	55
country	ZA	2009	2014	F	55
country	ZA	2009	2013	F	56
country	ZA	2009	2012	F	57
country	ZA	2009	2011	F	55
country	ZA	2009	2010	F	55
country	ZA	2009	2009	F	52
country	ZA	2009	2008	F	50
country	ZA	2009	2007	F	53
country	ZA	2009	2006	F	53
country	ZA	2009	2005	F	55
country	ZA	2009	2004	F	57
country	ZA	2009	2003	F	59
country	ZA	2009	2002	F	56
country	ZA	2009	2001	F	52
country	ZA	2009	2000	F	52
country	ZM	2009	1996	F	29
country	ZM	2009	1997	F	26
country	ZM	2009	1998	F	23
country	ZM	2009	1999	F	24
country	ZM	2009	2000	F	20
country	ZM	2009	2001	F	20
country	ZM	2009	2002	F	19
country	ZM	2009	2003	F	19
country	ZM	2009	2004	F	19
country	ZM	2009	2005	F	18
country	ZM	2009	2006	F	18
country	ZM	2009	2007	F	18
country	ZM	2009	2008	F	16
country	ZM	2009	2009	F	22
country	ZM	2009	2010	F	27
country	ZM	2009	2011	F	21
country	ZM	2009	2012	F	16
country	ZM	2009	2013	F	16
country	ZM	2009	2014	F	16
country	ZM	2009	2015	F	16
country	ZM	2009	2016	F	16
country	ZM	2009	2017	F	16
\.


--
-- Name: youth_unemployment pk_youth_unemployment; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.youth_unemployment
    ADD CONSTRAINT pk_youth_unemployment PRIMARY KEY (geo_level, geo_code, geo_version, youth_unemployment_year, sex);


--
-- PostgreSQL database dump complete
--
