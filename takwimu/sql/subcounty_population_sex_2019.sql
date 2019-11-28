--
-- PostgreSQL database dump
--

-- Dumped from database version 10.4
-- Dumped by pg_dump version 10.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;

ALTER TABLE IF EXISTS ONLY public.subcounty_population_sex_2019 DROP CONSTRAINT IF EXISTS pk_subcounty_population_sex_2019;
DROP TABLE IF EXISTS public.subcounty_population_sex_2019;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: subcounty_population_sex_2019; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.subcounty_population_sex_2019 (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    subcounty character varying(128) NOT NULL,
    gender character varying(128) NOT NULL,
    total integer
);


--
-- Data for Name: subcounty_population_sex_2019; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.subcounty_population_sex_2019 (geo_level, geo_code, geo_version, subcounty, gender, total) FROM stdin;
level1	KE_1_002	2009	Kinango	Intersex	1
level1	KE_1_003	2009	Chonyi	Intersex	1
level1	KE_1_007	2009	Balambala	Intersex	1
level1	KE_1_007	2009	Lagdera	Intersex	1
level1	KE_1_010	2009	Moyale	Intersex	1
level1	KE_1_002	2009	Matuga	Intersex	2
level1	KE_1_003	2009	Kilifi North	Intersex	2
level1	KE_1_004	2009	Tana Delta	Intersex	2
level1	KE_1_008	2009	Buna	Intersex	2
level1	KE_1_009	2009	Kutulo	Intersex	2
level1	KE_1_010	2009	North Horr	Intersex	2
level1	KE_1_024	2009	Pokot South	Intersex	2
level1	KE_1_001	2009	Jomvu	Intersex	3
level1	KE_1_008	2009	Wajir South	Intersex	3
level1	KE_1_010	2009	Loiyangalani	Intersex	3
level1	KE_1_011	2009	Merti	Intersex	3
level1	KE_1_024	2009	Pokot Central	Intersex	3
level1	KE_1_024	2009	Pokot North	Intersex	3
level1	KE_1_026	2009	Endebess	Intersex	3
level1	KE_1_026	2009	Kwanza	Intersex	3
level1	KE_1_001	2009	Likoni	Intersex	4
level1	KE_1_002	2009	Lungalunga	Intersex	4
level1	KE_1_002	2009	Msambweni	Intersex	4
level1	KE_1_003	2009	Ganze	Intersex	4
level1	KE_1_003	2009	Kilifi South	Intersex	4
level1	KE_1_005	2009	Lamu West	Intersex	4
level1	KE_1_007	2009	Ijara	Intersex	4
level1	KE_1_012	2009	Igembe Central	Intersex	4
level1	KE_1_012	2009	Igembe North	Intersex	4
level1	KE_1_012	2009	Meru Central	Intersex	4
level1	KE_1_001	2009	Mvita	Intersex	5
level1	KE_1_003	2009	Kaloleni	Intersex	5
level1	KE_1_007	2009	Garissa	Intersex	5
level1	KE_1_007	2009	Hulugho	Intersex	5
level1	KE_1_008	2009	Tarbaj	Intersex	5
level1	KE_1_009	2009	Lafey	Intersex	5
level1	KE_1_009	2009	Mandera Central	Intersex	5
level1	KE_1_009	2009	Mandera East	Intersex	5
level1	KE_1_011	2009	Isiolo	Intersex	5
level1	KE_1_012	2009	Tigania West	Intersex	5
level1	KE_1_026	2009	Trans Nzoia West	Intersex	5
level1	KE_1_001	2009	Kisauni	Intersex	6
level1	KE_1_008	2009	Wajir West	Intersex	6
level1	KE_1_026	2009	Kiminini	Intersex	6
level1	KE_1_002	2009	Samburu Kwale	Intersex	7
level1	KE_1_008	2009	Eldas	Intersex	7
level1	KE_1_008	2009	Wajir North	Intersex	7
level1	KE_1_009	2009	Mandera North	Intersex	7
level1	KE_1_024	2009	Kipkomo	Intersex	7
level1	KE_1_047	2009	Kamukunji	Intersex	7
level1	KE_1_007	2009	Dadaab	Intersex	8
level1	KE_1_012	2009	Igembe South	Intersex	8
level1	KE_1_003	2009	Malindi	Intersex	9
level1	KE_1_009	2009	Banisa	Intersex	9
level1	KE_1_047	2009	Kibra	Intersex	9
level1	KE_1_007	2009	Fafi	Intersex	10
level1	KE_1_047	2009	Makadara	Intersex	10
level1	KE_1_026	2009	Trans Nzoia East	Intersex	11
level1	KE_1_001	2009	Nyali	Intersex	12
level1	KE_1_047	2009	Starehe	Intersex	12
level1	KE_1_047	2009	Mathare	Intersex	14
level1	KE_1_047	2009	Westlands	Intersex	15
level1	KE_1_047	2009	Lang'ata	Intersex	17
level1	KE_1_047	2009	Dagoretti	Intersex	31
level1	KE_1_047	2009	Njiru	Intersex	31
level1	KE_1_047	2009	Kasarani	Intersex	37
level1	KE_1_012	2009	Mt Kenya Forest	Female	54
level1	KE_1_047	2009	Embakasi	Intersex	62
level1	KE_1_012	2009	Mt Kenya Forest	Male	409
level1	KE_1_012	2009	Mt Kenya Forest	Total	463
level1	KE_1_005	2009	Lamu East	Female	10583
level1	KE_1_003	2009	Kauma	Male	10965
level1	KE_1_003	2009	Kauma	Female	11673
level1	KE_1_005	2009	Lamu East	Male	11675
level1	KE_1_007	2009	Balambala	Female	11979
level1	KE_1_010	2009	Loiyangalani	Male	17659
level1	KE_1_010	2009	Loiyangalani	Female	18051
level1	KE_1_007	2009	Balambala	Male	20277
level1	KE_1_010	2009	Sololo	Female	21354
level1	KE_1_005	2009	Lamu East	Total	22258
level1	KE_1_003	2009	Kauma	Total	22638
level1	KE_1_011	2009	Merti	Female	22768
level1	KE_1_008	2009	Buna	Female	23088
level1	KE_1_010	2009	Sololo	Male	23468
level1	KE_1_011	2009	Merti	Male	24435
level1	KE_1_007	2009	Lagdera	Male	25023
level1	KE_1_007	2009	Lagdera	Female	25291
level1	KE_1_008	2009	Buna	Male	26796
level1	KE_1_008	2009	Tarbaj	Male	27141
level1	KE_1_003	2009	Chonyi	Male	29527
level1	KE_1_010	2009	North Horr	Female	29726
level1	KE_1_008	2009	Tarbaj	Female	30086
level1	KE_1_008	2009	Wajir North	Female	30209
level1	KE_1_008	2009	Wajir North	Male	31990
level1	KE_1_007	2009	Balambala	Total	32257
level1	KE_1_003	2009	Chonyi	Female	32807
level1	KE_1_010	2009	Loiyangalani	Total	35713
level1	KE_1_009	2009	Kutulo	Male	35799
level1	KE_1_009	2009	Kutulo	Female	36593
level1	KE_1_012	2009	Buuri East	Male	38101
level1	KE_1_012	2009	Buuri East	Female	38497
level1	KE_1_024	2009	Pokot South	Male	39808
level1	KE_1_009	2009	Lafey	Male	40476
level1	KE_1_024	2009	Pokot South	Female	40851
level1	KE_1_010	2009	North Horr	Male	41719
level1	KE_1_009	2009	Lafey	Female	42976
level1	KE_1_004	2009	Tana River	Male	43711
level1	KE_1_008	2009	Eldas	Female	43759
level1	KE_1_008	2009	Eldas	Male	44743
level1	KE_1_010	2009	Sololo	Total	44822
level1	KE_1_004	2009	Tana River	Female	44835
level1	KE_1_002	2009	Kinango	Male	45413
level1	KE_1_011	2009	Merti	Total	47206
level1	KE_1_002	2009	Kinango	Female	48806
level1	KE_1_008	2009	Buna	Total	49886
level1	KE_1_007	2009	Lagdera	Total	50315
level1	KE_1_024	2009	Kipkomo	Male	50923
level1	KE_1_024	2009	Kipkomo	Female	51703
level1	KE_1_012	2009	Tigania Central	Male	51814
level1	KE_1_008	2009	Wajir South	Female	51864
level1	KE_1_010	2009	Moyale	Female	52508
level1	KE_1_012	2009	Tigania Central	Female	52916
level1	KE_1_004	2009	Tana North	Female	54924
level1	KE_1_026	2009	Endebess	Female	55689
level1	KE_1_004	2009	Tana North	Male	55716
level1	KE_1_007	2009	Hulugho	Female	55898
level1	KE_1_008	2009	Wajir West	Female	56037
level1	KE_1_026	2009	Endebess	Male	56090
level1	KE_1_010	2009	Moyale	Male	56440
level1	KE_1_005	2009	Lamu West	Female	57230
level1	KE_1_008	2009	Tarbaj	Total	57232
level1	KE_1_004	2009	Tana Delta	Female	57632
level1	KE_1_003	2009	Rabai	Male	58571
level1	KE_1_004	2009	Tana Delta	Male	59123
level1	KE_1_024	2009	Pokot Central	Female	59331
level1	KE_1_024	2009	Pokot Central	Male	59682
level1	KE_1_011	2009	Isiolo	Male	60414
level1	KE_1_011	2009	Isiolo	Female	60647
level1	KE_1_007	2009	Ijara	Female	61129
level1	KE_1_007	2009	Fafi	Female	61413
level1	KE_1_008	2009	Wajir North	Total	62206
level1	KE_1_003	2009	Rabai	Female	62242
level1	KE_1_003	2009	Chonyi	Total	62335
level1	KE_1_001	2009	Changamwe	Female	63121
level1	KE_1_005	2009	Lamu West	Male	64428
level1	KE_1_024	2009	Pokot North	Male	64780
level1	KE_1_008	2009	Wajir South	Male	64947
level1	KE_1_008	2009	Wajir West	Male	65785
level1	KE_1_009	2009	Mandera North	Female	66835
level1	KE_1_012	2009	Meru Central	Female	66894
level1	KE_1_012	2009	Meru Central	Male	66920
level1	KE_1_003	2009	Ganze	Male	66921
level1	KE_1_012	2009	Tigania West	Male	67715
level1	KE_1_001	2009	Changamwe	Male	68761
level1	KE_1_024	2009	Pokot North	Female	69702
level1	KE_1_010	2009	North Horr	Total	71447
level1	KE_1_009	2009	Mandera Central	Male	71688
level1	KE_1_012	2009	Tigania West	Female	72241
level1	KE_1_009	2009	Kutulo	Total	72394
level1	KE_1_007	2009	Fafi	Male	72617
level1	KE_1_009	2009	Banisa	Female	74288
level1	KE_1_001	2009	Mvita	Male	75565
level1	KE_1_009	2009	Mandera East	Female	76095
level1	KE_1_012	2009	Buuri East	Total	76598
level1	KE_1_003	2009	Ganze	Female	76981
level1	KE_1_009	2009	Mandera North	Male	77008
level1	KE_1_007	2009	Hulugho	Male	78081
level1	KE_1_009	2009	Banisa	Male	78301
level1	KE_1_001	2009	Mvita	Female	78601
level1	KE_1_012	2009	Igembe South	Male	80192
level1	KE_1_001	2009	Jomvu	Female	80410
level1	KE_1_007	2009	Garissa	Female	80449
level1	KE_1_007	2009	Ijara	Male	80458
level1	KE_1_024	2009	Pokot South	Total	80661
level1	KE_1_012	2009	Igembe South	Female	81446
level1	KE_1_001	2009	Jomvu	Male	83002
level1	KE_1_012	2009	Igembe North	Male	83364
level1	KE_1_009	2009	Lafey	Total	83457
level1	KE_1_007	2009	Garissa	Male	83460
level1	KE_1_009	2009	Mandera East	Male	83538
level1	KE_1_009	2009	Mandera Central	Female	85527
level1	KE_1_012	2009	Igembe North	Female	85949
level1	KE_1_007	2009	Dadaab	Female	86185
level1	KE_1_003	2009	Kilifi North	Male	86986
level1	KE_1_002	2009	Msambweni	Female	88480
level1	KE_1_008	2009	Eldas	Total	88509
level1	KE_1_004	2009	Tana River	Total	88546
level1	KE_1_002	2009	Msambweni	Male	89206
level1	KE_1_047	2009	Kibra	Female	91569
level1	KE_1_024	2009	West Pokot	Male	91820
level1	KE_1_003	2009	Kilifi North	Female	91836
level1	KE_1_003	2009	Kaloleni	Male	92614
level1	KE_1_024	2009	West Pokot	Female	92626
level1	KE_1_047	2009	Makadara	Female	93157
level1	KE_1_003	2009	Magarini	Male	93302
level1	KE_1_047	2009	Kibra	Male	94199
level1	KE_1_002	2009	Kinango	Total	94220
level1	KE_1_002	2009	Matuga	Male	95831
level1	KE_1_047	2009	Makadara	Male	96369
level1	KE_1_047	2009	Lang'ata	Male	96698
level1	KE_1_002	2009	Lungalunga	Male	97174
level1	KE_1_002	2009	Samburu Kwale	Male	97497
level1	KE_1_003	2009	Magarini	Female	98308
level1	KE_1_002	2009	Matuga	Female	98419
level1	KE_1_007	2009	Dadaab	Male	99059
level1	KE_1_047	2009	Mathare	Female	100028
level1	KE_1_026	2009	Kwanza	Male	100234
level1	KE_1_047	2009	Lang'ata	Female	100774
level1	KE_1_003	2009	Kaloleni	Female	101063
level1	KE_1_026	2009	Trans Nzoia West	Female	101174
level1	KE_1_026	2009	Trans Nzoia West	Male	101198
level1	KE_1_047	2009	Starehe	Female	101238
level1	KE_1_002	2009	Lungalunga	Female	101245
level1	KE_1_003	2009	Kilifi South	Male	101852
level1	KE_1_024	2009	Kipkomo	Total	102633
level1	KE_1_026	2009	Kwanza	Female	103584
level1	KE_1_012	2009	Tigania Central	Total	104730
level1	KE_1_002	2009	Samburu Kwale	Female	104731
level1	KE_1_003	2009	Kilifi South	Female	104897
level1	KE_1_047	2009	Mathare	Male	106522
level1	KE_1_001	2009	Nyali	Female	107346
level1	KE_1_010	2009	Moyale	Total	108949
level1	KE_1_047	2009	Starehe	Male	109173
level1	KE_1_001	2009	Nyali	Male	109219
level1	KE_1_012	2009	Igembe Central	Female	110200
level1	KE_1_004	2009	Tana North	Total	110640
level1	KE_1_012	2009	Igembe Central	Male	111208
level1	KE_1_026	2009	Endebess	Total	111782
level1	KE_1_026	2009	Trans Nzoia East	Male	113498
level1	KE_1_026	2009	Trans Nzoia East	Female	116029
level1	KE_1_004	2009	Tana Delta	Total	116757
level1	KE_1_008	2009	Wajir South	Total	116814
level1	KE_1_026	2009	Kiminini	Male	118087
level1	KE_1_024	2009	Pokot Central	Total	119016
level1	KE_1_003	2009	Rabai	Total	120813
level1	KE_1_011	2009	Isiolo	Total	121066
level1	KE_1_005	2009	Lamu West	Total	121662
level1	KE_1_008	2009	Wajir West	Total	121828
level1	KE_1_001	2009	Likoni	Female	123392
level1	KE_1_026	2009	Kiminini	Female	124730
level1	KE_1_001	2009	Likoni	Male	126962
level1	KE_1_047	2009	Kamukunji	Female	131599
level1	KE_1_001	2009	Changamwe	Total	131882
level1	KE_1_012	2009	Meru Central	Total	133818
level1	KE_1_007	2009	Hulugho	Total	133984
level1	KE_1_007	2009	Fafi	Total	134040
level1	KE_1_024	2009	Pokot North	Total	134485
level1	KE_1_047	2009	Kamukunji	Male	136670
level1	KE_1_012	2009	Tigania West	Total	139961
level1	KE_1_007	2009	Ijara	Total	141591
level1	KE_1_009	2009	Mandera North	Total	143850
level1	KE_1_003	2009	Ganze	Total	143906
level1	KE_1_001	2009	Kisauni	Female	145176
level1	KE_1_001	2009	Kisauni	Male	146748
level1	KE_1_009	2009	Banisa	Total	152598
level1	KE_1_047	2009	Westlands	Male	153818
level1	KE_1_001	2009	Mvita	Total	154171
level1	KE_1_047	2009	Westlands	Female	155021
level1	KE_1_009	2009	Mandera Central	Total	157220
level1	KE_1_009	2009	Mandera East	Total	159638
level1	KE_1_012	2009	Igembe South	Total	161646
level1	KE_1_003	2009	Malindi	Male	163351
level1	KE_1_001	2009	Jomvu	Total	163415
level1	KE_1_007	2009	Garissa	Total	163914
level1	KE_1_012	2009	Igembe North	Total	169317
level1	KE_1_003	2009	Malindi	Female	169866
level1	KE_1_002	2009	Msambweni	Total	177690
level1	KE_1_003	2009	Kilifi North	Total	178824
level1	KE_1_024	2009	West Pokot	Total	184446
level1	KE_1_007	2009	Dadaab	Total	185252
level1	KE_1_047	2009	Kibra	Total	185777
level1	KE_1_047	2009	Makadara	Total	189536
level1	KE_1_003	2009	Magarini	Total	191610
level1	KE_1_003	2009	Kaloleni	Total	193682
level1	KE_1_002	2009	Matuga	Total	194252
level1	KE_1_047	2009	Lang'ata	Total	197489
level1	KE_1_002	2009	Lungalunga	Total	198423
level1	KE_1_002	2009	Samburu Kwale	Total	202235
level1	KE_1_026	2009	Trans Nzoia West	Total	202377
level1	KE_1_026	2009	Kwanza	Total	203821
level1	KE_1_047	2009	Mathare	Total	206564
level1	KE_1_003	2009	Kilifi South	Total	206753
level1	KE_1_047	2009	Starehe	Total	210423
level1	KE_1_047	2009	Dagoretti	Female	216526
level1	KE_1_001	2009	Nyali	Total	216577
level1	KE_1_047	2009	Dagoretti	Male	217651
level1	KE_1_012	2009	Igembe Central	Total	221412
level1	KE_1_026	2009	Trans Nzoia East	Total	229538
level1	KE_1_026	2009	Kiminini	Total	242823
level1	KE_1_001	2009	Likoni	Total	250358
level1	KE_1_047	2009	Kamukunji	Total	268276
level1	KE_1_001	2009	Kisauni	Total	291930
level1	KE_1_047	2009	Njiru	Male	307642
level1	KE_1_047	2009	Westlands	Total	308854
level1	KE_1_047	2009	Njiru	Female	318809
level1	KE_1_003	2009	Malindi	Total	333226
level1	KE_1_047	2009	Kasarani	Male	381234
level1	KE_1_047	2009	Kasarani	Female	399385
level1	KE_1_047	2009	Dagoretti	Total	434208
level1	KE_1_047	2009	Embakasi	Male	492476
level1	KE_1_047	2009	Embakasi	Female	496270
level1	KE_1_047	2009	Njiru	Total	626482
level1	KE_1_047	2009	Kasarani	Total	780656
level1	KE_1_047	2009	Embakasi	Total	988808
level1	KE_1_001	2009	Changamwe	Intersex	0
level1	KE_1_003	2009	Kauma	Intersex	0
level1	KE_1_003	2009	Magarini	Intersex	0
level1	KE_1_003	2009	Rabai	Intersex	0
level1	KE_1_004	2009	Tana North	Intersex	0
level1	KE_1_004	2009	Tana River	Intersex	0
level1	KE_1_005	2009	Lamu East	Intersex	0
level1	KE_1_010	2009	Sololo	Intersex	0
level1	KE_1_012	2009	Buuri East	Intersex	0
level1	KE_1_012	2009	Mt Kenya Forest	Intersex	0
level1	KE_1_012	2009	Tigania Central	Intersex	0
level1	KE_1_024	2009	West Pokot	Intersex	0
\.


--
-- Name: subcounty_population_sex_2019 pk_subcounty_population_sex_2019; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.subcounty_population_sex_2019
    ADD CONSTRAINT pk_subcounty_population_sex_2019 PRIMARY KEY (geo_level, geo_code, geo_version, subcounty, gender);


--
-- PostgreSQL database dump complete
--

