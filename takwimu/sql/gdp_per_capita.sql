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

ALTER TABLE IF EXISTS ONLY public.gdp_per_capita DROP CONSTRAINT IF EXISTS pk_gdp_per_capita;
DROP TABLE IF EXISTS public.gdp_per_capita;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: gdp_per_capita; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.gdp_per_capita (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    gdp_per_capita_year character varying(128) NOT NULL,
    total integer
);


--
-- Data for Name: gdp_per_capita; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.gdp_per_capita (geo_level, geo_code, geo_version, gdp_per_capita_year, total) FROM stdin;
country	BF	2009	1997	229
country	BF	2009	1998	256
country	BF	2009	1999	265
country	BF	2009	2000	226
country	BF	2009	2001	235
country	BF	2009	2002	261
country	BF	2009	2003	332
country	BF	2009	2004	371
country	BF	2009	2005	407
country	BF	2009	2006	421
country	BF	2009	2007	475
country	BF	2009	2008	570
country	BF	2009	2009	553
country	BF	2009	2010	575
country	BF	2009	2011	667
country	BF	2009	2012	674
country	BF	2009	2013	700
country	BF	2009	2014	704
country	BF	2009	2015	575
country	BF	2009	2016	614
country	BF	2009	2017	671
country	CD	2009	1997	139
country	CD	2009	1998	139
country	CD	2009	1999	103
country	CD	2009	2000	405
country	CD	2009	2001	154
country	CD	2009	2002	175
country	CD	2009	2003	174
country	CD	2009	2004	194
country	CD	2009	2005	219
country	CD	2009	2006	256
country	CD	2009	2007	287
country	CD	2009	2008	328
country	CD	2009	2009	299
country	CD	2009	2010	334
country	CD	2009	2011	387
country	CD	2009	2012	425
country	CD	2009	2013	458
country	CD	2009	2014	487
country	CD	2009	2015	498
country	CD	2009	2016	472
country	CD	2009	2017	463
country	ET	2009	2017	768
country	ET	2009	2016	713
country	ET	2009	2015	645
country	ET	2009	2014	571
country	ET	2009	2013	502
country	ET	2009	2012	469
country	ET	2009	2011	355
country	ET	2009	2010	341
country	ET	2009	2009	380
country	ET	2009	2008	325
country	ET	2009	2007	243
country	ET	2009	2006	194
country	ET	2009	2005	162
country	ET	2009	2004	136
country	ET	2009	2003	119
country	ET	2009	2002	111
country	ET	2009	2001	120
country	ET	2009	2000	124
country	KE	2009	2017	1595
country	KE	2009	2016	1463
country	KE	2009	2015	1355
country	KE	2009	2014	1335
country	KE	2009	2013	1229
country	KE	2009	2012	1155
country	KE	2009	2011	987
country	KE	2009	2010	967
country	KE	2009	2009	920
country	KE	2009	2008	917
country	KE	2009	2007	839
country	KE	2009	2006	697
country	KE	2009	2005	520
country	KE	2009	2004	459
country	KE	2009	2003	437
country	KE	2009	2002	396
country	KE	2009	2001	402
country	KE	2009	2000	404
country	NG	2009	2017	1968
country	NG	2009	2016	2176
country	NG	2009	2015	2730
country	NG	2009	2014	3222
country	NG	2009	2013	2997
country	NG	2009	2012	2746
country	NG	2009	2011	2519
country	NG	2009	2010	2291
country	NG	2009	2009	1890
country	NG	2009	2008	2242
country	NG	2009	2007	1882
country	NG	2009	2006	1656
country	NG	2009	2005	1268
country	NG	2009	2004	1007
country	NG	2009	2003	795
country	NG	2009	2002	741
country	NG	2009	2001	590
country	NG	2009	2000	568
country	SN	2009	2017	1329
country	SN	2009	2016	1231
country	SN	2009	2015	1186
country	SN	2009	2014	1359
country	SN	2009	2013	1343
country	SN	2009	2012	1301
country	SN	2009	2011	1344
country	SN	2009	2010	1255
country	SN	2009	2009	1295
country	SN	2009	2008	1389
country	SN	2009	2007	1203
country	SN	2009	2006	1025
country	SN	2009	2005	980
country	SN	2009	2004	928
country	SN	2009	2003	814
country	SN	2009	2002	649
country	SN	2009	2001	609
country	SN	2009	2000	599
country	TZ	2009	2017	936
country	TZ	2009	2016	878
country	TZ	2009	2015	872
country	TZ	2009	2014	951
country	TZ	2009	2013	903
country	TZ	2009	2012	820
country	TZ	2009	2011	733
country	TZ	2009	2010	702
country	TZ	2009	2009	659
country	TZ	2009	2008	651
country	TZ	2009	2007	528
country	TZ	2009	2006	472
country	TZ	2009	2005	442
country	TZ	2009	2004	345
country	TZ	2009	2003	323
country	TZ	2009	2002	308
country	TZ	2009	2001	304
country	TZ	2009	2000	307
country	TZ	2009	1997	250
country	TZ	2009	1998	296
country	TZ	2009	1999	300
country	UG	2009	1996	285
country	UG	2009	1997	287
country	UG	2009	1998	292
country	UG	2009	1999	258
country	UG	2009	2000	258
country	UG	2009	2001	235
country	UG	2009	2002	240
country	UG	2009	2003	238
country	UG	2009	2004	288
country	UG	2009	2005	316
country	UG	2009	2006	336
country	UG	2009	2007	402
country	UG	2009	2008	450
country	UG	2009	2009	554
country	UG	2009	2010	595
country	UG	2009	2011	575
country	UG	2009	2012	637
country	UG	2009	2013	655
country	UG	2009	2014	703
country	UG	2009	2015	675
country	UG	2009	2016	582
country	UG	2009	2017	606
country	ZA	2009	2017	6151
country	ZA	2009	2016	5280
country	ZA	2009	2015	5743
country	ZA	2009	2014	6429
country	ZA	2009	2013	6819
country	ZA	2009	2012	7478
country	ZA	2009	2011	7968
country	ZA	2009	2010	7276
country	ZA	2009	2009	5806
country	ZA	2009	2008	5689
country	ZA	2009	2007	6002
country	ZA	2009	2006	5503
country	ZA	2009	2005	5278
country	ZA	2009	2004	4745
country	ZA	2009	2003	3678
country	ZA	2009	2002	2461
country	ZA	2009	2001	2622
country	ZA	2009	2000	2982
country	ZA	2009	1997	3495
country	ZA	2009	1998	3105
country	ZA	2009	1999	3032
country	ZM	2009	1996	383
country	ZM	2009	1997	445
country	ZM	2009	1998	356
country	ZM	2009	1999	332
country	ZM	2009	2000	342
country	ZM	2009	2001	378
country	ZM	2009	2002	377
country	ZM	2009	2003	429
country	ZM	2009	2004	530
country	ZM	2009	2005	691
country	ZM	2009	2006	1030
country	ZM	2009	2007	1105
country	ZM	2009	2008	1369
country	ZM	2009	2009	1139
country	ZM	2009	2010	1463
country	ZM	2009	2011	1645
country	ZM	2009	2012	1735
country	ZM	2009	2013	1851
country	ZM	2009	2014	1738
country	ZM	2009	2015	1314
country	ZM	2009	2016	1263
country	ZM	2009	2017	1510
\.


--
-- Name: gdp_per_capita pk_gdp_per_capita; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.gdp_per_capita
    ADD CONSTRAINT pk_gdp_per_capita PRIMARY KEY (geo_level, geo_code, geo_version, gdp_per_capita_year);


--
-- PostgreSQL database dump complete
--
