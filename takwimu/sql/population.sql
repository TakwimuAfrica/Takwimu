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

ALTER TABLE IF EXISTS ONLY public.population_year DROP CONSTRAINT IF EXISTS pk_population_year;
DROP TABLE IF EXISTS public.population_year;
SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: population_year; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE population_year (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    "Population_Year" character varying(128) NOT NULL,
    total integer
);


--
-- Data for Name: population_year; Type: TABLE DATA; Schema: public; Owner: -
--

COPY population_year (geo_level, geo_code, geo_version, "Population_Year", total) FROM stdin;
country	NGA	2009	2000	122352009
country	SEN	2009	2000	9884052
country	TZA	2009	2000	34178042
country	NGA	2009	2001	125463434
country	SEN	2009	2001	10134497
country	TZA	2009	2001	35117019
country	NGA	2009	2002	128666710
country	SEN	2009	2002	10396861
country	TZA	2009	2002	36105808
country	NGA	2009	2003	131972533
country	SEN	2009	2003	10670990
country	TZA	2009	2003	37149072
country	NGA	2009	2004	135393616
country	SEN	2009	2004	10955944
country	TZA	2009	2004	38249984
country	NGA	2009	2005	138939478
country	SEN	2009	2005	11251266
country	TZA	2009	2005	39410545
country	NGA	2009	2006	142614094
country	SEN	2009	2006	11556763
country	TZA	2009	2006	40634948
country	NGA	2009	2007	146417024
country	SEN	2009	2007	11873557
country	TZA	2009	2007	41923715
country	NGA	2009	2008	150347390
country	SEN	2009	2008	12203957
country	TZA	2009	2008	43270144
country	NGA	2009	2009	154402181
country	SEN	2009	2009	12550917
country	TZA	2009	2009	44664231
country	NGA	2009	2010	158578261
country	SEN	2009	2010	12916229
country	TZA	2009	2010	46098591
country	NGA	2009	2011	162877076
country	SEN	2009	2011	13300910
country	TZA	2009	2011	47570902
country	NGA	2009	2012	167297284
country	SEN	2009	2012	13703513
country	TZA	2009	2012	49082997
country	NGA	2009	2013	171829303
country	SEN	2009	2013	14120320
country	TZA	2009	2013	50636595
country	NGA	2009	2014	176460502
country	SEN	2009	2014	14546111
country	TZA	2009	2014	52234869
country	NGA	2009	2015	181181744
country	SEN	2009	2015	14976994
country	TZA	2009	2015	53879957
country	NGA	2009	2016	185989640
country	SEN	2009	2016	15411614
country	TZA	2009	2016	55572201
\.


--
-- Name: population_year pk_population_year; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY population_year
    ADD CONSTRAINT pk_population_year PRIMARY KEY (geo_level, geo_code, geo_version, "Population_Year");


--
-- PostgreSQL database dump complete
--

