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

ALTER TABLE IF EXISTS ONLY public.access_to_elec_water_services DROP CONSTRAINT IF EXISTS pk_access_to_elec_water_services;
DROP TABLE IF EXISTS public.access_to_elec_water_services;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: access_to_elec_water_services; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.access_to_elec_water_services (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    access_to_elec_water_services character varying(128) NOT NULL,
    total numeric
);


--
-- Data for Name: access_to_elec_water_services; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.access_to_elec_water_services (geo_level, geo_code, geo_version, access_to_elec_water_services, total) FROM stdin;
country	NG	2009	Electricity	54.5
country	NG	2009	Improved water source	67.7
level1	NG_1_001	2009	Electricity	80.4
level1	NG_1_001	2009	Improved water source	83.5
level1	NG_1_002	2009	Electricity	32.7
level1	NG_1_002	2009	Improved water source	53.8
level1	NG_1_003	2009	Electricity	75
level1	NG_1_003	2009	Improved water source	80.3
level1	NG_1_004	2009	Electricity	71.5
level1	NG_1_004	2009	Improved water source	84.5
level1	NG_1_005	2009	Electricity	29
level1	NG_1_005	2009	Improved water source	60.2
level1	NG_1_006	2009	Electricity	46.6
level1	NG_1_006	2009	Improved water source	60.6
level1	NG_1_007	2009	Electricity	34.5
level1	NG_1_007	2009	Improved water source	64.3
level1	NG_1_008	2009	Electricity	63.4
level1	NG_1_008	2009	Improved water source	47
level1	NG_1_009	2009	Electricity	38.1
level1	NG_1_009	2009	Improved water source	53.9
level1	NG_1_010	2009	Electricity	71.6
level1	NG_1_010	2009	Improved water source	79.4
level1	NG_1_011	2009	Electricity	31.1
level1	NG_1_011	2009	Improved water source	76.3
level1	NG_1_012	2009	Electricity	85.5
level1	NG_1_012	2009	Improved water source	88
level1	NG_1_013	2009	Electricity	70.1
level1	NG_1_013	2009	Improved water source	84.3
level1	NG_1_014	2009	Electricity	70.1
level1	NG_1_014	2009	Improved water source	59.3
level1	NG_1_015	2009	Electricity	77.9
level1	NG_1_015	2009	Improved water source	75.5
level1	NG_1_016	2009	Electricity	41.2
level1	NG_1_016	2009	Improved water source	39.4
level1	NG_1_017	2009	Electricity	73.8
level1	NG_1_017	2009	Improved water source	92.2
level1	NG_1_018	2009	Electricity	25.7
level1	NG_1_018	2009	Improved water source	79.4
level1	NG_1_019	2009	Electricity	64.7
level1	NG_1_019	2009	Improved water source	61.2
level1	NG_1_020	2009	Electricity	46.8
level1	NG_1_020	2009	Improved water source	57.9
level1	NG_1_021	2009	Electricity	30
level1	NG_1_021	2009	Improved water source	60.7
level1	NG_1_022	2009	Electricity	41.4
level1	NG_1_022	2009	Improved water source	55.3
level1	NG_1_023	2009	Electricity	50.2
level1	NG_1_023	2009	Improved water source	70.3
level1	NG_1_024	2009	Electricity	71.8
level1	NG_1_024	2009	Improved water source	85.8
level1	NG_1_025	2009	Electricity	99.1
level1	NG_1_025	2009	Improved water source	93.5
level1	NG_1_026	2009	Electricity	31.5
level1	NG_1_026	2009	Improved water source	54.7
level1	NG_1_027	2009	Electricity	55
level1	NG_1_027	2009	Improved water source	52.8
level1	NG_1_028	2009	Electricity	75.8
level1	NG_1_028	2009	Improved water source	88.5
level1	NG_1_029	2009	Electricity	58.3
level1	NG_1_029	2009	Improved water source	79.5
level1	NG_1_030	2009	Electricity	74
level1	NG_1_030	2009	Improved water source	88.4
level1	NG_1_031	2009	Electricity	68.9
level1	NG_1_031	2009	Improved water source	82.7
level1	NG_1_032	2009	Electricity	39.8
level1	NG_1_032	2009	Improved water source	42.9
level1	NG_1_033	2009	Electricity	80.9
level1	NG_1_033	2009	Improved water source	83.4
level1	NG_1_034	2009	Electricity	37.5
level1	NG_1_034	2009	Improved water source	32.7
level1	NG_1_035	2009	Electricity	17.7
level1	NG_1_035	2009	Improved water source	38.3
level1	NG_1_036	2009	Electricity	28.5
level1	NG_1_036	2009	Improved water source	63.2
level1	NG_1_037	2009	Electricity	27.7
level1	NG_1_037	2009	Improved water source	51.5
\.


--
-- Name: access_to_elec_water_services pk_access_to_elec_water_services; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.access_to_elec_water_services
    ADD CONSTRAINT pk_access_to_elec_water_services PRIMARY KEY (geo_level, geo_code, geo_version, access_to_elec_water_services);


--
-- PostgreSQL database dump complete
--

