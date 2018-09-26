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
1	continent	AFR	Africa	\N	\N	\N	Africa	2009
2	country	NG	Nigeria	923768	continent	AFR	Nigeria	2009
3	country	SN	Senegal	196712	continent	AFR	Senegal	2009
4	country	TZ	Tanzania	945087	continent	AFR	Tanzania	2009
5	level1	NG_1_006	Bayelsa	10773	country	NG	Bayelsa	2009
6	level1	NG_1_007	Benue	34059	country	NG	Benue	2009
7	level1	NG_1_008	Borno	70898	country	NG	Borno	2009
8	level1	NG_1_009	Cross River	20156	country	NG	Cross River	2009
9	level1	NG_1_010	Delta	17698	country	NG	Delta	2009
10	level1	NG_1_011	Ebonyi	5670	country	NG	Ebonyi	2009
11	level1	NG_1_012	Edo	17802	country	NG	Edo	2009
12	level1	NG_1_013	Ekiti	6353	country	NG	Ekiti	2009
13	level1	NG_1_014	Enugu	7161	country	NG	Enugu	2009
14	level1	NG_1_015	Federal Capital Territory	7315	country	NG	Federal Capital Territory	2009
15	level1	NG_1_016	Gombe	18768	country	NG	Gombe	2009
16	level1	NG_1_017	Imo	5530	country	NG	Imo	2009
17	level1	NG_1_018	Jigawa	23154	country	NG	Jigawa	2009
18	level1	NG_1_019	Kaduna	46053	country	NG	Kaduna	2009
19	level1	NG_1_020	Kano	20131	country	NG	Kano	2009
20	level1	NG_1_021	Katsina	24192	country	NG	Katsina	2009
21	level1	NG_1_022	Kebbi	36800	country	NG	Kebbi	2009
22	level1	NG_1_023	Kogi	29833	country	NG	Kogi	2009
23	level1	NG_1_024	Kwara	36825	country	NG	Kwara	2009
24	level1	NG_1_025	Lagos	3345	country	NG	Lagos	2009
25	level1	NG_1_026	Nasarawa	27117	country	NG	Nasarawa	2009
26	level1	NG_1_027	Niger	76363	country	NG	Niger	2009
27	level1	NG_1_028	Ogun	16762	country	NG	Ogun	2009
28	level1	NG_1_029	Ondo	15500	country	NG	Ondo	2009
29	level1	NG_1_030	Osun	9251	country	NG	Osun	2009
30	level1	NG_1_031	Oyo	28454	country	NG	Oyo	2009
31	level1	NG_1_032	Plateau	30913	country	NG	Plateau	2009
32	level1	NG_1_033	Rivers	11077	country	NG	Rivers	2009
33	level1	NG_1_034	Sokoto	25973	country	NG	Sokoto	2009
34	level1	NG_1_035	Taraba	54473	country	NG	Taraba	2009
35	level1	NG_1_036	Yobe	45502	country	NG	Yobe	2009
36	level1	NG_1_037	Zamfara	39762	country	NG	Zamfara	2009
37	level1	SN_1_001	Dakar	547	country	SN	Dakar	2009
38	level1	SN_1_002	Diourbel	4824	country	SN	Diourbel	2009
39	level1	SN_1_003	Fatick	6849	country	SN	Fatick	2009
40	level1	SN_1_004	Kaffrine	11262	country	SN	Kaffrine	2009
41	level1	SN_1_005	Kaolack	5357	country	SN	Kaolack	2009
42	level1	SN_1_006	Kedougou	16800	country	SN	Kedougou	2009
43	level1	SN_1_007	Kolda	13771	country	SN	Kolda	2009
44	level1	SN_1_008	Louga	24889	country	SN	Louga	2009
45	level1	SN_1_009	Matam	29445	country	SN	Matam	2009
46	level1	SN_1_010	Saint Louis	19241	country	SN	Saint Louis	2009
47	level1	SN_1_011	Sedhiou	7341	country	SN	Sedhiou	2009
48	level1	SN_1_012	Tambacounda	42364	country	SN	Tambacounda	2009
49	level1	SN_1_013	Thies	6670	country	SN	Thies	2009
50	level1	SN_1_014	Ziguinchor	7352	country	SN	Ziguinchor	2009
51	level1	TZ_1_022	Pwani	32407	country	TZ	Pwani	2009
52	level1	TZ_1_026	Simiyu	2380	country	TZ	Simiyu	2009
53	level1	TZ_1_004	Geita	20054	country	TZ	Geita	2009
54	level1	TZ_1_027	Singida	49437	country	TZ	Singida	2009
55	level1	TZ_1_005	Iringa	58936	country	TZ	Iringa	2009
56	level1	TZ_1_023	Rukwa	75240	country	TZ	Rukwa	2009
57	level1	TZ_1_006	Kagera	39627	country	TZ	Kagera	2009
58	level1	TZ_1_010	Kigoma	45066	country	TZ	Kigoma	2009
59	level1	TZ_1_014	Lindi	67000	country	TZ	Lindi	2009
60	level1	TZ_1_002	Dar es salaam	1393	country	TZ	Dar es salaam	2009
61	level1	TZ_1_003	Dodoma	41311	country	TZ	Dodoma	2009
62	level1	TZ_1_028	Tanga	27348	country	TZ	Tanga	2009
63	level1	TZ_1_019	Mtwara	16707	country	TZ	Mtwara	2009
64	level1	TZ_1_021	Njombe	21347	country	TZ	Njombe	2009
65	level1	TZ_1_029	Tabora	76151	country	TZ	Tabora	2009
66	level1	TZ_1_011	Kilimanjaro	13209	country	TZ	Kilimanjaro	2009
67	level1	TZ_1_025	Shinyanga	40781	country	TZ	Shinyanga	2009
68	level1	TZ_1_016	Mara	31150	country	TZ	Mara	2009
69	level1	TZ_1_024	Ruvuma	66477	country	TZ	Ruvuma	2009
70	level1	TZ_1_020	Mwanza	35187	country	TZ	Mwanza	2009
71	level1	TZ_1_017	Mbeya	62420	country	TZ	Mbeya	2009
72	level1	TZ_1_001	Arusha	34516	country	TZ	Arusha	2009
73	level1	TZ_1_018	Morogoro	73139	country	TZ	Morogoro	2009
74	level1	TZ_1_009	Katavi	45843	country	TZ	Katavi	2009
75	level1	TZ_1_015	Manyara	47913	country	TZ	Manyara	2009
76	level1	TZ_1_012	Kusini Pemba	332	country	TZ	Kusini Pemba	2009
77	level1	TZ_1_008	Kaskazini Unguja	470	country	TZ	Kaskazini Unguja	2009
78	level1	TZ_1_013	Kusini Unguja	854	country	TZ	Kusini Unguja	2009
79	level1	TZ_1_030	Mjini Magharibi	230	country	TZ	Mjini Magharibi	2009
80	level1	TZ_1_007	Kaskazini Pemba	574	country	TZ	Kaskazini Pemba	2009
81	level1	NG_1_001	Abia	6320	country	NG	Abia	2009
82	level1	NG_1_002	Adamawa	36917	country	NG	Adamawa	2009
83	level1	NG_1_003	Akwa Ibom	7081	country	NG	Akwa Ibom	2009
84	level1	NG_1_004	Anambra	4844	country	NG	Anambra	2009
85	level1	NG_1_005	Bauchi	45837	country	NG	Bauchi	2009
86	level1	KE_1_020	Kirinyaga	1205.40000000000009	country	KE	Kirinyaga	2009
87	level1	KE_1_021	Muranga	2325.80000000000018	country	KE	Muranga	2009
88	level1	KE_1_018	Nyandarua	3107.69999999999982	country	KE	Nyandarua	2009
89	level1	KE_1_019	Nyeri	2361	country	KE	Nyeri	2009
90	level1	KE_1_024	West-Pokot	8418.20000000000073	country	KE	West-Pokot	2009
91	level1	KE_1_025	Samburu	20182.5	country	KE	Samburu	2009
92	level1	KE_1_022	Kiambu	2449.19999999999982	country	KE	Kiambu	2009
93	level1	KE_1_023	Turkana	71597.8000000000029	country	KE	Turkana	2009
94	level1	KE_1_028	Elgeyo-Marakwet	3049.69999999999982	country	KE	Elgeyo-Marakwet	2009
95	level1	KE_1_029	Nandi	2884.5	country	KE	Nandi	2009
96	level1	KE_1_026	Trans-Nzoia	2469.90000000000009	country	KE	Trans-Nzoia	2009
97	level1	KE_1_027	Uasin-Gishu	2955.30000000000018	country	KE	Uasin-Gishu	2009
98	level1	KE_1_032	Nakuru	7509.5	country	KE	Nakuru	2009
99	level1	KE_1_033	Narok	17921.2000000000007	country	KE	Narok	2009
100	level1	KE_1_030	Baringo	11075.2999999999993	country	KE	Baringo	2009
101	level1	KE_1_031	Laikipia	8696.10000000000036	country	KE	Laikipia	2009
102	level1	KE_1_036	Bomet	1997.90000000000009	country	KE	Bomet	2009
103	level1	KE_1_037	Kakamega	3033.80000000000018	country	KE	Kakamega	2009
104	level1	KE_1_034	Kajiado	21292.7000000000007	country	KE	Kajiado	2009
105	level1	KE_1_035	Kericho	2454.5	country	KE	Kericho	2009
106	level1	KE_1_040	Busia	1628.40000000000009	country	KE	Busia	2009
107	level1	KE_1_041	Siaya	2496.09999999999991	country	KE	Siaya	2009
108	level1	KE_1_038	Vihiga	531.299999999999955	country	KE	Vihiga	2009
109	level1	KE_1_039	Bungoma	2206.90000000000009	country	KE	Bungoma	2009
110	level1	KE_1_044	Migori	2586.40000000000009	country	KE	Migori	2009
111	level1	KE_1_045	Kisii	1317.90000000000009	country	KE	Kisii	2009
112	level1	KE_1_042	Kisumu	2009	country	KE	Kisumu	2009
113	level1	KE_1_043	Homa-Bay	3154.69999999999982	country	KE	Homa-Bay	2009
114	level1	KE_1_046	Nyamira	912.5	country	KE	Nyamira	2009
115	level1	KE_1_047	Nairobi	694.899999999999977	country	KE	Nairobi	2009
116	country	KE	Kenya	581309	continent	AFR	Kenya	2009
117	level1	KE_1_001	Mombasa	212.5	country	KE	Mombasa	2009
118	level1	KE_1_004	Tana-River	35375.8000000000029	country	KE	Tana-River	2009
119	level1	KE_1_005	Lamu	6497.69999999999982	country	KE	Lamu	2009
120	level1	KE_1_002	Kwale	8270.29999999999927	country	KE	Kwale	2009
121	level1	KE_1_003	Kilifi	12245.8999999999996	country	KE	Kilifi	2009
122	level1	KE_1_008	Wajir	55840.5999999999985	country	KE	Wajir	2009
123	level1	KE_1_009	Mandera	25797.7000000000007	country	KE	Mandera	2009
124	level1	KE_1_006	Taita-Taveta	17083.9000000000015	country	KE	Taita-Taveta	2009
125	level1	KE_1_007	Garissa	45720.1999999999971	country	KE	Garissa	2009
126	level1	KE_1_012	Meru	6930.10000000000036	country	KE	Meru	2009
127	level1	KE_1_013	Tharaka-Nithi	2409.5	country	KE	Tharaka-Nithi	2009
128	level1	KE_1_010	Marsabit	66923.1000000000058	country	KE	Marsabit	2009
129	level1	KE_1_011	Isiolo	25336.0999999999985	country	KE	Isiolo	2009
130	level1	KE_1_016	Machakos	5952.89999999999964	country	KE	Machakos	2009
131	level1	KE_1_017	Makueni	8008.89999999999964	country	KE	Makueni	2009
132	level1	KE_1_014	Embu	2555.90000000000009	country	KE	Embu	2009
133	level1	KE_1_015  Kitui	24385.0999999999985	country	KE	Kitui	2009
134 country ET  Ethiopia 1104000 continent AFR Ethiopia 2009
135 level1  ET_1_001  Addis-Ababa 526.99 country ET Addis-Ababa  2009
136 level1  ET_1_002  Afar 72052.78 country ET Afar  2009
137 level1  ET_1_003  Amhara 154708.96 country ET Amhara  2009
138 level1  ET_1_004  Beneshangul-Gumuz 50698.68 level1 ET Beneshangul-Gumuz  2009
139 level1  ET_1_005  Dire-Dawa 1558.61 country ET Dire-Dawa  2009
140 level1  ET_1_006  Gambella 29782.82 country ET Gambella  2009
141 level1  ET_1_007  Harar 333.94 country ET Harar  2009
142 level1  ET_1_008  Oromiya 284537.84 country ET Oromiya  2009
143 level1  ET_1_009  SNNPR 105476 country ET SNNPR  2009
144 level1  ET_1_010  Somali 279252 country ET Somali  2009
145 level1  ET_1_011  Tigray 84722 country ET Tigray  2009
\.


--
-- Name: wazimap_geography_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.wazimap_geography_id_seq', 133, true);


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

