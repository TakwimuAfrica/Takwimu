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

ALTER TABLE IF EXISTS ONLY public.maternal_mortality DROP CONSTRAINT IF EXISTS pk_maternal_mortality;
DROP TABLE IF EXISTS public.maternal_mortality;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: maternal_mortality; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.maternal_mortality (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    maternal_mortality_year character varying(128) NOT NULL,
    total integer
);


--
-- Data for Name: maternal_mortality; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.maternal_mortality (geo_level, geo_code, geo_version, maternal_mortality_year, total) FROM stdin;
country	BF	2009	1995	636
country	BF	2009	1996	620
country	BF	2009	1997	601
country	BF	2009	1998	581
country	BF	2009	1999	565
country	BF	2009	2000	547
country	BF	2009	2001	530
country	BF	2009	2002	516
country	BF	2009	2003	500
country	BF	2009	2004	482
country	BF	2009	2005	468
country	BF	2009	2006	457
country	BF	2009	2007	447
country	BF	2009	2008	436
country	BF	2009	2009	428
country	BF	2009	2010	417
country	BF	2009	2011	408
country	BF	2009	2012	398
country	BF	2009	2013	389
country	BF	2009	2014	379
country	BF	2009	2015	371
country	CD	2009	1997	919
country	CD	2009	1998	915
country	CD	2009	1999	902
country	CD	2009	2000	874
country	CD	2009	2001	853
country	CD	2009	2002	830
country	CD	2009	2003	808
country	CD	2009	2004	793
country	CD	2009	2005	787
country	CD	2009	2006	789
country	CD	2009	2007	803
country	CD	2009	2008	792
country	CD	2009	2009	793
country	CD	2009	2010	794
country	CD	2009	2011	777
country	CD	2009	2012	771
country	CD	2009	2013	746
country	CD	2009	2014	717
country	CD	2009	2015	693
country	ET	2009	2015	353
country	ET	2009	2014	378
country	ET	2009	2013	410
country	ET	2009	2012	447
country	ET	2009	2011	482
country	ET	2009	2010	523
country	ET	2009	2009	566
country	ET	2009	2008	608
country	ET	2009	2007	654
country	ET	2009	2006	698
country	ET	2009	2005	743
country	ET	2009	2004	780
country	ET	2009	2003	814
country	ET	2009	2002	846
country	ET	2009	2001	871
country	ET	2009	2000	897
country	KE	2009	2015	510
country	KE	2009	2014	525
country	KE	2009	2013	540
country	KE	2009	2012	562
country	KE	2009	2011	584
country	KE	2009	2010	605
country	KE	2009	2009	633
country	KE	2009	2008	660
country	KE	2009	2007	680
country	KE	2009	2006	702
country	KE	2009	2005	728
country	KE	2009	2004	751
country	KE	2009	2003	768
country	KE	2009	2002	767
country	KE	2009	2001	765
country	KE	2009	2000	759
country	NG	2009	2015	814
country	NG	2009	2014	820
country	NG	2009	2013	821
country	NG	2009	2012	819
country	NG	2009	2011	824
country	NG	2009	2010	867
country	NG	2009	2009	883
country	NG	2009	2008	829
country	NG	2009	2007	884
country	NG	2009	2006	890
country	NG	2009	2005	946
country	NG	2009	2004	986
country	NG	2009	2003	1040
country	NG	2009	2002	1090
country	NG	2009	2001	1140
country	NG	2009	2000	1170
country	SN	2009	2015	315
country	SN	2009	2014	323
country	SN	2009	2013	335
country	SN	2009	2012	351
country	SN	2009	2011	365
country	SN	2009	2010	375
country	SN	2009	2009	387
country	SN	2009	2008	398
country	SN	2009	2007	414
country	SN	2009	2006	426
country	SN	2009	2005	427
country	SN	2009	2004	445
country	SN	2009	2003	462
country	SN	2009	2002	474
country	SN	2009	2001	481
country	SN	2009	2000	488
country	TZ	2009	2015	398
country	TZ	2009	2014	418
country	TZ	2009	2013	438
country	TZ	2009	2012	464
country	TZ	2009	2011	483
country	TZ	2009	2010	514
country	TZ	2009	2009	542
country	TZ	2009	2008	566
country	TZ	2009	2007	608
country	TZ	2009	2006	652
country	TZ	2009	2005	687
country	TZ	2009	2004	717
country	TZ	2009	2003	747
country	TZ	2009	2002	777
country	TZ	2009	2001	813
country	TZ	2009	2000	842
counry	UG	2009	1996	678
counry	UG	2009	1997	668
counry	UG	2009	1998	658
counry	UG	2009	1999	639
counry	UG	2009	2000	620
counry	UG	2009	2001	601
counry	UG	2009	2002	576
counry	UG	2009	2003	558
counry	UG	2009	2004	536
counry	UG	2009	2005	504
counry	UG	2009	2006	481
counry	UG	2009	2007	469
counry	UG	2009	2008	451
counry	UG	2009	2009	432
counry	UG	2009	2010	420
counry	UG	2009	2011	408
counry	UG	2009	2012	395
counry	UG	2009	2013	372
counry	UG	2009	2014	356
counry	UG	2009	2015	343
country	ZA	2009	2015	138
country	ZA	2009	2014	140
country	ZA	2009	2013	145
country	ZA	2009	2012	152
country	ZA	2009	2011	154
country	ZA	2009	2010	154
country	ZA	2009	2009	148
country	ZA	2009	2008	138
country	ZA	2009	2007	126
country	ZA	2009	2006	119
country	ZA	2009	2005	112
country	ZA	2009	2004	107
country	ZA	2009	2003	102
country	ZA	2009	2002	95
country	ZA	2009	2001	89
country	ZA	2009	2000	85
country	ZM	2009	1996	598
country	ZM	2009	1997	598
country	ZM	2009	1998	596
country	ZM	2009	1999	569
country	ZM	2009	2000	541
country	ZM	2009	2001	518
country	ZM	2009	2002	493
country	ZM	2009	2003	472
country	ZM	2009	2004	414
country	ZM	2009	2005	372
country	ZM	2009	2006	338
country	ZM	2009	2007	311
country	ZM	2009	2008	289
country	ZM	2009	2009	274
country	ZM	2009	2010	262
country	ZM	2009	2011	251
country	ZM	2009	2012	243
country	ZM	2009	2013	237
country	ZM	2009	2014	231
country	ZM	2009	2015	224
\.


--
-- Name: maternal_mortality pk_maternal_mortality; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.maternal_mortality
    ADD CONSTRAINT pk_maternal_mortality PRIMARY KEY (geo_level, geo_code, geo_version, maternal_mortality_year);


--
-- PostgreSQL database dump complete
--
