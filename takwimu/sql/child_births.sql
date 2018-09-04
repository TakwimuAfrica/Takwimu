--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.13
-- Dumped by pg_dump version 9.6.7

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET search_path = public, pg_catalog;

ALTER TABLE IF EXISTS ONLY public.child_births DROP CONSTRAINT IF EXISTS pk_child_births;
DROP TABLE IF EXISTS public.child_births;
SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: child_births; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE child_births (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    child_births character varying(128) NOT NULL,
    total integer
);


--
-- Data for Name: child_births; Type: TABLE DATA; Schema: public; Owner: -
--

COPY child_births (geo_level, geo_code, geo_version, child_births, total) FROM stdin;
level1	NG_1_001	2009	number of births	326
level1	NG_1_002	2009	number of births	732
level1	NG_1_003	2009	number of births	473
level1	NG_1_004	2009	number of births	657
level1	NG_1_005	2009	number of births	1431
level1	NG_1_006	2009	number of births	233
level1	NG_1_007	2009	number of births	967
level1	NG_1_008	2009	number of births	1118
level1	NG_1_009	2009	number of births	532
level1	NG_1_010	2009	number of births	561
level1	NG_1_011	2009	number of births	748
level1	NG_1_012	2009	number of births	405
level1	NG_1_013	2009	number of births	200
level1	NG_1_014	2009	number of births	558
level1	NG_1_015	2009	number of births	209
level1	NG_1_016	2009	number of births	595
level1	NG_1_017	2009	number of births	552
level1	NG_1_018	2009	number of births	1594
level1	NG_1_019	2009	number of births	1439
level1	NG_1_020	2009	number of births	3024
level1	NG_1_021	2009	number of births	1703
level1	NG_1_022	2009	number of births	1247
level1	NG_1_023	2009	number of births	401
level1	NG_1_024	2009	number of births	405
level1	NG_1_025	2009	number of births	1303
level1	NG_1_026	2009	number of births	460
level1	NG_1_027	2009	number of births	1394
level1	NG_1_028	2009	number of births	736
level1	NG_1_029	2009	number of births	568
level1	NG_1_030	2009	number of births	445
level1	NG_1_031	2009	number of births	1108
level1	NG_1_032	2009	number of births	505
level1	NG_1_033	2009	number of births	730
level1	NG_1_034	2009	number of births	1151
level1	NG_1_035	2009	number of births	764
level1	NG_1_036	2009	number of births	938
level1	NG_1_037	2009	number of births	1618
country	NG	2009	number of births	31830
\.


--
-- Name: child_births pk_child_births; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY child_births
    ADD CONSTRAINT pk_child_births PRIMARY KEY (geo_level, geo_code, geo_version, child_births);


--
-- PostgreSQL database dump complete
--
