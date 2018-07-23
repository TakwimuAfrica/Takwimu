--
-- PostgreSQL database dump
--

-- Dumped from database version 10.4 (Ubuntu 10.4-0ubuntu0.18.04)
-- Dumped by pg_dump version 10.4 (Ubuntu 10.4-0ubuntu0.18.04)

-- Started on 2018-07-23 18:26:08 EAT

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 357 (class 1259 OID 18459)
-- Name: population_sex; Type: TABLE; Schema: public; Owner: takwimu
--

CREATE TABLE public.population_sex (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    "Population_Sex" character varying(128) NOT NULL,
    total integer
);


ALTER TABLE public.population_sex OWNER TO takwimu;

--
-- TOC entry 3373 (class 0 OID 18459)
-- Dependencies: 357
-- Data for Name: population_sex; Type: TABLE DATA; Schema: public; Owner: takwimu
--

COPY public.population_sex (geo_level, geo_code, geo_version, "Population_Sex", total) FROM stdin;
country	TZA	2009	male	21869990
country	TZA	2009	female	23058933
country	NGA	2009	male	98630184
country	NGA	2009	female	94762333
country	SEN	2009	male	6735421
country	SEN	2009	female	6773294
\.


--
-- TOC entry 3251 (class 2606 OID 18464)
-- Name: population_sex pk_population_sex; Type: CONSTRAINT; Schema: public; Owner: takwimu
--

ALTER TABLE ONLY public.population_sex
    ADD CONSTRAINT pk_population_sex PRIMARY KEY (geo_level, geo_code, geo_version, "Population_Sex");


-- Completed on 2018-07-23 18:26:08 EAT

--
-- PostgreSQL database dump complete
--

