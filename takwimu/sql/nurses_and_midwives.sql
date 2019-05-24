--
-- PostgreSQL database dump
--

-- Dumped from database version 10.6
-- Dumped by pg_dump version 10.6

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;

ALTER TABLE IF EXISTS ONLY public.nurses_and_midwives DROP CONSTRAINT IF EXISTS pk_nurses_and_midwives;
DROP TABLE IF EXISTS public.nurses_and_midwives;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: nurses_and_midwives; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.nurses_and_midwives (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    nurses_and_midwives_year character varying(128) NOT NULL,
    total double precision
);


--
-- Data for Name: nurses_and_midwives; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.nurses_and_midwives (geo_level, geo_code, geo_version, nurses_and_midwives_year, total) FROM stdin;
country	BF	2009	2012	0.630000000000000004
country	BF	2009	2011	0.456000000000000016
country	BF	2009	2010	0.552999999999999936
country	BF	2009	2009	0.40399999999999997
country	BF	2009	2008	0.369999999999999996
country	BF	2009	2006	0.423999999999999988
country	BF	2009	2004	0.503000000000000003
country	CD	2009	2009	0.960999999999999965
country	CD	2009	2004	0.529000000000000026
country	ET	2009	2010	0.236000000000000015
country	ET	2009	2009	0.252000000000000002
country	ET	2009	2008	0.201999999999999985
country	ET	2009	2007	0.223999999999999977
country	ET	2009	2006	0.22699999999999998
country	ET	2009	2005	0.246000000000000024
country	ET	2009	2004	0.208999999999999991
country	ET	2009	2003	0.214999999999999997
country	KE	2009	2014	1.58199999999999985
country	KE	2009	2013	1.48199999999999998
country	KE	2009	2012	1.45199999999999996
country	KE	2009	2011	1.45199999999999996
country	KE	2009	2010	0.735999999999999988
country	KE	2009	2009	0.406000000000000028
country	KE	2009	2008	0.367999999999999994
country	KE	2009	2004	0.468999999999999972
country	NG	2009	2010	1.60499999999999998
country	NG	2009	2008	1.4890000000000001
country	NG	2009	2007	1.49099999999999988
country	NG	2009	2006	1.49500000000000011
country	NG	2009	2005	1.52900000000000014
country	NG	2009	2003	1.58599999999999985
country	SN	2009	2016	0.308999999999999997
country	SN	2009	2010	0.419999999999999984
country	SN	2009	2008	0.429999999999999993
country	SN	2009	2004	0.299999999999999989
country	TZ	2009	2014	0.416000000000000036
country	TZ	2009	2012	0.427999999999999992
country	TZ	2009	2010	0.241999999999999993
country	TZ	2009	2006	0.233999999999999986
country	TZ	2009	2002	0.370999999999999996
country	UG	2009	2015	0.64800000000000002
country	UG	2009	2010	1.30600000000000005
country	UG	2009	2005	1.34199999999999986
country	UG	2009	2004	0.699999999999999956
country	ZA	2009	2016	5.22900000000000009
country	ZA	2009	2015	6.36299999999999955
country	ZA	2009	2014	6.24700000000000077
country	ZA	2009	2013	6.07500000000000018
country	ZA	2009	2012	5.84100000000000019
country	ZA	2009	2011	5.63299999999999912
country	ZA	2009	2010	5.48299999999999965
country	ZA	2009	2009	4.34999999999999964
country	ZA	2009	2008	4.22700000000000031
country	ZA	2009	2007	4.10400000000000009
country	ZA	2009	2006	4.01600000000000001
country	ZA	2009	2005	3.95600000000000041
country	ZA	2009	2004	3.87000000000000011
country	ZA	2009	2003	3.78399999999999981
country	ZA	2009	2002	3.73600000000000021
country	ZA	2009	2001	3.78100000000000014
country	ZA	2009	2000	3.82299999999999995
country	ZM	2009	2016	0.885999999999999899
country	ZM	2009	2010	0.714000000000000079
country	ZM	2009	2009	0.702999999999999958
country	ZM	2009	2008	0.692999999999999949
country	ZM	2009	2006	0.675999999999999934
country	ZM	2009	2005	0.694999999999999951
\.


--
-- Name: nurses_and_midwives pk_nurses_and_midwives; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nurses_and_midwives
    ADD CONSTRAINT pk_nurses_and_midwives PRIMARY KEY (geo_level, geo_code, geo_version, nurses_and_midwives_year);


--
-- PostgreSQL database dump complete
--

