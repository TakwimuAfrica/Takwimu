--
-- PostgreSQL database dump
--

-- Dumped from database version 10.0
-- Dumped by pg_dump version 10.4

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
1	continent	AFR	Africa	\N	\N	\N	\N	2009
2	country	NG	Nigeria	\N	continent	AFR	\N	2009
3	country	SN	Senegal	\N	continent	AFR	\N	2009
4	country	TZ	Tanzania	\N	continent	AFR	\N	2009
5	level1	NG_1_006	Bayelsa	\N	country	NG	Bayelsa	2009
6	level1	NG_1_007	Benue	\N	country	NG	Benue	2009
7	level1	NG_1_008	Borno	\N	country	NG	Borno	2009
8	level1	NG_1_009	Cross River	\N	country	NG	Cross River	2009
9	level1	NG_1_010	Delta	\N	country	NG	Delta	2009
10	level1	NG_1_011	Ebonyi	\N	country	NG	Ebonyi	2009
11	level1	NG_1_012	Edo	\N	country	NG	Edo	2009
12	level1	NG_1_013	Ekiti	\N	country	NG	Ekiti	2009
13	level1	NG_1_014	Enugu	\N	country	NG	Enugu	2009
14	level1	NG_1_015	Federal Capital Territory	\N	country	NG	Federal Capital Territory	2009
15	level1	NG_1_016	Gombe	\N	country	NG	Gombe	2009
16	level1	NG_1_017	Imo	\N	country	NG	Imo	2009
17	level1	NG_1_018	Jigawa	\N	country	NG	Jigawa	2009
18	level1	NG_1_019	Kaduna	\N	country	NG	Kaduna	2009
19	level1	NG_1_020	Kano	\N	country	NG	Kano	2009
20	level1	NG_1_021	Katsina	\N	country	NG	Katsina	2009
21	level1	NG_1_022	Kebbi	\N	country	NG	Kebbi	2009
22	level1	NG_1_023	Kogi	\N	country	NG	Kogi	2009
23	level1	NG_1_024	Kwara	\N	country	NG	Kwara	2009
24	level1	NG_1_025	Lagos	\N	country	NG	Lagos	2009
25	level1	NG_1_026	Nasarawa	\N	country	NG	Nasarawa	2009
26	level1	NG_1_027	Niger	\N	country	NG	Niger	2009
27	level1	NG_1_028	Ogun	\N	country	NG	Ogun	2009
28	level1	NG_1_029	Ondo	\N	country	NG	Ondo	2009
29	level1	NG_1_030	Osun	\N	country	NG	Osun	2009
30	level1	NG_1_031	Oyo	\N	country	NG	Oyo	2009
31	level1	NG_1_032	Plateau	\N	country	NG	Plateau	2009
32	level1	NG_1_033	Rivers	\N	country	NG	Rivers	2009
33	level1	NG_1_034	Sokoto	\N	country	NG	Sokoto	2009
34	level1	NG_1_035	Taraba	\N	country	NG	Taraba	2009
35	level1	NG_1_036	Yobe	\N	country	NG	Yobe	2009
36	level1	NG_1_037	Zamfara	\N	country	NG	Zamfara	2009
37	level1	SN_1_001	Dakar	\N	country	SN	Dakar	2009
38	level1	SN_1_002	Diourbel	\N	country	SN	Diourbel	2009
39	level1	SN_1_003	Fatick	\N	country	SN	Fatick	2009
40	level1	SN_1_004	Kaffrine	\N	country	SN	Kaffrine	2009
41	level1	SN_1_005	Kaolack	\N	country	SN	Kaolack	2009
42	level1	SN_1_006	Kedougou	\N	country	SN	Kedougou	2009
43	level1	SN_1_007	Kolda	\N	country	SN	Kolda	2009
44	level1	SN_1_008	Louga	\N	country	SN	Louga	2009
45	level1	SN_1_009	Matam	\N	country	SN	Matam	2009
46	level1	SN_1_010	Saint Louis	\N	country	SN	Saint Louis	2009
47	level1	SN_1_011	Sedhiou	\N	country	SN	Sedhiou	2009
48	level1	SN_1_012	Tambacounda	\N	country	SN	Tambacounda	2009
49	level1	SN_1_013	Thies	\N	country	SN	Thies	2009
50	level1	SN_1_014	Ziguinchor	\N	country	SN	Ziguinchor	2009
51	level1	TZ_1_022	Pwani	\N	country	TZ	Pwani	2009
52	level1	TZ_1_026	Simiyu	\N	country	TZ	Simiyu	2009
53	level1	TZ_1_004	Geita	\N	country	TZ	Geita	2009
54	level1	TZ_1_027	Singida	\N	country	TZ	Singida	2009
55	level1	TZ_1_005	Iringa	\N	country	TZ	Iringa	2009
56	level1	TZ_1_023	Rukwa	\N	country	TZ	Rukwa	2009
57	level1	TZ_1_006	Kagera	\N	country	TZ	Kagera	2009
58	level1	TZ_1_010	Kigoma	\N	country	TZ	Kigoma	2009
59	level1	TZ_1_014	Lindi	\N	country	TZ	Lindi	2009
60	level1	TZ_1_002	Dar es salaam	\N	country	TZ	Dar es salaam	2009
61	level1	TZ_1_003	Dodoma	\N	country	TZ	Dodoma	2009
62	level1	TZ_1_028	Tanga	\N	country	TZ	Tanga	2009
63	level1	TZ_1_019	Mtwara	\N	country	TZ	Mtwara	2009
64	level1	TZ_1_021	Njombe	\N	country	TZ	Njombe	2009
65	level1	TZ_1_029	Tabora	\N	country	TZ	Tabora	2009
66	level1	TZ_1_011	Kilimanjaro	\N	country	TZ	Kilimanjaro	2009
67	level1	TZ_1_025	Shinyanga	\N	country	TZ	Shinyanga	2009
68	level1	TZ_1_016	Mara	\N	country	TZ	Mara	2009
69	level1	TZ_1_024	Ruvuma	\N	country	TZ	Ruvuma	2009
70	level1	TZ_1_020	Mwanza	\N	country	TZ	Mwanza	2009
71	level1	TZ_1_017	Mbeya	\N	country	TZ	Mbeya	2009
72	level1	TZ_1_001	Arusha	\N	country	TZ	Arusha	2009
73	level1	TZ_1_018	Morogoro	\N	country	TZ	Morogoro	2009
74	level1	TZ_1_009	Katavi	\N	country	TZ	Katavi	2009
75	level1	TZ_1_015	Manyara	\N	country	TZ	Manyara	2009
76	level1	TZ_1_012	Kusini Pemba	\N	country	TZ	Kusini Pemba	2009
77	level1	TZ_1_008	Kaskazini Unguja	\N	country	TZ	Kaskazini Unguja	2009
78	level1	TZ_1_013	Kusini Unguja	\N	country	TZ	Kusini Unguja	2009
79	level1	TZ_1_030	Mjini Magharibi	\N	country	TZ	Mjini Magharibi	2009
80	level1	TZ_1_007	Kaskazini Pemba	\N	country	TZ	Kaskazini Pemba	2009
81	level1	NG_1_001	Abia	\N	country	NG	Abia	2009
82	level1	NG_1_002	Adamawa	\N	country	NG	Adamawa	2009
83	level1	NG_1_003	Akwa Ibom	\N	country	NG	Akwa Ibom	2009
84	level1	NG_1_004	Anambra	\N	country	NG	Anambra	2009
85	level1	NG_1_005	Bauchi	\N	country	NG	Bauchi	2009
\.


--
-- Name: wazimap_geography_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.wazimap_geography_id_seq', 1, false);


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

