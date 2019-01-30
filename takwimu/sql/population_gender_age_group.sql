--
-- PostgreSQL database dump
--

-- Dumped from database version 10.0
-- Dumped by pg_dump version 10.0

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

ALTER TABLE IF EXISTS ONLY public.gender_age_group DROP CONSTRAINT IF EXISTS pk_gender_age_group;
DROP TABLE IF EXISTS public.gender_age_group;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: gender_age_group; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.gender_age_group (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    gender character varying(128) NOT NULL,
    age_group character varying(128) NOT NULL,
    total integer NOT NULL,
    geo_version character varying(100)
);


--
-- Data for Name: gender_age_group; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.gender_age_group (geo_level, geo_code, gender, age_group, total, geo_version) FROM stdin;
country	ET	male	0-14 Years	2954372	2009
level1	ET_1_001	male	0-14 Years	303521	2009
level1	ET_1_002	male	0-14 Years	398080	2009
level1	ET_1_003	male	0-14 Years	376749	2009
level1	ET_1_004	male	0-14 Years	237719	2009
level1	ET_1_005	male	0-14 Years	432621	2009
level1	ET_1_006	male	0-14 Years	173033	2009
level1	ET_1_007	male	0-14 Years	269359	2009
level1	ET_1_008	male	0-14 Years	177019	2009
level1	ET_1_009	male	0-14 Years	375728	2009
level1	ET_1_010	male	0-14 Years	77019	2009
level1	ET_1_011	male	0-14 Years	35728	2009
country	ET	female	0-14 Years	2988797	2009
level1	ET_1_001	female	0-14 Years	305623	2009
level1	ET_1_002	female	0-14 Years	408528	2009
level1	ET_1_003	female	0-14 Years	376818	2009
level1	ET_1_004	female	0-14 Years	237137	2009
level1	ET_1_005	female	0-14 Years	452941	2009
level1	ET_1_006	female	0-14 Years	172981	2009
level1	ET_1_007	female	0-14 Years	268767	2009
level1	ET_1_008	female	0-14 Years	177475	2009
level1	ET_1_009	female	0-14 Years	378841	2009
level1	ET_1_010	female	0-14 Years	35728	2009
level1	ET_1_011	female	0-14 Years	77019	2009
country	ET	male	15-34 Years	2224884	2009
level1	ET_1_001	male	15-34 Years	217901	2009
level1	ET_1_002	male	15-34 Years	369307	2009
level1	ET_1_003	male	15-34 Years	257254	2009
level1	ET_1_004	male	15-34 Years	151398	2009
level1	ET_1_005	male	15-34 Years	425866	2009
level1	ET_1_006	male	15-34 Years	110133	2009
level1	ET_1_007	male	15-34 Years	169887	2009
level1	ET_1_008	male	15-34 Years	115472	2009
level1	ET_1_009	male	15-34 Years	269219	2009
level1	ET_1_010	male	15-34 Years	10133	2009
level1	ET_1_011	male	15-34 Years	50133	2009
country	ET	female	15-34 Years	2398258	2009
level1	ET_1_001	female	15-34 Years	230600	2009
level1	ET_1_002	female	15-34 Years	386957	2009
level1	ET_1_003	female	15-34 Years	270325	2009
level1	ET_1_004	female	15-34 Years	168751	2009
level1	ET_1_005	female	15-34 Years	464268	2009
level1	ET_1_006	female	15-34 Years	121315	2009
level1	ET_1_007	female	15-34 Years	185981	2009
level1	ET_1_008	female	15-34 Years	124050	2009
level1	ET_1_009	female	15-34 Years	287057	2009
level1	ET_1_010	female	15-34 Years	24050	2009
level1	ET_1_011	female	15-34 Years	27057	2009
country	ET	male	35 and above	1250964	2009
level1	ET_1_001	male	35 and above	122423	2009
level1	ET_1_002	male	35 and above	194945	2009
level1	ET_1_003	male	35 and above	160838	2009
level1	ET_1_004	male	35 and above	97450	2009
level1	ET_1_005	male	35 and above	191018	2009
level1	ET_1_006	male	35 and above	67489	2009
level1	ET_1_007	male	35 and above	104225	2009
level1	ET_1_008	male	35 and above	67378	2009
level1	ET_1_009	male	35 and above	144369	2009
level1	ET_1_010	male	35 and above	73780	2009
level1	ET_1_011	male	35 and above	144000	2009
country	ET	female	35 and above	1250964	2009
level1	ET_1_001	female	35 and above	122423	2009
level1	ET_1_002	female	35 and above	194945	2009
level1	ET_1_003	female	35 and above	160838	2009
level1	ET_1_004	female	35 and above	97450	2009
level1	ET_1_005	female	35 and above	191018	2009
level1	ET_1_006	female	35 and above	67489	2009
level1	ET_1_007	female	35 and above	104225	2009
level1	ET_1_008	female	35 and above	67378	2009
level1	ET_1_009	female	35 and above	144369	2009
level1	ET_1_010	female	35 and above	73780	2009
level1	ET_1_011	female	35 and above	136944	2009
\.


--
-- Name: gender_age_group pk_gender_age_group; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.gender_age_group
    ADD CONSTRAINT pk_gender_age_group PRIMARY KEY (geo_level, geo_code, gender, age_group);


--
-- PostgreSQL database dump complete
--

