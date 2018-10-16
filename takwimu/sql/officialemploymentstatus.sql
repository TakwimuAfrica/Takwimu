--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.2
-- Dumped by pg_dump version 9.6.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

ALTER TABLE IF EXISTS ONLY public.officialemploymentstatus DROP CONSTRAINT IF EXISTS pk_officialemploymentstatus;
DROP TABLE IF EXISTS public.officialemploymentstatus;
SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: officialemploymentstatus; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE officialemploymentstatus (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    "official employment status" character varying(128) NOT NULL,
    total integer NOT NULL,
    geo_version character varying(100) NOT NULL
);


--
-- Data for Name: officialemploymentstatus; Type: TABLE DATA; Schema: public; Owner: -
--

COPY officialemploymentstatus (geo_level, geo_code, "official employment status", total, geo_version) FROM stdin;
province	EC	Employed	1028964	2011
province	EC	Unemployed	615849	2011
province	EC	Discouraged work-seeker	306376	2011
province	EC	Other not economically active	2001779	2011
province	EC	Age less than 15 years	0	2011
province	EC	Not applicable	2609086	2011
province	FS	Employed	649661	2011
province	FS	Unemployed	313793	2011
province	FS	Discouraged work-seeker	99949	2011
province	FS	Other not economically active	732517	2011
province	FS	Age less than 15 years	0	2011
province	FS	Not applicable	949670	2011
province	GT	Employed	4467370	2011
province	GT	Unemployed	1598044	2011
province	GT	Discouraged work-seeker	296450	2011
province	GT	Other not economically active	2468859	2011
province	GT	Age less than 15 years	0	2011
province	GT	Not applicable	3441539	2011
province	KZN	Employed	2041581	2011
province	KZN	Unemployed	1006409	2011
province	KZN	Discouraged work-seeker	488538	2011
province	KZN	Other not economically active	2943203	2011
province	KZN	Age less than 15 years	0	2011
province	KZN	Not applicable	3787571	2011
province	LIM	Employed	885874	2011
province	LIM	Unemployed	565029	2011
province	LIM	Discouraged work-seeker	202780	2011
province	LIM	Other not economically active	1577756	2011
province	LIM	Age less than 15 years	0	2011
province	LIM	Not applicable	2173429	2011
province	MP	Employed	969771	2011
province	MP	Unemployed	448126	2011
province	MP	Discouraged work-seeker	150844	2011
province	MP	Other not economically active	1020806	2011
province	MP	Age less than 15 years	0	2011
province	MP	Not applicable	1450392	2011
province	NW	Employed	843369	2011
province	NW	Unemployed	387348	2011
province	NW	Discouraged work-seeker	127490	2011
province	NW	Other not economically active	913527	2011
province	NW	Age less than 15 years	0	2011
province	NW	Not applicable	1238219	2011
province	NC	Employed	282791	2011
province	NC	Unemployed	106723	2011
province	NC	Discouraged work-seeker	39913	2011
province	NC	Other not economically active	306291	2011
province	NC	Age less than 15 years	0	2011
province	NC	Not applicable	410143	2011
province	WC	Employed	2010697	2011
province	WC	Unemployed	552733	2011
province	WC	Discouraged work-seeker	122753	2011
province	WC	Other not economically active	1330519	2011
province	WC	Age less than 15 years	0	2011
province	WC	Not applicable	1806032	2011
country	ZA	Employed	13180077	2011
country	ZA	Unemployed	5594055	2011
country	ZA	Discouraged work-seeker	1835092	2011
country	ZA	Other not economically active	13295256	2011
country	ZA	Age less than 15 years	0	2011
country	ZA	Not applicable	17866080	2011
\.


--
-- Name: officialemploymentstatus pk_officialemploymentstatus; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY officialemploymentstatus
    ADD CONSTRAINT pk_officialemploymentstatus PRIMARY KEY (geo_level, geo_code, geo_version, "official employment status");


--
-- PostgreSQL database dump complete
--