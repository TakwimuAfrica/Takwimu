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

ALTER TABLE IF EXISTS ONLY public.total_population DROP CONSTRAINT IF EXISTS pk_total_population;
DROP TABLE IF EXISTS public.total_population;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: total_population; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.total_population (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    total_population_year character varying(128) NOT NULL,
    total integer
);


--
-- Data for Name: total_population; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.total_population (geo_level, geo_code, geo_version, total_population_year, total) FROM stdin;
country	ET	2009	2017	104957438
country	ET	2009	2016	102403196
country	ET	2009	2015	99873033
country	ET	2009	2014	97366774
country	ET	2009	2013	94887724
country	ET	2009	2012	92444183
country	ET	2009	2011	90046756
country	ET	2009	2010	87702670
country	ET	2009	2009	85416253
country	ET	2009	2008	83184892
country	ET	2009	2007	81000409
country	ET	2009	2006	78850689
country	ET	2009	2005	76727083
country	ET	2009	2004	74624405
country	ET	2009	2003	72545144
country	ET	2009	2002	70497192
country	ET	2009	2001	68492257
country	ET	2009	2000	66537331
country	KE	2009	2017	49699862
country	KE	2009	2016	48461567
country	KE	2009	2015	47236259
country	KE	2009	2014	46024250
country	KE	2009	2013	44826849
country	KE	2009	2012	43646629
country	KE	2009	2011	42486839
country	KE	2009	2010	41350152
country	KE	2009	2009	40237204
country	KE	2009	2008	39148416
country	KE	2009	2007	38085909
country	KE	2009	2006	37052050
country	KE	2009	2005	36048288
country	KE	2009	2004	35074931
country	KE	2009	2003	34130852
country	KE	2009	2002	33214009
country	KE	2009	2001	32321482
country	KE	2009	2000	31450483
country	NG	2009	2017	190886311
country	NG	2009	2016	185989640
country	NG	2009	2015	181181744
country	NG	2009	2014	176460502
country	NG	2009	2013	171829303
country	NG	2009	2012	167297284
country	NG	2009	2011	162877076
country	NG	2009	2010	158578261
country	NG	2009	2009	154402181
country	NG	2009	2008	150347390
country	NG	2009	2007	146417024
country	NG	2009	2006	142614094
country	NG	2009	2005	138939478
country	NG	2009	2004	135393616
country	NG	2009	2003	131972533
country	NG	2009	2002	128666710
country	NG	2009	2001	125463434
country	NG	2009	2000	122352009
country	SN	2009	2017	15850567
country	SN	2009	2016	15411614
country	SN	2009	2015	14976994
country	SN	2009	2014	14546111
country	SN	2009	2013	14120320
country	SN	2009	2012	13703513
country	SN	2009	2011	13300910
country	SN	2009	2010	12916229
country	SN	2009	2009	12550917
country	SN	2009	2008	12203957
country	SN	2009	2007	11873557
country	SN	2009	2006	11556763
country	SN	2009	2005	11251266
country	SN	2009	2004	10955944
country	SN	2009	2003	10670990
country	SN	2009	2002	10396861
country	SN	2009	2001	10134497
country	SN	2009	2000	9884052
country	TZ	2009	2017	57310019
country	TZ	2009	2016	55572201
country	TZ	2009	2015	53879957
country	TZ	2009	2014	52234869
country	TZ	2009	2013	50636595
country	TZ	2009	2012	49082997
country	TZ	2009	2011	47570902
country	TZ	2009	2010	46098591
country	TZ	2009	2009	44664231
country	TZ	2009	2008	43270144
country	TZ	2009	2007	41923715
country	TZ	2009	2006	40634948
country	TZ	2009	2005	39410545
country	TZ	2009	2004	38249984
country	TZ	2009	2003	37149072
country	TZ	2009	2002	36105808
country	TZ	2009	2001	35117019
country	TZ	2009	2000	34178042
country	ZA	2009	2017	56717156
country	ZA	2009	2016	56015473
country	ZA	2009	2015	55291225
country	ZA	2009	2014	54539571
country	ZA	2009	2013	53767396
country	ZA	2009	2012	52998213
country	ZA	2009	2011	52263516
country	ZA	2009	2010	51584663
country	ZA	2009	2009	50970818
country	ZA	2009	2008	50412129
country	ZA	2009	2007	49887181
country	ZA	2009	2006	49364582
country	ZA	2009	2005	48820586
country	ZA	2009	2004	48247395
country	ZA	2009	2003	47648727
country	ZA	2009	2002	47026173
country	ZA	2009	2001	46385006
country	ZA	2009	2000	45728315
\.


--
-- Name: total_population pk_total_population; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.total_population
    ADD CONSTRAINT pk_total_population PRIMARY KEY (geo_level, geo_code, geo_version, total_population_year);


--
-- PostgreSQL database dump complete
--

