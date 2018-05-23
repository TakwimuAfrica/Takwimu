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

ALTER TABLE IF EXISTS ONLY public.rank_year DROP CONSTRAINT IF EXISTS pk_rank_year;
DROP TABLE IF EXISTS public.rank_year;
SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: rank_year; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rank_year (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    "Rank" character varying(128) NOT NULL,
    year character varying(128) NOT NULL,
    total float
);


--
-- Data for Name: rank_year; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rank_year (geo_level, geo_code, geo_version, "Rank", year, total) FROM stdin;
country	NGA	2009	152	2003	0.445
country	SEN	2009	162	2003	0.408
country	TZA	2009	151	2003	0.42
country	NGA	2009	152	2004	0.463
country	SEN	2009	162	2004	0.415
country	TZA	2009	151	2004	0.432
country	NGA	2009	152	2005	0.466
country	SEN	2009	162	2005	0.422
country	TZA	2009	151	2005	0.446
country	NGA	2009	152	2006	0.477
country	SEN	2009	162	2006	0.425
country	TZA	2009	151	2006	0.457
country	NGA	2009	152	2007	0.481
country	SEN	2009	162	2007	0.435
country	TZA	2009	151	2007	0.468
country	NGA	2009	152	2008	0.487
country	SEN	2009	162	2008	0.444
country	TZA	2009	151	2008	0.478
country	NGA	2009	152	2009	0.492
country	SEN	2009	162	2009	0.449
country	TZA	2009	151	2009	0.488
country	NGA	2009	152	2010	0.5
country	SEN	2009	162	2010	0.455
country	TZA	2009	151	2010	0.498
country	NGA	2009	152	2011	0.507
country	SEN	2009	162	2011	0.463
country	TZA	2009	151	2011	0.504
country	NGA	2009	152	2012	0.514
country	SEN	2009	162	2012	0.474
country	TZA	2009	151	2012	0.513
country	NGA	2009	152	2013	0.521
country	SEN	2009	162	2013	0.483
country	TZA	2009	151	2013	0.512
country	NGA	2009	152	2014	0.525
country	SEN	2009	162	2014	0.491
country	TZA	2009	151	2014	0.519
country	NGA	2009	152	2015	0.527
country	SEN	2009	162	2015	0.494
country	TZA	2009	151	2015	0.531
\.


--
-- Name: rank_year pk_rank_year; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rank_year
    ADD CONSTRAINT pk_rank_year PRIMARY KEY (geo_level, geo_code, geo_version, "Rank", year);


--
-- PostgreSQL database dump complete
--

