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

ALTER TABLE IF EXISTS ONLY public.food_production DROP CONSTRAINT IF EXISTS pk_food_production;
DROP TABLE IF EXISTS public.food_production;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: food_production; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.food_production (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    crops character varying(128) NOT NULL,
    total integer
);


--
-- Data for Name: food_production; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.food_production (geo_level, geo_code, geo_version, crops, total) FROM stdin;
level1	SN_1_001	2009	Cassava	5189
level1	SN_1_001	2009	Cowpea	397
level1	SN_1_001	2009	Maize	799
level1	SN_1_001	2009	Peanut Oil Mill	935
level1	SN_1_001	2009	Sorghum	180
level1	SN_1_001	2009	Total Cereals	979
level1	SN_1_001	2009	Watermelon	1488
country	SN	2009	Cassava	439571
country	SN	2009	Cotton	20295
country	SN	2009	Cowpea	82875
country	SN	2009	Fonio	3228
country	SN	2009	Maize	304296
country	SN	2009	Millet	749874
country	SN	2009	Peanut Oil Mill	1050042
country	SN	2009	Rice	906348
country	SN	2009	Sesame	10376
country	SN	2009	Sorghum	188500
country	SN	2009	Total Cereals	2152245
country	SN	2009	Watermelon	270686
level1	SN_1_002	2009	Cassava	5831
level1	SN_1_002	2009	Cowpea	7301
level1	SN_1_002	2009	Maize	836
level1	SN_1_002	2009	Millet	103444
level1	SN_1_002	2009	Peanut Oil Mill	65442
level1	SN_1_002	2009	Sesame	305
level1	SN_1_002	2009	Sorghum	10666
level1	SN_1_002	2009	Total Cereals	114946
level1	SN_1_002	2009	Watermelon	16840
level1	SN_1_003	2009	Cassava	12277
level1	SN_1_003	2009	Cowpea	15389
level1	SN_1_003	2009	Maize	30361
level1	SN_1_003	2009	Millet	108840
level1	SN_1_003	2009	Peanut Oil Mill	127389
level1	SN_1_003	2009	Rice	15982
level1	SN_1_003	2009	Sesame	174
level1	SN_1_003	2009	Sorghum	11989
level1	SN_1_003	2009	Total Cereals	167171
level1	SN_1_003	2009	Watermelon	20188
level1	SN_1_004	2009	Cassava	4712
level1	SN_1_004	2009	Cowpea	313
level1	SN_1_004	2009	Maize	65294
level1	SN_1_004	2009	Millet	113926
level1	SN_1_004	2009	Peanut Oil Mill	198468
level1	SN_1_004	2009	Rice	478
level1	SN_1_004	2009	Sesame	4303
level1	SN_1_004	2009	Sorghum	51618
level1	SN_1_004	2009	Total Cereals	231316
level1	SN_1_004	2009	Watermelon	60126
level1	SN_1_005	2009	Cassava	56782
level1	SN_1_005	2009	Cowpea	1706
level1	SN_1_005	2009	Maize	37932
level1	SN_1_005	2009	Millet	133626
level1	SN_1_005	2009	Peanut Oil Mill	124901
level1	SN_1_005	2009	Rice	5525
level1	SN_1_005	2009	Sesame	211
level1	SN_1_005	2009	Sorghum	10491
level1	SN_1_005	2009	Total Cereals	187573
level1	SN_1_005	2009	Watermelon	68825
level1	SN_1_006	2009	Cowpea	5
level1	SN_1_006	2009	Fonio	839
level1	SN_1_006	2009	Maize	12678
level1	SN_1_006	2009	Peanut Oil Mill	3981
level1	SN_1_006	2009	Rice	18750
level1	SN_1_006	2009	Sorghum	4642
level1	SN_1_006	2009	Total Cereals	36908
level1	SN_1_007	2009	Cassava	7416
level1	SN_1_007	2009	Cowpea	731
level1	SN_1_007	2009	Fonio	72
level1	SN_1_007	2009	Maize	34807
level1	SN_1_007	2009	Millet	33662
level1	SN_1_007	2009	Peanut Oil Mill	86363
level1	SN_1_007	2009	Rice	162964
level1	SN_1_007	2009	Sesame	654
level1	SN_1_007	2009	Sorghum	25935
level1	SN_1_007	2009	Total Cereals	257440
level1	SN_1_007	2009	Watermelon	12013
level1	SN_1_008	2009	Cassava	23566
level1	SN_1_008	2009	Cowpea	43357
level1	SN_1_008	2009	Maize	3682
level1	SN_1_008	2009	Millet	44524
level1	SN_1_008	2009	Peanut Oil Mill	139842
level1	SN_1_008	2009	Rice	705
level1	SN_1_008	2009	Sorghum	2227
level1	SN_1_008	2009	Total Cereals	51138
level1	SN_1_008	2009	Watermelon	41840
level1	SN_1_009	2009	Cowpea	244
level1	SN_1_009	2009	Maize	810
level1	SN_1_009	2009	Millet	31230
level1	SN_1_009	2009	Peanut Oil Mill	781
level1	SN_1_009	2009	Rice	42896
level1	SN_1_009	2009	Sorghum	3844
level1	SN_1_009	2009	Total Cereals	78780
level1	SN_1_009	2009	Watermelon	2179
level1	SN_1_010	2009	Cassava	3859
level1	SN_1_010	2009	Cowpea	3177
level1	SN_1_010	2009	Maize	5018
level1	SN_1_010	2009	Millet	2129
level1	SN_1_010	2009	Peanut Oil Mill	5714
level1	SN_1_010	2009	Rice	399224
level1	SN_1_010	2009	Sorghum	880
level1	SN_1_010	2009	Total Cereals	407251
level1	SN_1_010	2009	Watermelon	18514
level1	SN_1_011	2009	Cassava	7975
level1	SN_1_011	2009	Cowpea	660
level1	SN_1_011	2009	Fonio	2317
level1	SN_1_011	2009	Maize	71005
level1	SN_1_011	2009	Millet	33877
level1	SN_1_011	2009	Peanut Oil Mill	72288
level1	SN_1_011	2009	Rice	174264
level1	SN_1_011	2009	Sesame	1448
level1	SN_1_011	2009	Sorghum	16354
level1	SN_1_011	2009	Total Cereals	297816
level1	SN_1_011	2009	Watermelon	6034
level1	SN_1_012	2009	Cassava	3540
level1	SN_1_012	2009	Cowpea	660
level1	SN_1_012	2009	Maize	37094
level1	SN_1_012	2009	Millet	57960
level1	SN_1_012	2009	Peanut Oil Mill	91500
level1	SN_1_012	2009	Rice	6843
level1	SN_1_012	2009	Sesame	2803
level1	SN_1_012	2009	Sorghum	34729
level1	SN_1_012	2009	Total Cereals	136626
level1	SN_1_012	2009	Watermelon	4609
level1	SN_1_013	2009	Cassava	305969
level1	SN_1_013	2009	Cowpea	7680
level1	SN_1_013	2009	Maize	1375
level1	SN_1_013	2009	Millet	80672
level1	SN_1_013	2009	Peanut Oil Mill	100641
level1	SN_1_013	2009	Sorghum	14514
level1	SN_1_013	2009	Total Cereals	96561
level1	SN_1_013	2009	Watermelon	9388
level1	SN_1_014	2009	Cassava	2455
level1	SN_1_014	2009	Cowpea	1254
level1	SN_1_014	2009	Maize	2607
level1	SN_1_014	2009	Millet	5983
level1	SN_1_014	2009	Peanut Oil Mill	31797
level1	SN_1_014	2009	Rice	78718
level1	SN_1_014	2009	Sesame	479
level1	SN_1_014	2009	Sorghum	430
level1	SN_1_014	2009	Total Cereals	87739
level1	SN_1_014	2009	Watermelon	8644
\.


--
-- Name: food_production pk_food_production; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.food_production
    ADD CONSTRAINT pk_food_production PRIMARY KEY (geo_level, geo_code, geo_version, crops);


--
-- PostgreSQL database dump complete
--

