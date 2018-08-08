--
-- PostgreSQL database dump
--

<<<<<<< Updated upstream
-- Dumped from database version 10.0
-- Dumped by pg_dump version 10.4

SET statement_timeout = 0;
SET lock_timeout = 0;
=======
-- Dumped from database version 10.4 (Ubuntu 10.4-0ubuntu0.18.04)
-- Dumped by pg_dump version 10.4 (Ubuntu 10.4-0ubuntu0.18.04)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
>>>>>>> Stashed changes
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
<<<<<<< Updated upstream

ALTER TABLE IF EXISTS ONLY public.health_centers_ownership DROP CONSTRAINT IF EXISTS pk_health_centers_ownership;
DROP TABLE IF EXISTS public.health_centers_ownership;
=======
SET row_security = off;

>>>>>>> Stashed changes
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: health_centers_ownership; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.health_centers_ownership (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    organization_type character varying(128) NOT NULL,
    total integer
);


--
-- Data for Name: health_centers_ownership; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.health_centers_ownership (geo_level, geo_code, geo_version, organization_type, total) FROM stdin;
<<<<<<< Updated upstream
=======
level1	TZ_1_001	2009	faith based org	62
level1	TZ_1_001	2009	parastatal	4
level1	TZ_1_001	2009	private	84
level1	TZ_1_001	2009	public	184
level1	TZ_1_003	2009	faith based org	78
level1	TZ_1_003	2009	parastatal	14
level1	TZ_1_003	2009	private	357
level1	TZ_1_003	2009	public	150
level1	TZ_1_002	2009	faith based org	38
level1	TZ_1_002	2009	parastatal	4
level1	TZ_1_002	2009	private	18
level1	TZ_1_002	2009	public	308
level1	TZ_1_004	2009	faith based org	13
level1	TZ_1_004	2009	parastatal	1
level1	TZ_1_004	2009	private	23
level1	TZ_1_004	2009	public	106
level1	TZ_1_005	2009	faith based org	45
level1	TZ_1_005	2009	parastatal	1
level1	TZ_1_005	2009	private	20
level1	TZ_1_005	2009	public	174
level1	TZ_1_006	2009	faith based org	37
level1	TZ_1_006	2009	parastatal	2
level1	TZ_1_006	2009	private	23
level1	TZ_1_006	2009	public	236
level1	TZ_1_009	2009	faith based org	9
level1	TZ_1_009	2009	parastatal	0
level1	TZ_1_009	2009	private	6
level1	TZ_1_009	2009	public	62
level1	TZ_1_010	2009	faith based org	25
level1	TZ_1_010	2009	parastatal	1
level1	TZ_1_010	2009	private	14
level1	TZ_1_010	2009	public	221
level1	TZ_1_011	2009	faith based org	90
level1	TZ_1_011	2009	parastatal	2
level1	TZ_1_011	2009	private	62
level1	TZ_1_011	2009	public	234
level1	TZ_1_014	2009	faith based org	6
level1	TZ_1_014	2009	parastatal	0
level1	TZ_1_014	2009	private	2
level1	TZ_1_014	2009	public	214
level1	TZ_1_015	2009	faith based org	29
level1	TZ_1_015	2009	parastatal	1
level1	TZ_1_015	2009	private	17
level1	TZ_1_015	2009	public	143
level1	TZ_1_016	2009	faith based org	39
level1	TZ_1_016	2009	parastatal	2
level1	TZ_1_016	2009	private	35
level1	TZ_1_016	2009	public	199
level1	TZ_1_017	2009	faith based org	50
level1	TZ_1_017	2009	parastatal	5
level1	TZ_1_017	2009	private	61
level1	TZ_1_017	2009	public	354
level1	TZ_1_018	2009	faith based org	67
level1	TZ_1_018	2009	parastatal	12
level1	TZ_1_018	2009	private	33
level1	TZ_1_018	2009	public	244
level1	TZ_1_019	2009	faith based org	19
level1	TZ_1_019	2009	parastatal	0
level1	TZ_1_019	2009	private	12
level1	TZ_1_019	2009	public	188
level1	TZ_1_020	2009	faith based org	27
level1	TZ_1_020	2009	parastatal	6
level1	TZ_1_020	2009	private	67
level1	TZ_1_020	2009	public	262
level1	TZ_1_021	2009	faith based org	43
level1	TZ_1_021	2009	parastatal	4
level1	TZ_1_021	2009	private	4
level1	TZ_1_021	2009	public	187
level1	TZ_1_022	2009	faith based org	26
level1	TZ_1_022	2009	parastatal	5
level1	TZ_1_022	2009	private	23
level1	TZ_1_022	2009	public	232
level1	TZ_1_023	2009	faith based org	21
level1	TZ_1_023	2009	parastatal	0
level1	TZ_1_023	2009	private	8
level1	TZ_1_023	2009	public	176
level1	TZ_1_024	2009	faith based org	49
level1	TZ_1_024	2009	parastatal	0
level1	TZ_1_024	2009	private	11
level1	TZ_1_024	2009	public	215
level1	TZ_1_025	2009	faith based org	20
level1	TZ_1_025	2009	parastatal	1
level1	TZ_1_025	2009	private	26
level1	TZ_1_025	2009	public	152
level1	TZ_1_026	2009	faith based org	19
level1	TZ_1_026	2009	parastatal	0
level1	TZ_1_026	2009	private	12
level1	TZ_1_026	2009	public	171
level1	TZ_1_027	2009	faith based org	30
level1	TZ_1_027	2009	parastatal	0
level1	TZ_1_027	2009	private	5
level1	TZ_1_027	2009	public	175
level1	TZ_1_029	2009	faith based org	25
level1	TZ_1_029	2009	parastatal	1
level1	TZ_1_029	2009	private	13
level1	TZ_1_029	2009	public	247
level1	TZ_1_028	2009	faith based org	33
level1	TZ_1_028	2009	parastatal	5
level1	TZ_1_028	2009	private	32
level1	TZ_1_028	2009	public	292
country	TZ	2009	faith based org	900
country	TZ	2009	parastatal	71
country	TZ	2009	private	968
country	TZ	2009	public	5126
>>>>>>> Stashed changes
\.


--
-- Name: health_centers_ownership pk_health_centers_ownership; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.health_centers_ownership
    ADD CONSTRAINT pk_health_centers_ownership PRIMARY KEY (geo_level, geo_code, geo_version, organization_type);

<<<<<<< Updated upstream

=======
>>>>>>> Stashed changes
--
-- PostgreSQL database dump complete
--

