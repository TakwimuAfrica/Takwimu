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
country	ET	2009	2016	male	64
country	ET	2009	2015	male	63
country	ET	2009	2014	male	63
country	ET	2009	2013	male	62
country	ET	2009	2012	male	62
country	ET	2009	2011	male	61
country	ET	2009	2010	male	60
country	ET	2009	2009	male	59
country	ET	2009	2008	male	58
country	ET	2009	2007	male	57
country	ET	2009	2006	male	56
country	ET	2009	2005	male	55
country	ET	2009	2004	male	54
country	ET	2009	2003	male	53
country	ET	2009	2002	male	52
country	ET	2009	2001	male	51
country	ET	2009	2000	male	51
country	KE	2009	2016	male	65
country	KE	2009	2015	male	64
country	KE	2009	2014	male	64
country	KE	2009	2013	male	63
country	KE	2009	2012	male	63
country	KE	2009	2011	male	62
country	KE	2009	2010	male	61
country	KE	2009	2009	male	60
country	KE	2009	2008	male	59
country	KE	2009	2007	male	57
country	KE	2009	2006	male	56
country	KE	2009	2005	male	54
country	KE	2009	2004	male	53
country	KE	2009	2003	male	52
country	KE	2009	2002	male	51
country	KE	2009	2001	male	50
country	KE	2009	2000	male	50
country	NG	2009	2016	male	53
country	NG	2009	2015	male	52
country	NG	2009	2014	male	52
country	NG	2009	2013	male	51
country	NG	2009	2012	male	51
country	NG	2009	2011	male	51
country	NG	2009	2010	male	50
country	NG	2009	2009	male	50
country	NG	2009	2008	male	49
country	NG	2009	2007	male	49
country	NG	2009	2006	male	48
country	NG	2009	2005	male	47
country	NG	2009	2004	male	47
country	NG	2009	2003	male	46
country	NG	2009	2002	male	46
country	NG	2009	2001	male	46
country	NG	2009	2000	male	45
country	SN	2009	2016	male	65
country	SN	2009	2015	male	65
country	SN	2009	2014	male	64
country	SN	2009	2013	male	64
country	SN	2009	2012	male	64
country	SN	2009	2011	male	63
country	SN	2009	2010	male	63
country	SN	2009	2009	male	62
country	SN	2009	2008	male	61
country	SN	2009	2007	male	61
country	SN	2009	2006	male	60
country	SN	2009	2005	male	59
country	SN	2009	2004	male	58
country	SN	2009	2003	male	58
country	SN	2009	2002	male	57
country	SN	2009	2001	male	57
country	SN	2009	2000	male	56
country	TZ	2009	2016	male	64
country	TZ	2009	2015	male	63
country	TZ	2009	2014	male	62
country	TZ	2009	2013	male	61
country	TZ	2009	2012	male	61
country	TZ	2009	2011	male	60
country	TZ	2009	2010	male	59
country	TZ	2009	2009	male	59
country	TZ	2009	2008	male	58
country	TZ	2009	2007	male	57
country	TZ	2009	2006	male	56
country	TZ	2009	2005	male	55
country	TZ	2009	2004	male	54
country	TZ	2009	2003	male	53
country	TZ	2009	2002	male	51
country	TZ	2009	2001	male	51
country	TZ	2009	2000	male	50
country	ZA	2009	2016	male	59
country	ZA	2009	2015	male	58
country	ZA	2009	2014	male	58
country	ZA	2009	2013	male	56
country	ZA	2009	2012	male	55
country	ZA	2009	2011	male	54
country	ZA	2009	2010	male	53
country	ZA	2009	2009	male	52
country	ZA	2009	2008	male	51
country	ZA	2009	2007	male	51
country	ZA	2009	2006	male	50
country	ZA	2009	2005	male	50
country	ZA	2009	2004	male	50
country	ZA	2009	2003	male	51
country	ZA	2009	2002	male	52
country	ZA	2009	2001	male	52
country	ZA	2009	2000	male	53
country	ET	2009	2016	female	67
country	ET	2009	2015	female	67
country	ET	2009	2014	female	66
country	ET	2009	2013	female	66
country	ET	2009	2012	female	65
country	ET	2009	2011	female	64
country	ET	2009	2010	female	63
country	ET	2009	2009	female	62
country	ET	2009	2008	female	61
country	ET	2009	2007	female	60
country	ET	2009	2006	female	59
country	ET	2009	2005	female	58
country	ET	2009	2004	female	57
country	ET	2009	2003	female	56
country	ET	2009	2002	female	55
country	ET	2009	2001	female	54
country	ET	2009	2000	female	53
country	KE	2009	2016	female	69
country	KE	2009	2015	female	69
country	KE	2009	2014	female	69
country	KE	2009	2013	female	68
country	KE	2009	2012	female	67
country	KE	2009	2011	female	66
country	KE	2009	2010	female	65
country	KE	2009	2009	female	63
country	KE	2009	2008	female	62
country	KE	2009	2007	female	60
country	KE	2009	2006	female	59
country	KE	2009	2005	female	57
country	KE	2009	2004	female	56
country	KE	2009	2003	female	55
country	KE	2009	2002	female	54
country	KE	2009	2001	female	54
country	KE	2009	2000	female	54
country	NG	2009	2016	female	54
country	NG	2009	2015	female	54
country	NG	2009	2014	female	53
country	NG	2009	2013	female	53
country	NG	2009	2012	female	52
country	NG	2009	2011	female	52
country	NG	2009	2010	female	52
country	NG	2009	2009	female	51
country	NG	2009	2008	female	51
country	NG	2009	2007	female	50
country	NG	2009	2006	female	50
country	NG	2009	2005	female	49
country	NG	2009	2004	female	49
country	NG	2009	2003	female	48
country	NG	2009	2002	female	48
country	NG	2009	2001	female	47
country	NG	2009	2000	female	47
country	SN	2009	2016	female	69
country	SN	2009	2015	female	69
country	SN	2009	2014	female	68
country	SN	2009	2013	female	68
country	SN	2009	2012	female	67
country	SN	2009	2011	female	66
country	SN	2009	2010	female	66
country	SN	2009	2009	female	65
country	SN	2009	2008	female	64
country	SN	2009	2007	female	63
country	SN	2009	2006	female	63
country	SN	2009	2005	female	62
country	SN	2009	2004	female	61
country	SN	2009	2003	female	61
country	SN	2009	2002	female	60
country	SN	2009	2001	female	60
country	SN	2009	2000	female	59
country	TZ	2009	2016	female	67
country	TZ	2009	2015	female	67
country	TZ	2009	2014	female	66
country	TZ	2009	2013	female	65
country	TZ	2009	2012	female	64
country	TZ	2009	2011	female	63
country	TZ	2009	2010	female	63
country	TZ	2009	2009	female	62
country	TZ	2009	2008	female	61
country	TZ	2009	2007	female	60
country	TZ	2009	2006	female	59
country	TZ	2009	2005	female	58
country	TZ	2009	2004	female	57
country	TZ	2009	2003	female	56
country	TZ	2009	2002	female	55
country	TZ	2009	2001	female	54
country	TZ	2009	2000	female	53
country	ZA	2009	2016	female	66
country	ZA	2009	2015	female	66
country	ZA	2009	2014	female	65
country	ZA	2009	2013	female	63
country	ZA	2009	2012	female	62
country	ZA	2009	2011	female	60
country	ZA	2009	2010	female	59
country	ZA	2009	2009	female	57
country	ZA	2009	2008	female	56
country	ZA	2009	2007	female	56
country	ZA	2009	2006	female	55
country	ZA	2009	2005	female	55
country	ZA	2009	2004	female	55
country	ZA	2009	2003	female	56
country	ZA	2009	2002	female	57
country	ZA	2009	2001	female	58
country	ZA	2009	2000	female	60
\.


--
-- Name: life_expectancy_at_birth pk_life_expectancy_at_birth; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.life_expectancy_at_birth
    ADD CONSTRAINT pk_life_expectancy_at_birth PRIMARY KEY (geo_level, geo_code, geo_version, life_expectancy_at_birth_year, sex);


--
-- PostgreSQL database dump complete
--

