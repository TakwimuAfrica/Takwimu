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

ALTER TABLE IF EXISTS ONLY public.recurrent_capital_expenditure DROP CONSTRAINT IF EXISTS pk_recurrent_capital_expenditure;
DROP TABLE IF EXISTS public.recurrent_capital_expenditure;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: recurrent_capital_expenditure; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.recurrent_capital_expenditure (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    recurrent_or_capital character varying(128) NOT NULL,
    year character varying(128) NOT NULL,
    total numeric
);


--
-- Data for Name: recurrent_capital_expenditure; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.recurrent_capital_expenditure (geo_level, geo_code, geo_version, recurrent_or_capital, year, total) FROM stdin;
country	NG	2009	Capital	2015	557.00
country	NG	2009	Capital	2014	1119.62
country	NG	2009	Capital	2011	1146.75
country	NG	2009	Capital	2009	1280.71
country	NG	2009	Capital	2012	1339.99
country	NG	2009	Capital	2016	1587.40
country	NG	2009	Capital	2013	1621.48
country	NG	2009	Capital	2010	1764.69
country	NG	2009	Capital	2017	2174.50
country	NG	2009	Capital	2018	2869.60
country	NG	2009	Capital	2020	2783.00
country	NG	2009	Capital	2019	3184.00
country	NG	2009	Recurrent	2009	1824.71
country	NG	2009	Recurrent	2013	2386.03
country	NG	2009	Recurrent	2012	2425.05
country	NG	2009	Recurrent	2011	2425.07
country	NG	2009	Recurrent	2014	2454.89
country	NG	2009	Recurrent	2015	2607.13
country	NG	2009	Recurrent	2016	2646.39
country	NG	2009	Recurrent	2010	2669.01
country	NG	2009	Recurrent	2017	2990.92
country	NG	2009	Recurrent	2018	3516.48
country	NG	2009	Recurrent	2019	4386.00
country	NG	2009	Recurrent	2020	4843.00
\.


--
-- Name: recurrent_capital_expenditure pk_recurrent_capital_expenditure; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.recurrent_capital_expenditure
    ADD CONSTRAINT pk_recurrent_capital_expenditure PRIMARY KEY (geo_level, geo_code, geo_version, recurrent_or_capital, year);


--
-- PostgreSQL database dump complete
--
