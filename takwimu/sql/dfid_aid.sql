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

ALTER TABLE IF EXISTS ONLY public.dfid_aid DROP CONSTRAINT IF EXISTS pk_dfid_aid;
DROP TABLE IF EXISTS public.dfid_aid;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: dfid_aid; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.dfid_aid (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    project character varying(250) NOT NULL,
    total numeric
);


--
-- Data for Name: dfid_aid; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.dfid_aid (geo_level, geo_code, geo_version, project, total) FROM stdin;
country	NG	2009	North East Nigeria Transition to Development Programme	392999993.00
country	NG	2009	Fleming Fund – Country and Regional Grants and Fellowships Programme	234970256.75
country	NG	2009	Maternal and Newborn Child Health Programme	133202673.00
country	NG	2009	UK Aid Match 2013–2016: giving the public a say in how a portion of the aid budget is spent	122799944.00
country	NG	2009	Partnership to Engage, Reform and Learn (PERL)	99999990.00
country	NG	2009	Sanitation, Hygiene & Water in Nigeria, Phase 2	96519994.00
country	NG	2009	Girls Education Project (GEP) Phase 3	87694556.00
country	NG	2009	LAFIYA -UK Support for Health in Nigeria	84500000.00
country	NG	2009	Partnership for Learning for All in Nigerian Education - PLANE	82999999.00
country	NG	2009	Working to Improving Nutrition in Northern Nigeria (WINNN)	61300275.00
country	NG	2009	Child Development Grant (CDG) Programme	56518530.00
country	NG	2009	Rural and Agriculture Markets Development programme for Northern Nigeria (PrOpCom Mai-karfi)	50999993.00
country	NG	2009	Deepening Democracy in Nigeria 2 (DDIN2)	47453946.00
country	NG	2009	UK Action Against Corruption Programme (UKACT)	39126318.00
country	NG	2009	Women for Health (W4H) Programme	38205743.00
country	NG	2009	Increasing Economic Opportunities for Marginalised Youth in Northern Nigeria	35979988.00
country	NG	2009	Support to National Malaria Programme Phase 2	34731659.00
country	NG	2009	Teacher Development Programme	34073456.00
country	NG	2009	Market Development in the Niger Delta	22148991.00
country	NG	2009	CSSF North East Nigeria Conflict Management and Stabilisation	21200000.00
country	NG	2009	Contributing Towards Eliminating Blinding Trachoma in the Commonwealth	19999995.00
country	NG	2009	Facility for Oil Sector Transformation II	19499996.00
country	NG	2009	World Bank Governance Partnership Facility Programme	18999999.00
country	NG	2009	European Union Emergency Trust Fund for stability and addressing root causes of irregular migration and displaced persons in Africa	18899113.00
country	NG	2009	Policy Development Facility Phase II	18499997.00
country	NG	2009	British Council - Nigeria	17967289.35
country	NG	2009	Anti-corruption in Nigeria Programme	15849995.00
country	NG	2009	Nigeria Security & Justice Reform Programme	10700000.00
country	NG	2009	Solar Nigeria Programme	10517080.00
country	NG	2009	North East Nigeria Security and Conflict and Stabilisation Programme	8900000.00
country	NG	2009	Policy Research Fund	7505493.00
country	NG	2009	UK Nigeria Infrastructure Advisory Facility (UKNIAF)	7199999.00
country	NG	2009	Promoting Learning in Agribusiness using New Technologies	4799999.00
country	NG	2009	North East Nigeria Security and Conflict and Stabilisation Programme - CSSF	3300000.00
country	NG	2009	Nigeria Countering Organised Crime and Corruption	3000000.00
country	NG	2009	LINKS – 'Powering Economic Growth in Northern Nigeria'	2450000.00
country	NG	2009	Nigeria Delta & Maritime Security and Stability Programme	1800000.00
country	NG	2009	Financial Sector Development Programme	38699993.00
country	NG	2009	Stamp Out Slavery In Nigeria (SOSIN) Programme	1449999.00
country	NG	2009	Nigeria Delta & Maritime Security and Stability Programme - CSSF	900000.00
country	NG	2009	Frontline Diplomatic Enabling Activity in Nigeria	80251.00
country	NG	2009	Supporting Human Rights, Democracy and the Rules based International System in Nigeria	25000.00
\.


--
-- Name: dfid_aid pk_dfid_aid; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dfid_aid
    ADD CONSTRAINT pk_dfid_aid PRIMARY KEY (geo_level, geo_code, geo_version, project);


--
-- PostgreSQL database dump complete
--

