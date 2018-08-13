--
-- PostgreSQL database dump
--

-- Dumped from database version 10.4 (Ubuntu 10.4-0ubuntu0.18.04)
-- Dumped by pg_dump version 10.4 (Ubuntu 10.4-0ubuntu0.18.04)

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
-- Name: outpatient_diagnosis_over_five; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.outpatient_diagnosis_over_five (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    outpatient_diagnosis_over_five character varying(128) NOT NULL,
    total integer
);

--
-- Data for Name: outpatient_diagnosis_over_five; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.outpatient_diagnosis_over_five (geo_level, geo_code, geo_version, outpatient_diagnosis_over_five, total) FROM stdin;
level1	TZ_1_001	2009	diarrhoea	28274
level1	TZ_1_001	2009	hypertension	31121
level1	TZ_1_001	2009	intestinal worms	23005
level1	TZ_1_001	2009	malaria	33833
level1	TZ_1_001	2009	surgical conditions	44772
level1	TZ_1_001	2009	pneumonia	59702
level1	TZ_1_001	2009	upper respiratory disorders	82980
level1	TZ_1_001	2009	skin infections	43659
level1	TZ_1_001	2009	UTI	65644
level1	TZ_1_003	2009	diarrhoea	87029
level1	TZ_1_003	2009	hypertension	82124
level1	TZ_1_003	2009	intestinal worms	78960
level1	TZ_1_003	2009	malaria	461786
level1	TZ_1_003	2009	surgical conditions	49047
level1	TZ_1_003	2009	pneumonia	63317
level1	TZ_1_003	2009	upper respiratory disorders	157448
level1	TZ_1_003	2009	skin infections	156592
level1	TZ_1_003	2009	UTI	237459
level1	TZ_1_002	2009	diarrhoea	39895
level1	TZ_1_002	2009	hypertension	6549
level1	TZ_1_002	2009	intestinal worms	22504
level1	TZ_1_002	2009	malaria	126094
level1	TZ_1_002	2009	surgical conditions	17481
level1	TZ_1_002	2009	pneumonia	26152
level1	TZ_1_002	2009	upper respiratory disorders	40710
level1	TZ_1_002	2009	skin infections	29347
level1	TZ_1_002	2009	UTI	41872
level1	TZ_1_004	2009	diarrhoea	12682
level1	TZ_1_004	2009	hypertension	3139
level1	TZ_1_004	2009	intestinal worms	23311
level1	TZ_1_004	2009	malaria	126160
level1	TZ_1_004	2009	surgical conditions	5622
level1	TZ_1_004	2009	pneumonia	9938
level1	TZ_1_004	2009	upper respiratory disorders	15276
level1	TZ_1_004	2009	skin infections	11985
level1	TZ_1_004	2009	UTI	31396
level1	TZ_1_005	2009	diarrhoea	22334
level1	TZ_1_005	2009	hypertension	6459
level1	TZ_1_005	2009	intestinal worms	15452
level1	TZ_1_005	2009	malaria	60186
level1	TZ_1_005	2009	surgical conditions	15703
level1	TZ_1_005	2009	pneumonia	16745
level1	TZ_1_005	2009	upper respiratory disorders	26056
level1	TZ_1_005	2009	skin infections	23054
level1	TZ_1_005	2009	UTI	24436
level1	TZ_1_006	2009	diarrhoea	25226
level1	TZ_1_006	2009	hypertension	13224
level1	TZ_1_006	2009	intestinal worms	38606
level1	TZ_1_006	2009	malaria	259856
level1	TZ_1_006	2009	surgical conditions	15369
level1	TZ_1_006	2009	pneumonia	20098
level1	TZ_1_006	2009	upper respiratory disorders	41090
level1	TZ_1_006	2009	skin infections	18662
level1	TZ_1_006	2009	UTI	78677
level1	TZ_1_009	2009	diarrhoea	7208
level1	TZ_1_009	2009	hypertension	1730
level1	TZ_1_009	2009	intestinal worms	8258
level1	TZ_1_009	2009	malaria	41782
level1	TZ_1_009	2009	surgical conditions	1682
level1	TZ_1_009	2009	pneumonia	3560
level1	TZ_1_009	2009	upper respiratory disorders	7776
level1	TZ_1_009	2009	skin infections	5802
level1	TZ_1_009	2009	UTI	10882
level1	TZ_1_010	2009	diarrhoea	22293
level1	TZ_1_010	2009	hypertension	5438
level1	TZ_1_010	2009	intestinal worms	46894
level1	TZ_1_010	2009	malaria	199323
level1	TZ_1_010	2009	surgical conditions	8448
level1	TZ_1_010	2009	pneumonia	13976
level1	TZ_1_010	2009	upper respiratory disorders	39690
level1	TZ_1_010	2009	skin infections	16465
level1	TZ_1_010	2009	UTI	50819
level1	TZ_1_011	2009	diarrhoea	20140
level1	TZ_1_011	2009	hypertension	41422
level1	TZ_1_011	2009	intestinal worms	38035
level1	TZ_1_011	2009	malaria	63798
level1	TZ_1_011	2009	surgical conditions	36984
level1	TZ_1_011	2009	pneumonia	50911
level1	TZ_1_011	2009	upper respiratory disorders	90294
level1	TZ_1_011	2009	skin infections	43510
level1	TZ_1_011	2009	UTI	59498
level1	TZ_1_014	2009	diarrhoea	15204
level1	TZ_1_014	2009	hypertension	9942
level1	TZ_1_014	2009	intestinal worms	10487
level1	TZ_1_014	2009	malaria	147525
level1	TZ_1_014	2009	surgical conditions	11007
level1	TZ_1_014	2009	pneumonia	12420
level1	TZ_1_014	2009	upper respiratory disorders	19613
level1	TZ_1_014	2009	skin infections	13174
level1	TZ_1_014	2009	UTI	18998
level1	TZ_1_015	2009	diarrhoea	21107
level1	TZ_1_015	2009	hypertension	3106
level1	TZ_1_015	2009	intestinal worms	14265
level1	TZ_1_015	2009	malaria	75027
level1	TZ_1_015	2009	surgical conditions	16759
level1	TZ_1_015	2009	pneumonia	31601
level1	TZ_1_015	2009	upper respiratory disorders	33651
level1	TZ_1_015	2009	skin infections	127577
level1	TZ_1_015	2009	UTI	26656
level1	TZ_1_016	2009	diarrhoea	24014
level1	TZ_1_016	2009	hypertension	4950
level1	TZ_1_016	2009	intestinal worms	40183
level1	TZ_1_016	2009	malaria	199835
level1	TZ_1_016	2009	surgical conditions	15469
level1	TZ_1_016	2009	pneumonia	16754
level1	TZ_1_016	2009	upper respiratory disorders	31429
level1	TZ_1_016	2009	skin infections	21752
level1	TZ_1_016	2009	UTI	57655
level1	TZ_1_017	2009	diarrhoea	45613
level1	TZ_1_017	2009	hypertension	14672
level1	TZ_1_017	2009	intestinal worms	25842
level1	TZ_1_017	2009	malaria	104218
level1	TZ_1_017	2009	surgical conditions	24136
level1	TZ_1_017	2009	pneumonia	31531
level1	TZ_1_017	2009	upper respiratory disorders	49634
level1	TZ_1_017	2009	skin infections	36567
level1	TZ_1_017	2009	UTI	39453
level1	TZ_1_018	2009	diarrhoea	37771
level1	TZ_1_018	2009	hypertension	18899
level1	TZ_1_018	2009	intestinal worms	42646
level1	TZ_1_018	2009	malaria	319602
level1	TZ_1_018	2009	surgical conditions	24837
level1	TZ_1_018	2009	pneumonia	31834
level1	TZ_1_018	2009	upper respiratory disorders	52380
level1	TZ_1_018	2009	skin infections	45028
level1	TZ_1_018	2009	UTI	78748
level1	TZ_1_019	2009	diarrhoea	16992
level1	TZ_1_019	2009	hypertension	10680
level1	TZ_1_019	2009	intestinal worms	12045
level1	TZ_1_019	2009	malaria	192333
level1	TZ_1_019	2009	surgical conditions	11923
level1	TZ_1_019	2009	pneumonia	18654
level1	TZ_1_019	2009	upper respiratory disorders	23771
level1	TZ_1_019	2009	skin infections	15211
level1	TZ_1_019	2009	UTI	25551
level1	TZ_1_020	2009	diarrhoea	27941
level1	TZ_1_020	2009	hypertension	9394
level1	TZ_1_020	2009	intestinal worms	48618
level1	TZ_1_020	2009	malaria	229520
level1	TZ_1_020	2009	surgical conditions	14735
level1	TZ_1_020	2009	pneumonia	20243
level1	TZ_1_020	2009	upper respiratory disorders	39290
level1	TZ_1_020	2009	skin infections	33815
level1	TZ_1_020	2009	UTI	92271
level1	TZ_1_021	2009	diarrhoea	13885
level1	TZ_1_021	2009	hypertension	4208
level1	TZ_1_021	2009	intestinal worms	6844
level1	TZ_1_021	2009	malaria	27670
level1	TZ_1_021	2009	surgical conditions	7296
level1	TZ_1_021	2009	pneumonia	10561
level1	TZ_1_021	2009	upper respiratory disorders	13198
level1	TZ_1_021	2009	skin infections	13931
level1	TZ_1_021	2009	UTI	11265
level1	TZ_1_022	2009	diarrhoea	21128
level1	TZ_1_022	2009	hypertension	15754
level1	TZ_1_022	2009	intestinal worms	17434
level1	TZ_1_022	2009	malaria	244679
level1	TZ_1_022	2009	surgical conditions	16616
level1	TZ_1_022	2009	pneumonia	17414
level1	TZ_1_022	2009	upper respiratory disorders	45542
level1	TZ_1_022	2009	skin infections	24472
level1	TZ_1_022	2009	UTI	54574
level1	TZ_1_023	2009	diarrhoea	17062
level1	TZ_1_023	2009	hypertension	2559
level1	TZ_1_023	2009	intestinal worms	11529
level1	TZ_1_023	2009	malaria	69919
level1	TZ_1_023	2009	surgical conditions	6476
level1	TZ_1_023	2009	pneumonia	11275
level1	TZ_1_023	2009	upper respiratory disorders	11379
level1	TZ_1_023	2009	skin infections	13718
level1	TZ_1_023	2009	UTI	16449
level1	TZ_1_024	2009	diarrhoea	18192
level1	TZ_1_024	2009	hypertension	11484
level1	TZ_1_024	2009	intestinal worms	15023
level1	TZ_1_024	2009	malaria	183819
level1	TZ_1_024	2009	surgical conditions	16330
level1	TZ_1_024	2009	pneumonia	20209
level1	TZ_1_024	2009	upper respiratory disorders	27345
level1	TZ_1_024	2009	skin infections	19308
level1	TZ_1_024	2009	UTI	18919
level1	TZ_1_025	2009	diarrhoea	24111
level1	TZ_1_025	2009	hypertension	5590
level1	TZ_1_025	2009	intestinal worms	21553
level1	TZ_1_025	2009	malaria	157642
level1	TZ_1_025	2009	surgical conditions	6871
level1	TZ_1_025	2009	pneumonia	12182
level1	TZ_1_025	2009	upper respiratory disorders	36171
level1	TZ_1_025	2009	skin infections	19037
level1	TZ_1_025	2009	UTI	43194
level1	TZ_1_026	2009	diarrhoea	18586
level1	TZ_1_026	2009	hypertension	1631
level1	TZ_1_026	2009	intestinal worms	16511
level1	TZ_1_026	2009	malaria	90687
level1	TZ_1_026	2009	surgical conditions	3002
level1	TZ_1_026	2009	pneumonia	10156
level1	TZ_1_026	2009	upper respiratory disorders	20370
level1	TZ_1_026	2009	skin infections	10868
level1	TZ_1_026	2009	UTI	30865
level1	TZ_1_027	2009	diarrhoea	33771
level1	TZ_1_027	2009	hypertension	4043
level1	TZ_1_027	2009	intestinal worms	16369
level1	TZ_1_027	2009	malaria	95183
level1	TZ_1_027	2009	surgical conditions	16802
level1	TZ_1_027	2009	pneumonia	18858
level1	TZ_1_027	2009	upper respiratory disorders	53355
level1	TZ_1_027	2009	skin infections	22149
level1	TZ_1_027	2009	UTI	31143
level1	TZ_1_029	2009	diarrhoea	28323
level1	TZ_1_029	2009	hypertension	4479
level1	TZ_1_029	2009	intestinal worms	20844
level1	TZ_1_029	2009	malaria	211160
level1	TZ_1_029	2009	surgical conditions	7566
level1	TZ_1_029	2009	pneumonia	12666
level1	TZ_1_029	2009	upper respiratory disorders	32161
level1	TZ_1_029	2009	skin infections	13597
level1	TZ_1_029	2009	UTI	32539
level1	TZ_1_028	2009	diarrhoea	36855
level1	TZ_1_028	2009	hypertension	23839
level1	TZ_1_028	2009	intestinal worms	34304
level1	TZ_1_028	2009	malaria	300736
level1	TZ_1_028	2009	surgical conditions	36421
level1	TZ_1_028	2009	pneumonia	42122
level1	TZ_1_028	2009	upper respiratory disorders	78197
level1	TZ_1_028	2009	skin infections	60071
level1	TZ_1_028	2009	UTI	76590
level1	TZ_1_007	2009	diarrhoea	0
level1	TZ_1_007	2009	hypertension	0
level1	TZ_1_007	2009	intestinal worms	0
level1	TZ_1_007	2009	malaria	0
level1	TZ_1_007	2009	surgical conditions	0
level1	TZ_1_007	2009	pneumonia	0
level1	TZ_1_007	2009	upper respiratory disorders	0
level1	TZ_1_007	2009	skin infections	0
level1	TZ_1_007	2009	UTI	0
level1	TZ_1_008	2009	diarrhoea	0
level1	TZ_1_008	2009	hypertension	0
level1	TZ_1_008	2009	intestinal worms	0
level1	TZ_1_008	2009	malaria	0
level1	TZ_1_008	2009	surgical conditions	0
level1	TZ_1_008	2009	pneumonia	0
level1	TZ_1_008	2009	upper respiratory disorders	0
level1	TZ_1_008	2009	skin infections	0
level1	TZ_1_008	2009	UTI	0
level1	TZ_1_012	2009	diarrhoea	0
level1	TZ_1_012	2009	hypertension	0
level1	TZ_1_012	2009	intestinal worms	0
level1	TZ_1_012	2009	malaria	0
level1	TZ_1_012	2009	surgical conditions	0
level1	TZ_1_012	2009	pneumonia	0
level1	TZ_1_012	2009	upper respiratory disorders	0
level1	TZ_1_012	2009	skin infections	0
level1	TZ_1_012	2009	UTI	0
level1	TZ_1_013	2009	diarrhoea	0
level1	TZ_1_013	2009	hypertension	0
level1	TZ_1_013	2009	intestinal worms	0
level1	TZ_1_013	2009	malaria	0
level1	TZ_1_013	2009	surgical conditions	0
level1	TZ_1_013	2009	pneumonia	0
level1	TZ_1_013	2009	upper respiratory disorders	0
level1	TZ_1_013	2009	skin infections	0
level1	TZ_1_013	2009	UTI	0
level1	TZ_1_030	2009	diarrhoea	0
level1	TZ_1_030	2009	hypertension	0
level1	TZ_1_030	2009	intestinal worms	0
level1	TZ_1_030	2009	malaria	0
level1	TZ_1_030	2009	surgical conditions	0
level1	TZ_1_030	2009	pneumonia	0
level1	TZ_1_030	2009	upper respiratory disorders	0
level1	TZ_1_030	2009	skin infections	0
level1	TZ_1_030	2009	UTI	0
country	TZ	2009	diarrhoea	665636
country	TZ	2009	hypertension	336436
country	TZ	2009	intestinal worms	649522
country	TZ	2009	malaria	4022373
country	TZ	2009	surgical conditions	431354
country	TZ	2009	pneumonia	582879
country	TZ	2009	upper respiratory disorders	1068806
country	TZ	2009	skin infections	839351
country	TZ	2009	UTI	1255553
\.


--
-- Name: outpatient_diagnosis_over_five pk_outpatient_diagnosis_over_five; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.outpatient_diagnosis_over_five
    ADD CONSTRAINT pk_outpatient_diagnosis_over_five PRIMARY KEY (geo_level, geo_code, geo_version, outpatient_diagnosis_over_five);

--
-- PostgreSQL database dump complete
--

