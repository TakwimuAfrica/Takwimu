--
-- PostgreSQL database dump
--

-- Dumped from database version 10.0
-- Dumped by pg_dump version 10.0

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET search_path = public, pg_catalog;

ALTER TABLE IF EXISTS ONLY public.crop_production_year DROP CONSTRAINT IF EXISTS pk_crop_production_year;
DROP TABLE IF EXISTS public.crop_production_year;
SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: crop_production_year; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE crop_production_year (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    "Crop_Production_Year" character varying(128) NOT NULL,
    total integer
);


--
-- Data for Name: crop_production_year; Type: TABLE DATA; Schema: public; Owner: -
--

COPY crop_production_year (geo_level, geo_code, geo_version, "Crop_Production_Year", total) FROM stdin;
country	TZA	2009	1980	48
country	TZA	2009	1981	50
country	TZA	2009	1982	51
country	TZA	2009	1983	54
country	TZA	2009	1984	56
country	TZA	2009	1985	57
country	TZA	2009	1986	59
country	TZA	2009	1987	59
country	TZA	2009	1988	57
country	TZA	2009	1989	61
country	TZA	2009	1990	62
country	TZA	2009	1991	64
country	TZA	2009	1992	61
country	TZA	2009	1993	61
country	TZA	2009	1994	58
country	TZA	2009	1995	63
country	TZA	2009	1996	67
country	TZA	2009	1997	63
country	TZA	2009	1998	68
country	TZA	2009	1999	67
country	TZA	2009	2000	66
country	TZA	2009	2001	72
country	TZA	2009	2002	95
country	TZA	2009	2003	80
country	TZA	2009	2004	97
country	TZA	2009	2005	97
country	TZA	2009	2006	107
country	TZA	2009	2007	110
country	TZA	2009	2008	109
country	TZA	2009	2009	111
country	TZA	2009	2010	131
country	TZA	2009	2011	142
country	TZA	2009	2012	151
country	TZA	2009	2013	157
country	SEN	2009	1980	48
country	SEN	2009	1981	84
country	SEN	2009	1982	83
country	SEN	2009	1983	50
country	SEN	2009	1984	54
country	SEN	2009	1985	75
country	SEN	2009	1986	82
country	SEN	2009	1987	92
country	SEN	2009	1988	76
country	SEN	2009	1989	89
country	SEN	2009	1990	78
country	SEN	2009	1991	81
country	SEN	2009	1992	71
country	SEN	2009	1993	80
country	SEN	2009	1994	78
country	SEN	2009	1995	90
country	SEN	2009	1996	82
country	SEN	2009	1997	75
country	SEN	2009	1998	71
country	SEN	2009	1999	109
country	SEN	2009	2000	111
country	SEN	2009	2001	103
country	SEN	2009	2002	61
country	SEN	2009	2003	95
country	SEN	2009	2004	95
country	SEN	2009	2005	114
country	SEN	2009	2006	92
country	SEN	2009	2007	80
country	SEN	2009	2008	135
country	SEN	2009	2009	148
country	SEN	2009	2010	163
country	SEN	2009	2011	103
country	SEN	2009	2012	131
country	SEN	2009	2013	125
country	NGA	2009	1980	26
country	NGA	2009	1981	26
country	NGA	2009	1982	27
country	NGA	2009	1983	27
country	NGA	2009	1984	28
country	NGA	2009	1985	30
country	NGA	2009	1986	33
country	NGA	2009	1987	33
country	NGA	2009	1988	39
country	NGA	2009	1989	44
country	NGA	2009	1990	47
country	NGA	2009	1991	54
country	NGA	2009	1992	59
country	NGA	2009	1993	62
country	NGA	2009	1994	64
country	NGA	2009	1995	66
country	NGA	2009	1996	69
country	NGA	2009	1997	71
country	NGA	2009	1998	75
country	NGA	2009	1999	79
country	NGA	2009	2000	79
country	NGA	2009	2001	79
country	NGA	2009	2002	83
country	NGA	2009	2003	88
country	NGA	2009	2004	95
country	NGA	2009	2005	100
country	NGA	2009	2006	105
country	NGA	2009	2007	96
country	NGA	2009	2008	103
country	NGA	2009	2009	88
country	NGA	2009	2010	103
country	NGA	2009	2011	94
country	NGA	2009	2012	105
country	NGA	2009	2013	109
\.


--
-- Name: crop_production_year pk_crop_production_year; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY crop_production_year
    ADD CONSTRAINT pk_crop_production_year PRIMARY KEY (geo_level, geo_code, geo_version, "Crop_Production_Year");


--
-- PostgreSQL database dump complete
--

