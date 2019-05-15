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

ALTER TABLE IF EXISTS ONLY public.account_ownership DROP CONSTRAINT IF EXISTS pk_account_ownership;
DROP TABLE IF EXISTS public.account_ownership;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: account_ownership; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.account_ownership (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    sex character varying(128) NOT NULL,
    account_ownership_year character varying(128) NOT NULL,
    total integer
);


--
-- Data for Name: account_ownership; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.account_ownership (geo_level, geo_code, geo_version, sex, account_ownership_year, total) FROM stdin;
country	BF	2009	F	2017	34
country	BF	2009	F	2014	13
country	BF	2009	F	2011	11
country	CD	2009	F	2017	24
country	CD	2009	F	2014	14
country	CD	2009	F	2011	3
country	ET	2009	F	2017	29
country	ET	2009	F	2014	21
country	KE	2009	F	2017	78
country	KE	2009	F	2014	71
country	KE	2009	F	2011	39
country	NG	2009	F	2017	27
country	NG	2009	F	2014	34
country	NG	2009	F	2011	26
country	SN	2009	F	2017	38
country	SN	2009	F	2014	11
country	SN	2009	F	2011	5
country	TZ	2009	F	2017	42
country	TZ	2009	F	2014	34
country	TZ	2009	F	2011	14
country	UG	2009	F	2017	53
country	UG	2009	F	2014	37
country	UG	2009	F	2011	15
country	ZA	2009	F	2017	70
country	ZA	2009	F	2014	70
country	ZA	2009	F	2011	51
country	ZM	2009	F	2017	40
country	ZM	2009	F	2014	33
country	ZM	2009	F	2011	23
country	BF	2009	M	2017	51
country	BF	2009	M	2014	16
country	BF	2009	M	2011	16
country	CD	2009	M	2017	27
country	CD	2009	M	2014	21
country	CD	2009	M	2011	5
country	ET	2009	M	2017	41
country	ET	2009	M	2014	23
country	KE	2009	M	2017	86
country	KE	2009	M	2014	79
country	KE	2009	M	2011	46
country	NG	2009	M	2017	51
country	NG	2009	M	2014	54
country	NG	2009	M	2011	33
country	SN	2009	M	2017	47
country	SN	2009	M	2014	20
country	SN	2009	M	2011	6
country	TZ	2009	M	2017	52
country	TZ	2009	M	2014	45
country	TZ	2009	M	2011	21
country	UG	2009	M	2017	66
country	UG	2009	M	2014	52
country	UG	2009	M	2011	26
country	ZA	2009	M	2017	68
country	ZA	2009	M	2014	70
country	ZA	2009	M	2011	56
country	ZM	2009	M	2017	52
country	ZM	2009	M	2014	38
country	ZM	2009	M	2011	19
\.


--
-- Name: account_ownership pk_account_ownership; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.account_ownership
    ADD CONSTRAINT pk_account_ownership PRIMARY KEY (geo_level, geo_code, geo_version, sex, account_ownership_year);


--
-- PostgreSQL database dump complete
--
