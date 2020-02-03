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

ALTER TABLE IF EXISTS ONLY public.mobile_phone_subscriptions DROP CONSTRAINT IF EXISTS pk_mobile_phone_subscriptions;
DROP TABLE IF EXISTS public.mobile_phone_subscriptions;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: mobile_phone_subscriptions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.mobile_phone_subscriptions (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    mobile_phone_subscriptions_year character varying(128) NOT NULL,
    total numeric
);


--
-- Data for Name: mobile_phone_subscriptions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.mobile_phone_subscriptions (geo_level, geo_code, geo_version, mobile_phone_subscriptions_year, total) FROM stdin;
country	BF	2009	1996	0
country	BF	2009	1997	0
country	BF	2009	1998	0
country	BF	2009	1999	0
country	BF	2009	2000	0
country	BF	2009	2001	1
country	BF	2009	2002	1
country	BF	2009	2003	2
country	BF	2009	2004	3
country	BF	2009	2005	5
country	BF	2009	2006	7
country	BF	2009	2007	13
country	BF	2009	2008	21
country	BF	2009	2009	25
country	BF	2009	2010	37
country	BF	2009	2011	48
country	BF	2009	2012	60
country	BF	2009	2013	66
country	BF	2009	2014	71
country	BF	2009	2015	80
country	BF	2009	2016	83
country	BF	2009	2017	94
country	CD	2009	1995	0
country	CD	2009	1996	0
country	CD	2009	1997	0
country	CD	2009	1998	0
country	CD	2009	1999	0
country	CD	2009	2000	0
country	CD	2009	2001	0
country	CD	2009	2002	1
country	CD	2009	2003	2
country	CD	2009	2004	4
country	CD	2009	2005	5
country	CD	2009	2006	8
country	CD	2009	2007	11
country	CD	2009	2008	16
country	CD	2009	2009	15
country	CD	2009	2010	18
country	CD	2009	2011	23
country	CD	2009	2012	29
country	CD	2009	2013	40
country	CD	2009	2014	50
country	CD	2009	2015	50
country	CD	2009	2016	37
country	CD	2009	2017	43
country	ET	2009	2017	60
country	ET	2009	2016	50
country	ET	2009	2015	42
country	ET	2009	2014	31
country	ET	2009	2013	27
country	ET	2009	2012	22
country	ET	2009	2011	16
country	ET	2009	2010	8
country	ET	2009	2009	5
country	ET	2009	2008	2
country	ET	2009	2007	1
country	ET	2009	2006	1
country	ET	2009	2005	1
country	ET	2009	2004	0
country	ET	2009	2003	0
country	ET	2009	2002	0
country	ET	2009	2001	0
country	ET	2009	2000	0
country	KE	2009	1998	0.04
country	KE	2009	1999	0.08
country	KE	2009	2000	0.4
country	KE	2009	2001	1.83
country	KE	2009	2002	3.52
country	KE	2009	2003	4.59
country	KE	2009	2004	7.15
country	KE	2009	2005	12.6
country	KE	2009	2006	19.5
country	KE	2009	2007	29.3
country	KE	2009	2008	41
country	KE	2009	2009	47.3
country	KE	2009	2010	59.4
country	KE	2009	2011	65
country	KE	2009	2012	69.3
country	KE	2009	2013	69.9
country	KE	2009	2014	72
country	KE	2009	2015	78.8
country	KE	2009	2016	79.5
country	KE	2009	2017	85.3
country	KE	2009	2018	96.3
country	NG	2009	1998	0.017194
country	NG	2009	1999	0.020963
country	NG	2009	2000	0.024533
country	NG	2009	2001	0.212499
country	NG	2009	2002	1.220138
country	NG	2009	2003	2.387762
country	NG	2009	2004	6.759666
country	NG	2009	2005	13.38494
country	NG	2009	2006	22.67615
country	NG	2009	2007	27.60395
country	NG	2009	2008	41.91698
country	NG	2009	2009	48.2866
country	NG	2009	2010	55.07636
country	NG	2009	2011	58.45475
country	NG	2009	2012	67.43921
country	NG	2009	2013	74.08115
country	NG	2009	2014	78.77349
country	NG	2009	2015	83.26831
country	NG	2009	2016	82.9974
country	NG	2009	2017	75.92482
country	NG	2009	2018	88.18424
country	SN	2009	2017	99
country	SN	2009	2016	99
country	SN	2009	2015	100
country	SN	2009	2014	99
country	SN	2009	2013	93
country	SN	2009	2012	84
country	SN	2009	2011	70
country	SN	2009	2010	65
country	SN	2009	2009	55
country	SN	2009	2008	44
country	SN	2009	2007	31
country	SN	2009	2006	26
country	SN	2009	2005	15
country	SN	2009	2004	10
country	SN	2009	2003	7
country	SN	2009	2002	5
country	SN	2009	2001	3
country	SN	2009	2000	3
country	TZ	2009	2017	70
country	TZ	2009	2016	72
country	TZ	2009	2015	74
country	TZ	2009	2014	61
country	TZ	2009	2013	54
country	TZ	2009	2012	55
country	TZ	2009	2011	54
country	TZ	2009	2010	46
country	TZ	2009	2009	39
country	TZ	2009	2008	30
country	TZ	2009	2007	20
country	TZ	2009	2006	14
country	TZ	2009	2005	8
country	TZ	2009	2004	5
country	TZ	2009	2003	3
country	TZ	2009	2002	2
country	TZ	2009	2001	1
country	TZ	2009	2000	0
country	UG	2009	1996	0
country	UG	2009	1997	0
country	UG	2009	1998	0
country	UG	2009	1999	0
country	UG	2009	2000	1
country	UG	2009	2001	1
country	UG	2009	2002	2
country	UG	2009	2003	3
country	UG	2009	2004	4
country	UG	2009	2005	5
country	UG	2009	2006	7
country	UG	2009	2007	14
country	UG	2009	2008	27
country	UG	2009	2009	29
country	UG	2009	2010	38
country	UG	2009	2011	48
country	UG	2009	2012	45
country	UG	2009	2013	48
country	UG	2009	2014	52
country	UG	2009	2015	50
country	UG	2009	2016	55
country	UG	2009	2017	58
country	ZA	2009	2017	162
country	ZA	2009	2016	147
country	ZA	2009	2015	159
country	ZA	2009	2014	145
country	ZA	2009	2013	143
country	ZA	2009	2012	129
country	ZA	2009	2011	122
country	ZA	2009	2010	98
country	ZA	2009	2009	91
country	ZA	2009	2008	89
country	ZA	2009	2007	85
country	ZA	2009	2006	80
country	ZA	2009	2005	70
country	ZA	2009	2004	43
country	ZA	2009	2003	35
country	ZA	2009	2002	29
country	ZA	2009	2001	23
country	ZA	2009	2000	18
country	ZM	2009	1996	0
country	ZM	2009	1997	0
country	ZM	2009	1998	0
country	ZM	2009	1999	0
country	ZM	2009	2000	1
country	ZM	2009	2001	1
country	ZM	2009	2002	1
country	ZM	2009	2003	2
country	ZM	2009	2004	4
country	ZM	2009	2005	8
country	ZM	2009	2006	13
country	ZM	2009	2007	21
country	ZM	2009	2008	27
country	ZM	2009	2009	33
country	ZM	2009	2010	39
country	ZM	2009	2011	57
country	ZM	2009	2012	72
country	ZM	2009	2013	69
country	ZM	2009	2014	65
country	ZM	2009	2015	72
country	ZM	2009	2016	72
country	ZM	2009	2017	79
\.


--
-- Name: mobile_phone_subscriptions pk_mobile_phone_subscriptions; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mobile_phone_subscriptions
    ADD CONSTRAINT pk_mobile_phone_subscriptions PRIMARY KEY (geo_level, geo_code, geo_version, mobile_phone_subscriptions_year);


--
-- PostgreSQL database dump complete
--
