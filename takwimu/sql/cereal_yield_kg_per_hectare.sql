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

ALTER TABLE IF EXISTS ONLY public.cereal_yield_kg_per_hectare DROP CONSTRAINT IF EXISTS pk_cereal_yield_kg_per_hectare;
DROP TABLE IF EXISTS public.cereal_yield_kg_per_hectare;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: cereal_yield_kg_per_hectare; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cereal_yield_kg_per_hectare (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    cereal_yield_kg_per_hectare_year character varying(128) NOT NULL,
    total integer
);


--
-- Data for Name: cereal_yield_kg_per_hectare; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.cereal_yield_kg_per_hectare (geo_level, geo_code, geo_version, cereal_yield_kg_per_hectare_year, total) FROM stdin;
country	ET	2009	2016	2484
country	ET	2009	2015	2556
country	ET	2009	2014	2325
country	ET	2009	2013	2193
country	ET	2009	2012	2047
country	ET	2009	2011	1962
country	ET	2009	2010	1833
country	ET	2009	2009	1683
country	ET	2009	2008	1446
country	ET	2009	2007	1439
country	ET	2009	2006	1563
country	ET	2009	2005	1361
country	ET	2009	2004	1163
country	ET	2009	2003	1123
country	ET	2009	2002	1354
country	ET	2009	2001	1198
country	ET	2009	2000	1116
country	KE	2009	2016	1391
country	KE	2009	2015	1773
country	KE	2009	2014	1583
country	KE	2009	2013	1662
country	KE	2009	2012	1745
country	KE	2009	2011	1515
country	KE	2009	2010	1710
country	KE	2009	2009	1243
country	KE	2009	2008	1418
country	KE	2009	2007	1773
country	KE	2009	2006	1646
country	KE	2009	2005	1646
country	KE	2009	2004	1806
country	KE	2009	2003	1594
country	KE	2009	2002	1488
country	KE	2009	2001	1640
country	KE	2009	2000	1375
country	NG	2009	2016	1444
country	NG	2009	2015	1444
country	NG	2009	2014	1450
country	NG	2009	2013	1235
country	NG	2009	2012	1400
country	NG	2009	2011	1335
country	NG	2009	2010	1528
country	NG	2009	2009	1531
country	NG	2009	2008	1598
country	NG	2009	2007	1400
country	NG	2009	2006	1508
country	NG	2009	2005	1422
country	NG	2009	2004	1373
country	NG	2009	2003	1309
country	NG	2009	2002	1255
country	NG	2009	2001	1234
country	NG	2009	2000	1172
country	SN	2009	2016	1349
country	SN	2009	2015	1376
country	SN	2009	2014	1112
country	SN	2009	2013	1124
country	SN	2009	2012	1221
country	SN	2009	2011	967
country	SN	2009	2010	1197
country	SN	2009	2009	1135
country	SN	2009	2008	1174
country	SN	2009	2007	723
country	SN	2009	2006	879
country	SN	2009	2005	1201
country	SN	2009	2004	975
country	SN	2009	2003	1091
country	SN	2009	2002	652
country	SN	2009	2001	887
country	SN	2009	2000	879
country	TZ	2009	2016	1541
country	TZ	2009	2015	1618
country	TZ	2009	2014	1673
country	TZ	2009	2013	1418
country	TZ	2009	2012	1315
country	TZ	2009	2011	1390
country	TZ	2009	2010	1648
country	TZ	2009	2009	1110
country	TZ	2009	2008	1334
country	TZ	2009	2007	1427
country	TZ	2009	2006	1327
country	TZ	2009	2005	1102
country	TZ	2009	2004	1371
country	TZ	2009	2003	858
country	TZ	2009	2002	1900
country	TZ	2009	2001	2044
country	TZ	2009	2000	1441
country	ZA	2009	2016	3810
country	ZA	2009	2015	3537
country	ZA	2009	2014	4894
country	ZA	2009	2013	4041
country	ZA	2009	2012	4240
country	ZA	2009	2011	4014
country	ZA	2009	2010	4149
country	ZA	2009	2009	4406
country	ZA	2009	2008	4063
country	ZA	2009	2007	2790
country	ZA	2009	2006	3141
country	ZA	2009	2005	3309
country	ZA	2009	2004	2778
country	ZA	2009	2003	2537
country	ZA	2009	2002	2773
country	ZA	2009	2001	2424
country	ZA	2009	2000	2766
\.


--
-- Name: cereal_yield_kg_per_hectare pk_cereal_yield_kg_per_hectare; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cereal_yield_kg_per_hectare
    ADD CONSTRAINT pk_cereal_yield_kg_per_hectare PRIMARY KEY (geo_level, geo_code, geo_version, cereal_yield_kg_per_hectare_year);


--
-- PostgreSQL database dump complete
--

