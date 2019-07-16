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

ALTER TABLE IF EXISTS ONLY public.account_ownership_indicator DROP CONSTRAINT IF EXISTS pk_account_ownership_indicator;
DROP TABLE IF EXISTS public.account_ownership_indicator;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: account_ownership_indicator; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.account_ownership_indicator (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    account_ownership_year character varying(128) NOT NULL,
    total numeric
);


--
-- Data for Name: account_ownership_indicator; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.account_ownership_indicator (geo_level, geo_code, geo_version, account_ownership_year, total) FROM stdin;
country	NG	2009	2016-2017	44.2
level1	NG_1_001	2009	2016-2017	60.7
level1	NG_1_002	2009	2016-2017	37.3
level1	NG_1_003	2009	2016-2017	44.6
level1	NG_1_004	2009	2016-2017	75
level1	NG_1_005	2009	2016-2017	16.4
level1	NG_1_006	2009	2016-2017	55.1
level1	NG_1_007	2009	2016-2017	41.6
level1	NG_1_008	2009	2016-2017	37.2
level1	NG_1_009	2009	2016-2017	46.5
level1	NG_1_010	2009	2016-2017	56.6
level1	NG_1_011	2009	2016-2017	38.7
level1	NG_1_012	2009	2016-2017	76.3
level1	NG_1_013	2009	2016-2017	57.2
level1	NG_1_014	2009	2016-2017	55.7
level1	NG_1_015	2009	2016-2017	66.1
level1	NG_1_016	2009	2016-2017	25.1
level1	NG_1_017	2009	2016-2017	63.2
level1	NG_1_018	2009	2016-2017	14.8
level1	NG_1_019	2009	2016-2017	41.6
level1	NG_1_020	2009	2016-2017	22.9
level1	NG_1_021	2009	2016-2017	16.3
level1	NG_1_022	2009	2016-2017	17.7
level1	NG_1_023	2009	2016-2017	46.8
level1	NG_1_024	2009	2016-2017	40
level1	NG_1_025	2009	2016-2017	86.1
level1	NG_1_026	2009	2016-2017	37.4
level1	NG_1_027	2009	2016-2017	32.7
level1	NG_1_028	2009	2016-2017	51.5
level1	NG_1_029	2009	2016-2017	52.4
level1	NG_1_030	2009	2016-2017	55.5
level1	NG_1_031	2009	2016-2017	60.9
level1	NG_1_032	2009	2016-2017	46.1
level1	NG_1_033	2009	2016-2017	72.4
level1	NG_1_034	2009	2016-2017	17.2
level1	NG_1_035	2009	2016-2017	29.1
level1	NG_1_036	2009	2016-2017	19.7
level1	NG_1_037	2009	2016-2017	20.6
\.


--
-- Name: account_ownership_indicator pk_account_ownership_indicator; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.account_ownership_indicator
    ADD CONSTRAINT pk_account_ownership_indicator PRIMARY KEY (geo_level, geo_code, geo_version, account_ownership_year);


--
-- PostgreSQL database dump complete
--
