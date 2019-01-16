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

DROP INDEX IF EXISTS public.wazimap_geography_version_01953818_like;
DROP INDEX IF EXISTS public.wazimap_geography_name_36b79089_like;
DROP INDEX IF EXISTS public.wazimap_geography_long_name_9b8409f5_like;
DROP INDEX IF EXISTS public.wazimap_geography_b068931c;
DROP INDEX IF EXISTS public.wazimap_geography_2fc6351a;
DROP INDEX IF EXISTS public.wazimap_geography_2af72f10;
ALTER TABLE IF EXISTS ONLY public.wazimap_geography DROP CONSTRAINT IF EXISTS wazimap_geography_pkey;
ALTER TABLE IF EXISTS ONLY public.wazimap_geography DROP CONSTRAINT IF EXISTS wazimap_geography_geo_level_bbe3c9fc_uniq;
ALTER TABLE IF EXISTS public.wazimap_geography ALTER COLUMN id DROP DEFAULT;
DROP SEQUENCE IF EXISTS public.wazimap_geography_id_seq;
DROP TABLE IF EXISTS public.wazimap_geography;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: wazimap_geography; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.wazimap_geography (
    id integer NOT NULL,
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    name character varying(100) NOT NULL,
    square_kms double precision,
    parent_level character varying(15),
    parent_code character varying(10),
    long_name character varying(100),
    version character varying(100) NOT NULL
);


--
-- Name: wazimap_geography_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.wazimap_geography_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wazimap_geography_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.wazimap_geography_id_seq OWNED BY public.wazimap_geography.id;


--
-- Name: wazimap_geography id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wazimap_geography ALTER COLUMN id SET DEFAULT nextval('public.wazimap_geography_id_seq'::regclass);


--
-- Data for Name: wazimap_geography; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.wazimap_geography (id, geo_level, geo_code, name, square_kms, parent_level, parent_code, long_name, version) FROM stdin;
2	country	KE	Kenya	581309	\N	\N	\N	2009
3	county	1	Mombasa	212.5	country	KE	\N	2009
4	county	2	Kwale	8270.29999999999927	country	KE	\N	2009
5	county	3	Kilifi	12245.8999999999996	country	KE	\N	2009
6	county	4	Tana River	35375.8000000000029	country	KE	\N	2009
7	county	5	Lamu	6497.69999999999982	country	KE	\N	2009
8	county	6	Taita-Taveta	17083.9000000000015	country	KE	\N	2009
9	county	7	Garissa	45720.1999999999971	country	KE	\N	2009
10	county	8	Wajir	55840.5999999999985	country	KE	\N	2009
11	county	9	Mandera	25797.7000000000007	country	KE	\N	2009
12	county	10	Marsabit	66923.1000000000058	country	KE	\N	2009
13	county	11	Isiolo	25336.0999999999985	country	KE	\N	2009
14	county	12	Meru	6930.10000000000036	country	KE	\N	2009
15	county	13	Tharaka-Nithi	2409.5	country	KE	\N	2009
16	county	14	Embu	2555.90000000000009	country	KE	\N	2009
17	county	15	Kitui	24385.0999999999985	country	KE	\N	2009
18	county	16	Machakos	5952.89999999999964	country	KE	\N	2009
19	county	17	Makueni	8008.89999999999964	country	KE	\N	2009
20	county	18	Nyandarua	3107.69999999999982	country	KE	\N	2009
21	county	19	Nyeri	2361	country	KE	\N	2009
22	county	20	Kirinyaga	1205.40000000000009	country	KE	\N	2009
23	county	21	Murang'a	2325.80000000000018	country	KE	\N	2009
24	county	22	Kiambu	2449.19999999999982	country	KE	\N	2009
25	county	23	Turkana	71597.8000000000029	country	KE	\N	2009
26	county	24	West Pokot	8418.20000000000073	country	KE	\N	2009
27	county	25	Samburu	20182.5	country	KE	\N	2009
28	county	26	Trans-Nzoia	2469.90000000000009	country	KE	\N	2009
29	county	27	Uasin Gishu	2955.30000000000018	country	KE	\N	2009
30	county	28	Elgeyo-Marakwet	3049.69999999999982	country	KE	\N	2009
31	county	29	Nandi	2884.5	country	KE	\N	2009
32	county	30	Baringo	11075.2999999999993	country	KE	\N	2009
33	county	31	Laikipia	8696.10000000000036	country	KE	\N	2009
34	county	32	Nakuru	7509.5	country	KE	\N	2009
35	county	33	Narok	17921.2000000000007	country	KE	\N	2009
36	county	34	Kajiado	21292.7000000000007	country	KE	\N	2009
37	county	35	Kericho	2454.5	country	KE	\N	2009
38	county	36	Bomet	1997.90000000000009	country	KE	\N	2009
39	county	37	Kakamega	3033.80000000000018	country	KE	\N	2009
40	county	38	Vihiga	531.299999999999955	country	KE	\N	2009
41	county	39	Bungoma	2206.90000000000009	country	KE	\N	2009
42	county	40	Busia	1628.40000000000009	country	KE	\N	2009
43	county	41	Siaya	2496.09999999999991	country	KE	\N	2009
44	county	42	Kisumu	2009.5	country	KE	\N	2009
45	county	43	Homa Bay	3154.69999999999982	country	KE	\N	2009
46	county	44	Migori	2586.40000000000009	country	KE	\N	2009
47	county	45	Kisii	1317.90000000000009	country	KE	\N	2009
48	county	46	Nyamira	912.5	country	KE	\N	2009
49	county	47	Nairobi	694.899999999999977	country	KE	\N	2009
\.


--
-- Name: wazimap_geography_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.wazimap_geography_id_seq', 49, true);


--
-- Name: wazimap_geography wazimap_geography_geo_level_bbe3c9fc_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wazimap_geography
    ADD CONSTRAINT wazimap_geography_geo_level_bbe3c9fc_uniq UNIQUE (geo_level, geo_code, version);


--
-- Name: wazimap_geography wazimap_geography_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wazimap_geography
    ADD CONSTRAINT wazimap_geography_pkey PRIMARY KEY (id);


--
-- Name: wazimap_geography_2af72f10; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wazimap_geography_2af72f10 ON public.wazimap_geography USING btree (version);


--
-- Name: wazimap_geography_2fc6351a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wazimap_geography_2fc6351a ON public.wazimap_geography USING btree (long_name);


--
-- Name: wazimap_geography_b068931c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wazimap_geography_b068931c ON public.wazimap_geography USING btree (name);


--
-- Name: wazimap_geography_long_name_9b8409f5_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wazimap_geography_long_name_9b8409f5_like ON public.wazimap_geography USING btree (long_name varchar_pattern_ops);


--
-- Name: wazimap_geography_name_36b79089_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wazimap_geography_name_36b79089_like ON public.wazimap_geography USING btree (name varchar_pattern_ops);


--
-- Name: wazimap_geography_version_01953818_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wazimap_geography_version_01953818_like ON public.wazimap_geography USING btree (version varchar_pattern_ops);


--
-- PostgreSQL database dump complete
--

