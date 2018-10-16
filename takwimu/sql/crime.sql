--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.2
-- Dumped by pg_dump version 9.6.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

ALTER TABLE IF EXISTS ONLY public.crime DROP CONSTRAINT IF EXISTS pk_crime;
DROP TABLE IF EXISTS public.crime;
SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: crime; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE crime (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    crime character varying(128) NOT NULL,
    total integer NOT NULL,
    geo_version character varying(100) NOT NULL
);


--
-- Data for Name: crime; Type: TABLE DATA; Schema: public; Owner: -
--

COPY crime (geo_level, geo_code, crime, total, geo_version) FROM stdin;
province	KZN	Theft out of or from motor vehicle	18289	2009
province	EC	Attempted murder	1858	2009
province	MP	Assault with the intent to inflict grievous bodily harm	10803	2009
province	GT	Driving under the influence of alcohol or drugs	26100	2009
province	LIM	Common assault	9509	2009
province	WC	Assault with the intent to inflict grievous bodily harm	24846	2009
province	LIM	Robbery at non-residential premises	1414	2009
province	NW	Neglect and ill-treatment of children	199	2009
province	WC	Culpable homicide	998	2009
province	EC	Common robbery	4021	2009
province	NW	Common assault	6783	2009
province	FS	Burglary at residential premises	16363	2009
province	LIM	Neglect and ill-treatment of children	201	2009
province	MP	Culpable homicide	1185	2009
province	NW	Robbery at non-residential premises	1369	2009
province	EC	Total Sexual Crimes	9897	2009
province	NC	Commercial crime	1049	2009
province	FS	Crimen injuria	3502	2009
province	FS	Murder	946	2009
province	EC	Carjacking	775	2009
province	GT	Culpable homicide	2503	2009
province	LIM	Unlawful possession of firearms and ammunition	512	2009
province	KZN	Burglary at non-residential premises	10974	2009
province	WC	Driving under the influence of alcohol or drugs	13588	2009
province	NC	Public violence	36	2009
province	KZN	Malicious injury to property	14373	2009
province	KZN	Robbery with aggravating circumstances	20211	2009
province	MP	Driving under the influence of alcohol or drugs	3090	2009
province	NW	Unlawful possession of firearms and ammunition	494	2009
province	GT	Assault with the intent to inflict grievous bodily harm	41581	2009
province	KZN	All theft not mentioned elsewhere	48124	2009
province	NC	Stock-theft	1271	2009
province	WC	All theft not mentioned elsewhere	94747	2009
province	GT	Theft out of or from motor vehicle	42722	2009
province	NW	Public violence	67	2009
province	FS	Carjacking	259	2009
province	MP	All theft not mentioned elsewhere	20045	2009
province	NC	Unlawful possession of firearms and ammunition	94	2009
province	MP	Malicious injury to property	5872	2009
province	MP	Robbery with aggravating circumstances	5284	2009
province	KZN	Driving under the influence of alcohol or drugs	11054	2009
province	NW	Stock-theft	2702	2009
province	WC	Malicious injury to property	26701	2009
province	WC	Robbery with aggravating circumstances	19526	2009
province	EC	Crimen injuria	2213	2009
province	EC	Murder	3453	2009
province	LIM	Stock-theft	1756	2009
province	MP	Burglary at non-residential premises	5316	2009
province	WC	Burglary at non-residential premises	13489	2009
province	LIM	Public violence	101	2009
province	NC	Common assault	4791	2009
province	NC	Robbery at non-residential premises	282	2009
province	KZN	Culpable homicide	2218	2009
province	FS	Attempted murder	911	2009
province	GT	Burglary at non-residential premises	16480	2009
province	NW	Commercial crime	5765	2009
province	KZN	Assault with the intent to inflict grievous bodily harm	27310	2009
province	LIM	Commercial crime	4547	2009
province	GT	Malicious injury to property	35328	2009
province	GT	Robbery with aggravating circumstances	42646	2009
province	FS	Common robbery	2655	2009
province	WC	Theft out of or from motor vehicle	42638	2009
province	GT	All theft not mentioned elsewhere	112485	2009
province	EC	Burglary at residential premises	24750	2009
province	MP	Theft out of or from motor vehicle	7785	2009
province	NC	Neglect and ill-treatment of children	86	2009
province	FS	Total Sexual Crimes	4814	2009
province	EC	Public violence	431	2009
province	EC	Stock-theft	6477	2009
province	NW	Crimen injuria	1268	2009
province	NW	Murder	825	2009
province	WC	Truck hijacking	40	2009
province	MP	Truck hijacking	197	2009
province	KZN	Theft of motor vehicle and motorcycle	9220	2009
province	LIM	Crimen injuria	1570	2009
province	LIM	Murder	783	2009
province	KZN	Shoplifting	12556	2009
province	NC	Carjacking	29	2009
province	FS	Unlawful possession of firearms and ammunition	483	2009
province	GT	Drug-related crime	74713	2009
province	LIM	Burglary at residential premises	17316	2009
province	MP	Drug-related crime	7464	2009
province	NC	Common robbery	1278	2009
province	NC	Total Sexual Crimes	1754	2009
province	WC	Drug-related crime	85463	2009
province	FS	Neglect and ill-treatment of children	372	2009
province	GT	Truck hijacking	547	2009
province	KZN	Robbery at residential premises	4033	2009
province	EC	Commercial crime	7009	2009
province	KZN	Kidnapping	858	2009
province	NC	Attempted murder	607	2009
province	NW	Burglary at residential premises	15434	2009
province	FS	Common assault	17124	2009
province	KZN	Arson	935	2009
province	FS	Robbery at non-residential premises	993	2009
province	WC	Arson	663	2009
province	MP	Arson	284	2009
province	NW	Attempted murder	1079	2009
province	FS	Commercial crime	4501	2009
province	NC	Burglary at residential premises	6027	2009
province	WC	Kidnapping	572	2009
province	LIM	Common robbery	3315	2009
province	LIM	Total Sexual Crimes	6646	2009
province	EC	Neglect and ill-treatment of children	279	2009
province	MP	Kidnapping	232	2009
province	MP	Robbery at residential premises	1118	2009
province	EC	Common assault	13392	2009
province	NW	Common robbery	2363	2009
province	WC	Robbery at residential premises	1878	2009
province	NW	Total Sexual Crimes	4850	2009
province	GT	Shoplifting	22207	2009
province	EC	Robbery at non-residential premises	2448	2009
province	GT	Theft of motor vehicle and motorcycle	27470	2009
province	KZN	Drug-related crime	42079	2009
province	LIM	Attempted murder	785	2009
province	FS	Stock-theft	4452	2009
province	KZN	Truck hijacking	45	2009
province	MP	Theft of motor vehicle and motorcycle	2360	2009
province	NW	Carjacking	242	2009
province	FS	Public violence	80	2009
province	MP	Shoplifting	3154	2009
province	WC	Theft of motor vehicle and motorcycle	9511	2009
province	WC	Shoplifting	14746	2009
province	GT	Robbery at residential premises	7438	2009
province	LIM	Carjacking	260	2009
province	GT	Kidnapping	1324	2009
province	EC	Unlawful possession of firearms and ammunition	1843	2009
province	GT	Arson	1273	2009
province	NC	Crimen injuria	803	2009
province	NC	Murder	438	2009
province	LIM	All theft not mentioned elsewhere	18947	2009
province	EC	Truck hijacking	31	2009
province	LIM	Malicious injury to property	6939	2009
province	LIM	Robbery with aggravating circumstances	5364	2009
province	NW	Burglary at non-residential premises	4875	2009
province	GT	Commercial crime	27749	2009
province	WC	Stock-theft	880	2009
province	NW	Malicious injury to property	5958	2009
province	NW	Robbery with aggravating circumstances	5427	2009
province	KZN	Unlawful possession of firearms and ammunition	4427	2009
province	LIM	Burglary at non-residential premises	7398	2009
province	MP	Stock-theft	2582	2009
province	NW	All theft not mentioned elsewhere	18336	2009
province	WC	Public violence	278	2009
province	NC	Driving under the influence of alcohol or drugs	744	2009
province	FS	Shoplifting	3191	2009
province	MP	Public violence	77	2009
province	FS	Theft of motor vehicle and motorcycle	2037	2009
province	NW	Theft out of or from motor vehicle	6023	2009
province	GT	Public violence	483	2009
province	NC	Assault with the intent to inflict grievous bodily harm	8734	2009
province	FS	Robbery at residential premises	753	2009
province	GT	Stock-theft	878	2009
province	KZN	Neglect and ill-treatment of children	229	2009
province	MP	Commercial crime	5269	2009
province	FS	Arson	368	2009
province	KZN	Common assault	24486	2009
province	WC	Commercial crime	11025	2009
province	KZN	Robbery at non-residential premises	2706	2009
province	FS	Kidnapping	234	2009
province	LIM	Theft out of or from motor vehicle	5735	2009
province	NC	Culpable homicide	297	2009
province	EC	Drug-related crime	15063	2009
province	MP	Robbery at non-residential premises	1260	2009
province	NW	Culpable homicide	882	2009
province	WC	Common assault	37273	2009
province	WC	Robbery at non-residential premises	2156	2009
province	KZN	Commercial crime	12612	2009
province	LIM	Assault with the intent to inflict grievous bodily harm	13354	2009
province	EC	Robbery at residential premises	1924	2009
province	MP	Common assault	7575	2009
province	LIM	Culpable homicide	1153	2009
province	MP	Neglect and ill-treatment of children	101	2009
province	NC	Theft out of or from motor vehicle	2976	2009
province	EC	Kidnapping	368	2009
province	WC	Neglect and ill-treatment of children	452	2009
province	NW	Assault with the intent to inflict grievous bodily harm	13509	2009
province	GT	Unlawful possession of firearms and ammunition	3679	2009
province	FS	Drug-related crime	8199	2009
province	EC	Arson	1107	2009
province	KZN	Public violence	155	2009
province	FS	Truck hijacking	71	2009
province	NC	Malicious injury to property	3117	2009
province	NC	Robbery with aggravating circumstances	1405	2009
province	NC	All theft not mentioned elsewhere	7088	2009
province	MP	Unlawful possession of firearms and ammunition	939	2009
province	KZN	Stock-theft	7345	2009
province	NW	Driving under the influence of alcohol or drugs	2251	2009
province	WC	Unlawful possession of firearms and ammunition	2810	2009
province	GT	Neglect and ill-treatment of children	704	2009
province	GT	Common assault	44748	2009
province	LIM	Driving under the influence of alcohol or drugs	2296	2009
province	EC	Shoplifting	6269	2009
province	EC	Theft of motor vehicle and motorcycle	3401	2009
province	GT	Robbery at non-residential premises	6026	2009
province	NC	Burglary at non-residential premises	2382	2009
province	LIM	Arson	678	2009
province	MP	Total Sexual Crimes	3953	2009
province	EC	Culpable homicide	1282	2009
province	FS	Theft out of or from motor vehicle	5686	2009
province	WC	Common robbery	13140	2009
province	LIM	Kidnapping	200	2009
province	GT	Carjacking	6064	2009
province	NC	Drug-related crime	3252	2009
province	WC	Total Sexual Crimes	8062	2009
province	NW	Robbery at residential premises	1004	2009
province	MP	Common robbery	3020	2009
province	NW	Kidnapping	303	2009
province	LIM	Robbery at residential premises	1020	2009
province	EC	Assault with the intent to inflict grievous bodily harm	27451	2009
province	NW	Arson	422	2009
province	KZN	Burglary at residential premises	42030	2009
province	MP	Attempted murder	772	2009
province	WC	Attempted murder	3363	2009
province	FS	Burglary at non-residential premises	5194	2009
province	GT	Attempted murder	3901	2009
province	EC	Driving under the influence of alcohol or drugs	7350	2009
province	KZN	Crimen injuria	3740	2009
province	KZN	Murder	3625	2009
province	LIM	Theft of motor vehicle and motorcycle	1027	2009
province	LIM	Shoplifting	4080	2009
province	WC	Carjacking	961	2009
province	GT	Common robbery	15708	2009
province	FS	All theft not mentioned elsewhere	18813	2009
province	MP	Carjacking	365	2009
province	NW	Theft of motor vehicle and motorcycle	2054	2009
province	NW	Shoplifting	2368	2009
province	GT	Total Sexual Crimes	11021	2009
province	NC	Truck hijacking	0	2009
province	FS	Malicious injury to property	8181	2009
province	FS	Robbery with aggravating circumstances	5358	2009
province	FS	Driving under the influence of alcohol or drugs	1769	2009
province	NC	Theft of motor vehicle and motorcycle	326	2009
province	NC	Shoplifting	1302	2009
province	KZN	Carjacking	2294	2009
province	NW	Truck hijacking	46	2009
province	EC	Burglary at non-residential premises	7658	2009
province	LIM	Truck hijacking	13	2009
province	MP	Crimen injuria	692	2009
province	MP	Murder	810	2009
province	WC	Crimen injuria	8650	2009
province	WC	Murder	2909	2009
province	EC	Malicious injury to property	12843	2009
province	EC	Robbery with aggravating circumstances	13485	2009
province	GT	Burglary at residential premises	68139	2009
province	EC	All theft not mentioned elsewhere	28292	2009
province	WC	Burglary at residential premises	50589	2009
province	NC	Kidnapping	38	2009
province	EC	Theft out of or from motor vehicle	11841	2009
province	FS	Culpable homicide	766	2009
province	LIM	Drug-related crime	9846	2009
province	MP	Burglary at residential premises	18600	2009
province	KZN	Attempted murder	3753	2009
province	NC	Arson	169	2009
province	GT	Crimen injuria	3269	2009
province	GT	Murder	3333	2009
province	KZN	Common robbery	7856	2009
province	KZN	Total Sexual Crimes	11424	2009
province	NW	Drug-related crime	11015	2009
province	NC	Robbery at residential premises	110	2009
province	FS	Assault with the intent to inflict grievous bodily harm	14531	2009
country	ZA	Attempted murder	17029	2009
country	ZA	Theft out of or from motor vehicle	143695	2009
country	ZA	Public violence	1708	2009
country	ZA	Commercial crime	79526	2009
country	ZA	Neglect and ill-treatment of children	2623	2009
country	ZA	Robbery at residential premises	19278	2009
country	ZA	Crimen injuria	25707	2009
country	ZA	Murder	17122	2009
country	ZA	Burglary at non-residential premises	73766	2009
country	ZA	Carjacking	11249	2009
country	ZA	Culpable homicide	11284	2009
country	ZA	Truck hijacking	990	2009
country	ZA	Driving under the influence of alcohol or drugs	68242	2009
country	ZA	Stock-theft	28343	2009
country	ZA	Assault with the intent to inflict grievous bodily harm	182119	2009
country	ZA	Robbery at non-residential premises	18654	2009
country	ZA	Malicious injury to property	119312	2009
country	ZA	Robbery with aggravating circumstances	118706	2009
country	ZA	Theft of motor vehicle and motorcycle	57406	2009
country	ZA	Total Sexual Crimes	62421	2009
country	ZA	Unlawful possession of firearms and ammunition	15281	2009
country	ZA	Shoplifting	69873	2009
country	ZA	Common assault	165681	2009
country	ZA	Common robbery	53356	2009
country	ZA	Kidnapping	4129	2009
country	ZA	Drug-related crime	257094	2009
country	ZA	All theft not mentioned elsewhere	366877	2009
country	ZA	Arson	5899	2009
country	ZA	Burglary at residential premises	259248	2009
province	KZN	Theft out of or from motor vehicle	18289	2016
province	EC	Attempted murder	1858	2016
province	MP	Assault with the intent to inflict grievous bodily harm	10803	2016
province	GT	Driving under the influence of alcohol or drugs	26100	2016
province	LIM	Common assault	9509	2016
province	WC	Assault with the intent to inflict grievous bodily harm	24846	2016
province	LIM	Robbery at non-residential premises	1414	2016
province	NW	Neglect and ill-treatment of children	199	2016
province	WC	Culpable homicide	998	2016
province	EC	Common robbery	4021	2016
province	NW	Common assault	6783	2016
province	FS	Burglary at residential premises	16363	2016
province	LIM	Neglect and ill-treatment of children	201	2016
province	MP	Culpable homicide	1185	2016
province	NW	Robbery at non-residential premises	1369	2016
province	EC	Total Sexual Crimes	9897	2016
province	NC	Commercial crime	1049	2016
province	FS	Crimen injuria	3502	2016
province	FS	Murder	946	2016
province	EC	Carjacking	775	2016
province	GT	Culpable homicide	2503	2016
province	LIM	Unlawful possession of firearms and ammunition	512	2016
province	KZN	Burglary at non-residential premises	10974	2016
province	WC	Driving under the influence of alcohol or drugs	13588	2016
province	NC	Public violence	36	2016
province	KZN	Malicious injury to property	14373	2016
province	KZN	Robbery with aggravating circumstances	20211	2016
province	MP	Driving under the influence of alcohol or drugs	3090	2016
province	NW	Unlawful possession of firearms and ammunition	494	2016
province	GT	Assault with the intent to inflict grievous bodily harm	41581	2016
province	KZN	All theft not mentioned elsewhere	48124	2016
province	NC	Stock-theft	1271	2016
province	WC	All theft not mentioned elsewhere	94747	2016
province	GT	Theft out of or from motor vehicle	42722	2016
province	NW	Public violence	67	2016
province	FS	Carjacking	259	2016
province	MP	All theft not mentioned elsewhere	20045	2016
province	NC	Unlawful possession of firearms and ammunition	94	2016
province	MP	Malicious injury to property	5872	2016
province	MP	Robbery with aggravating circumstances	5284	2016
province	KZN	Driving under the influence of alcohol or drugs	11054	2016
province	NW	Stock-theft	2702	2016
province	WC	Malicious injury to property	26701	2016
province	WC	Robbery with aggravating circumstances	19526	2016
province	EC	Crimen injuria	2213	2016
province	EC	Murder	3453	2016
province	LIM	Stock-theft	1756	2016
province	MP	Burglary at non-residential premises	5316	2016
province	WC	Burglary at non-residential premises	13489	2016
province	LIM	Public violence	101	2016
province	NC	Common assault	4791	2016
province	NC	Robbery at non-residential premises	282	2016
province	KZN	Culpable homicide	2218	2016
province	FS	Attempted murder	911	2016
province	GT	Burglary at non-residential premises	16480	2016
province	NW	Commercial crime	5765	2016
province	KZN	Assault with the intent to inflict grievous bodily harm	27310	2016
province	LIM	Commercial crime	4547	2016
province	GT	Malicious injury to property	35328	2016
province	GT	Robbery with aggravating circumstances	42646	2016
province	FS	Common robbery	2655	2016
province	WC	Theft out of or from motor vehicle	42638	2016
province	GT	All theft not mentioned elsewhere	112485	2016
province	EC	Burglary at residential premises	24750	2016
province	MP	Theft out of or from motor vehicle	7785	2016
province	NC	Neglect and ill-treatment of children	86	2016
province	FS	Total Sexual Crimes	4814	2016
province	EC	Public violence	431	2016
province	EC	Stock-theft	6477	2016
province	NW	Crimen injuria	1268	2016
province	NW	Murder	825	2016
province	WC	Truck hijacking	40	2016
province	MP	Truck hijacking	197	2016
province	KZN	Theft of motor vehicle and motorcycle	9220	2016
province	LIM	Crimen injuria	1570	2016
province	LIM	Murder	783	2016
province	KZN	Shoplifting	12556	2016
province	NC	Carjacking	29	2016
province	FS	Unlawful possession of firearms and ammunition	483	2016
province	GT	Drug-related crime	74713	2016
province	LIM	Burglary at residential premises	17316	2016
province	MP	Drug-related crime	7464	2016
province	NC	Common robbery	1278	2016
province	NC	Total Sexual Crimes	1754	2016
province	WC	Drug-related crime	85463	2016
province	FS	Neglect and ill-treatment of children	372	2016
province	GT	Truck hijacking	547	2016
province	KZN	Robbery at residential premises	4033	2016
province	EC	Commercial crime	7009	2016
province	KZN	Kidnapping	858	2016
province	NC	Attempted murder	607	2016
province	NW	Burglary at residential premises	15434	2016
province	FS	Common assault	17124	2016
province	KZN	Arson	935	2016
province	FS	Robbery at non-residential premises	993	2016
province	WC	Arson	663	2016
province	MP	Arson	284	2016
province	NW	Attempted murder	1079	2016
province	FS	Commercial crime	4501	2016
province	NC	Burglary at residential premises	6027	2016
province	WC	Kidnapping	572	2016
province	LIM	Common robbery	3315	2016
province	LIM	Total Sexual Crimes	6646	2016
province	EC	Neglect and ill-treatment of children	279	2016
province	MP	Kidnapping	232	2016
province	MP	Robbery at residential premises	1118	2016
province	EC	Common assault	13392	2016
province	NW	Common robbery	2363	2016
province	WC	Robbery at residential premises	1878	2016
province	NW	Total Sexual Crimes	4850	2016
province	GT	Shoplifting	22207	2016
province	EC	Robbery at non-residential premises	2448	2016
province	GT	Theft of motor vehicle and motorcycle	27470	2016
province	KZN	Drug-related crime	42079	2016
province	LIM	Attempted murder	785	2016
province	FS	Stock-theft	4452	2016
province	KZN	Truck hijacking	45	2016
province	MP	Theft of motor vehicle and motorcycle	2360	2016
province	NW	Carjacking	242	2016
province	FS	Public violence	80	2016
province	MP	Shoplifting	3154	2016
province	WC	Theft of motor vehicle and motorcycle	9511	2016
province	WC	Shoplifting	14746	2016
province	GT	Robbery at residential premises	7438	2016
province	LIM	Carjacking	260	2016
province	GT	Kidnapping	1324	2016
province	EC	Unlawful possession of firearms and ammunition	1843	2016
province	GT	Arson	1273	2016
province	NC	Crimen injuria	803	2016
province	NC	Murder	438	2016
province	LIM	All theft not mentioned elsewhere	18947	2016
province	EC	Truck hijacking	31	2016
province	LIM	Malicious injury to property	6939	2016
province	LIM	Robbery with aggravating circumstances	5364	2016
province	NW	Burglary at non-residential premises	4875	2016
province	GT	Commercial crime	27749	2016
province	WC	Stock-theft	880	2016
province	NW	Malicious injury to property	5958	2016
province	NW	Robbery with aggravating circumstances	5427	2016
province	KZN	Unlawful possession of firearms and ammunition	4427	2016
province	LIM	Burglary at non-residential premises	7398	2016
province	MP	Stock-theft	2582	2016
province	NW	All theft not mentioned elsewhere	18336	2016
province	WC	Public violence	278	2016
province	NC	Driving under the influence of alcohol or drugs	744	2016
province	FS	Shoplifting	3191	2016
province	MP	Public violence	77	2016
province	FS	Theft of motor vehicle and motorcycle	2037	2016
province	NW	Theft out of or from motor vehicle	6023	2016
province	GT	Public violence	483	2016
province	NC	Assault with the intent to inflict grievous bodily harm	8734	2016
province	FS	Robbery at residential premises	753	2016
province	GT	Stock-theft	878	2016
province	KZN	Neglect and ill-treatment of children	229	2016
province	MP	Commercial crime	5269	2016
province	FS	Arson	368	2016
province	KZN	Common assault	24486	2016
province	WC	Commercial crime	11025	2016
province	KZN	Robbery at non-residential premises	2706	2016
province	FS	Kidnapping	234	2016
province	LIM	Theft out of or from motor vehicle	5735	2016
province	NC	Culpable homicide	297	2016
province	EC	Drug-related crime	15063	2016
province	MP	Robbery at non-residential premises	1260	2016
province	NW	Culpable homicide	882	2016
province	WC	Common assault	37273	2016
province	WC	Robbery at non-residential premises	2156	2016
province	KZN	Commercial crime	12612	2016
province	LIM	Assault with the intent to inflict grievous bodily harm	13354	2016
province	EC	Robbery at residential premises	1924	2016
province	MP	Common assault	7575	2016
province	LIM	Culpable homicide	1153	2016
province	MP	Neglect and ill-treatment of children	101	2016
province	NC	Theft out of or from motor vehicle	2976	2016
province	EC	Kidnapping	368	2016
province	WC	Neglect and ill-treatment of children	452	2016
province	NW	Assault with the intent to inflict grievous bodily harm	13509	2016
province	GT	Unlawful possession of firearms and ammunition	3679	2016
province	FS	Drug-related crime	8199	2016
province	EC	Arson	1107	2016
province	KZN	Public violence	155	2016
province	FS	Truck hijacking	71	2016
province	NC	Malicious injury to property	3117	2016
province	NC	Robbery with aggravating circumstances	1405	2016
province	NC	All theft not mentioned elsewhere	7088	2016
province	MP	Unlawful possession of firearms and ammunition	939	2016
province	KZN	Stock-theft	7345	2016
province	NW	Driving under the influence of alcohol or drugs	2251	2016
province	WC	Unlawful possession of firearms and ammunition	2810	2016
province	GT	Neglect and ill-treatment of children	704	2016
province	GT	Common assault	44748	2016
province	LIM	Driving under the influence of alcohol or drugs	2296	2016
province	EC	Shoplifting	6269	2016
province	EC	Theft of motor vehicle and motorcycle	3401	2016
province	GT	Robbery at non-residential premises	6026	2016
province	NC	Burglary at non-residential premises	2382	2016
province	LIM	Arson	678	2016
province	MP	Total Sexual Crimes	3953	2016
province	EC	Culpable homicide	1282	2016
province	FS	Theft out of or from motor vehicle	5686	2016
province	WC	Common robbery	13140	2016
province	LIM	Kidnapping	200	2016
province	GT	Carjacking	6064	2016
province	NC	Drug-related crime	3252	2016
province	WC	Total Sexual Crimes	8062	2016
province	NW	Robbery at residential premises	1004	2016
province	MP	Common robbery	3020	2016
province	NW	Kidnapping	303	2016
province	LIM	Robbery at residential premises	1020	2016
province	EC	Assault with the intent to inflict grievous bodily harm	27451	2016
province	NW	Arson	422	2016
province	KZN	Burglary at residential premises	42030	2016
province	MP	Attempted murder	772	2016
province	WC	Attempted murder	3363	2016
province	FS	Burglary at non-residential premises	5194	2016
province	GT	Attempted murder	3901	2016
province	EC	Driving under the influence of alcohol or drugs	7350	2016
province	KZN	Crimen injuria	3740	2016
province	KZN	Murder	3625	2016
province	LIM	Theft of motor vehicle and motorcycle	1027	2016
province	LIM	Shoplifting	4080	2016
province	WC	Carjacking	961	2016
province	GT	Common robbery	15708	2016
province	FS	All theft not mentioned elsewhere	18813	2016
province	MP	Carjacking	365	2016
province	NW	Theft of motor vehicle and motorcycle	2054	2016
province	NW	Shoplifting	2368	2016
province	GT	Total Sexual Crimes	11021	2016
province	NC	Truck hijacking	0	2016
province	FS	Malicious injury to property	8181	2016
province	FS	Robbery with aggravating circumstances	5358	2016
province	FS	Driving under the influence of alcohol or drugs	1769	2016
province	NC	Theft of motor vehicle and motorcycle	326	2016
province	NC	Shoplifting	1302	2016
province	KZN	Carjacking	2294	2016
province	NW	Truck hijacking	46	2016
province	EC	Burglary at non-residential premises	7658	2016
province	LIM	Truck hijacking	13	2016
province	MP	Crimen injuria	692	2016
province	MP	Murder	810	2016
province	WC	Crimen injuria	8650	2016
province	WC	Murder	2909	2016
province	EC	Malicious injury to property	12843	2016
province	EC	Robbery with aggravating circumstances	13485	2016
province	GT	Burglary at residential premises	68139	2016
province	EC	All theft not mentioned elsewhere	28292	2016
province	WC	Burglary at residential premises	50589	2016
province	NC	Kidnapping	38	2016
province	EC	Theft out of or from motor vehicle	11841	2016
province	FS	Culpable homicide	766	2016
province	LIM	Drug-related crime	9846	2016
province	MP	Burglary at residential premises	18600	2016
province	KZN	Attempted murder	3753	2016
province	NC	Arson	169	2016
province	GT	Crimen injuria	3269	2016
province	GT	Murder	3333	2016
province	KZN	Common robbery	7856	2016
province	KZN	Total Sexual Crimes	11424	2016
province	NW	Drug-related crime	11015	2016
province	NC	Robbery at residential premises	110	2016
province	FS	Assault with the intent to inflict grievous bodily harm	14531	2016
country	ZA	Attempted murder	17029	2016
country	ZA	Theft out of or from motor vehicle	143695	2016
country	ZA	Public violence	1708	2016
country	ZA	Commercial crime	79526	2016
country	ZA	Neglect and ill-treatment of children	2623	2016
country	ZA	Robbery at residential premises	19278	2016
country	ZA	Crimen injuria	25707	2016
country	ZA	Murder	17122	2016
country	ZA	Burglary at non-residential premises	73766	2016
country	ZA	Carjacking	11249	2016
country	ZA	Culpable homicide	11284	2016
country	ZA	Truck hijacking	990	2016
country	ZA	Driving under the influence of alcohol or drugs	68242	2016
country	ZA	Stock-theft	28343	2016
country	ZA	Assault with the intent to inflict grievous bodily harm	182119	2016
country	ZA	Robbery at non-residential premises	18654	2016
country	ZA	Malicious injury to property	119312	2016
country	ZA	Robbery with aggravating circumstances	118706	2016
country	ZA	Theft of motor vehicle and motorcycle	57406	2016
country	ZA	Total Sexual Crimes	62421	2016
country	ZA	Unlawful possession of firearms and ammunition	15281	2016
country	ZA	Shoplifting	69873	2016
country	ZA	Common assault	165681	2016
country	ZA	Common robbery	53356	2016
country	ZA	Kidnapping	4129	2016
country	ZA	Drug-related crime	257094	2016
country	ZA	All theft not mentioned elsewhere	366877	2016
country	ZA	Arson	5899	2016
country	ZA	Burglary at residential premises	259248	2016
\.


--
-- Name: crime pk_crime; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY crime
    ADD CONSTRAINT pk_crime PRIMARY KEY (geo_level, geo_code, geo_version, crime);


--
-- PostgreSQL database dump complete
--
