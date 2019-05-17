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
country	BF	2009	2016	1181
country	BF	2009	2015	1196
country	BF	2009	2014	1226
country	BF	2009	2013	1157
country	BF	2009	2012	1203
country	BF	2009	2011	995
country	BF	2009	2010	1063
country	BF	2009	2009	1002
country	BF	2009	2008	1040
country	BF	2009	2007	936
country	BF	2009	2006	1204
country	BF	2009	2005	1127
country	BF	2009	2004	940
country	BF	2009	2003	996
country	BF	2009	2002	943
country	BF	2009	2001	968
country	BF	2009	2000	856
country	BF	2009	1999	913
country	BF	2009	1998	889
country	BF	2009	1997	705
country	CD	2009	2016	772
country	CD	2009	2015	772
country	CD	2009	2014	772
country	CD	2009	2013	772
country	CD	2009	2012	772
country	CD	2009	2011	772
country	CD	2009	2010	772
country	CD	2009	2009	772
country	CD	2009	2008	772
country	CD	2009	2007	772
country	CD	2009	2006	772
country	CD	2009	2005	772
country	CD	2009	2004	772
country	CD	2009	2003	772
country	CD	2009	2002	772
country	CD	2009	2001	787
country	CD	2009	2000	787
country	CD	2009	1999	787
country	CD	2009	1998	811
country	CD	2009	1997	802
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
country	ET	2009	1999	1125
country	ET	2009	1998	1141
country	ET	2009	1997	1264
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
country	KE	2009	1999	1428
country	KE	2009	1998	1590
country	KE	2009	1997	1397
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
country	NG	2009	1999	1239
country	NG	2009	1998	1202
country	NG	2009	1997	1183
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
country	SN	2009	1999	870
country	SN	2009	1998	668
country	SN	2009	1997	717
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
country	TZ	2009	1999	1767
country	TZ	2009	1998	1199
country	TZ	2009	1997	1101
country	UG	2009	2016	1906
country	UG	2009	2015	1931
country	UG	2009	2014	2021
country	UG	2009	2013	1996
country	UG	2009	2012	2029
country	UG	2009	2011	2057
country	UG	2009	2010	1979
country	UG	2009	2009	2039
country	UG	2009	2008	1828
country	UG	2009	2007	1526
country	UG	2009	2006	1523
country	UG	2009	2005	1574
country	UG	2009	2004	1468
country	UG	2009	2003	1678
country	UG	2009	2002	1639
country	UG	2009	2001	1641
country	UG	2009	2000	1539
country	UG	2009	1999	1634
country	UG	2009	1998	1526
country	UG	2009	1997	1218
country	UG	2009	1996	1205
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
country	ZA	2009	1999	2191
country	ZA	2009	1998	2182
country	ZA	2009	1997	2272
country	ZM	2009	2016	2418
country	ZM	2009	2015	3007
country	ZM	2009	2014	2755
country	ZM	2009	2013	2532
country	ZM	2009	2012	2689
country	ZM	2009	2011	2731
country	ZM	2009	2010	2534
country	ZM	2009	2009	2066
country	ZM	2009	2008	2180
country	ZM	2009	2007	2253
country	ZM	2009	2006	1816
country	ZM	2009	2005	1899
country	ZM	2009	2004	1814
country	ZM	2009	2003	1702
country	ZM	2009	2002	1419
country	ZM	2009	2001	1402
country	ZM	2009	2000	1682
country	ZM	2009	1999	1324
country	ZM	2009	1998	1211
country	ZM	2009	1997	1413
country	ZM	2009	1996	1912
\.


--
-- Name: cereal_yield_kg_per_hectare pk_cereal_yield_kg_per_hectare; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cereal_yield_kg_per_hectare
    ADD CONSTRAINT pk_cereal_yield_kg_per_hectare PRIMARY KEY (geo_level, geo_code, geo_version, cereal_yield_kg_per_hectare_year);


--
-- PostgreSQL database dump complete
--
