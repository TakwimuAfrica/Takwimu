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

ALTER TABLE IF EXISTS ONLY public.outpatient_diagnosis_under_five DROP CONSTRAINT IF EXISTS pk_outpatient_diagnosis_under_five;
DROP TABLE IF EXISTS public.outpatient_diagnosis_under_five;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: outpatient_diagnosis_under_five; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.outpatient_diagnosis_under_five (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    outpatient_diagnosis_under_five character varying(128) NOT NULL,
    total integer
);


--
-- Data for Name: outpatient_diagnosis_under_five; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.outpatient_diagnosis_under_five (geo_level, geo_code, geo_version, outpatient_diagnosis_under_five, total) FROM stdin;
level1	TZ_1_001	2009	diarrhoea	44781
level1	TZ_1_001	2009	intestinal worms	14821
level1	TZ_1_001	2009	malaria	18895
level1	TZ_1_001	2009	pneumonia	80685
level1	TZ_1_001	2009	skin infections	31260
level1	TZ_1_001	2009	upper respiratory disorders	66511
level1	TZ_1_001	2009	UTI	25098
level1	TZ_1_003	2009	diarrhoea	108411
level1	TZ_1_003	2009	intestinal worms	64692
level1	TZ_1_003	2009	malaria	276762
level1	TZ_1_003	2009	pneumonia	106899
level1	TZ_1_003	2009	skin infections	145834
level1	TZ_1_003	2009	upper respiratory disorders	137757
level1	TZ_1_003	2009	UTI	161374
level1	TZ_1_002	2009	diarrhoea	73926
level1	TZ_1_002	2009	intestinal worms	17201
level1	TZ_1_002	2009	malaria	111535
level1	TZ_1_002	2009	pneumonia	47207
level1	TZ_1_002	2009	skin infections	34253
level1	TZ_1_002	2009	upper respiratory disorders	43846
level1	TZ_1_002	2009	UTI	29084
level1	TZ_1_004	2009	diarrhoea	31065
level1	TZ_1_004	2009	intestinal worms	17547
level1	TZ_1_004	2009	malaria	150911
level1	TZ_1_004	2009	pneumonia	21016
level1	TZ_1_004	2009	skin infections	16325
level1	TZ_1_004	2009	upper respiratory disorders	17554
level1	TZ_1_004	2009	UTI	25509
level1	TZ_1_005	2009	diarrhoea	20846
level1	TZ_1_005	2009	intestinal worms	7622
level1	TZ_1_005	2009	malaria	29543
level1	TZ_1_005	2009	pneumonia	19898
level1	TZ_1_005	2009	skin infections	19403
level1	TZ_1_005	2009	upper respiratory disorders	14569
level1	TZ_1_005	2009	UTI	7798
level1	TZ_1_006	2009	diarrhoea	44398
level1	TZ_1_006	2009	intestinal worms	28579
level1	TZ_1_006	2009	malaria	279216
level1	TZ_1_006	2009	pneumonia	44583
level1	TZ_1_006	2009	skin infections	16727
level1	TZ_1_006	2009	upper respiratory disorders	38173
level1	TZ_1_006	2009	UTI	30569
level1	TZ_1_009	2009	diarrhoea	11429
level1	TZ_1_009	2009	intestinal worms	6545
level1	TZ_1_009	2009	malaria	36880
level1	TZ_1_009	2009	pneumonia	5838
level1	TZ_1_009	2009	skin infections	6016
level1	TZ_1_009	2009	upper respiratory disorders	7147
level1	TZ_1_009	2009	UTI	8715
level1	TZ_1_010	2009	diarrhoea	38352
level1	TZ_1_010	2009	intestinal worms	30229
level1	TZ_1_010	2009	malaria	173188
level1	TZ_1_010	2009	pneumonia	25366
level1	TZ_1_010	2009	skin infections	18680
level1	TZ_1_010	2009	upper respiratory disorders	42823
level1	TZ_1_010	2009	UTI	37636
level1	TZ_1_011	2009	diarrhoea	23657
level1	TZ_1_011	2009	intestinal worms	18805
level1	TZ_1_011	2009	malaria	21621
level1	TZ_1_011	2009	pneumonia	55554
level1	TZ_1_011	2009	skin infections	29244
level1	TZ_1_011	2009	upper respiratory disorders	48257
level1	TZ_1_011	2009	UTI	23345
level1	TZ_1_014	2009	diarrhoea	22154
level1	TZ_1_014	2009	intestinal worms	10562
level1	TZ_1_014	2009	malaria	174654
level1	TZ_1_014	2009	pneumonia	19883
level1	TZ_1_014	2009	skin infections	14794
level1	TZ_1_014	2009	upper respiratory disorders	20293
level1	TZ_1_014	2009	UTI	10726
level1	TZ_1_015	2009	diarrhoea	38082
level1	TZ_1_015	2009	intestinal worms	10264
level1	TZ_1_015	2009	malaria	59058
level1	TZ_1_015	2009	pneumonia	53305
level1	TZ_1_015	2009	skin infections	19588
level1	TZ_1_015	2009	upper respiratory disorders	25994
level1	TZ_1_015	2009	UTI	9868
level1	TZ_1_016	2009	diarrhoea	37024
level1	TZ_1_016	2009	intestinal worms	26219
level1	TZ_1_016	2009	malaria	200050
level1	TZ_1_016	2009	pneumonia	29973
level1	TZ_1_016	2009	skin infections	20224
level1	TZ_1_016	2009	upper respiratory disorders	26840
level1	TZ_1_016	2009	UTI	38204
level1	TZ_1_017	2009	diarrhoea	71511
level1	TZ_1_017	2009	intestinal worms	17411
level1	TZ_1_017	2009	malaria	84351
level1	TZ_1_017	2009	pneumonia	55842
level1	TZ_1_017	2009	skin infections	41943
level1	TZ_1_017	2009	upper respiratory disorders	51389
level1	TZ_1_017	2009	UTI	22341
level1	TZ_1_018	2009	diarrhoea	43066
level1	TZ_1_018	2009	intestinal worms	26349
level1	TZ_1_018	2009	malaria	225126
level1	TZ_1_018	2009	pneumonia	56095
level1	TZ_1_018	2009	skin infections	43685
level1	TZ_1_018	2009	upper respiratory disorders	41436
level1	TZ_1_018	2009	UTI	52816
level1	TZ_1_019	2009	diarrhoea	31262
level1	TZ_1_019	2009	intestinal worms	12475
level1	TZ_1_019	2009	malaria	216063
level1	TZ_1_019	2009	pneumonia	32473
level1	TZ_1_019	2009	skin infections	22166
level1	TZ_1_019	2009	upper respiratory disorders	25355
level1	TZ_1_019	2009	UTI	15339
level1	TZ_1_020	2009	diarrhoea	65145
level1	TZ_1_020	2009	intestinal worms	30837
level1	TZ_1_020	2009	malaria	249147
level1	TZ_1_020	2009	pneumonia	55269
level1	TZ_1_020	2009	skin infections	48071
level1	TZ_1_020	2009	upper respiratory disorders	46425
level1	TZ_1_020	2009	UTI	52759
level1	TZ_1_021	2009	diarrhoea	11691
level1	TZ_1_021	2009	intestinal worms	3528
level1	TZ_1_021	2009	malaria	15258
level1	TZ_1_021	2009	pneumonia	13925
level1	TZ_1_021	2009	skin infections	10372
level1	TZ_1_021	2009	upper respiratory disorders	8933
level1	TZ_1_021	2009	UTI	3249
level1	TZ_1_022	2009	diarrhoea	29904
level1	TZ_1_022	2009	intestinal worms	13668
level1	TZ_1_022	2009	malaria	190204
level1	TZ_1_022	2009	pneumonia	32296
level1	TZ_1_022	2009	skin infections	24623
level1	TZ_1_022	2009	upper respiratory disorders	41581
level1	TZ_1_022	2009	UTI	26335
level1	TZ_1_023	2009	diarrhoea	40704
level1	TZ_1_023	2009	intestinal worms	9145
level1	TZ_1_023	2009	malaria	73850
level1	TZ_1_023	2009	pneumonia	17101
level1	TZ_1_023	2009	skin infections	17718
level1	TZ_1_023	2009	upper respiratory disorders	13483
level1	TZ_1_023	2009	UTI	11591
level1	TZ_1_024	2009	diarrhoea	26614
level1	TZ_1_024	2009	intestinal worms	11711
level1	TZ_1_024	2009	malaria	178686
level1	TZ_1_024	2009	pneumonia	27612
level1	TZ_1_024	2009	skin infections	20459
level1	TZ_1_024	2009	upper respiratory disorders	27223
level1	TZ_1_024	2009	UTI	9794
level1	TZ_1_025	2009	diarrhoea	44455
level1	TZ_1_025	2009	intestinal worms	14325
level1	TZ_1_025	2009	malaria	159449
level1	TZ_1_025	2009	pneumonia	28085
level1	TZ_1_025	2009	skin infections	18625
level1	TZ_1_025	2009	upper respiratory disorders	31540
level1	TZ_1_025	2009	UTI	25035
level1	TZ_1_026	2009	diarrhoea	39057
level1	TZ_1_026	2009	intestinal worms	10624
level1	TZ_1_026	2009	malaria	85640
level1	TZ_1_026	2009	pneumonia	23571
level1	TZ_1_026	2009	skin infections	13972
level1	TZ_1_026	2009	upper respiratory disorders	17893
level1	TZ_1_026	2009	UTI	22321
level1	TZ_1_027	2009	diarrhoea	53021
level1	TZ_1_027	2009	intestinal worms	9437
level1	TZ_1_027	2009	malaria	64226
level1	TZ_1_027	2009	pneumonia	25170
level1	TZ_1_027	2009	skin infections	25894
level1	TZ_1_027	2009	upper respiratory disorders	40604
level1	TZ_1_027	2009	UTI	16011
level1	TZ_1_029	2009	diarrhoea	53520
level1	TZ_1_029	2009	intestinal worms	14003
level1	TZ_1_029	2009	malaria	207585
level1	TZ_1_029	2009	pneumonia	25191
level1	TZ_1_029	2009	skin infections	15112
level1	TZ_1_029	2009	upper respiratory disorders	29867
level1	TZ_1_029	2009	UTI	18488
level1	TZ_1_028	2009	diarrhoea	51523
level1	TZ_1_028	2009	intestinal worms	24896
level1	TZ_1_028	2009	malaria	194761
level1	TZ_1_028	2009	pneumonia	84269
level1	TZ_1_028	2009	skin infections	50188
level1	TZ_1_028	2009	upper respiratory disorders	55611
level1	TZ_1_028	2009	UTI	37431
level1	TZ_1_007	2009	diarrhoea	0
level1	TZ_1_007	2009	intestinal worms	0
level1	TZ_1_007	2009	malaria	0
level1	TZ_1_007	2009	pneumonia	0
level1	TZ_1_007	2009	skin infections	0
level1	TZ_1_007	2009	upper respiratory disorders	0
level1	TZ_1_007	2009	UTI	0
level1	TZ_1_008	2009	diarrhoea	0
level1	TZ_1_008	2009	intestinal worms	0
level1	TZ_1_008	2009	malaria	0
level1	TZ_1_008	2009	pneumonia	0
level1	TZ_1_008	2009	skin infections	0
level1	TZ_1_008	2009	upper respiratory disorders	0
level1	TZ_1_008	2009	UTI	0
level1	TZ_1_012	2009	diarrhoea	0
level1	TZ_1_012	2009	intestinal worms	0
level1	TZ_1_012	2009	malaria	0
level1	TZ_1_012	2009	pneumonia	0
level1	TZ_1_012	2009	skin infections	0
level1	TZ_1_012	2009	upper respiratory disorders	0
level1	TZ_1_012	2009	UTI	0
level1	TZ_1_013	2009	diarrhoea	0
level1	TZ_1_013	2009	intestinal worms	0
level1	TZ_1_013	2009	malaria	0
level1	TZ_1_013	2009	pneumonia	0
level1	TZ_1_013	2009	skin infections	0
level1	TZ_1_013	2009	upper respiratory disorders	0
level1	TZ_1_013	2009	UTI	0
level1	TZ_1_030	2009	diarrhoea	0
level1	TZ_1_030	2009	intestinal worms	0
level1	TZ_1_030	2009	malaria	0
level1	TZ_1_030	2009	pneumonia	0
level1	TZ_1_030	2009	skin infections	0
level1	TZ_1_030	2009	upper respiratory disorders	0
level1	TZ_1_030	2009	UTI	0
country	TZ	2009	diarrhoea	1055598
country	TZ	2009	intestinal worms	451495
country	TZ	2009	malaria	3476659
country	TZ	2009	pneumonia	987106
country	TZ	2009	skin infections	725176
country	TZ	2009	upper respiratory disorders	921104
country	TZ	2009	UTI	721436
\.


--
-- Name: outpatient_diagnosis_under_five pk_outpatient_diagnosis_under_five; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.outpatient_diagnosis_under_five
    ADD CONSTRAINT pk_outpatient_diagnosis_under_five PRIMARY KEY (geo_level, geo_code, geo_version, outpatient_diagnosis_under_five);


--
-- PostgreSQL database dump complete
--

