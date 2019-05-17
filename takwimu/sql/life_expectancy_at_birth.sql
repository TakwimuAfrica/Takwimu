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

ALTER TABLE IF EXISTS ONLY public.life_expectancy_at_birth DROP CONSTRAINT IF EXISTS pk_life_expectancy_at_birth;
DROP TABLE IF EXISTS public.life_expectancy_at_birth;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: life_expectancy_at_birth; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.life_expectancy_at_birth (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    life_expectancy_at_birth_year character varying(128) NOT NULL,
    sex character varying(128) NOT NULL,
    total integer
);


--
-- Data for Name: life_expectancy_at_birth; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.life_expectancy_at_birth (geo_level, geo_code, geo_version, life_expectancy_at_birth_year, sex, total) FROM stdin;
country	BF	2009	1997	M	48
country	BF	2009	1998	M	48
country	BF	2009	1999	M	49
country	BF	2009	2000	M	49
country	BF	2009	2001	M	50
country	BF	2009	2002	M	50
country	BF	2009	2003	M	51
country	BF	2009	2004	M	52
country	BF	2009	2005	M	52
country	BF	2009	2006	M	53
country	BF	2009	2007	M	54
country	BF	2009	2008	M	55
country	BF	2009	2009	M	56
country	BF	2009	2010	M	56
country	BF	2009	2011	M	57
country	BF	2009	2012	M	58
country	BF	2009	2013	M	58
country	BF	2009	2014	M	59
country	BF	2009	2015	M	59
country	BF	2009	2016	M	60
country	CD	2009	1997	M	48
country	CD	2009	1998	M	48
country	CD	2009	1999	M	48
country	CD	2009	2000	M	49
country	CD	2009	2001	M	49
country	CD	2009	2002	M	50
country	CD	2009	2003	M	51
country	CD	2009	2004	M	51
country	CD	2009	2005	M	52
country	CD	2009	2006	M	53
country	CD	2009	2007	M	54
country	CD	2009	2008	M	54
country	CD	2009	2009	M	55
country	CD	2009	2010	M	55
country	CD	2009	2011	M	56
country	CD	2009	2012	M	56
country	CD	2009	2013	M	57
country	CD	2009	2014	M	57
country	CD	2009	2015	M	58
country	CD	2009	2016	M	58
country	ET	2009	2016	M	64
country	ET	2009	2015	M	63
country	ET	2009	2014	M	63
country	ET	2009	2013	M	62
country	ET	2009	2012	M	62
country	ET	2009	2011	M	61
country	ET	2009	2010	M	60
country	ET	2009	2009	M	59
country	ET	2009	2008	M	58
country	ET	2009	2007	M	57
country	ET	2009	2006	M	56
country	ET	2009	2005	M	55
country	ET	2009	2004	M	54
country	ET	2009	2003	M	53
country	ET	2009	2002	M	52
country	ET	2009	2001	M	51
country	ET	2009	2000	M	51
country	KE	2009	2016	M	65
country	KE	2009	2015	M	64
country	KE	2009	2014	M	64
country	KE	2009	2013	M	63
country	KE	2009	2012	M	63
country	KE	2009	2011	M	62
country	KE	2009	2010	M	61
country	KE	2009	2009	M	60
country	KE	2009	2008	M	59
country	KE	2009	2007	M	57
country	KE	2009	2006	M	56
country	KE	2009	2005	M	54
country	KE	2009	2004	M	53
country	KE	2009	2003	M	52
country	KE	2009	2002	M	51
country	KE	2009	2001	M	50
country	KE	2009	2000	M	50
country	NG	2009	2016	M	53
country	NG	2009	2015	M	52
country	NG	2009	2014	M	52
country	NG	2009	2013	M	51
country	NG	2009	2012	M	51
country	NG	2009	2011	M	51
country	NG	2009	2010	M	50
country	NG	2009	2009	M	50
country	NG	2009	2008	M	49
country	NG	2009	2007	M	49
country	NG	2009	2006	M	48
country	NG	2009	2005	M	47
country	NG	2009	2004	M	47
country	NG	2009	2003	M	46
country	NG	2009	2002	M	46
country	NG	2009	2001	M	46
country	NG	2009	2000	M	45
country	SN	2009	2016	M	65
country	SN	2009	2015	M	65
country	SN	2009	2014	M	64
country	SN	2009	2013	M	64
country	SN	2009	2012	M	64
country	SN	2009	2011	M	63
country	SN	2009	2010	M	63
country	SN	2009	2009	M	62
country	SN	2009	2008	M	61
country	SN	2009	2007	M	61
country	SN	2009	2006	M	60
country	SN	2009	2005	M	59
country	SN	2009	2004	M	58
country	SN	2009	2003	M	58
country	SN	2009	2002	M	57
country	SN	2009	2001	M	57
country	SN	2009	2000	M	56
country	TZ	2009	2016	M	64
country	TZ	2009	2015	M	63
country	TZ	2009	2014	M	62
country	TZ	2009	2013	M	61
country	TZ	2009	2012	M	61
country	TZ	2009	2011	M	60
country	TZ	2009	2010	M	59
country	TZ	2009	2009	M	59
country	TZ	2009	2008	M	58
country	TZ	2009	2007	M	57
country	TZ	2009	2006	M	56
country	TZ	2009	2005	M	55
country	TZ	2009	2004	M	54
country	TZ	2009	2003	M	53
country	TZ	2009	2002	M	51
country	TZ	2009	2001	M	51
country	TZ	2009	2000	M	50
country	UG	2009	1996	M	42
country	UG	2009	1997	M	42
country	UG	2009	1998	M	43
country	UG	2009	1999	M	44
country	UG	2009	2000	M	45
country	UG	2009	2001	M	46
country	UG	2009	2002	M	47
country	UG	2009	2003	M	48
country	UG	2009	2004	M	50
country	UG	2009	2005	M	51
country	UG	2009	2006	M	52
country	UG	2009	2007	M	53
country	UG	2009	2008	M	54
country	UG	2009	2009	M	55
country	UG	2009	2010	M	55
country	UG	2009	2011	M	56
country	UG	2009	2012	M	56
country	UG	2009	2013	M	57
country	UG	2009	2014	M	57
country	UG	2009	2015	M	57
country	UG	2009	2016	M	58
country	ZA	2009	2016	M	59
country	ZA	2009	2015	M	58
country	ZA	2009	2014	M	58
country	ZA	2009	2013	M	56
country	ZA	2009	2012	M	55
country	ZA	2009	2011	M	54
country	ZA	2009	2010	M	53
country	ZA	2009	2009	M	52
country	ZA	2009	2008	M	51
country	ZA	2009	2007	M	51
country	ZA	2009	2006	M	50
country	ZA	2009	2005	M	50
country	ZA	2009	2004	M	50
country	ZA	2009	2003	M	51
country	ZA	2009	2002	M	52
country	ZA	2009	2001	M	52
country	ZA	2009	2000	M	53
country	ZM	2009	1996	M	41
country	ZM	2009	1997	M	41
country	ZM	2009	1998	M	42
country	ZM	2009	1999	M	42
country	ZM	2009	2000	M	43
country	ZM	2009	2001	M	44
country	ZM	2009	2002	M	45
country	ZM	2009	2003	M	46
country	ZM	2009	2004	M	47
country	ZM	2009	2005	M	48
country	ZM	2009	2006	M	49
country	ZM	2009	2007	M	51
country	ZM	2009	2008	M	52
country	ZM	2009	2009	M	53
country	ZM	2009	2010	M	55
country	ZM	2009	2011	M	56
country	ZM	2009	2012	M	57
country	ZM	2009	2013	M	58
country	ZM	2009	2014	M	58
country	ZM	2009	2015	M	59
country	ZM	2009	2016	M	59
country	BF	2009	1997	F	51
country	BF	2009	1998	F	51
country	BF	2009	1999	F	51
country	BF	2009	2000	F	52
country	BF	2009	2001	F	52
country	BF	2009	2002	F	52
country	BF	2009	2003	F	53
country	BF	2009	2004	F	53
country	BF	2009	2005	F	54
country	BF	2009	2006	F	55
country	BF	2009	2007	F	55
country	BF	2009	2008	F	56
country	BF	2009	2009	F	57
country	BF	2009	2010	F	58
country	BF	2009	2011	F	58
country	BF	2009	2012	F	59
country	BF	2009	2013	F	59
country	BF	2009	2014	F	60
country	BF	2009	2015	F	61
country	BF	2009	2016	F	61
country	CD	2009	1997	F	50
country	CD	2009	1998	F	51
country	CD	2009	1999	F	51
country	CD	2009	2000	F	51
country	CD	2009	2001	F	52
country	CD	2009	2002	F	53
country	CD	2009	2003	F	54
country	CD	2009	2004	F	54
country	CD	2009	2005	F	55
country	CD	2009	2006	F	56
country	CD	2009	2007	F	57
country	CD	2009	2008	F	57
country	CD	2009	2009	F	58
country	CD	2009	2010	F	58
country	CD	2009	2011	F	59
country	CD	2009	2012	F	59
country	CD	2009	2013	F	60
country	CD	2009	2014	F	60
country	CD	2009	2015	F	61
country	CD	2009	2016	F	61
country	ET	2009	2016	F	67
country	ET	2009	2015	F	67
country	ET	2009	2014	F	66
country	ET	2009	2013	F	66
country	ET	2009	2012	F	65
country	ET	2009	2011	F	64
country	ET	2009	2010	F	63
country	ET	2009	2009	F	62
country	ET	2009	2008	F	61
country	ET	2009	2007	F	60
country	ET	2009	2006	F	59
country	ET	2009	2005	F	58
country	ET	2009	2004	F	57
country	ET	2009	2003	F	56
country	ET	2009	2002	F	55
country	ET	2009	2001	F	54
country	ET	2009	2000	F	53
country	KE	2009	2016	F	69
country	KE	2009	2015	F	69
country	KE	2009	2014	F	69
country	KE	2009	2013	F	68
country	KE	2009	2012	F	67
country	KE	2009	2011	F	66
country	KE	2009	2010	F	65
country	KE	2009	2009	F	63
country	KE	2009	2008	F	62
country	KE	2009	2007	F	60
country	KE	2009	2006	F	59
country	KE	2009	2005	F	57
country	KE	2009	2004	F	56
country	KE	2009	2003	F	55
country	KE	2009	2002	F	54
country	KE	2009	2001	F	54
country	KE	2009	2000	F	54
country	NG	2009	2016	F	54
country	NG	2009	2015	F	54
country	NG	2009	2014	F	53
country	NG	2009	2013	F	53
country	NG	2009	2012	F	52
country	NG	2009	2011	F	52
country	NG	2009	2010	F	52
country	NG	2009	2009	F	51
country	NG	2009	2008	F	51
country	NG	2009	2007	F	50
country	NG	2009	2006	F	50
country	NG	2009	2005	F	49
country	NG	2009	2004	F	49
country	NG	2009	2003	F	48
country	NG	2009	2002	F	48
country	NG	2009	2001	F	47
country	NG	2009	2000	F	47
country	SN	2009	2016	F	69
country	SN	2009	2015	F	69
country	SN	2009	2014	F	68
country	SN	2009	2013	F	68
country	SN	2009	2012	F	67
country	SN	2009	2011	F	66
country	SN	2009	2010	F	66
country	SN	2009	2009	F	65
country	SN	2009	2008	F	64
country	SN	2009	2007	F	63
country	SN	2009	2006	F	63
country	SN	2009	2005	F	62
country	SN	2009	2004	F	61
country	SN	2009	2003	F	61
country	SN	2009	2002	F	60
country	SN	2009	2001	F	60
country	SN	2009	2000	F	59
country	TZ	2009	2016	F	67
country	TZ	2009	2015	F	67
country	TZ	2009	2014	F	66
country	TZ	2009	2013	F	65
country	TZ	2009	2012	F	64
country	TZ	2009	2011	F	63
country	TZ	2009	2010	F	63
country	TZ	2009	2009	F	62
country	TZ	2009	2008	F	61
country	TZ	2009	2007	F	60
country	TZ	2009	2006	F	59
country	TZ	2009	2005	F	58
country	TZ	2009	2004	F	57
country	TZ	2009	2003	F	56
country	TZ	2009	2002	F	55
country	TZ	2009	2001	F	54
country	TZ	2009	2000	F	53
country	UG	2009	1996	F	47
country	UG	2009	1997	F	48
country	UG	2009	1998	F	48
country	UG	2009	1999	F	49
country	UG	2009	2000	F	50
country	UG	2009	2001	F	50
country	UG	2009	2002	F	51
country	UG	2009	2003	F	52
country	UG	2009	2004	F	53
country	UG	2009	2005	F	54
country	UG	2009	2006	F	55
country	UG	2009	2007	F	56
country	UG	2009	2008	F	57
country	UG	2009	2009	F	58
country	UG	2009	2010	F	59
country	UG	2009	2011	F	60
country	UG	2009	2012	F	60
country	UG	2009	2013	F	61
country	UG	2009	2014	F	61
country	UG	2009	2015	F	62
country	UG	2009	2016	F	62
country	ZA	2009	2016	F	66
country	ZA	2009	2015	F	66
country	ZA	2009	2014	F	65
country	ZA	2009	2013	F	63
country	ZA	2009	2012	F	62
country	ZA	2009	2011	F	60
country	ZA	2009	2010	F	59
country	ZA	2009	2009	F	57
country	ZA	2009	2008	F	56
country	ZA	2009	2007	F	56
country	ZA	2009	2006	F	55
country	ZA	2009	2005	F	55
country	ZA	2009	2004	F	55
country	ZA	2009	2003	F	56
country	ZA	2009	2002	F	57
country	ZA	2009	2001	F	58
country	ZA	2009	2000	F	60
country	ZM	2009	1996	F	45
country	ZM	2009	1997	F	45
country	ZM	2009	1998	F	46
country	ZM	2009	1999	F	46
country	ZM	2009	2000	F	46
country	ZM	2009	2001	F	47
country	ZM	2009	2002	F	48
country	ZM	2009	2003	F	49
country	ZM	2009	2004	F	50
country	ZM	2009	2005	F	51
country	ZM	2009	2006	F	53
country	ZM	2009	2007	F	54
country	ZM	2009	2008	F	56
country	ZM	2009	2009	F	57
country	ZM	2009	2010	F	59
country	ZM	2009	2011	F	60
country	ZM	2009	2012	F	61
country	ZM	2009	2013	F	62
country	ZM	2009	2014	F	63
country	ZM	2009	2015	F	64
country	ZM	2009	2016	F	64
\.


--
-- Name: life_expectancy_at_birth pk_life_expectancy_at_birth; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.life_expectancy_at_birth
    ADD CONSTRAINT pk_life_expectancy_at_birth PRIMARY KEY (geo_level, geo_code, geo_version, life_expectancy_at_birth_year, sex);


--
-- PostgreSQL database dump complete
--
