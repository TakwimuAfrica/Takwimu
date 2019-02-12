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
    total double precision
);


--
-- Data for Name: food_production; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.food_production (geo_level, geo_code, geo_version, crops, total) FROM stdin;
level1	NG_1_002	2009	Cotton	80920.2899999999936
level1	NG_1_002	2009	Sesame seed	1061.88000000000011
level1	NG_1_002	2009	Garlic	484.579999999999984
level1	NG_1_002	2009	Shea nuts	17705.2000000000007
level1	NG_1_002	2009	Sugarcane	50885.7200000000012
level1	NG_1_002	2009	Cocoa	1650.13000000000011
level1	NG_1_002	2009	Palm Oil	203.539999999999992
level1	NG_1_001	2009	Ginger	1940.94000000000005
level1	NG_1_001	2009	Cashew	278.129999999999995
level1	NG_1_001	2009	Cocoa	3340.76000000000022
level1	NG_1_001	2009	Coffee	598.610000000000014
level1	NG_1_001	2009	Palm Oil	49227.3600000000006
level1	NG_1_001	2009	Rubber	301.379999999999995
level1	NG_1_001	2009	Kolanut	281.589999999999975
level1	NG_1_003	2009	Cashew	143.860000000000014
level1	NG_1_003	2009	Cocoa	1253.08999999999992
level1	NG_1_003	2009	Palm Oil	135818.899999999994
level1	NG_1_003	2009	Kolanut	354.70999999999998
level1	NG_1_004	2009	Cashew	999.490000000000009
level1	NG_1_004	2009	Palm Oil	53463.239999999998
level1	NG_1_004	2009	Kolanut	2303
level1	NG_1_005	2009	Cotton	741.840000000000032
level1	NG_1_005	2009	Sesame seed	3796.69000000000005
level1	NG_1_005	2009	Gum Arabic	966.159999999999968
level1	NG_1_005	2009	Shea nuts	25623.630000000001
level1	NG_1_005	2009	Sugarcane	993.100000000000023
level1	NG_1_006	2009	Sugarcane	33599.7099999999991
level1	NG_1_006	2009	Cocoa	91.1099999999999994
level1	NG_1_006	2009	Palm Oil	15369.8600000000006
level1	NG_1_006	2009	Rubber	1658.28999999999996
level1	NG_1_007	2009	Sesame seed	19922.9500000000007
level1	NG_1_007	2009	Garlic	761.480000000000018
level1	NG_1_007	2009	Ginger	34434.7200000000012
level1	NG_1_007	2009	Shea nuts	27136.25
level1	NG_1_007	2009	Sugarcane	9020.60000000000036
level1	NG_1_007	2009	Cashew	580.769999999999982
level1	NG_1_007	2009	Palm Oil	47588.1399999999994
level1	NG_1_007	2009	Kolanut	3147.76999999999998
level1	NG_1_008	2009	Cotton	8850.48999999999978
level1	NG_1_008	2009	Sesame seed	2092.55999999999995
level1	NG_1_008	2009	Garlic	9909.10000000000036
level1	NG_1_008	2009	Ginger	6101.43000000000029
level1	NG_1_008	2009	Gum Arabic	6789.36999999999989
level1	NG_1_008	2009	Shea nuts	5900.63000000000011
level1	NG_1_008	2009	Sugarcane	2841.36000000000013
level1	NG_1_009	2009	Cashew	1016.63
level1	NG_1_009	2009	Cocoa	69421.4199999999983
level1	NG_1_009	2009	Coffee	4278.60000000000036
level1	NG_1_009	2009	Palm Oil	101741.979999999996
level1	NG_1_009	2009	Rubber	11491.3199999999997
level1	NG_1_009	2009	Kolanut	91.0600000000000023
level1	NG_1_010	2009	Sugarcane	3179.2800000000002
level1	NG_1_010	2009	Cashew	2107.5300000000002
level1	NG_1_010	2009	Cocoa	3927.92000000000007
level1	NG_1_010	2009	Palm Oil	104728.919999999998
level1	NG_1_010	2009	Rubber	15950.9300000000003
level1	NG_1_010	2009	Kolanut	650.110000000000014
level1	NG_1_011	2009	Ginger	2916.23000000000002
level1	NG_1_011	2009	Sugarcane	2806.86000000000013
level1	NG_1_011	2009	Cashew	2656.67000000000007
level1	NG_1_011	2009	Palm Oil	89718.9900000000052
level1	NG_1_012	2009	Sugarcane	10098.5200000000004
level1	NG_1_012	2009	Cashew	5236.60999999999967
level1	NG_1_012	2009	Cocoa	23678.9099999999999
level1	NG_1_012	2009	Coffee	2373.5300000000002
level1	NG_1_012	2009	Palm Oil	70876.8099999999977
level1	NG_1_012	2009	Rubber	6951.18000000000029
level1	NG_1_012	2009	Kolanut	291.079999999999984
level1	NG_1_013	2009	Cotton	49.4600000000000009
level1	NG_1_013	2009	Ginger	697.32000000000005
level1	NG_1_013	2009	Sugarcane	6486.14999999999964
level1	NG_1_013	2009	Cashew	2505.90000000000009
level1	NG_1_013	2009	Cocoa	36464.9100000000035
level1	NG_1_013	2009	Coffee	3281.05000000000018
level1	NG_1_013	2009	Palm Oil	60948.0599999999977
level1	NG_1_013	2009	Rubber	492.480000000000018
level1	NG_1_013	2009	Kolanut	11344.0300000000007
level1	NG_1_014	2009	Sugarcane	113.790000000000006
level1	NG_1_014	2009	Cashew	7663.10000000000036
level1	NG_1_014	2009	Palm Oil	56297.4700000000012
level1	NG_1_014	2009	Kolanut	1407.92000000000007
level1	NG_1_016	2009	Cotton	53682.75
level1	NG_1_016	2009	Sesame seed	3754.61999999999989
level1	NG_1_016	2009	Garlic	4104.06999999999971
level1	NG_1_016	2009	Ginger	13587.6800000000003
level1	NG_1_016	2009	Shea nuts	7664.53999999999996
level1	NG_1_016	2009	Sugarcane	11451.6200000000008
level1	NG_1_017	2009	Shea nuts	4098.77999999999975
level1	NG_1_017	2009	Cashew	8475.5
level1	NG_1_017	2009	Cocoa	10.2400000000000002
level1	NG_1_017	2009	Palm Oil	124435.139999999999
level1	NG_1_017	2009	Kolanut	87.4000000000000057
level1	NG_1_018	2009	Cotton	18259.2400000000016
level1	NG_1_018	2009	Sesame seed	30583.8400000000001
level1	NG_1_018	2009	Ginger	2125.5300000000002
level1	NG_1_018	2009	Gum Arabic	1858.05999999999995
level1	NG_1_018	2009	Shea nuts	33577.3399999999965
level1	NG_1_018	2009	Sugarcane	114174.779999999999
level1	NG_1_019	2009	Cotton	21325.5299999999988
level1	NG_1_019	2009	Sesame seed	2439.98000000000002
level1	NG_1_019	2009	Garlic	89
level1	NG_1_019	2009	Ginger	43135.1299999999974
level1	NG_1_019	2009	Shea nuts	35494.4000000000015
level1	NG_1_019	2009	Sugarcane	197208.510000000009
level1	NG_1_019	2009	Cashew	7241.10000000000036
level1	NG_1_019	2009	Palm Oil	4098.77999999999975
level1	NG_1_020	2009	Cotton	52077.4199999999983
level1	NG_1_020	2009	Sesame seed	3796.69000000000005
level1	NG_1_020	2009	Garlic	37350.7799999999988
level1	NG_1_020	2009	Ginger	7184.35999999999967
level1	NG_1_020	2009	Gum Arabic	1699.57999999999993
level1	NG_1_020	2009	Shea nuts	14772.1900000000005
level1	NG_1_020	2009	Sugarcane	401189.119999999995
level1	NG_1_020	2009	Cashew	2411.78999999999996
level1	NG_1_021	2009	Cotton	116611.850000000006
level1	NG_1_021	2009	Sesame seed	2955.32000000000016
level1	NG_1_021	2009	Garlic	29766.8499999999985
level1	NG_1_021	2009	Ginger	16580.0400000000009
level1	NG_1_021	2009	Gum Arabic	590.379999999999995
level1	NG_1_021	2009	Shea nuts	3712.19999999999982
level1	NG_1_021	2009	Sugarcane	192853.429999999993
level1	NG_1_021	2009	Cashew	805.629999999999995
level1	NG_1_022	2009	Cotton	15707.2999999999993
level1	NG_1_022	2009	Sesame seed	3754.61999999999989
level1	NG_1_022	2009	Garlic	3720.59999999999991
level1	NG_1_022	2009	Gum Arabic	885.57000000000005
level1	NG_1_022	2009	Shea nuts	11641.3999999999996
level1	NG_1_022	2009	Sugarcane	122543.410000000003
level1	NG_1_022	2009	Cashew	1003.30999999999995
level1	NG_1_023	2009	Cotton	197.819999999999993
level1	NG_1_023	2009	Sesame seed	1002.89999999999998
level1	NG_1_023	2009	Ginger	3408.71000000000004
level1	NG_1_023	2009	Shea nuts	28033.2400000000016
level1	NG_1_023	2009	Sugarcane	1789.6400000000001
level1	NG_1_023	2009	Cashew	986.450000000000045
level1	NG_1_023	2009	Cocoa	1062.97000000000003
level1	NG_1_023	2009	Coffee	5445.42000000000007
level1	NG_1_023	2009	Palm Oil	54395.1200000000026
level1	NG_1_023	2009	Rubber	165.830000000000013
level1	NG_1_023	2009	Kolanut	3521.84999999999991
level1	NG_1_024	2009	Shea nuts	24797.6399999999994
level1	NG_1_024	2009	Sugarcane	8782.68000000000029
level1	NG_1_024	2009	Cashew	38981.2099999999991
level1	NG_1_024	2009	Cocoa	1427.42000000000007
level1	NG_1_024	2009	Coffee	1385.68000000000006
level1	NG_1_024	2009	Palm Oil	3065.57000000000016
level1	NG_1_025	2009	Sugarcane	96.0699999999999932
level1	NG_1_025	2009	Cashew	844
level1	NG_1_025	2009	Cocoa	202.469999999999999
level1	NG_1_025	2009	Palm Oil	5007.10000000000036
level1	NG_1_025	2009	Kolanut	64.3400000000000034
level1	NG_1_026	2009	Sesame seed	40817.0199999999968
level1	NG_1_026	2009	Ginger	24981.0999999999985
level1	NG_1_026	2009	Shea nuts	1093.95000000000005
level1	NG_1_026	2009	Sugarcane	25561.8300000000017
level1	NG_1_026	2009	Cashew	978.269999999999982
level1	NG_1_026	2009	Palm Oil	5516.31999999999971
level1	NG_1_027	2009	Cotton	22829
level1	NG_1_027	2009	Sesame seed	1077.56999999999994
level1	NG_1_027	2009	Shea nuts	30130.9599999999991
level1	NG_1_027	2009	Sugarcane	19965.3600000000006
level1	NG_1_027	2009	Cashew	1927.75999999999999
level1	NG_1_027	2009	Palm Oil	8197.55999999999949
level1	NG_1_027	2009	Kolanut	18.5100000000000016
level1	NG_1_028	2009	Cotton	148.370000000000005
level1	NG_1_028	2009	Cashew	1083.76999999999998
level1	NG_1_028	2009	Cocoa	19903.0800000000017
level1	NG_1_028	2009	Coffee	1535.80999999999995
level1	NG_1_028	2009	Palm Oil	59165.4800000000032
level1	NG_1_028	2009	Rubber	3053.23999999999978
level1	NG_1_028	2009	Kolanut	51464.8300000000017
level1	NG_1_029	2009	Cotton	148.370000000000005
level1	NG_1_029	2009	Sugarcane	8182.68000000000029
level1	NG_1_029	2009	Cashew	1064.58999999999992
level1	NG_1_029	2009	Cocoa	92220.7899999999936
level1	NG_1_029	2009	Coffee	4008.82000000000016
level1	NG_1_029	2009	Palm Oil	101089.699999999997
level1	NG_1_029	2009	Rubber	5298.44999999999982
level1	NG_1_029	2009	Kolanut	50862.9700000000012
level1	NG_1_030	2009	Cotton	0
level1	NG_1_030	2009	Cashew	999.899999999999977
level1	NG_1_030	2009	Cocoa	74104.1499999999942
level1	NG_1_030	2009	Coffee	2363.55000000000018
level1	NG_1_030	2009	Palm Oil	71435.7100000000064
level1	NG_1_030	2009	Kolanut	37326.8099999999977
level1	NG_1_031	2009	Cotton	178.800000000000011
level1	NG_1_031	2009	Ginger	347.629999999999995
level1	NG_1_031	2009	Sugarcane	6279.25
level1	NG_1_031	2009	Cashew	987.860000000000014
level1	NG_1_031	2009	Cocoa	36059.9700000000012
level1	NG_1_031	2009	Coffee	1026.93000000000006
level1	NG_1_031	2009	Palm Oil	86470.0500000000029
level1	NG_1_031	2009	Kolanut	7616.21000000000004
level1	NG_1_032	2009	Sesame seed	1935.68000000000006
level1	NG_1_032	2009	Shea nuts	27628.0600000000013
level1	NG_1_032	2009	Sugarcane	28003.1800000000003
level1	NG_1_032	2009	Tea	1441.20000000000005
level1	NG_1_032	2009	Cashew	834.399999999999977
level1	NG_1_033	2009	Sugarcane	2968.94000000000005
level1	NG_1_033	2009	Cashew	8.35999999999999943
level1	NG_1_033	2009	Cocoa	303.70999999999998
level1	NG_1_033	2009	Palm Oil	16417.8300000000017
level1	NG_1_033	2009	Rubber	2656.88999999999987
level1	NG_1_033	2009	Kolanut	693.970000000000027
level1	NG_1_034	2009	Cotton	3204.76000000000022
level1	NG_1_034	2009	Sesame seed	588.960000000000036
level1	NG_1_034	2009	Garlic	39408.9300000000003
level1	NG_1_034	2009	Gum Arabic	994.509999999999991
level1	NG_1_034	2009	Sugarcane	98912.8899999999994
level1	NG_1_034	2009	Cashew	556.269999999999982
level1	NG_1_035	2009	Sesame seed	2797.55999999999995
level1	NG_1_035	2009	Ginger	3650.11999999999989
level1	NG_1_035	2009	Gum Arabic	751.389999999999986
level1	NG_1_035	2009	Shea nuts	20328.5499999999993
level1	NG_1_035	2009	Sugarcane	49289.1999999999971
level1	NG_1_035	2009	Tea	4170.80000000000018
level1	NG_1_035	2009	Cocoa	4885.94999999999982
level1	NG_1_035	2009	Coffee	6601.98999999999978
level1	NG_1_035	2009	Palm Oil	6085.30000000000018
level1	NG_1_035	2009	Kolanut	2704.76000000000022
level1	NG_1_036	2009	Cotton	2819.01000000000022
level1	NG_1_036	2009	Sesame seed	3291.86000000000013
level1	NG_1_036	2009	Garlic	3016.23999999999978
level1	NG_1_036	2009	Gum Arabic	8504.90999999999985
level1	NG_1_036	2009	Shea nuts	6763.43000000000029
level1	NG_1_037	2009	Cotton	135559.540000000008
level1	NG_1_037	2009	Garlic	21508.380000000001
level1	NG_1_037	2009	Ginger	5002.01000000000022
level1	NG_1_037	2009	Shea nuts	7316.94999999999982
level1	NG_1_037	2009	Sugarcane	17544.6599999999999
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
country	NG	2009	Cashew	93290
country	NG	2009	Cocoa	370009
country	NG	2009	Coffee	32900
country	NG	2009	Cotton	533312
country	NG	2009	Garlic	150120
country	NG	2009	Ginger	167294
country	NG	2009	Gum Arabic	23040
country	NG	2009	Kolanut	174233
country	NG	2009	Palm Oil	1331530
country	NG	2009	Rubber	48020
country	NG	2009	Sesame seed	127601
country	NG	2009	Shea nuts	336390
country	NG	2009	Sugarcane	1429574
country	NG	2009	Tea	5612
country	TZ	2009	Wheat	5085
country	TZ	2009	Bananas	95226
country	TZ	2009	Maize	143950
level1	TZ_1_001	2009	Wheat	5085
level1	TZ_1_001	2009	Bananas	95226.3399999999965
level1	TZ_1_001	2009	Maize	143950.670000000013
level1	TZ_1_003	2009	Cassava	51109.0199999999968
level1	TZ_1_003	2009	Maize	78016.2799999999988
level1	TZ_1_011	2009	Wheat	22452
level1	TZ_1_011	2009	Bananas	558025.630000000005
level1	TZ_1_011	2009	Cassava	53618
level1	TZ_1_011	2009	Maize	216489.450000000012
level1	TZ_1_028	2009	Bananas	56728.25
level1	TZ_1_028	2009	Cassava	366483.940000000002
level1	TZ_1_018	2009	Bananas	56728.25
level1	TZ_1_018	2009	Cassava	201718.079999999987
level1	TZ_1_018	2009	Maize	274909.700000000012
level1	TZ_1_022	2009	Maize	82073.3000000000029
level1	TZ_1_002	2009	Maize	1899.05999999999995
level1	TZ_1_014	2009	Cassava	154630.75
level1	TZ_1_014	2009	Maize	89477.5
level1	TZ_1_019	2009	Cassava	502708.950000000012
level1	TZ_1_019	2009	Maize	65577.5099999999948
level1	TZ_1_024	2009	Wheat	845
level1	TZ_1_024	2009	Bananas	24845.9399999999987
level1	TZ_1_024	2009	Cassava	259647.920000000013
level1	TZ_1_024	2009	Maize	289587.760000000009
level1	TZ_1_005	2009	Wheat	11488
level1	TZ_1_005	2009	Cassava	30617.119999999999
level1	TZ_1_005	2009	Maize	393164.200000000012
level1	TZ_1_017	2009	Wheat	6408
level1	TZ_1_017	2009	Bananas	550169.550000000047
level1	TZ_1_017	2009	Cassava	87312.8600000000006
level1	TZ_1_017	2009	Maize	621544.849999999977
level1	TZ_1_027	2009	Cassava	40734.2200000000012
level1	TZ_1_029	2009	Cassava	88923.3600000000006
level1	TZ_1_023	2009	Wheat	4226
level1	TZ_1_023	2009	Bananas	97414.3600000000006
level1	TZ_1_023	2009	Cassava	241028.779999999999
level1	TZ_1_023	2009	Maize	372830.390000000014
level1	TZ_1_010	2009	Bananas	342583.659999999974
level1	TZ_1_010	2009	Cassava	368525.469999999972
level1	TZ_1_010	2009	Maize	170670.839999999997
level1	TZ_1_025	2009	Cassava	551818.290000000037
level1	TZ_1_006	2009	Bananas	1150200.32000000007
level1	TZ_1_006	2009	Cassava	332324.570000000007
level1	TZ_1_006	2009	Maize	182630.25
level1	TZ_1_020	2009	Bananas	2249.84000000000015
level1	TZ_1_020	2009	Cassava	254933.709999999992
level1	TZ_1_020	2009	Maize	202146.070000000007
level1	TZ_1_016	2009	Bananas	120020.309999999998
level1	TZ_1_016	2009	Cassava	432224.039999999979
level1	TZ_1_016	2009	Maize	169451.829999999987
level1	TZ_1_015	2009	Maize	240969.549999999988
level1	KE_1_023	2009	maize	1310
level1	KE_1_023	2009	wheat	0
level1	KE_1_023	2009	barley	0
level1	KE_1_023	2009	rice	0
level1	KE_1_023	2009	sorghum	1438
level1	KE_1_023	2009	millet	0
level1	KE_1_023	2009	beans	0
level1	KE_1_023	2009	cowpeas	0
level1	KE_1_023	2009	greengrams	145
level1	KE_1_023	2009	sweetpotatoes	2
level1	KE_1_023	2009	cassava	0
level1	KE_1_023	2009	irishpotatoes	0
level1	KE_1_023	2009	cocoyam	0
level1	KE_1_015	2009	greengrams	89487
level1	KE_1_015	2009	maize	84763
level1	KE_1_015	2009	wheat	0
level1	KE_1_015	2009	barley	0
level1	KE_1_015	2009	rice	0
level1	KE_1_015	2009	sorghum	59530
level1	KE_1_015	2009	millet	53735
level1	KE_1_015	2009	beans	32155
level1	KE_1_015	2009	cowpeas	89161
level1	KE_1_015	2009	sweetpotatoes	484
level1	KE_1_015	2009	cassava	915
level1	KE_1_015	2009	irishpotatoes	0
level1	KE_1_015	2009	cocoyam	0
level1	KE_1_047	2009	maize	913
level1	KE_1_047	2009	wheat	0
level1	KE_1_047	2009	barley	0
level1	KE_1_047	2009	rice	0
level1	KE_1_047	2009	sorghum	913
level1	KE_1_047	2009	millet	0
level1	KE_1_047	2009	beans	676
level1	KE_1_047	2009	cowpeas	33
level1	KE_1_047	2009	greengrams	3
level1	KE_1_047	2009	sweetpotatoes	25
level1	KE_1_047	2009	cassava	18
level1	KE_1_047	2009	irishpotatoes	94
level1	KE_1_047	2009	cocoyam	0
level1	KE_1_022	2009	maize	24450
level1	KE_1_022	2009	wheat	0
level1	KE_1_022	2009	barley	0
level1	KE_1_022	2009	rice	0
level1	KE_1_022	2009	sorghum	0
level1	KE_1_022	2009	millet	0
level1	KE_1_022	2009	beans	13834
level1	KE_1_022	2009	cowpeas	0
level1	KE_1_022	2009	greengrams	0
level1	KE_1_022	2009	sweetpotatoes	50
level1	KE_1_022	2009	cassava	111
level1	KE_1_022	2009	irishpotatoes	15483
level1	KE_1_022	2009	cocoyam	0
level1	KE_1_020	2009	maize	32992
level1	KE_1_020	2009	wheat	0
level1	KE_1_020	2009	barley	0
level1	KE_1_020	2009	rice	10465
level1	KE_1_020	2009	sorghum	276
level1	KE_1_020	2009	millet	12
level1	KE_1_020	2009	beans	24199
level1	KE_1_020	2009	cowpeas	361
level1	KE_1_020	2009	greengrams	405
level1	KE_1_020	2009	sweetpotatoes	834
level1	KE_1_020	2009	cassava	123
level1	KE_1_020	2009	irishpotatoes	839
level1	KE_1_020	2009	cocoyam	7
level1	KE_1_021	2009	maize	61543
level1	KE_1_021	2009	wheat	0
level1	KE_1_021	2009	barley	0
level1	KE_1_021	2009	rice	103
level1	KE_1_021	2009	sorghum	204
level1	KE_1_021	2009	millet	0
level1	KE_1_021	2009	beans	43244
level1	KE_1_021	2009	cowpeas	819
level1	KE_1_021	2009	greengrams	313
level1	KE_1_021	2009	sweetpotatoes	467
level1	KE_1_021	2009	cassava	361
level1	KE_1_021	2009	irishpotatoes	7294
level1	KE_1_021	2009	cocoyam	213
level1	KE_1_018	2009	maize	10366
level1	KE_1_018	2009	wheat	1455
level1	KE_1_018	2009	barley	25
level1	KE_1_018	2009	rice	0
level1	KE_1_018	2009	sorghum	35
level1	KE_1_018	2009	millet	0
level1	KE_1_018	2009	beans	4561
level1	KE_1_018	2009	cowpeas	0
level1	KE_1_018	2009	greengrams	0
level1	KE_1_018	2009	sweetpotatoes	21
level1	KE_1_018	2009	cassava	11
level1	KE_1_018	2009	irishpotatoes	22270
level1	KE_1_018	2009	cocoyam	0
level1	KE_1_019	2009	maize	61543
level1	KE_1_019	2009	wheat	4280
level1	KE_1_019	2009	barley	0
level1	KE_1_019	2009	rice	103
level1	KE_1_019	2009	sorghum	204
level1	KE_1_019	2009	millet	0
level1	KE_1_019	2009	beans	43244
level1	KE_1_019	2009	cowpeas	509
level1	KE_1_019	2009	greengrams	0
level1	KE_1_019	2009	sweetpotatoes	467
level1	KE_1_019	2009	cassava	361
level1	KE_1_019	2009	irishpotatoes	7294
level1	KE_1_019	2009	cocoyam	213
level1	KE_1_003	2009	maize	653
level1	KE_1_003	2009	wheat	0
level1	KE_1_003	2009	barley	0
level1	KE_1_003	2009	rice	179
level1	KE_1_003	2009	sorghum	363
level1	KE_1_003	2009	millet	4
level1	KE_1_003	2009	beans	34
level1	KE_1_003	2009	cowpeas	8929
level1	KE_1_003	2009	greengrams	3389
level1	KE_1_003	2009	sweetpotatoes	275
level1	KE_1_003	2009	cassava	5779
level1	KE_1_003	2009	irishpotatoes	0
level1	KE_1_003	2009	cocoyam	0
level1	KE_1_002	2009	maize	34644
level1	KE_1_002	2009	wheat	0
level1	KE_1_002	2009	barley	0
level1	KE_1_002	2009	rice	1273
level1	KE_1_002	2009	sorghum	153
level1	KE_1_002	2009	millet	4
level1	KE_1_002	2009	beans	284
level1	KE_1_002	2009	cowpeas	4619
level1	KE_1_002	2009	greengrams	4080
level1	KE_1_002	2009	sweetpotatoes	802
level1	KE_1_002	2009	cassava	6475
level1	KE_1_002	2009	irishpotatoes	0
level1	KE_1_002	2009	cocoyam	0
level1	KE_1_005	2009	maize	35261
level1	KE_1_005	2009	wheat	0
level1	KE_1_005	2009	barley	0
level1	KE_1_005	2009	rice	91
level1	KE_1_005	2009	sorghum	273
level1	KE_1_005	2009	millet	273
level1	KE_1_005	2009	beans	0
level1	KE_1_005	2009	cowpeas	3620
level1	KE_1_005	2009	greengrams	3154
level1	KE_1_005	2009	sweetpotatoes	25
level1	KE_1_005	2009	cassava	1279
level1	KE_1_005	2009	irishpotatoes	0
level1	KE_1_005	2009	cocoyam	0
level1	KE_1_001	2009	maize	653
level1	KE_1_001	2009	wheat	0
level1	KE_1_001	2009	barley	0
level1	KE_1_001	2009	rice	0
level1	KE_1_001	2009	sorghum	0
level1	KE_1_001	2009	millet	0
level1	KE_1_001	2009	beans	0
level1	KE_1_001	2009	cowpeas	297
level1	KE_1_001	2009	greengrams	297
level1	KE_1_001	2009	sweetpotatoes	7
level1	KE_1_001	2009	cassava	226
level1	KE_1_041	2009	cocoyam	0
level1	KE_1_001	2009	irishpotatoes	0
level1	KE_1_001	2009	cocoyam	0
level1	KE_1_006	2009	maize	653
level1	KE_1_006	2009	wheat	0
level1	KE_1_006	2009	barley	0
level1	KE_1_006	2009	rice	265
level1	KE_1_006	2009	sorghum	474
level1	KE_1_006	2009	millet	32
level1	KE_1_006	2009	beans	2361
level1	KE_1_006	2009	cowpeas	1351
level1	KE_1_006	2009	greengrams	2164
level1	KE_1_006	2009	sweetpotatoes	77
level1	KE_1_006	2009	cassava	58
level1	KE_1_006	2009	irishpotatoes	0
level1	KE_1_006	2009	cocoyam	0
level1	KE_1_004	2009	maize	9582
level1	KE_1_004	2009	wheat	0
level1	KE_1_004	2009	barley	0
level1	KE_1_004	2009	rice	1355
level1	KE_1_004	2009	sorghum	131
level1	KE_1_004	2009	millet	0
level1	KE_1_004	2009	beans	0
level1	KE_1_004	2009	cowpeas	1334
level1	KE_1_004	2009	greengrams	2175
level1	KE_1_004	2009	sweetpotatoes	88
level1	KE_1_004	2009	cassava	189
level1	KE_1_004	2009	irishpotatoes	0
level1	KE_1_004	2009	cocoyam	0
level1	KE_1_014	2009	maize	26720
level1	KE_1_014	2009	wheat	0
level1	KE_1_014	2009	barley	0
level1	KE_1_014	2009	rice	5
level1	KE_1_014	2009	sorghum	5386
level1	KE_1_014	2009	millet	2799
level1	KE_1_014	2009	beans	20330
level1	KE_1_014	2009	cowpeas	7231
level1	KE_1_014	2009	greengrams	7436
level1	KE_1_014	2009	sweetpotatoes	213
level1	KE_1_014	2009	cassava	210
level1	KE_1_014	2009	irishpotatoes	195
level1	KE_1_014	2009	cocoyam	81
level1	KE_1_011	2009	maize	1385
level1	KE_1_011	2009	wheat	0
level1	KE_1_011	2009	barley	0
level1	KE_1_011	2009	rice	0
level1	KE_1_011	2009	sorghum	45
level1	KE_1_011	2009	millet	0
level1	KE_1_011	2009	beans	2267
level1	KE_1_011	2009	cowpeas	70
level1	KE_1_011	2009	greengrams	60
level1	KE_1_011	2009	sweetpotatoes	42
level1	KE_1_011	2009	cassava	0
level1	KE_1_011	2009	irishpotatoes	0
level1	KE_1_011	2009	cocoyam	0
level1	KE_1_016	2009	maize	139090
level1	KE_1_016	2009	wheat	0
level1	KE_1_016	2009	barley	0
level1	KE_1_016	2009	rice	0
level1	KE_1_016	2009	sorghum	9693
level1	KE_1_016	2009	millet	1853
level1	KE_1_016	2009	beans	64369
level1	KE_1_016	2009	cowpeas	35247
level1	KE_1_016	2009	greengrams	12097
level1	KE_1_016	2009	sweetpotatoes	3562
level1	KE_1_016	2009	cassava	3216
level1	KE_1_016	2009	irishpotatoes	10
level1	KE_1_016	2009	cocoyam	0
level1	KE_1_017	2009	maize	181089
level1	KE_1_017	2009	wheat	0
level1	KE_1_017	2009	barley	0
level1	KE_1_017	2009	rice	0
level1	KE_1_017	2009	sorghum	16306
level1	KE_1_017	2009	millet	11322
level1	KE_1_017	2009	beans	37367
level1	KE_1_017	2009	cowpeas	97103
level1	KE_1_017	2009	greengrams	89444
level1	KE_1_017	2009	sweetpotatoes	4802
level1	KE_1_017	2009	cassava	4988
level1	KE_1_017	2009	irishpotatoes	137
level1	KE_1_017	2009	cocoyam	0
level1	KE_1_010	2009	maize	1571
level1	KE_1_010	2009	wheat	37
level1	KE_1_010	2009	barley	0
level1	KE_1_010	2009	rice	0
level1	KE_1_010	2009	sorghum	13
level1	KE_1_010	2009	millet	0
level1	KE_1_010	2009	beans	627
level1	KE_1_010	2009	cowpeas	8
level1	KE_1_010	2009	greengrams	7
level1	KE_1_010	2009	sweetpotatoes	0
level1	KE_1_010	2009	cassava	2
level1	KE_1_010	2009	irishpotatoes	0
level1	KE_1_010	2009	cocoyam	0
level1	KE_1_012	2009	maize	110489
level1	KE_1_012	2009	wheat	11600
level1	KE_1_012	2009	barley	20600
level1	KE_1_012	2009	rice	111
level1	KE_1_012	2009	sorghum	12451
level1	KE_1_012	2009	millet	6853
level1	KE_1_012	2009	beans	142009
level1	KE_1_012	2009	cowpeas	8990
level1	KE_1_012	2009	greengrams	7692
level1	KE_1_012	2009	sweetpotatoes	1230
level1	KE_1_012	2009	cassava	731
level1	KE_1_012	2009	irishpotatoes	14916
level1	KE_1_012	2009	cocoyam	0
level1	KE_1_013	2009	maize	29916
level1	KE_1_013	2009	wheat	0
level1	KE_1_013	2009	barley	0
level1	KE_1_013	2009	rice	28
level1	KE_1_013	2009	sorghum	21227
level1	KE_1_013	2009	millet	20778
level1	KE_1_013	2009	beans	9436
level1	KE_1_013	2009	cowpeas	16509
level1	KE_1_013	2009	greengrams	30584
level1	KE_1_013	2009	sweetpotatoes	244
level1	KE_1_013	2009	cassava	462
level1	KE_1_030	2009	maize	34960
level1	KE_1_013	2009	irishpotatoes	42
level1	KE_1_013	2009	cocoyam	92
level1	KE_1_007	2009	maize	245
level1	KE_1_007	2009	wheat	0
level1	KE_1_007	2009	barley	0
level1	KE_1_007	2009	rice	30
level1	KE_1_007	2009	sorghum	35
level1	KE_1_007	2009	millet	0
level1	KE_1_007	2009	beans	0
level1	KE_1_007	2009	cowpeas	85
level1	KE_1_007	2009	greengrams	105
level1	KE_1_007	2009	sweetpotatoes	0
level1	KE_1_007	2009	cassava	0
level1	KE_1_007	2009	irishpotatoes	0
level1	KE_1_007	2009	cocoyam	0
level1	KE_1_009	2009	maize	2682
level1	KE_1_009	2009	wheat	0
level1	KE_1_009	2009	barley	0
level1	KE_1_009	2009	rice	0
level1	KE_1_009	2009	sorghum	961
level1	KE_1_009	2009	millet	0
level1	KE_1_009	2009	beans	0
level1	KE_1_009	2009	cowpeas	1276
level1	KE_1_009	2009	greengrams	132
level1	KE_1_009	2009	sweetpotatoes	0
level1	KE_1_009	2009	cassava	0
level1	KE_1_009	2009	irishpotatoes	0
level1	KE_1_009	2009	cocoyam	0
level1	KE_1_008	2009	maize	660
level1	KE_1_008	2009	wheat	0
level1	KE_1_008	2009	barley	0
level1	KE_1_008	2009	rice	0
level1	KE_1_008	2009	sorghum	440
level1	KE_1_008	2009	millet	0
level1	KE_1_008	2009	beans	0
level1	KE_1_008	2009	cowpeas	219
level1	KE_1_008	2009	greengrams	120
level1	KE_1_008	2009	sweetpotatoes	0
level1	KE_1_008	2009	cassava	0
level1	KE_1_008	2009	irishpotatoes	0
level1	KE_1_008	2009	cocoyam	0
level1	KE_1_043	2009	maize	79667
level1	KE_1_043	2009	wheat	0
level1	KE_1_043	2009	barley	0
level1	KE_1_043	2009	rice	5223
level1	KE_1_043	2009	sorghum	20401
level1	KE_1_043	2009	millet	1785
level1	KE_1_043	2009	beans	40583
level1	KE_1_043	2009	cowpeas	476
level1	KE_1_043	2009	greengrams	762
level1	KE_1_043	2009	sweetpotatoes	7839
level1	KE_1_043	2009	cassava	4884
level1	KE_1_043	2009	irishpotatoes	2697
level1	KE_1_043	2009	cocoyam	1531
level1	KE_1_045	2009	maize	62210
level1	KE_1_045	2009	wheat	0
level1	KE_1_045	2009	barley	0
level1	KE_1_045	2009	rice	0
level1	KE_1_045	2009	sorghum	113
level1	KE_1_045	2009	millet	7357
level1	KE_1_045	2009	beans	47842
level1	KE_1_045	2009	cowpeas	511
level1	KE_1_045	2009	greengrams	0
level1	KE_1_045	2009	sweetpotatoes	1161
level1	KE_1_045	2009	cassava	109
level1	KE_1_045	2009	irishpotatoes	160
level1	KE_1_045	2009	cocoyam	0
level1	KE_1_042	2009	maize	27150
level1	KE_1_042	2009	wheat	0
level1	KE_1_042	2009	barley	0
level1	KE_1_042	2009	rice	4540
level1	KE_1_042	2009	sorghum	11160
level1	KE_1_042	2009	millet	23
level1	KE_1_042	2009	beans	8095
level1	KE_1_042	2009	cowpeas	1462
level1	KE_1_042	2009	greengrams	1423
level1	KE_1_042	2009	sweetpotatoes	1573
level1	KE_1_042	2009	cassava	1106
level1	KE_1_042	2009	irishpotatoes	0
level1	KE_1_042	2009	cocoyam	0
level1	KE_1_044	2009	maize	67485
level1	KE_1_044	2009	wheat	0
level1	KE_1_044	2009	barley	0
level1	KE_1_044	2009	rice	681
level1	KE_1_044	2009	sorghum	5373
level1	KE_1_044	2009	millet	390
level1	KE_1_044	2009	beans	19698
level1	KE_1_044	2009	cowpeas	334
level1	KE_1_044	2009	greengrams	132
level1	KE_1_044	2009	sweetpotatoes	10995
level1	KE_1_044	2009	cassava	6639
level1	KE_1_044	2009	irishpotatoes	0
level1	KE_1_044	2009	cocoyam	0
level1	KE_1_046	2009	maize	35549
level1	KE_1_046	2009	wheat	0
level1	KE_1_046	2009	rice	0
level1	KE_1_046	2009	sorghum	93
level1	KE_1_046	2009	millet	8688
level1	KE_1_046	2009	beans	24615
level1	KE_1_046	2009	cowpeas	0
level1	KE_1_046	2009	greengrams	0
level1	KE_1_046	2009	sweetpotatoes	440
level1	KE_1_046	2009	cassava	80
level1	KE_1_046	2009	irishpotatoes	41
level1	KE_1_046	2009	cocoyam	0
level1	KE_1_041	2009	maize	78132
level1	KE_1_041	2009	wheat	0
level1	KE_1_041	2009	barley	0
level1	KE_1_041	2009	rice	2648
level1	KE_1_041	2009	sorghum	15986
level1	KE_1_041	2009	millet	179
level1	KE_1_041	2009	beans	47915
level1	KE_1_041	2009	cowpeas	597
level1	KE_1_041	2009	greengrams	833
level1	KE_1_041	2009	sweetpotatoes	3476
level1	KE_1_041	2009	cassava	2987
level1	KE_1_041	2009	irishpotatoes	0
level1	KE_1_030	2009	wheat	0
level1	KE_1_030	2009	barley	0
level1	KE_1_030	2009	rice	40
level1	KE_1_030	2009	sorghum	849
level1	KE_1_030	2009	millet	2301
level1	KE_1_030	2009	beans	17788
level1	KE_1_030	2009	cowpeas	285
level1	KE_1_030	2009	greengrams	551
level1	KE_1_030	2009	sweetpotatoes	361
level1	KE_1_030	2009	cassava	118
level1	KE_1_030	2009	irishpotatoes	2013
level1	KE_1_030	2009	cocoyam	0
level1	KE_1_036	2009	maize	30940
level1	KE_1_036	2009	wheat	0
level1	KE_1_036	2009	barley	0
level1	KE_1_036	2009	rice	0
level1	KE_1_036	2009	sorghum	442
level1	KE_1_036	2009	millet	992
level1	KE_1_036	2009	beans	31857
level1	KE_1_036	2009	cowpeas	0
level1	KE_1_036	2009	greengrams	0
level1	KE_1_036	2009	sweetpotatoes	2333
level1	KE_1_036	2009	cassava	23
level1	KE_1_036	2009	irishpotatoes	0
level1	KE_1_036	2009	cocoyam	0
level1	KE_1_028	2009	maize	27620
level1	KE_1_028	2009	wheat	105
level1	KE_1_028	2009	barley	0
level1	KE_1_028	2009	rice	14
level1	KE_1_028	2009	sorghum	769
level1	KE_1_028	2009	millet	2407
level1	KE_1_028	2009	beans	14894
level1	KE_1_028	2009	cowpeas	129
level1	KE_1_028	2009	greengrams	579
level1	KE_1_028	2009	sweetpotatoes	58
level1	KE_1_028	2009	cassava	226
level1	KE_1_028	2009	irishpotatoes	11637
level1	KE_1_028	2009	cocoyam	0
level1	KE_1_034	2009	maize	31020
level1	KE_1_034	2009	wheat	0
level1	KE_1_034	2009	barley	0
level1	KE_1_034	2009	rice	0
level1	KE_1_034	2009	sorghum	55
level1	KE_1_034	2009	millet	26
level1	KE_1_034	2009	beans	42550
level1	KE_1_034	2009	cowpeas	58
level1	KE_1_034	2009	greengrams	35
level1	KE_1_034	2009	sweetpotatoes	3
level1	KE_1_034	2009	cassava	3
level1	KE_1_034	2009	irishpotatoes	1091
level1	KE_1_034	2009	cocoyam	0
level1	KE_1_035	2009	maize	41041
level1	KE_1_035	2009	wheat	0
level1	KE_1_035	2009	barley	0
level1	KE_1_035	2009	rice	0
level1	KE_1_035	2009	sorghum	957
level1	KE_1_035	2009	millet	618
level1	KE_1_035	2009	beans	19804
level1	KE_1_035	2009	cowpeas	0
level1	KE_1_035	2009	greengrams	0
level1	KE_1_035	2009	sweetpotatoes	735
level1	KE_1_035	2009	cassava	0
level1	KE_1_035	2009	irishpotatoes	0
level1	KE_1_035	2009	cocoyam	0
level1	KE_1_031	2009	maize	6175
level1	KE_1_031	2009	wheat	5145
level1	KE_1_031	2009	barley	0
level1	KE_1_031	2009	rice	0
level1	KE_1_031	2009	sorghum	57
level1	KE_1_031	2009	millet	0
level1	KE_1_031	2009	beans	1659
level1	KE_1_031	2009	cowpeas	8
level1	KE_1_031	2009	greengrams	0
level1	KE_1_031	2009	sweetpotatoes	70
level1	KE_1_031	2009	cassava	17
level1	KE_1_031	2009	irishpotatoes	484
level1	KE_1_031	2009	cocoyam	0
level1	KE_1_032	2009	maize	86504
level1	KE_1_032	2009	wheat	32057
level1	KE_1_032	2009	barley	30456
level1	KE_1_032	2009	rice	0
level1	KE_1_032	2009	sorghum	1330
level1	KE_1_032	2009	millet	3456
level1	KE_1_032	2009	beans	43946
level1	KE_1_032	2009	cowpeas	59
level1	KE_1_032	2009	greengrams	0
level1	KE_1_032	2009	sweetpotatoes	217
level1	KE_1_032	2009	cassava	111
level1	KE_1_032	2009	irishpotatoes	34744
level1	KE_1_032	2009	cocoyam	0
level1	KE_1_029	2009	maize	74045
level1	KE_1_029	2009	wheat	43
level1	KE_1_029	2009	barley	0
level1	KE_1_029	2009	rice	0
level1	KE_1_029	2009	sorghum	181
level1	KE_1_029	2009	millet	172
level1	KE_1_029	2009	beans	37964
level1	KE_1_029	2009	cowpeas	0
level1	KE_1_029	2009	greengrams	0
level1	KE_1_029	2009	sweetpotatoes	102
level1	KE_1_029	2009	cassava	84
level1	KE_1_029	2009	irishpotatoes	384
level1	KE_1_029	2009	cocoyam	0
level1	KE_1_033	2009	maize	112079
level1	KE_1_033	2009	wheat	70884
level1	KE_1_033	2009	barley	140126
level1	KE_1_033	2009	rice	0
level1	KE_1_033	2009	sorghum	1437
level1	KE_1_033	2009	millet	1443
level1	KE_1_033	2009	beans	30346
level1	KE_1_033	2009	cowpeas	58
level1	KE_1_033	2009	greengrams	0
level1	KE_1_033	2009	sweetpotatoes	2062
level1	KE_1_033	2009	cassava	55
level1	KE_1_033	2009	irishpotatoes	10173
level1	KE_1_033	2009	cocoyam	0
level1	KE_1_025	2009	maize	1973
level1	KE_1_025	2009	wheat	600
level1	KE_1_025	2009	barley	450
level1	KE_1_025	2009	rice	0
level1	KE_1_025	2009	sorghum	10
level1	KE_1_025	2009	millet	9
level1	KE_1_025	2009	beans	840
level1	KE_1_025	2009	cowpeas	11
level1	KE_1_025	2009	greengrams	15
level1	KE_1_025	2009	sweetpotatoes	1
level1	KE_1_025	2009	cassava	3
level1	KE_1_025	2009	irishpotatoes	0
level1	KE_1_025	2009	cocoyam	0
level1	KE_1_026	2009	maize	106778
level1	KE_1_026	2009	wheat	1870
level1	KE_1_026	2009	barley	0
level1	KE_1_026	2009	rice	0
level1	KE_1_026	2009	sorghum	189
level1	KE_1_026	2009	millet	860
level1	KE_1_026	2009	beans	13740
level1	KE_1_026	2009	cowpeas	120
level1	KE_1_026	2009	greengrams	0
level1	KE_1_026	2009	sweetpotatoes	226
level1	KE_1_026	2009	cassava	76
level1	KE_1_026	2009	irishpotatoes	87
level1	KE_1_026	2009	cocoyam	0
level1	KE_1_027	2009	maize	96654
level1	KE_1_027	2009	wheat	18829
level1	KE_1_027	2009	barley	875
level1	KE_1_027	2009	rice	0
level1	KE_1_027	2009	sorghum	1438
level1	KE_1_027	2009	millet	284
level1	KE_1_027	2009	beans	15992
level1	KE_1_027	2009	cowpeas	0
level1	KE_1_027	2009	greengrams	0
level1	KE_1_027	2009	sweetpotatoes	87
level1	KE_1_027	2009	cassava	11
level1	KE_1_027	2009	irishpotatoes	1132
level1	KE_1_027	2009	cocoyam	0
level1	KE_1_024	2009	maize	19748
level1	KE_1_024	2009	wheat	0
level1	KE_1_024	2009	barley	0
level1	KE_1_024	2009	rice	0
level1	KE_1_024	2009	sorghum	560
level1	KE_1_024	2009	millet	337
level1	KE_1_024	2009	beans	7630
level1	KE_1_024	2009	cowpeas	0
level1	KE_1_024	2009	greengrams	50
level1	KE_1_024	2009	sweetpotatoes	6
level1	KE_1_024	2009	cassava	0
level1	KE_1_024	2009	irishpotatoes	0
level1	KE_1_024	2009	cocoyam	0
level1	KE_1_039	2009	maize	98074
level1	KE_1_039	2009	wheat	305
level1	KE_1_039	2009	barley	0
level1	KE_1_039	2009	rice	115
level1	KE_1_039	2009	sorghum	1565
level1	KE_1_039	2009	millet	4760
level1	KE_1_039	2009	beans	57578
level1	KE_1_039	2009	cowpeas	0
level1	KE_1_039	2009	greengrams	471
level1	KE_1_039	2009	sweetpotatoes	5499
level1	KE_1_039	2009	cassava	1567
level1	KE_1_039	2009	irishpotatoes	1396
level1	KE_1_039	2009	cocoyam	0
level1	KE_1_040	2009	maize	50400
level1	KE_1_040	2009	wheat	0
level1	KE_1_040	2009	barley	0
level1	KE_1_040	2009	rice	964
level1	KE_1_040	2009	sorghum	13109
level1	KE_1_040	2009	millet	4500
level1	KE_1_040	2009	beans	19100
level1	KE_1_040	2009	cowpeas	0
level1	KE_1_040	2009	greengrams	1018
level1	KE_1_040	2009	sweetpotatoes	6395
level1	KE_1_040	2009	cassava	19580
level1	KE_1_040	2009	irishpotatoes	0
level1	KE_1_040	2009	cocoyam	0
level1	KE_1_037	2009	maize	70993
level1	KE_1_037	2009	wheat	0
level1	KE_1_037	2009	barley	0
level1	KE_1_037	2009	rice	104
level1	KE_1_037	2009	sorghum	830
level1	KE_1_037	2009	millet	534
level1	KE_1_037	2009	beans	48126
level1	KE_1_037	2009	cowpeas	0
level1	KE_1_037	2009	greengrams	8
level1	KE_1_037	2009	sweetpotatoes	2998
level1	KE_1_037	2009	cassava	341
level1	KE_1_037	2009	irishpotatoes	16
level1	KE_1_037	2009	cocoyam	0
level1	KE_1_038	2009	maize	23772
level1	KE_1_038	2009	wheat	0
level1	KE_1_038	2009	barley	0
level1	KE_1_038	2009	rice	54
level1	KE_1_038	2009	sorghum	358
level1	KE_1_038	2009	millet	45
level1	KE_1_038	2009	beans	18851
level1	KE_1_038	2009	cowpeas	0
level1	KE_1_038	2009	greengrams	2
level1	KE_1_038	2009	sweetpotatoes	715
level1	KE_1_038	2009	cassava	191
level1	KE_1_038	2009	irishpotatoes	0
level1	KE_1_038	2009	cocoyam	0
country	KE	2009	maize	2116141
country	KE	2009	wheat	147210
country	KE	2009	barley	210532
country	KE	2009	rice	28390
country	KE	2009	sorghum	213520
country	KE	2009	millet	138829
country	KE	2009	beans	1052408
country	KE	2009	cowpeas	281877
country	KE	2009	greengrams	259167
country	KE	2009	sweetpotatoes	61067
country	KE	2009	cassava	63725
country	KE	2009	irishpotatoes	134630
country	KE	2009	cocoyam	2155
\.


--
-- Name: food_production pk_food_production; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.food_production
    ADD CONSTRAINT pk_food_production PRIMARY KEY (geo_level, geo_code, geo_version, crops);


--
-- PostgreSQL database dump complete
--

