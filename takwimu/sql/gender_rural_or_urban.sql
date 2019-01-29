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

ALTER TABLE IF EXISTS ONLY public.gender_rural_or_urban DROP CONSTRAINT IF EXISTS pk_gender_rural_or_urban;
DROP TABLE IF EXISTS public.gender_rural_or_urban;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: gender_rural_or_urban; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.gender_rural_or_urban (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    gender character varying(128) NOT NULL,
    rural_or_urban character varying(128) NOT NULL,
    total integer NOT NULL,
    geo_version character varying(100)
);


--
-- Data for Name: gender_rural_or_urban; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.gender_rural_or_urban (geo_level, geo_code, gender, rural_or_urban, total, geo_version) FROM stdin;
country	ET	male	rural	4477108	2009
level1	ET_1_001	male	rural	460146	2009
level1	ET_1_002	male	rural	181734	2009
level1	ET_1_003	male	rural	651737	2009
level1	ET_1_004	male	rural	367462	2009
level1	ET_1_005	male	rural	160216	2009
level1	ET_1_006	male	rural	272884	2009
level1	ET_1_007	male	rural	415508	2009
level1	ET_1_008	male	rural	256167	2009
level1	ET_1_009	male	rural	556592	2009
level1	ET_1_010	male	rural	256167	2009
level1	ET_1_011	male	rural	556592	2009
country	ET	female	rural	4547387	2009
level1	ET_1_001	female	rural	468896	2009
level1	ET_1_002	female	rural	179918	2009
level1	ET_1_003	female	rural	681706	2009
level1	ET_1_004	female	rural	388889	2009
level1	ET_1_005	female	rural	159516	2009
level1	ET_1_006	female	rural	289141	2009
level1	ET_1_007	female	rural	437455	2009
level1	ET_1_008	female	rural	268989	2009
level1	ET_1_009	female	rural	584948	2009
level1	ET_1_010	female	rural	437455	2009
level1	ET_1_011	female	rural	268989	2009
country	ET	male	urban	2711517	2009
level1	ET_1_001	male	urban	153226	2009
level1	ET_1_002	male	urban	769041	2009
level1	ET_1_003	male	urban	92617	2009
level1	ET_1_004	male	urban	87584	2009
level1	ET_1_005	male	urban	888999	2009
level1	ET_1_006	male	urban	56096	2009
level1	ET_1_007	male	urban	92718	2009
level1	ET_1_008	male	urban	76209	2009
level1	ET_1_009	male	urban	182404	2009
level1	ET_1_010	male	urban	76209	2009
level1	ET_1_011	male	urban	182404	2009
country	ET	female	urban	2747725	2009
level1	ET_1_001	female	urban	162821	2009
level1	ET_1_002	female	urban	789918	2009
level1	ET_1_003	female	urban	99063	2009
level1	ET_1_004	female	urban	94456	2009
level1	ET_1_005	female	urban	930176	2009
level1	ET_1_006	female	urban	59386	2009
level1	ET_1_007	female	urban	99274	2009
level1	ET_1_008	female	urban	80333	2009
level1	ET_1_009	female	urban	193144	2009
level1	ET_1_010	female	urban	99274	2009
level1	ET_1_011	female	urban	80333	2009
\.


--
-- Name: gender_rural_or_urban pk_gender_rural_or_urban; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.gender_rural_or_urban
    ADD CONSTRAINT pk_gender_rural_or_urban PRIMARY KEY (geo_level, geo_code, gender, rural_or_urban);


--
-- PostgreSQL database dump complete
--
