--
-- PostgreSQL database dump
--

-- Dumped from database version 10.0
-- Dumped by pg_dump version 10.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;

ALTER TABLE IF EXISTS ONLY public.crop_production_year DROP CONSTRAINT IF EXISTS pk_crop_production_year;
DROP TABLE IF EXISTS public.crop_production_year;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: crop_production_year; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.crop_production_year (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    "Crop_Production_Year" character varying(128) NOT NULL,
    total integer
);


--
-- Data for Name: crop_production_year; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.crop_production_year (geo_level, geo_code, geo_version, "Crop_Production_Year", total) FROM stdin;
country	TZ	2009	1980	48
country	TZ	2009	1981	50
country	TZ	2009	1982	51
country	TZ	2009	1983	54
country	TZ	2009	1984	56
country	TZ	2009	1985	57
country	TZ	2009	1986	59
country	TZ	2009	1987	59
country	TZ	2009	1988	57
country	TZ	2009	1989	61
country	TZ	2009	1990	62
country	TZ	2009	1991	64
country	TZ	2009	1992	61
country	TZ	2009	1993	61
country	TZ	2009	1994	58
country	TZ	2009	1995	63
country	TZ	2009	1996	67
country	TZ	2009	1997	63
country	TZ	2009	1998	68
country	TZ	2009	1999	67
country	TZ	2009	2000	66
country	TZ	2009	2001	72
country	TZ	2009	2002	95
country	TZ	2009	2003	80
country	TZ	2009	2004	97
country	TZ	2009	2005	97
country	TZ	2009	2006	107
country	TZ	2009	2007	110
country	TZ	2009	2008	109
country	TZ	2009	2009	111
country	TZ	2009	2010	131
country	TZ	2009	2011	142
country	TZ	2009	2012	151
country	TZ	2009	2013	157
country	SN	2009	1980	48
country	SN	2009	1981	84
country	SN	2009	1982	83
country	SN	2009	1983	50
country	SN	2009	1984	54
country	SN	2009	1985	75
country	SN	2009	1986	82
country	SN	2009	1987	92
country	SN	2009	1988	76
country	SN	2009	1989	89
country	SN	2009	1990	78
country	SN	2009	1991	81
country	SN	2009	1992	71
country	SN	2009	1993	80
country	SN	2009	1994	78
country	SN	2009	1995	90
country	SN	2009	1996	82
country	SN	2009	1997	75
country	SN	2009	1998	71
country	SN	2009	1999	109
country	SN	2009	2000	111
country	SN	2009	2001	103
country	SN	2009	2002	61
country	SN	2009	2003	95
country	SN	2009	2004	95
country	SN	2009	2005	114
country	SN	2009	2006	92
country	SN	2009	2007	80
country	SN	2009	2008	135
country	SN	2009	2009	148
country	SN	2009	2010	163
country	SN	2009	2011	103
country	SN	2009	2012	131
country	SN	2009	2013	125
country	NG	2009	1980	26
country	NG	2009	1981	26
country	NG	2009	1982	27
country	NG	2009	1983	27
country	NG	2009	1984	28
country	NG	2009	1985	30
country	NG	2009	1986	33
country	NG	2009	1987	33
country	NG	2009	1988	39
country	NG	2009	1989	44
country	NG	2009	1990	47
country	NG	2009	1991	54
country	NG	2009	1992	59
country	NG	2009	1993	62
country	NG	2009	1994	64
country	NG	2009	1995	66
country	NG	2009	1996	69
country	NG	2009	1997	71
country	NG	2009	1998	75
country	NG	2009	1999	79
country	NG	2009	2000	79
country	NG	2009	2001	79
country	NG	2009	2002	83
country	NG	2009	2003	88
country	NG	2009	2004	95
country	NG	2009	2005	100
country	NG	2009	2006	105
country	NG	2009	2007	96
country	NG	2009	2008	103
country	NG	2009	2009	88
country	NG	2009	2010	103
country	NG	2009	2011	94
country	NG	2009	2012	105
country	NG	2009	2013	109
\.


--
-- Name: crop_production_year pk_crop_production_year; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.crop_production_year
    ADD CONSTRAINT pk_crop_production_year PRIMARY KEY (geo_level, geo_code, geo_version, "Crop_Production_Year");


--
-- PostgreSQL database dump complete
--

