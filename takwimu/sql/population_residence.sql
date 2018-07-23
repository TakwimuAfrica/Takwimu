--
-- PostgreSQL database dump
--

-- Dumped from database version 10.4 (Ubuntu 10.4-0ubuntu0.18.04)
-- Dumped by pg_dump version 10.4 (Ubuntu 10.4-0ubuntu0.18.04)

-- Started on 2018-07-23 18:28:45 EAT

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
-- TOC entry 358 (class 1259 OID 18471)
-- Name: population_residence; Type: TABLE; Schema: public; Owner: takwimu
--

CREATE TABLE public.population_residence (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    "Population_Residence" character varying(128) NOT NULL,
    total integer
);


ALTER TABLE public.population_residence OWNER TO takwimu;

--
-- TOC entry 3373 (class 0 OID 18471)
-- Dependencies: 358
-- Data for Name: population_residence; Type: TABLE DATA; Schema: public; Owner: takwimu
--

COPY public.population_residence (geo_level, geo_code, geo_version, "Population_Residence", total) FROM stdin;
country	TZA	2009	urban	13305004
country	TZA	2009	rural	31623919
country	NGA	2009	urban	0
country	NGA	2009	rural	0
country	SEN	2009	urban	6102800
country	SEN	2009	rural	7405915
\.


--
-- TOC entry 3251 (class 2606 OID 18476)
-- Name: population_residence pk_population_residence; Type: CONSTRAINT; Schema: public; Owner: takwimu
--

ALTER TABLE ONLY public.population_residence
    ADD CONSTRAINT pk_population_residence PRIMARY KEY (geo_level, geo_code, geo_version, "Population_Residence");


-- Completed on 2018-07-23 18:28:45 EAT

--
-- PostgreSQL database dump complete
--

