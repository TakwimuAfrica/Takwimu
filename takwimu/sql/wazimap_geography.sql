--
-- PostgreSQL database dump
--

-- Dumped from database version 10.0
-- Dumped by pg_dump version 10.4

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
-- Name: wazimap_geography; Type: TABLE; Schema: public; Owner: ahereza
--

CREATE TABLE public.wazimap_geography (
    id integer NOT NULL,
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    name character varying(100) NOT NULL,
    version character varying(100) NOT NULL,
    square_kms double precision,
    parent_level character varying(20),
    parent_code character varying(20),
    long_name character varying(100)
);


ALTER TABLE public.wazimap_geography OWNER TO ahereza;

--
-- Data for Name: wazimap_geography; Type: TABLE DATA; Schema: public; Owner: ahereza
--

COPY public.wazimap_geography (id, geo_level, geo_code, name, version, square_kms, parent_level, parent_code, long_name) FROM stdin;
0	level1	NG_1_001	Abia	2009	\N	country	NG	Abia
1	level1	NG_1_002	Adamawa	2009	\N	country	NG	Adamawa
2	level1	NG_1_003	Akwa Ibom	2009	\N	country	NG	Akwa Ibom
3	level1	NG_1_004	Anambra	2009	\N	country	NG	Anambra
4	level1	NG_1_005	Bauchi	2009	\N	country	NG	Bauchi
5	level1	NG_1_006	Bayelsa	2009	\N	country	NG	Bayelsa
6	level1	NG_1_007	Benue	2009	\N	country	NG	Benue
7	level1	NG_1_008	Borno	2009	\N	country	NG	Borno
8	level1	NG_1_009	Cross River	2009	\N	country	NG	Cross River
9	level1	NG_1_010	Delta	2009	\N	country	NG	Delta
10	level1	NG_1_011	Ebonyi	2009	\N	country	NG	Ebonyi
11	level1	NG_1_012	Edo	2009	\N	country	NG	Edo
12	level1	NG_1_013	Ekiti	2009	\N	country	NG	Ekiti
13	level1	NG_1_014	Enugu	2009	\N	country	NG	Enugu
14	level1	NG_1_015	Federal Capital Territory	2009	\N	country	NG	Federal Capital Territory
15	level1	NG_1_016	Gombe	2009	\N	country	NG	Gombe
16	level1	NG_1_017	Imo	2009	\N	country	NG	Imo
17	level1	NG_1_018	Jigawa	2009	\N	country	NG	Jigawa
18	level1	NG_1_019	Kaduna	2009	\N	country	NG	Kaduna
19	level1	NG_1_020	Kano	2009	\N	country	NG	Kano
20	level1	NG_1_021	Katsina	2009	\N	country	NG	Katsina
21	level1	NG_1_022	Kebbi	2009	\N	country	NG	Kebbi
22	level1	NG_1_023	Kogi	2009	\N	country	NG	Kogi
23	level1	NG_1_024	Kwara	2009	\N	country	NG	Kwara
24	level1	NG_1_025	Lagos	2009	\N	country	NG	Lagos
25	level1	NG_1_026	Nasarawa	2009	\N	country	NG	Nasarawa
26	level1	NG_1_027	Niger	2009	\N	country	NG	Niger
27	level1	NG_1_028	Ogun	2009	\N	country	NG	Ogun
28	level1	NG_1_029	Ondo	2009	\N	country	NG	Ondo
29	level1	NG_1_030	Osun	2009	\N	country	NG	Osun
30	level1	NG_1_031	Oyo	2009	\N	country	NG	Oyo
31	level1	NG_1_032	Plateau	2009	\N	country	NG	Plateau
32	level1	NG_1_033	Rivers	2009	\N	country	NG	Rivers
33	level1	NG_1_034	Sokoto	2009	\N	country	NG	Sokoto
34	level1	NG_1_035	Taraba	2009	\N	country	NG	Taraba
35	level1	NG_1_036	Yobe	2009	\N	country	NG	Yobe
36	level1	NG_1_037	Zamfara	2009	\N	country	NG	Zamfara
37	level1	SN_1_001	Dakar	2009	\N	country	SN	Dakar
38	level1	SN_1_002	Diourbel	2009	\N	country	SN	Diourbel
39	level1	SN_1_003	Fatick	2009	\N	country	SN	Fatick
40	level1	SN_1_004	Kaffrine	2009	\N	country	SN	Kaffrine
41	level1	SN_1_005	Kaolack	2009	\N	country	SN	Kaolack
42	level1	SN_1_006	Kedougou	2009	\N	country	SN	Kedougou
43	level1	SN_1_007	Kolda	2009	\N	country	SN	Kolda
44	level1	SN_1_008	Louga	2009	\N	country	SN	Louga
45	level1	SN_1_009	Matam	2009	\N	country	SN	Matam
46	level1	SN_1_010	Saint Louis	2009	\N	country	SN	Saint Louis
47	level1	SN_1_011	Sedhiou	2009	\N	country	SN	Sedhiou
48	level1	SN_1_012	Tambacounda	2009	\N	country	SN	Tambacounda
49	level1	SN_1_013	Thies	2009	\N	country	SN	Thies
50	level1	SN_1_014	Ziguinchor	2009	\N	country	SN	Ziguinchor
51	level1	TZ_1_022	Pwani	2009	\N	country	TZ	Pwani
52	level1	TZ_1_026	Simiyu	2009	\N	country	TZ	Simiyu
53	level1	TZ_1_004	Geita	2009	\N	country	TZ	Geita
54	level1	TZ_1_027	Singida	2009	\N	country	TZ	Singida
55	level1	TZ_1_005	Iringa	2009	\N	country	TZ	Iringa
56	level1	TZ_1_023	Rukwa	2009	\N	country	TZ	Rukwa
57	level1	TZ_1_006	Kagera	2009	\N	country	TZ	Kagera
58	level1	TZ_1_010	Kigoma	2009	\N	country	TZ	Kigoma
59	level1	TZ_1_014	Lindi	2009	\N	country	TZ	Lindi
60	level1	TZ_1_002	Dar es salaam	2009	\N	country	TZ	Dar es salaam
61	level1	TZ_1_003	Dodoma	2009	\N	country	TZ	Dodoma
62	level1	TZ_1_028	Tanga	2009	\N	country	TZ	Tanga
63	level1	TZ_1_019	Mtwara	2009	\N	country	TZ	Mtwara
64	level1	TZ_1_21	Njombe	2009	\N	country	TZ	Njombe
65	level1	TZ_1_029	Tabora	2009	\N	country	TZ	Tabora
66	level1	TZ_1_011	Kilimanjaro	2009	\N	country	TZ	Kilimanjaro
67	level1	TZ_1_025	Shinyanga	2009	\N	country	TZ	Shinyanga
68	level1	TZ_1_016	Mara	2009	\N	country	TZ	Mara
69	level1	TZ_1_024	Ruvuma	2009	\N	country	TZ	Ruvuma
70	level1	TZ_1_020	Mwanza	2009	\N	country	TZ	Mwanza
71	level1	TZ_1_017	Mbeya	2009	\N	country	TZ	Mbeya
72	level1	TZ_1_001	Arusha	2009	\N	country	TZ	Arusha
73	level1	TZ_1_018	Morogoro	2009	\N	country	TZ	Morogoro
74	level1	TZ_1_009	Katavi	2009	\N	country	TZ	Katavi
75	level1	TZ_1_015	Manyara	2009	\N	country	TZ	Manyara
76	level1	TZ_1_012	Kusini Pemba	2009	\N	country	TZ	Kusini Pemba
77	level1	TZ_1_008	Kaskazini Unguja	2009	\N	country	TZ	Kaskazini Unguja
78	level1	TZ_1_013	Kusini Unguja	2009	\N	country	TZ	Kusini Unguja
79	level1	TZ_1_030	Mjini Magharibi	2009	\N	country	TZ	Mjini Magharibi
80	level1	TZ_1_007	Kaskazini Pemba	2009	\N	country	TZ	Kaskazini Pemba
81	country	TZ	Tanzania	2009	\N	continent	AFR	Tanzania
82	country	NG	Nigeria	2009	\N	continent	AFR	Nigeria
83	country	SN	Senegal	2009	\N	continent	AFR	Senegal
84	continent	AFR	Africa	2009	\N	\N	\N	Africa
\.


--
-- PostgreSQL database dump complete
--

