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

ALTER TABLE IF EXISTS ONLY public.valid_invalid_votes DROP CONSTRAINT IF EXISTS pk_valid_invalid_votes;
DROP TABLE IF EXISTS public.valid_invalid_votes;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: valid_invalid_votes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.valid_invalid_votes (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    votes character varying(128) NOT NULL,
    total integer
);


--
-- Data for Name: valid_invalid_votes; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.valid_invalid_votes (geo_level, geo_code, geo_version, votes, total) FROM stdin;
level1	NG_1_001	2009	Invalid Votes	10004
level1	NG_1_002	2009	Invalid Votes	25192
level1	NG_1_003	2009	Invalid Votes	11487
level1	NG_1_004	2009	Invalid Votes	14825
level1	NG_1_005	2009	Invalid Votes	19437
level1	NG_1_006	2009	Invalid Votes	4672
level1	NG_1_007	2009	Invalid Votes	19867
level1	NG_1_008	2009	Invalid Votes	13088
level1	NG_1_009	2009	Invalid Votes	15392
level1	NG_1_010	2009	Invalid Votes	17075
level1	NG_1_011	2009	Invalid Votes	29449
level1	NG_1_012	2009	Invalid Votes	22334
level1	NG_1_013	2009	Invalid Votes	8754
level1	NG_1_014	2009	Invalid Votes	12459
level1	NG_1_015	2009	Invalid Votes	9210
level1	NG_1_016	2009	Invalid Votes	12845
level1	NG_1_017	2009	Invalid Votes	28957
level1	NG_1_018	2009	Invalid Votes	34325
level1	NG_1_019	2009	Invalid Votes	32719
level1	NG_1_020	2009	Invalid Votes	43626
level1	NG_1_021	2009	Invalid Votes	32288
level1	NG_1_022	2009	Invalid Votes	38119
level1	NG_1_023	2009	Invalid Votes	17959
level1	NG_1_024	2009	Invalid Votes	21321
level1	NG_1_025	2009	Invalid Votes	52289
level1	NG_1_026	2009	Invalid Votes	10094
level1	NG_1_027	2009	Invalid Votes	31012
level1	NG_1_028	2009	Invalid Votes	26441
level1	NG_1_029	2009	Invalid Votes	21379
level1	NG_1_030	2009	Invalid Votes	20758
level1	NG_1_031	2009	Invalid Votes	47254
level1	NG_1_032	2009	Invalid Votes	18304
level1	NG_1_033	2009	Invalid Votes	19307
level1	NG_1_034	2009	Invalid Votes	42110
level1	NG_1_035	2009	Invalid Votes	23039
level1	NG_1_036	2009	Invalid Votes	17971
level1	NG_1_037	2009	Invalid Votes	19357
country	SN	2009	Invalid Votes	14093
country	TZ	2009	Invalid Votes	402248
level1	TZ_1_001	2009	Invalid Votes	11140
level1	TZ_1_002	2009	Invalid Votes	41563
level1	TZ_1_003	2009	Invalid Votes	25216
level1	TZ_1_004	2009	Invalid Votes	21105
level1	TZ_1_005	2009	Invalid Votes	6026
level1	TZ_1_006	2009	Invalid Votes	15766
level1	TZ_1_007	2009	Invalid Votes	1520
level1	TZ_1_008	2009	Invalid Votes	2249
level1	TZ_1_009	2009	Invalid Votes	4416
level1	TZ_1_010	2009	Invalid Votes	12547
level1	TZ_1_011	2009	Invalid Votes	8209
level1	TZ_1_012	2009	Invalid Votes	1862
level1	TZ_1_013	2009	Invalid Votes	1262
level1	TZ_1_014	2009	Invalid Votes	14457
level1	TZ_1_015	2009	Invalid Votes	10829
level1	TZ_1_016	2009	Invalid Votes	13891
level1	TZ_1_017	2009	Invalid Votes	19412
level1	TZ_1_018	2009	Invalid Votes	16004
level1	TZ_1_019	2009	Invalid Votes	11909
level1	TZ_1_020	2009	Invalid Votes	40885
level1	TZ_1_022	2009	Invalid Votes	9230
level1	TZ_1_023	2009	Invalid Votes	7180
level1	TZ_1_024	2009	Invalid Votes	20842
level1	TZ_1_025	2009	Invalid Votes	14736
level1	TZ_1_026	2009	Invalid Votes	14478
level1	TZ_1_027	2009	Invalid Votes	10826
level1	TZ_1_028	2009	Invalid Votes	27510
level1	TZ_1_029	2009	Invalid Votes	18150
level1	TZ_1_030	2009	Invalid Votes	4250
level1	TZ_1_021	2009	Invalid Votes	4210
country	NG	2009	Invalid Votes	844719
level1	SN_1_001	2009	Invalid Votes	5006
level1	SN_1_002	2009	Invalid Votes	2543
level1	SN_1_003	2009	Invalid Votes	1496
level1	SN_1_004	2009	Invalid Votes	1670
level1	SN_1_005	2009	Invalid Votes	1985
level1	SN_1_006	2009	Invalid Votes	480
level1	SN_1_007	2009	Invalid Votes	1923
level1	SN_1_008	2009	Invalid Votes	2025
level1	SN_1_009	2009	Invalid Votes	1544
level1	SN_1_010	2009	Invalid Votes	2083
level1	SN_1_011	2009	Invalid Votes	1406
level1	SN_1_012	2009	Invalid Votes	1581
level1	SN_1_013	2009	Invalid Votes	3227
level1	SN_1_014	2009	Invalid Votes	846
level1	NG_1_001	2009	Valid Votes	391045
level1	NG_1_002	2009	Valid Votes	636018
level1	NG_1_003	2009	Valid Votes	1017064
level1	NG_1_004	2009	Valid Votes	688584
level1	NG_1_005	2009	Valid Votes	1020338
level1	NG_1_006	2009	Valid Votes	367067
level1	NG_1_007	2009	Valid Votes	683264
level1	NG_1_008	2009	Valid Votes	501920
level1	NG_1_009	2009	Valid Votes	450514
level1	NG_1_010	2009	Valid Votes	1267773
level1	NG_1_011	2009	Valid Votes	363888
level1	NG_1_012	2009	Valid Votes	500451
level1	NG_1_013	2009	Valid Votes	300691
level1	NG_1_014	2009	Valid Votes	573173
level1	NG_1_015	2009	Valid Votes	306805
level1	NG_1_016	2009	Valid Votes	460599
level1	NG_1_017	2009	Valid Votes	702964
level1	NG_1_018	2009	Valid Votes	1037564
level1	NG_1_019	2009	Valid Votes	1617482
level1	NG_1_020	2009	Valid Votes	2128821
level1	NG_1_021	2009	Valid Votes	1449426
level1	NG_1_022	2009	Valid Votes	677003
level1	NG_1_023	2009	Valid Votes	421328
level1	NG_1_024	2009	Valid Votes	440080
level1	NG_1_025	2009	Valid Votes	1443686
level1	NG_1_026	2009	Valid Votes	511547
level1	NG_1_027	2009	Valid Votes	813671
level1	NG_1_028	2009	Valid Votes	533172
level1	NG_1_029	2009	Valid Votes	561056
level1	NG_1_030	2009	Valid Votes	642615
level1	NG_1_031	2009	Valid Votes	881352
level1	NG_1_032	2009	Valid Votes	982388
level1	NG_1_033	2009	Valid Votes	1565461
level1	NG_1_034	2009	Valid Votes	834259
level1	NG_1_035	2009	Valid Votes	579677
level1	NG_1_036	2009	Valid Votes	473796
level1	NG_1_037	2009	Valid Votes	761022
country	SN	2009	Valid Votes	2901800
country	TZ	2009	Valid Votes	15193862
level1	TZ_1_001	2009	Valid Votes	718835
level1	TZ_1_002	2009	Valid Votes	1592888
level1	TZ_1_003	2009	Valid Votes	684674
level1	TZ_1_004	2009	Valid Votes	541116
level1	TZ_1_005	2009	Valid Votes	378589
level1	TZ_1_006	2009	Valid Votes	771232
level1	TZ_1_007	2009	Valid Votes	66393
level1	TZ_1_008	2009	Valid Votes	65043
level1	TZ_1_009	2009	Valid Votes	181727
level1	TZ_1_010	2009	Valid Votes	505931
level1	TZ_1_011	2009	Valid Votes	567901
level1	TZ_1_012	2009	Valid Votes	62891
level1	TZ_1_013	2009	Valid Votes	51362
level1	TZ_1_014	2009	Valid Votes	835389
level1	TZ_1_015	2009	Valid Votes	500016
level1	TZ_1_016	2009	Valid Votes	616009
level1	TZ_1_017	2009	Valid Votes	983952
level1	TZ_1_018	2009	Valid Votes	819801
level1	TZ_1_019	2009	Valid Votes	531119
level1	TZ_1_020	2009	Valid Votes	906515
level1	TZ_1_022	2009	Valid Votes	440400
level1	TZ_1_023	2009	Valid Votes	312803
level1	TZ_1_024	2009	Valid Votes	470665
level1	TZ_1_025	2009	Valid Votes	465515
level1	TZ_1_026	2009	Valid Votes	508682
level1	TZ_1_027	2009	Valid Votes	413162
level1	TZ_1_028	2009	Valid Votes	614882
level1	TZ_1_029	2009	Valid Votes	606162
level1	TZ_1_030	2009	Valid Votes	169463
level1	TZ_1_021	2009	Valid Votes	268757
country	NG	2009	Valid Votes	28587564
level1	SN_1_001	2009	Valid Votes	749145
level1	SN_1_002	2009	Valid Votes	201478
level1	SN_1_003	2009	Valid Votes	136432
level1	SN_1_004	2009	Valid Votes	99351
level1	SN_1_005	2009	Valid Votes	183345
level1	SN_1_006	2009	Valid Votes	23289
level1	SN_1_007	2009	Valid Votes	104834
level1	SN_1_008	2009	Valid Votes	181857
level1	SN_1_009	2009	Valid Votes	108017
level1	SN_1_010	2009	Valid Votes	208559
level1	SN_1_011	2009	Valid Votes	81804
level1	SN_1_012	2009	Valid Votes	97778
level1	SN_1_013	2009	Valid Votes	368428
level1	SN_1_014	2009	Valid Votes	87642
\.


--
-- Name: valid_invalid_votes pk_valid_invalid_votes; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.valid_invalid_votes
    ADD CONSTRAINT pk_valid_invalid_votes PRIMARY KEY (geo_level, geo_code, geo_version, votes);


--
-- PostgreSQL database dump complete
--

