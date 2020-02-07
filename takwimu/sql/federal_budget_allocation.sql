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

ALTER TABLE IF EXISTS ONLY public.federal_budget_allocation DROP CONSTRAINT IF EXISTS pk_federal_budget_allocation;
DROP TABLE IF EXISTS public.federal_budget_allocation;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: federal_budget_allocation; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.federal_budget_allocation (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    allocation character varying(128) NOT NULL,
    total numeric
);


--
-- Data for Name: federal_budget_allocation; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.federal_budget_allocation (geo_level, geo_code, geo_version, allocation, total) FROM stdin;
country	NG	2009	Pensions and gratituties	504388747211
country	NG	2009	Service wide votes	980672226134
country	NG	2009	Capital supplementation	652915780857
country	NG	2009	Statutory transfers	492360342965
country	NG	2009	Debt servicing	2264014113092
country	NG	2009	Capital development fund	2031704458092
\.


--
-- Name: federal_budget_allocation pk_federal_budget_allocation; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.federal_budget_allocation
    ADD CONSTRAINT pk_federal_budget_allocation PRIMARY KEY (geo_level, geo_code, geo_version, allocation);


--
-- PostgreSQL database dump complete
--
