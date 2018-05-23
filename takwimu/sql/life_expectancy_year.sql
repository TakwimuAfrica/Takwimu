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

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: life_expectancy_year; Type: TABLE; Schema: public; Owner: humandev
--

CREATE TABLE life_expectancy_year (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    "Life_Expectancy_Year" character varying(128) NOT NULL,
    total integer
);


ALTER TABLE life_expectancy_year OWNER TO humandev;

--
-- Data for Name: life_expectancy_year; Type: TABLE DATA; Schema: public; Owner: humandev
--

COPY life_expectancy_year (geo_level, geo_code, geo_version, "Life_Expectancy_Year", total) FROM stdin;
country	NGA	2009	2000	46
country	SEN	2009	2000	58
country	TZA	2009	2000	51
country	NGA	2009	2001	47
country	SEN	2009	2001	58
country	TZA	2009	2001	52
country	NGA	2009	2002	47
country	SEN	2009	2002	59
country	TZA	2009	2002	53
country	NGA	2009	2003	47
country	SEN	2009	2003	59
country	TZA	2009	2003	54
country	NGA	2009	2004	48
country	SEN	2009	2004	60
country	TZA	2009	2004	55
country	NGA	2009	2005	48
country	SEN	2009	2005	60
country	TZA	2009	2005	56
country	NGA	2009	2006	49
country	SEN	2009	2006	61
country	TZA	2009	2006	57
country	NGA	2009	2007	49
country	SEN	2009	2007	62
country	TZA	2009	2007	58
country	NGA	2009	2008	50
country	SEN	2009	2008	63
country	TZA	2009	2008	59
country	NGA	2009	2009	50
country	SEN	2009	2009	63
country	TZA	2009	2009	60
country	NGA	2009	2010	51
country	SEN	2009	2010	64
country	TZA	2009	2010	61
country	NGA	2009	2011	51
country	SEN	2009	2011	65
country	TZA	2009	2011	62
country	NGA	2009	2012	52
country	SEN	2009	2012	65
country	TZA	2009	2012	62
country	NGA	2009	2013	52
country	SEN	2009	2013	66
country	TZA	2009	2013	63
country	NGA	2009	2014	53
country	SEN	2009	2014	66
country	TZA	2009	2014	64
country	NGA	2009	2015	53
country	SEN	2009	2015	67
country	TZA	2009	2015	65
\.


--
-- Name: life_expectancy_year pk_life_expectancy_year; Type: CONSTRAINT; Schema: public; Owner: humandev
--

ALTER TABLE ONLY life_expectancy_year
    ADD CONSTRAINT pk_life_expectancy_year PRIMARY KEY (geo_level, geo_code, geo_version, "Life_Expectancy_Year");


--
-- PostgreSQL database dump complete
--