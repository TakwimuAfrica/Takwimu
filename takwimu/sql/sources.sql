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

ALTER TABLE IF EXISTS ONLY public.sources DROP CONSTRAINT IF EXISTS pk_sources;
DROP TABLE IF EXISTS public.sources;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: sources; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sources (
    geo_level character varying(15) NOT NULL,
    country_code character varying(10) NOT NULL,
    table_name character varying(50) NOT NULL,
    source_title character varying(100) NOT NULL,
    source_link character varying(150) NOT NULL
);


--
-- Data for Name: sources; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.sources (geo_level, country_code, table_name, source_title, source_link) FROM stdin;
country	ZA	allSecondarySchoolEnrollments	WorldBank	https://data.worldbank.org/indicator/SE.SEC.ENRR.FE?locations=ZA
country	ZA	allGdpPerCapitas	WorldBank	https://data.worldbank.org/indicator/NY.gdp.PCAP.CD?locations=ZA
country	ZA	allGdps	WorldBank	https://data.worldbank.org/indicator/NY.gdp.MKTP.CD?locations=ZA
country	ZA	allAccessToBasicServices	WorldBank	https://data.worldbank.org/indicator/SH.H2O.BASW.ZS?locations=ZA
country	ZA	allPopulationSex2011S	Community Survey 2016	https://openafrica.net/dataset/community-survey-2016
country	ZA	allAgriculturalLands	WorldBank	https://data.worldbank.org/indicator/AG.LND.AGRI.ZS?locations=ZA
country	ZA	total_population	WorldBank	https://data.worldbank.org/indicator/SP.POP.TOTL?locations=ZA
country	ZA	allLifeExpectancyAtBirths	WorldBank	https://data.worldbank.org/indicator/SP.DYN.LE00.FE.IN?locations=ZA
country	ZA	allBirthsAttendedBySkilledHealthStaffs	WorldBank	https://data.worldbank.org/indicator/SH.STA.BRTC.ZS?locations=ZA
country	ZA	allMaternalMortalities	WorldBank	https://data.worldbank.org/indicator/SH.STA.MMRT?locations=ZA
country	ZA	allGdpPerCapitaGrowths	WorldBank	https://data.worldbank.org/indicator/NY.gdp.PCAP.KD.ZG?locations=ZA
country	ZA	allTaxRevenues	WorldBank	https://data.worldbank.org/indicator/GC.TAX.TOTL.CN?locations=ZA
country	ZA	allGiniIndices	WorldBank	https://data.worldbank.org/indicator/SI.POV.GINI?locations=ZA
country	ZA	allAccountOwnerships	WorldBank	https://data.worldbank.org/indicator/FX.OWN.TOTL.MA.ZS?locations=ZA
country	ZA	allGdpGrowths	WorldBank	https://data.worldbank.org/indicator/NY.gdp.MKTP.KD.ZG?locations=ZA
country	ZA	allPhysiciansNursesAndMidwives	WorldBank	https://data.worldbank.org/indicator/SH.MED.PHYS.ZS?locations=ZA
country	ZA	allFgmPrevalences	WorldBank	https://data.worldbank.org/indicator/SH.STA.FGMS.ZS?locations=ZA
country	ZA	allAdultLiteracyRates	WorldBank	https://data.worldbank.org/indicator/SE.ADT.LITR.FE.ZS?locations=ZA
country	ZA	allTaxAsPercentageOfGdps	WorldBank	https://data.worldbank.org/indicator/GC.TAX.TOTL.GD.ZS?locations=ZA
country	ZA	allCerealYieldKgPerHectares	WorldBank	https://data.worldbank.org/indicator/AG.YLD.CREL.KG?locations=ZA
country	ZA	allMobilePhoneSubscriptions	WorldBank	https://data.worldbank.org/indicator/IT.CEL.SETS.P2?locations=ZA
country	ZA	allIncidenceOfMalariaPer1000PopAtRisks	WorldBank	https://data.worldbank.org/indicator/SH.MLR.INCD.P3?locations=ZA
country	ZA	allHivPrevalences	WorldBank	https://data.worldbank.org/indicator/SH.HIV.1524.MA.ZS?locations=ZA
country	ZA	allYouthUnemployments	WorldBank	https://data.worldbank.org/indicator/SL.UEM.1524.MA.ZS?locations=ZA
country	ZA	allPrimaryEducationCompletionRates	WorldBank	https://data.worldbank.org/indicator/SE.PRM.CMPT.MA.ZS?locations=ZA
country	ZA	allForeignDirectInvestmentNetInflows	WorldBank	https://data.worldbank.org/indicator/?locations=ZA
country	ZA	allEmploymentToPopulationRatios	WorldBank	https://data.worldbank.org/indicator/SL.EMP.TOTL.SP.MA.ZS?locations=ZA
country	ZA	allPrevalenceOfUndernourishments	WorldBank	https://data.worldbank.org/indicator/SN.ITK.DEFC.ZS?locations=ZA
country	ZA	allNursesAndMidwives	WorldBank	https://data.worldbank.org/indicator/SH.MED.NUMW.P3?locations=ZA
country	ZA	allPrimarySchoolEnrollments	WorldBank	https://data.worldbank.org/indicator/SE.PRM.ENRR.MA?locations=ZA
country	TZ	allSecondarySchoolEnrollments	WorldBank	https://data.worldbank.org/indicator/SE.SEC.ENRR.FE?locations=TZ
country	TZ	allGdpPerCapitas	WorldBank	https://data.worldbank.org/indicator/NY.gdp.PCAP.CD?locations=TZ
country	TZ	allGdps	WorldBank	https://data.worldbank.org/indicator/NY.gdp.MKTP.CD?locations=TZ
country	TZ	allFoodProductions	WorldBank	https://data.worldbank.org/indicator/AG.YLD.CREL.KG?locations=TZ
country	TZ	allAccessToBasicServices	WorldBank	https://data.worldbank.org/indicator/SH.H2O.BASW.ZS?locations=TZ
country	TZ	allAgriculturalLands	WorldBank	https://data.worldbank.org/indicator/AG.LND.AGRI.ZS?locations=TZ
country	TZ	total_population	WorldBank	https://data.worldbank.org/indicator/SP.POP.TOTL?locations=TZ
country	TZ	allLifeExpectancyAtBirths	WorldBank	https://data.worldbank.org/indicator/SP.DYN.LE00.FE.IN?locations=TZ
country	TZ	allBirthsAttendedBySkilledHealthStaffs	WorldBank	https://data.worldbank.org/indicator/SH.STA.BRTC.ZS?locations=TZ
country	TZ	allMaternalMortalities	WorldBank	https://data.worldbank.org/indicator/SH.STA.MMRT?locations=TZ
country	TZ	allVotesPerCandidates	Commonwealth Tanzania General Election 2015	https://openafrica.net/dataset/tanzania-election-result-2015
country	TZ	allGdpPerCapitaGrowths	WorldBank	https://data.worldbank.org/indicator/NY.gdp.PCAP.KD.ZG?locations=TZ
country	TZ	allTaxRevenues	WorldBank	https://data.worldbank.org/indicator/GC.TAX.TOTL.CN?locations=TZ
country	TZ	allValidInvalidVotes	Commonwealth Tanzania General Election 2015	https://openafrica.net/dataset/tanzania-election-result-2015
country	TZ	allGiniIndices	WorldBank	https://data.worldbank.org/indicator/SI.POV.GINI?locations=TZ
country	TZ	allAccountOwnerships	WorldBank	https://data.worldbank.org/indicator/FX.OWN.TOTL.MA.ZS?locations=TZ
country	TZ	allGdpGrowths	WorldBank	https://data.worldbank.org/indicator/NY.gdp.MKTP.KD.ZG?locations=TZ
country	TZ	allPhysiciansNursesAndMidwives	WorldBank	https://data.worldbank.org/indicator/SH.MED.PHYS.ZS?locations=TZ
country	TZ	allFgmPrevalences	WorldBank	https://data.worldbank.org/indicator/SH.STA.FGMS.ZS?locations=TZ
country	TZ	allAdultLiteracyRates	WorldBank	https://data.worldbank.org/indicator/SE.ADT.LITR.FE.ZS?locations=TZ
country	TZ	allTaxAsPercentageOfGdps	WorldBank	https://data.worldbank.org/indicator/GC.TAX.TOTL.GD.ZS?locations=TZ
country	TZ	allCerealYieldKgPerHectares	WorldBank	https://data.worldbank.org/indicator/AG.YLD.CREL.KG?locations=TZ
country	TZ	allMobilePhoneSubscriptions	WorldBank	https://data.worldbank.org/indicator/IT.CEL.SETS.P2?locations=TZ
country	TZ	allIncidenceOfMalariaPer1000PopAtRisks	WorldBank	https://data.worldbank.org/indicator/SH.MLR.INCD.P3?locations=TZ
country	TZ	allPopulationSex2012S	General Census 2012	https://openafrica.net/dataset/tanzania-census-data
country	TZ	allHivPrevalences	WorldBank	https://data.worldbank.org/indicator/SH.HIV.1524.MA.ZS?locations=TZ
country	TZ	allYouthUnemployments	WorldBank	https://data.worldbank.org/indicator/SL.UEM.1524.MA.ZS?locations=TZ
country	TZ	allPrimaryEducationCompletionRates	WorldBank	https://data.worldbank.org/indicator/SE.PRM.CMPT.MA.ZS?locations=TZ
country	TZ	allRegisteredAccreditedVoters	Commonwealth Tanzania General Election 2015	https://openafrica.net/dataset/tanzania-election-result-2015
country	TZ	allForeignDirectInvestmentNetInflows	WorldBank	https://data.worldbank.org/indicator/?locations=TZ
country	TZ	allEmploymentToPopulationRatios	WorldBank	https://data.worldbank.org/indicator/SL.EMP.TOTL.SP.MA.ZS?locations=TZ
country	TZ	allPrevalenceOfUndernourishments	WorldBank	https://data.worldbank.org/indicator/SN.ITK.DEFC.ZS?locations=TZ
country	TZ	allPopulationResidence2012S	General Census 2012	https://openafrica.net/dataset/tanzania-census-data
country	TZ	allNursesAndMidwives	WorldBank	https://data.worldbank.org/indicator/SH.MED.NUMW.P3?locations=TZ
country	TZ	allPrimarySchoolEnrollments	WorldBank	https://data.worldbank.org/indicator/SE.PRM.ENRR.MA?locations=TZ
country	ET	residence_dist	Summary and Statistical Report of the 2007 Population and Housing Census	https://africaopendata.org/dataset/ethiopia-summary-and-statistical-report-of-the-2007-population-and-housing-census
country	ET	allGdpPerCapitas	WorldBank	https://data.worldbank.org/indicator/NY.gdp.PCAP.CD?locations=ET
country	ET	allGdps	WorldBank	https://data.worldbank.org/indicator/NY.gpds.MKTP.CD?locations=ET
country	ET	allAccessToBasicServices	WorldBank	https://data.worldbank.org/indicator/SH.H2O.BASW.ZS?locations=ET
country	ET	allAgriculturalLands	WorldBank	https://data.worldbank.org/indicator/AG.LND.AGRI.ZS?locations=ET
country	ET	allSecondarySchoolEnrollments	WorldBank	https://data.worldbank.org/indicator/SE.SEC.ENRR.FE?locations=ET
country	ET	total_population	WorldBank	https://data.worldbank.org/indicator/SP.POP.TOTL?locations=ET
country	ET	allLifeExpectancyAtBirths	WorldBank	https://data.worldbank.org/indicator/SP.DYN.LE00.FE.IN?locations=ET
country	ET	allBirthsAttendedBySkilledHealthStaffs	WorldBank	https://data.worldbank.org/indicator/SH.STA.BRTC.ZS?locations=ET
country	ET	allMaternalMortalities	WorldBank	https://data.worldbank.org/indicator/SH.STA.MMRT?locations=ET
country	ET	allGdpPerCapitaGrowths	WorldBank	https://data.worldbank.org/indicator/NY.gdp.PCAP.KD.ZG?locations=ET
country	ET	allTaxRevenues	WorldBank	https://data.worldbank.org/indicator/GC.TAX.TOTL.CN?locations=ET
country	ET	allGiniIndices	WorldBank	https://data.worldbank.org/indicator/SI.POV.GINI?locations=ET
country	ET	allAccountOwnerships	WorldBank	https://data.worldbank.org/indicator/FX.OWN.TOTL.MA.ZS?locations=ET
country	ET	allGdpGrowths	WorldBank	https://data.worldbank.org/indicator/NY.gdp.MKTP.KD.ZG?locations=ET
country	ET	allPhysiciansNursesAndMidwives	WorldBank	https://data.worldbank.org/indicator/SH.MED.PHYS.ZS?locations=ET
country	ET	allFgmPrevalences	WorldBank	https://data.worldbank.org/indicator/SH.STA.FGMS.ZS?locations=ET
country	ET	allAdultLiteracyRates	WorldBank	https://data.worldbank.org/indicator/SE.ADT.LITR.FE.ZS?locations=ET
country	ET	allTaxAsPercentageOfGdps	WorldBank	https://data.worldbank.org/indicator/GC.TAX.TOTL.GD.ZS?locations=ET
country	ET	allCerealYieldKgPerHectares	WorldBank	https://data.worldbank.org/indicator/AG.YLD.CREL.KG?locations=ET
country	ET	allMobilePhoneSubscriptions	WorldBank	https://data.worldbank.org/indicator/IT.CEL.SETS.P2?locations=ET
country	ET	allIncidenceOfMalariaPer1000PopAtRisks	WorldBank	https://data.worldbank.org/indicator/SH.MLR.INCD.P3?locations=ET
country	ET	allPopulationSex2007S	Population and Housing Census 2007	http://catalog.ihsn.org/index.php/catalog/3583
country	ET	allHivPrevalences	WorldBank	https://data.worldbank.org/indicator/SH.HIV.1524.MA.ZS?locations=ET
country	ET	allYouthUnemployments	WorldBank	https://data.worldbank.org/indicator/SL.UEM.1524.MA.ZS?locations=ET
country	ET	allPrimaryEducationCompletionRates	WorldBank	https://data.worldbank.org/indicator/SE.PRM.CMPT.MA.ZS?locations=ET
country	ET	sex_dist	Summary and Statistical Report of the 2007 Population and Housing Census	https://africaopendata.org/dataset/ethiopia-summary-and-statistical-report-of-the-2007-population-and-housing-census
country	ET	allForeignDirectInvestmentNetInflows	WorldBank	https://data.worldbank.org/indicator/?locations=ET
country	ET	allEmploymentToPopulationRatios	WorldBank	https://data.worldbank.org/indicator/SL.EMP.TOTL.SP.MA.ZS?locations=ET
country	ET	allPrevalenceOfUndernourishments	WorldBank	https://data.worldbank.org/indicator/SN.ITK.DEFC.ZS?locations=ET
country	ET	allNursesAndMidwives	WorldBank	https://data.worldbank.org/indicator/SH.MED.NUMW.P3?locations=ET
country	ET	allPrimarySchoolEnrollments	WorldBank	https://data.worldbank.org/indicator/SE.PRM.ENRR.MA?locations=ET
country	SN	allSecondarySchoolEnrollments	WorldBank	https://data.worldbank.org/indicator/SE.SEC.ENRR.FE?locations=SN
country	SN	allGdpPerCapitas	WorldBank	https://data.worldbank.org/indicator/NY.gdp.PCAP.CD?locations=SN
country	SN	allGdps	WorldBank	https://data.worldbank.org/indicator/NY.gdp.MKTP.CD?locations=SN
country	SN	allFoodProductions	WorldBank	https://data.worldbank.org/indicator/AG.YLD.CREL.KG?locations=SN
country	SN	allAccessToBasicServices	WorldBank	https://data.worldbank.org/indicator/SH.H2O.BASW.ZS?locations=SN
country	SN	allPopulationSex2013S	Census Data 2013	https://africaopendata.org/dataset/senegal-census-data
country	SN	allAgriculturalLands	WorldBank	https://data.worldbank.org/indicator/AG.LND.AGRI.ZS?locations=SN
country	SN	total_population	WorldBank	https://data.worldbank.org/indicator/SP.POP.TOTL?locations=SN
country	SN	allLifeExpectancyAtBirths	WorldBank	https://data.worldbank.org/indicator/SP.DYN.LE00.FE.IN?locations=SN
country	SN	allBirthsAttendedBySkilledHealthStaffs	WorldBank	https://data.worldbank.org/indicator/SH.STA.BRTC.ZS?locations=SN
country	SN	allMaternalMortalities	WorldBank	https://data.worldbank.org/indicator/SH.STA.MMRT?locations=SN
country	SN	allVotesPerCandidates	African Election Database	http://africanelections.tripod.com/sn_detail.html#2012_Presidential_Election_(Second_Round)/
country	SN	allGdpPerCapitaGrowths	WorldBank	https://data.worldbank.org/indicator/NY.gdp.PCAP.KD.ZG?locations=SN
country	SN	allTaxRevenues	WorldBank	https://data.worldbank.org/indicator/GC.TAX.TOTL.CN?locations=SN
country	SN	allPopulationResidence2013S	Census Data 2013	https://africaopendata.org/dataset/senegal-census-data
country	SN	allRegisteredAccreditedVoters	African Election Database	http://africanelections.tripod.com/sn_detail.html#2012_Presidential_Election_(Second_Round)/
country	SN	allGiniIndices	WorldBank	https://data.worldbank.org/indicator/SI.POV.GINI?locations=SN
country	SN	allAccountOwnerships	WorldBank	https://data.worldbank.org/indicator/FX.OWN.TOTL.MA.ZS?locations=SN
country	SN	allGdpGrowths	WorldBank	https://data.worldbank.org/indicator/NY.gdp.MKTP.KD.ZG?locations=SN
country	SN	allPhysiciansNursesAndMidwives	WorldBank	https://data.worldbank.org/indicator/SH.MED.PHYS.ZS?locations=SN
country	SN	allFgmPrevalences	WorldBank	https://data.worldbank.org/indicator/SH.STA.FGMS.ZS?locations=SN
country	SN	allAdultLiteracyRates	WorldBank	https://data.worldbank.org/indicator/SE.ADT.LITR.FE.ZS?locations=SN
country	SN	allTaxAsPercentageOfGdps	WorldBank	https://data.worldbank.org/indicator/GC.TAX.TOTL.GD.ZS?locations=SN
country	SN	allCerealYieldKgPerHectares	WorldBank	https://data.worldbank.org/indicator/AG.YLD.CREL.KG?locations=SN
country	SN	allMobilePhoneSubscriptions	WorldBank	https://data.worldbank.org/indicator/IT.CEL.SETS.P2?locations=SN
country	SN	allIncidenceOfMalariaPer1000PopAtRisks	WorldBank	https://data.worldbank.org/indicator/SH.MLR.INCD.P3?locations=SN
country	SN	allHivPrevalences	WorldBank	https://data.worldbank.org/indicator/SH.HIV.1524.MA.ZS?locations=SN
country	SN	allYouthUnemployments	WorldBank	https://data.worldbank.org/indicator/SL.UEM.1524.MA.ZS?locations=SN
country	SN	allPrimaryEducationCompletionRates	WorldBank	https://data.worldbank.org/indicator/SE.PRM.CMPT.MA.ZS?locations=SN
country	SN	allValidInvalidVotes	African Election Database	http://africanelections.tripod.com/sn_detail.html#2012_Presidential_Election_(Second_Round)/
country	SN	allForeignDirectInvestmentNetInflows	WorldBank	https://data.worldbank.org/indicator/?locations=SN
country	SN	allEmploymentToPopulationRatios	WorldBank	https://data.worldbank.org/indicator/SL.EMP.TOTL.SP.MA.ZS?locations=SN
country	SN	allPrevalenceOfUndernourishments	WorldBank	https://data.worldbank.org/indicator/SN.ITK.DEFC.ZS?locations=SN
country	SN	allNursesAndMidwives	WorldBank	https://data.worldbank.org/indicator/SH.MED.NUMW.P3?locations=SN
country	SN	allPrimarySchoolEnrollments	WorldBank	https://data.worldbank.org/indicator/SE.PRM.ENRR.MA?locations=SN
country	CD	allSecondarySchoolEnrollments	WorldBank 2018	https://data.worldbank.org/indicator/SE.SEC.ENRR.FE?locations=CD
country	CD	allGdpPerCapitas	WorldBank 2018	https://data.worldbank.org/indicator/NY.gdp.PCAP.CD?locations=CD
country	CD	allBirthsAttendedBySkilledHealthStaffs	WorldBank	https://data.worldbank.org/indicator/SH.STA.BRTC.ZS?locations=CD
country	CD	allAccessToBasicServices	WorldBank	https://data.worldbank.org/indicator/SH.H2O.BASW.ZS?locations=CD
country	CD	allAgriculturalLands	WorldBank	https://data.worldbank.org/indicator/AG.LND.AGRI.ZS?locations=CD
country	CD	total_population	WorldBank 2018	https://data.worldbank.org/indicator/SP.POP.TOTL?locations=CD
country	CD	allLifeExpectancyAtBirths	WorldBank 2017	https://data.worldbank.org/indicator/SP.DYN.LE00.FE.IN?locations=CD
country	CD	allGdps	WorldBank	https://data.worldbank.org/indicator/NY.gdp.MKTP.CD?locations=CD
country	CD	allMaternalMortalities	WorldBank	https://data.worldbank.org/indicator/SH.STA.MMRT?locations=CD
country	CD	allGdpPerCapitaGrowths	WorldBank 2018	https://data.worldbank.org/indicator/NY.gdp.PCAP.KD.ZG?locations=CD
country	CD	allTaxRevenues	WorldBank	https://data.worldbank.org/indicator/GC.TAX.TOTL.CN?locations=CD
country	CD	allGiniIndices	WorldBank 2017	https://data.worldbank.org/indicator/SI.POV.GINI?locations=CD
country	CD	allAccountOwnerships	WorldBank 2018	https://data.worldbank.org/indicator/FX.OWN.TOTL.MA.ZS?locations=CD
country	CD	allGdpGrowths	WorldBank	https://data.worldbank.org/indicator/NY.gdp.MKTP.KD.ZG?locations=CD
country	CD	allAdultLiteracyRates	WorldBank 2018	https://data.worldbank.org/indicator/SE.ADT.LITR.FE.ZS?locations=CD
country	CD	allTaxAsPercentageOfGdps	WorldBank 2017	https://data.worldbank.org/indicator/GC.TAX.TOTL.GD.ZS?locations=CD
country	CD	allCerealYieldKgPerHectares	WorldBank	https://data.worldbank.org/indicator/AG.YLD.CREL.KG?locations=CD
country	CD	allMobilePhoneSubscriptions	WorldBank 2017	https://data.worldbank.org/indicator/IT.CEL.SETS.P2?locations=CD
country	CD	allIncidenceOfMalariaPer1000PopAtRisks	WorldBank 2017	https://data.worldbank.org/indicator/SH.MLR.INCD.P3?locations=CD
country	CD	allYouthUnemployments	WorldBank 2018	https://data.worldbank.org/indicator/SL.UEM.1524.MA.ZS?locations=CD
country	CD	allPrimaryEducationCompletionRates	WorldBank 2018	https://data.worldbank.org/indicator/SE.PRM.ENRR.MA?locations=CD
country	CD	allForeignDirectInvestmentNetInflows	WorldBank	https://data.worldbank.org/indicator/?locations=CD
country	CD	allEmploymentToPopulationRatios	WorldBank	https://data.worldbank.org/indicator/SL.EMP.TOTL.SP.MA.ZS?locations=CD
country	CD	allNursesAndMidwives	WorldBank	https://data.worldbank.org/indicator/SH.MED.NUMW.P3?locations=CD
country	CD	allPrimarySchoolEnrollments	Worldbank	https://data.worldbank.org/indicator/SE.PRM.ENRR.MA?locations=CD
country	UG	allGdps	WorldBank	https://data.worldbank.org/indicator/NY.gdp.MKTP.CD?locations=UG
country	UG	allSecondarySchoolEnrollments	WorldBank 2018	https://data.worldbank.org/indicator/SE.SEC.ENRR.FE?locations=UG
country	UG	allGdpPerCapitas	WorldBank	https://data.worldbank.org/indicator/NY.gdp.PCAP.CD?locations=UG
country	UG	allGdpPerCapitaGrowths	WorldBank 2018	https://data.worldbank.org/indicator/NY.gdp.PCAP.KD.ZG?locations=UG
country	UG	allAccessToBasicServices	WorldBank	https://data.worldbank.org/indicator/SH.H2O.BASW.ZS?locations=UG
country	UG	allAgriculturalLands	WorldBank	https://data.worldbank.org/indicator/AG.LND.AGRI.ZS?locations=UG
country	UG	total_population	WorldBank 2017	https://data.worldbank.org/indicator/SP.POP.TOTL?locations=UG
country	UG	allLifeExpectancyAtBirths	WorldBank 2017	https://data.worldbank.org/indicator/SP.DYN.LE00.FE.IN?locations=UG
country	UG	allBirthsAttendedBySkilledHealthStaffs	WorldBank	https://data.worldbank.org/indicator/SH.STA.BRTC.ZS?locations=UG
country	UG	allMaternalMortalities	WorldBank	https://data.worldbank.org/indicator/SH.STA.MMRT?locations=UG
country	UG	allTaxRevenues	WorldBank	https://data.worldbank.org/indicator/GC.TAX.TOTL.CN?locations=UG
country	UG	allGiniIndices	WorldBank 2017	https://data.worldbank.org/indicator/SI.POV.GINI?locations=UG
country	UG	allAccountOwnerships	WorldBank 2018	https://data.worldbank.org/indicator/FX.OWN.TOTL.MA.ZS?locations=UG
country	UG	allGdpGrowths	WorldBank	https://data.worldbank.org/indicator/NY.gdp.MKTP.KD.ZG?locations=UG
country	UG	allAdultLiteracyRates	WorldBank 2013	https://data.worldbank.org/indicator/SE.ADT.LITR.FE.ZS?locations=UG
country	UG	allTaxAsPercentageOfGdps	WorldBank 2017	https://data.worldbank.org/indicator/GC.TAX.TOTL.GD.ZS?locations=UG
country	UG	allCerealYieldKgPerHectares	WorldBank	https://data.worldbank.org/indicator/AG.YLD.CREL.KG?locations=UG
country	UG	allMobilePhoneSubscriptions	WorldBank 2017	https://data.worldbank.org/indicator/IT.CEL.SETS.P2?locations=UG
country	UG	allIncidenceOfMalariaPer1000PopAtRisks	WorldBank 2016	https://data.worldbank.org/indicator/SH.MLR.INCD.P3?locations=UG
country	UG	allYouthUnemployments	WorldBank 2017	https://data.worldbank.org/indicator/SL.UEM.1524.MA.ZS?locations=UG
country	UG	allPrimaryEducationCompletionRates	WorldBank 2018	https://data.worldbank.org/indicator/SE.PRM.ENRR.MA?locations=UG
country	UG	allEmploymentToPopulationRatios	WorldBank	https://data.worldbank.org/indicator/SL.EMP.TOTL.SP.MA.ZS?locations=UG
country	UG	allPrevalenceOfUndernourishments	WorldBank 2017	https://data.worldbank.org/indicator/SN.ITK.DEFC.ZS?locations=UG
country	UG	allNursesAndMidwives	WorldBank	https://data.worldbank.org/indicator/SH.MED.NUMW.P3?locations=UG
country	UG	allPrimarySchoolEnrollments	WorldBank 2018	https://data.worldbank.org/indicator/SE.PRM.ENRR.MA?locations=UG
country	KE	allDonorFundedProgrammes	Kenya National Bureau of Statistics 2018	https://www.knbs.or.ke/?wpdmpro=economic-survey-2018
country	KE	allEmploymentInAgricultures	WorldBank 2018	https://data.worldbank.org/indicator/SL.AGR.EMPL.MA.ZS?locations=KE
country	KE	allWomenInGovernments	Kenya National Bureau of Statistics 2018	https://www.knbs.or.ke/?wpdmpro=economic-survey-2018
country	KE	allDonors	OECD 2016	http://www.oecd.org/dac/financing-sustainable-development/development-finance-data/aid-at-a-glance.htm
country	KE	allGdpPerCapitas	WorldBank	https://data.worldbank.org/indicator/NY.gdp.PCAP.CD?locations=KE
country	KE	allBirthsAttendedBySkilledHealthStaffs	WorldBank	https://data.worldbank.org/indicator/SH.STA.BRTC.ZS?locations=KE
country	KE	allFoodProductions	Kenya National Bureau of Statistics 2018	https://www.knbs.or.ke/?wpdmpro=economic-survey-2018
country	KE	allAccessToBasicServices	WorldBank	https://data.worldbank.org/indicator/SH.H2O.BASW.ZS?locations=KE
country	KE	allGovernmentFundings	Kenya National Bureau of Statistics 2018	https://www.knbs.or.ke/?wpdmpro=economic-survey-2018
country	KE	fgm_age_dist	Kenya Demographic and Health Survey 2014	https://openafrica.net/dataset/2014-kenya-demographic-and-health-survey
country	KE	allAgriculturalLands	WorldBank	https://data.worldbank.org/indicator/AG.LND.AGRI.ZS?locations=KE
country	KE	allSecondarySchoolEnrollments	WorldBank	https://data.worldbank.org/indicator/SE.SEC.ENRR.FE?locations=KE
country	KE	total_population	WorldBank	https://data.worldbank.org/indicator/SP.POP.TOTL?locations=KE
country	KE	allWomenInParliaments	WorldBank 2017	https://data.worldbank.org/indicator/SG.GEN.PARL.ZS?end=2017&locations=KE&start=1997
country	KE	allBudgetAllocations	Statistical Abstract 2018	https://www.knbs.or.ke/?wpdmpro=statistics-abstract-2018
country	KE	allLifeExpectancyAtBirths	WorldBank	https://data.worldbank.org/indicator/SP.DYN.LE00.FE.IN?locations=KE
country	KE	allHealthFacilityBeds	Statistical Abstract 2018	https://www.knbs.or.ke/?wpdmpro=statistics-abstract-2018
country	KE	seized_firearms_dist	Kenya National Bureau of Statistics 2018	https://www.knbs.or.ke/?wpdmpro=economic-survey-2018
country	KE	allGdps	WorldBank	https://data.worldbank.org/indicator/NY.gdp.MKTP.CD?locations=KE
country	KE	allMaternalMortalities	WorldBank	https://data.worldbank.org/indicator/SH.STA.MMRT?locations=KE
country	KE	allSecondarySchoolTotEnrollments	Statistical Abstract 2018	https://www.knbs.or.ke/?wpdmpro=statistics-abstract-2018
country	KE	allGdpGrowths	WorldBank	https://data.worldbank.org/indicator/NY.gdp.MKTP.KD.ZG?locations=KE
country	KE	prevention_methods_dist	Kenya Demographic and Health Survey 2014	https://openafrica.net/dataset/2014-kenya-demographic-and-health-survey
country	KE	allGiniIndices	WorldBank	https://data.worldbank.org/indicator/SI.POV.GINI?locations=KE
country	KE	allHealthWorkersDistributions	Kenya National Bureau of Statistics 2018	https://www.knbs.or.ke/?wpdmpro=economic-survey-2018
country	KE	allAccountOwnerships	WorldBank	https://data.worldbank.org/indicator/FX.OWN.TOTL.MA.ZS?locations=KE
country	KE	allPopulationResidence2009S	Census 2009	https://dc.sourceafrica.net/documents/21197-Census-2009.html
country	KE	allPopulationSexYears	Statistical Abstract 2018	https://www.knbs.or.ke/?wpdmpro=statistics-abstract-2018
country	KE	allGdpPerCapitaGrowths	WorldBank	https://data.worldbank.org/indicator/NY.gdp.PCAP.KD.ZG?locations=KE
country	KE	allPhysiciansNursesAndMidwives	WorldBank	https://data.worldbank.org/indicator/SH.MED.PHYS.ZS?locations=KE
country	KE	allFgmPrevalences	WorldBank	https://data.worldbank.org/indicator/SH.STA.FGMS.ZS?locations=KE
country	KE	allAdultLiteracyRates	WorldBank	https://data.worldbank.org/indicator/SE.ADT.LITR.FE.ZS?locations=KE
country	KE	allTaxAsPercentageOfGdps	WorldBank	https://data.worldbank.org/indicator/GC.TAX.TOTL.GD.ZS?locations=KE
country	KE	allPopulationSex2009S	Census 2009	https://dc.sourceafrica.net/documents/21197-Census-2009.html
country	KE	allCerealYieldKgPerHectares	WorldBank	https://data.worldbank.org/indicator/AG.YLD.CREL.KG?locations=KE
country	KE	allTaxRevenues	WorldBank	https://data.worldbank.org/indicator/GC.TAX.TOTL.CN?locations=KE
country	KE	allMobilePhoneSubscriptions	WorldBank	https://data.worldbank.org/indicator/IT.CEL.SETS.P2?locations=KE
country	KE	allIncidenceOfMalariaPer1000PopAtRisks	WorldBank	https://data.worldbank.org/indicator/SH.MLR.INCD.P3?locations=KE
country	KE	allResidencePovertyTypes	Kenya National Bureau of Statistics 2018	https://www.knbs.or.ke/?wpdmpro=economic-survey-2018
country	KE	allPrimarySchoolTotEnrollments	Statistical Abstract 2018	https://www.knbs.or.ke/?wpdmpro=statistics-abstract-2018
country	KE	allHivPrevalences	WorldBank	https://data.worldbank.org/indicator/SH.HIV.1524.MA.ZS?locations=KE
country	KE	allYouthUnemployments	WorldBank	https://data.worldbank.org/indicator/SL.UEM.1524.MA.ZS?locations=KE
country	KE	allPrimaryEducationCompletionRates	WorldBank	https://data.worldbank.org/indicator/SE.PRM.CMPT.MA.ZS?locations=KE
country	KE	allForeignDirectInvestmentNetInflows	WorldBank	https://data.worldbank.org/indicator/?locations=KE
country	KE	allEmploymentToPopulationRatios	WorldBank	https://data.worldbank.org/indicator/SL.EMP.TOTL.SP.MA.ZS?locations=KE
country	KE	allInfantUnder5Mortalities	WorldBank 2017	https://data.worldbank.org/indicator/SP.DYN.IMRT.IN?end=2017&locations=KE&start=1990
country	KE	health_centers_dist	Ministry of Health 2014	https://africaopendata.org/dataset/kenya-health-sector-human-resources-strategy-2014-2018
country	KE	allPrevalenceOfUndernourishments	WorldBank	https://data.worldbank.org/indicator/SN.ITK.DEFC.ZS?locations=KE
country	KE	allPovertyAgeResidences	Kenya National Bureau of Statistics 2018	https://www.knbs.or.ke/?wpdmpro=economic-survey-2018
country	KE	allNursesAndMidwives	WorldBank	https://data.worldbank.org/indicator/SH.MED.NUMW.P3?locations=KE
country	KE	allPrimarySchoolEnrollments	Worldbank	https://data.worldbank.org/indicator/SE.PRM.ENRR.MA?locations=NG
level1	KE	allBudgetAllocations	Statistical Abstract 2018	https://www.knbs.or.ke/?wpdmpro=statistics-abstract-2018
level1	KE	allHealthFacilityBeds	Statistical Abstract 2018	https://www.knbs.or.ke/?wpdmpro=statistics-abstract-2018
level1	KE	allHivPrevalences	Kenya HIV Estimates NACC 2018	https://africaopendata.org/dataset/kenya-hiv-estimates-2018
level1	KE	allPopulationSex2009S	Census 2009	https://dc.sourceafrica.net/documents/21197-Census-2009.html
level1	KE	allSecondarySchoolTotEnrollments	Statistical Abstract 2018	https://www.knbs.or.ke/?wpdmpro=statistics-abstract-2018
level1	KE	allPopulationSexYears	Statistical Abstract 2018	https://www.knbs.or.ke/?wpdmpro=statistics-abstract-2018
level1	KE	allPrimarySchoolTotEnrollments	Statistical Abstract 2018	https://www.knbs.or.ke/?wpdmpro=statistics-abstract-2018
country	NG	allHivPrevalences	WorldBank	https://data.worldbank.org/indicator/SH.HIV.1524.MA.ZS?locations=NG
country	NG	allSecondarySchoolEnrollments	WorldBank	https://data.worldbank.org/indicator/SE.SEC.ENRR.FE?locations=NG
country	NG	allGdpPerCapitas	WorldBank	https://data.worldbank.org/indicator/NY.gdp.PCAP.CD?locations=NG
country	NG	allBirthsAttendedBySkilledHealthStaffs	Federal Ministry of Health 2018	https://msdat.fmohconnect.gov.ng/#/central_analytics/ODY
country	NG	allFoodProductions	National Bureau of Statistics 2018	https://nigerianstat.gov.ng/
country	NG	allAccessToBasicServices	WorldBank	https://data.worldbank.org/indicator/SH.H2O.BASW.ZS?locations=NG
country	NG	allForeignDirectInvestmentNetInflows	WorldBank	https://data.worldbank.org/indicator/?locations=NG
country	NG	allNumberOfDoctorsYearSexes	National Bureau of Statistics 2018	https://nigerianstat.gov.ng/download/952
country	NG	allAccountOwnerships	WorldBank	https://data.worldbank.org/indicator/FX.OWN.TOTL.MA.ZS?locations=NG
country	NG	allYouthUnemploymentGenerals	National Bureau of Statistics 2017	https://openafrica.net/dataset/labor_force_unemployment_rate_2017_2018
country	NG	allPrimaryEducationCompletionSexes	Nigeria Federal Ministry of Education 2016	https://africaopendata.org/dataset/nigeria-education-indicators-2016
country	NG	total_population	WorldBank	https://data.worldbank.org/indicator/SP.POP.TOTL?locations=NG
country	NG	allAccountOwnershipIndicators	Multiple Indicator Cluster Survey 2016-17	https://mics-surveys-prod.s3.amazonaws.com/MICS5/West%20and%20Central%20Africa/Nigeria/2016-2017/Final/Nigeria%202016-17%20MICS_English.zip
country	NG	allLiteracySexes	National Bureau of Statistics 2018	https://nigerianstat.gov.ng/download/952
country	NG	allLifeExpectancyAtBirths	WorldBank	https://data.worldbank.org/indicator/SP.DYN.LE00.FE.IN?locations=NG
country	NG	allGdps	WorldBank	https://data.worldbank.org/indicator/NY.gpds.MKTP.CD?locations=NG
country	NG	allMaternalMortalities	WorldBank	https://data.worldbank.org/indicator/SH.STA.MMRT?locations=NG
country	NG	allPopulationSex2006S	Nigeria Bureau of Statistics 2016	https://openafrica.net/dataset/population_projections_2007_2016
country	NG	allVotesPerCandidates	Commonwealth Nigeria Presidentail and National Assembly Elections 2015	https://africaopendata.org/dataset/nigeria-presidential-and-national-assembly-elections-2015
country	NG	allPopulationSexYears	Nigeria Bureau of Statistics 2016	https://openafrica.net/dataset/population_projections_2007_2016
country	NG	allTaxRevenues	WorldBank	https://data.worldbank.org/indicator/GC.TAX.TOTL.CN?locations=NG
country	NG	allValidInvalidVotes	Commonwealth Nigeria Presidentail and National Assembly Elections 2015	https://africaopendata.org/dataset/nigeria-presidential-and-national-assembly-elections-2015
country	NG	allGiniIndices	WorldBank	https://data.worldbank.org/indicator/SI.POV.GINI?locations=NG
country	NG	allAccessToElecWaterServices	Nigeria National Bureau of Statistics 2017	http://microdata.worldbank.org/index.php/catalog/3002/download/41925
country	NG	allPrimarySchoolEnrollmentDistributions	 National Bureau of Statistics 2018	https://nigerianstat.gov.ng/download/952
country	NG	allHumanDevIndices	Computation of Human Development Indices for the UNDP Nigeria Human Development Report (2016)	https://nigerianstat.gov.ng/download/830
country	NG	allGdpGrowths	WorldBank	https://data.worldbank.org/indicator/NY.gdp.MKTP.KD.ZG?locations=NG
country	NG	allGdpPerCapitaGrowths	WorldBank	https://data.worldbank.org/indicator/NY.gdp.PCAP.KD.ZG?locations=NG
country	NG	allPhysiciansNursesAndMidwives	WorldBank	https://data.worldbank.org/indicator/SH.MED.PHYS.ZS?locations=NG
country	NG	allFgmPrevalences	WorldBank	https://data.worldbank.org/indicator/SH.STA.FGMS.ZS?locations=NG
country	NG	allAdultLiteracyRates	WorldBank	https://data.worldbank.org/indicator/SE.ADT.LITR.FE.ZS?locations=NG
country	NG	allTaxAsPercentageOfGdps	WorldBank	https://data.worldbank.org/indicator/GC.TAX.TOTL.GD.ZS?locations=NG
country	NG	allCerealYieldKgPerHectares	WorldBank	https://data.worldbank.org/indicator/AG.YLD.CREL.KG?locations=NG
country	NG	allNumberOfDentistYearSexes	National Bureau of Statistics 2018	https://nigerianstat.gov.ng/download/952
country	NG	allMobilePhoneSubscriptions	WorldBank	https://data.worldbank.org/indicator/IT.CEL.SETS.P2?locations=NG
country	NG	allIncidenceOfMalariaPer1000PopAtRisks	WorldBank	https://data.worldbank.org/indicator/SH.MLR.INCD.P3?locations=NG
country	NG	allJuniorSecondarySchoolEnrollments	 National Bureau of Statistics 2018	https://nigerianstat.gov.ng/download/952
country	NG	allAgriculturalLands	WorldBank	https://data.worldbank.org/indicator/AG.LND.AGRI.ZS?locations=NG
country	NG	allSeniorSecondarySchoolEnrollments	 National Bureau of Statistics 2018	https://nigerianstat.gov.ng/download/952
country	NG	allYouthUnemployments	WorldBank	https://data.worldbank.org/indicator/SL.UEM.1524.MA.ZS?locations=NG
country	NG	allPrimaryEducationCompletionRates	WorldBank	https://data.worldbank.org/indicator/SE.PRM.ENRR.MA?locations=NG
country	NG	allRegisteredAccreditedVoters	Commonwealth Nigeria Presidentail and National Assembly Elections 2015	https://africaopendata.org/dataset/nigeria-presidential-and-national-assembly-elections-2015
country	NG	allPrevalenceFgms	MICS 2016-17	https://mics-surveys-prod.s3.amazonaws.com/MICS5/West%20and%20Central%20Africa/Nigeria/2016-2017/Final/Nigeria%202016-17%20MICS_English.zip
country	NG	allEmploymentToPopulationRatios	WorldBank	https://data.worldbank.org/indicator/SL.EMP.TOTL.SP.MA.ZS?locations=NG
country	NG	allHivPatientsDistributions	National Bureau of Statistics 2018	https://nigerianstat.gov.ng/download/952
country	NG	allMalariaPrevalences	Kenya Malaria Indicator Survey 2015	https://openafrica.net/dataset/kenya-malaria-indicator-survey-2015-kmis-report
country	NG	allPrevalenceOfUndernourishments	WorldBank	https://data.worldbank.org/indicator/SN.ITK.DEFC.ZS?locations=NG
country	NG	allNursesAndMidwives	WorldBank	https://data.worldbank.org/indicator/SH.MED.NUMW.P3?locations=NG
country	NG	allPrimarySchoolEnrollments	Worldbank	https://data.worldbank.org/indicator/SE.PRM.ENRR.MA?locations=NG
level1	NG	allHivPrevalences	WorldBank	https://data.worldbank.org/indicator/SH.HIV.1524.MA.ZS?locations=NG
level1	NG	allSecondarySchoolEnrollments	WorldBank	https://data.worldbank.org/indicator/SE.SEC.ENRR.FE?locations=NG
level1	NG	allGdpPerCapitas	WorldBank	https://data.worldbank.org/indicator/NY.gdp.PCAP.CD?locations=NG
level1	NG	allGdps	WorldBank	https://data.worldbank.org/indicator/NY.gpds.MKTP.CD?locations=NG
level1	NG	allFoodProductions	National Bureau of Statistics 2018	https://nigerianstat.gov.ng/
level1	NG	allAccessToBasicServices	WorldBank	https://data.worldbank.org/indicator/SH.H2O.BASW.ZS?locations=NG
level1	NG	allForeignDirectInvestmentNetInflows	WorldBank	https://data.worldbank.org/indicator/?locations=NG
level1	NG	allNumberOfDoctorsYearSexes	National Bureau of Statistics 2018	https://nigerianstat.gov.ng/download/952
level1	NG	allAccountOwnerships	WorldBank	https://data.worldbank.org/indicator/FX.OWN.TOTL.MA.ZS?locations=NG
level1	NG	allYouthUnemploymentGenerals	National Bureau of Statistics 2017	https://openafrica.net/dataset/labor_force_unemployment_rate_2017_2018
level1	NG	allPrimaryEducationCompletionSexes	Nigeria Federal Ministry of Education 2016	https://africaopendata.org/dataset/nigeria-education-indicators-2016
level1	NG	total_population	WorldBank	https://data.worldbank.org/indicator/SP.POP.TOTL?locations=NG
level1	NG	allAccountOwnershipIndicators	Multiple Indicator Cluster Survey 2016-17	https://mics-surveys-prod.s3.amazonaws.com/MICS5/West%20and%20Central%20Africa/Nigeria/2016-2017/Final/Nigeria%202016-17%20MICS_English.zip
level1	NG	allLiteracySexes	 National Bureau of Statistics 2018	https://nigerianstat.gov.ng/download/952
level1	NG	allLifeExpectancyAtBirths	WorldBank	https://data.worldbank.org/indicator/SP.DYN.LE00.FE.IN?locations=NG
level1	NG	allBirthsAttendedBySkilledHealthStaffs	Federal Ministry of Health 2018	https://msdat.fmohconnect.gov.ng/#/central_analytics/ODY
level1	NG	allMaternalMortalities	 National Bureau of Statistics 2018	https://nigerianstat.gov.ng/download/952
level1	NG	allPopulationSex2006S	Nigeria Bureau of Statistics 2016	https://openafrica.net/dataset/population_projections_2007_2016
level1	NG	allVotesPerCandidates	Commonwealth Nigeria Presidentail and National Assembly Elections 2015	https://africaopendata.org/dataset/nigeria-presidential-and-national-assembly-elections-2015
level1	NG	allPopulationSexYears	Nigeria Bureau of Statistics 2016	https://openafrica.net/dataset/population_projections_2007_2016
level1	NG	allTaxRevenues	WorldBank	https://data.worldbank.org/indicator/GC.TAX.TOTL.CN?locations=NG
level1	NG	allValidInvalidVotes	Commonwealth Nigeria Presidentail and National Assembly Elections 2015	https://africaopendata.org/dataset/nigeria-presidential-and-national-assembly-elections-2015
level1	NG	allGiniIndices	WorldBank	https://data.worldbank.org/indicator/SI.POV.GINI?locations=NG
level1	NG	allAccessToElecWaterServices	Nigeria National Bureau of Statistics 2017	http://microdata.worldbank.org/index.php/catalog/3002/download/41925
level1	NG	allPrimarySchoolEnrollmentDistributions	 National Bureau of Statistics 2018	https://nigerianstat.gov.ng/download/952
level1	NG	allHumanDevIndices	Computation of Human Development Indices for the UNDP Nigeria Human Development Report (2016)	https://nigerianstat.gov.ng/download/830
level1	NG	allGdpGrowths	WorldBank	https://data.worldbank.org/indicator/NY.gdp.MKTP.KD.ZG?locations=NG
level1	NG	allGdpPerCapitaGrowths	WorldBank	https://data.worldbank.org/indicator/NY.gdp.PCAP.KD.ZG?locations=NG
level1	NG	allPhysiciansNursesAndMidwives	WorldBank	https://data.worldbank.org/indicator/SH.MED.PHYS.ZS?locations=NG
level1	NG	allFgmPrevalences	WorldBank	https://data.worldbank.org/indicator/SH.STA.FGMS.ZS?locations=NG
level1	NG	allAdultLiteracyRates	WorldBank	https://data.worldbank.org/indicator/SE.ADT.LITR.FE.ZS?locations=NG
level1	NG	allTaxAsPercentageOfGdps	WorldBank	https://data.worldbank.org/indicator/GC.TAX.TOTL.GD.ZS?locations=NG
level1	NG	allCerealYieldKgPerHectares	WorldBank	https://data.worldbank.org/indicator/AG.YLD.CREL.KG?locations=NG
level1	NG	allNumberOfDentistYearSexes	National Bureau of Statistics 2018	https://nigerianstat.gov.ng/download/952
level1	NG	allMobilePhoneSubscriptions	WorldBank	https://data.worldbank.org/indicator/IT.CEL.SETS.P2?locations=NG
level1	NG	allIncidenceOfMalariaPer1000PopAtRisks	WorldBank	https://data.worldbank.org/indicator/SH.MLR.INCD.P3?locations=NG
level1	NG	allJuniorSecondarySchoolEnrollments	 National Bureau of Statistics 2018	https://nigerianstat.gov.ng/download/952
level1	NG	allAgriculturalLands	WorldBank	https://data.worldbank.org/indicator/AG.LND.AGRI.ZS?locations=NG
level1	NG	allSeniorSecondarySchoolEnrollments	 National Bureau of Statistics 2018	https://nigerianstat.gov.ng/download/952
level1	NG	allYouthUnemployments	WorldBank	https://data.worldbank.org/indicator/SL.UEM.1524.MA.ZS?locations=NG
level1	NG	allPrimaryEducationCompletionRates	WorldBank	https://data.worldbank.org/indicator/SE.PRM.ENRR.MA?locations=NG
level1	NG	allRegisteredAccreditedVoters	Commonwealth Nigeria Presidentail and National Assembly Elections 2015	https://africaopendata.org/dataset/nigeria-presidential-and-national-assembly-elections-2015
level1	NG	allPrevalenceFgms	MICS 2016-17	https://mics-surveys-prod.s3.amazonaws.com/MICS5/West%20and%20Central%20Africa/Nigeria/2016-2017/Final/Nigeria%202016-17%20MICS_English.zip
level1	NG	allEmploymentToPopulationRatios	WorldBank	https://data.worldbank.org/indicator/SL.EMP.TOTL.SP.MA.ZS?locations=NG
level1	NG	allHivPatientsDistributions	 National Bureau of Statistics 2018	https://nigerianstat.gov.ng/download/952
level1	NG	allMalariaPrevalences	Kenya Malaria Indicator Survey 2015	https://openafrica.net/dataset/kenya-malaria-indicator-survey-2015-kmis-report
level1	NG	allPrevalenceOfUndernourishments	WorldBank	https://data.worldbank.org/indicator/SN.ITK.DEFC.ZS?locations=NG
level1	NG	allNursesAndMidwives	WorldBank	https://data.worldbank.org/indicator/SH.MED.NUMW.P3?locations=NG
level1	NG	allPrimarySchoolEnrollments	Worldbank	https://data.worldbank.org/indicator/SE.PRM.ENRR.MA?locations=NG
country	BF	allGdps	WorldBank	https://data.worldbank.org/indicator/NY.gdp.MKTP.CD?locations=BF
country	BF	allSecondarySchoolEnrollments	WorldBank 2018	https://data.worldbank.org/indicator/SE.SEC.ENRR.FE?locations=BF
country	BF	allGdpPerCapitas	WorldBank 2017	https://data.worldbank.org/indicator/NY.gdp.PCAP.CD?locations=BF
country	BF	allGdpPerCapitaGrowths	WorldBank 2018	https://data.worldbank.org/indicator/NY.gdp.PCAP.KD.ZG?locations=BF
country	BF	allAccessToBasicServices	WorldBank	https://data.worldbank.org/indicator/SH.H2O.BASW.ZS?locations=BF
country	BF	allAgriculturalLands	WorldBank 2018	https://data.worldbank.org/indicator/AG.LND.AGRI.ZS?locations=BF
country	BF	total_population	WorldBank 2018	https://data.worldbank.org/indicator/SP.POP.TOTL?locations=BF
country	BF	allLifeExpectancyAtBirths	WorldBank 2017	https://data.worldbank.org/indicator/SP.DYN.LE00.FE.IN?locations=BF
country	BF	allBirthsAttendedBySkilledHealthStaffs	WorldBank	https://data.worldbank.org/indicator/SH.STA.BRTC.ZS?locations=BF
country	BF	allMaternalMortalities	WorldBank	https://data.worldbank.org/indicator/SH.STA.MMRT?locations=BF
country	BF	allTaxRevenues	WorldBank	https://data.worldbank.org/indicator/GC.TAX.TOTL.CN?locations=BF
country	BF	allGiniIndices	WorldBank 2017	https://data.worldbank.org/indicator/SI.POV.GINI?locations=BF
country	BF	allAccountOwnerships	WorldBank 2018	https://data.worldbank.org/indicator/FX.OWN.TOTL.MA.ZS?locations=BF
country	BF	allGdpGrowths	WorldBank	https://data.worldbank.org/indicator/NY.gdp.MKTP.KD.ZG?locations=BF
country	BF	allFgmPrevalences	WorldBank	https://data.worldbank.org/indicator/SH.STA.FGMS.ZS?locations=BF
country	BF	allAdultLiteracyRates	WorldBank 2018	https://data.worldbank.org/indicator/SE.ADT.LITR.MA.ZS?locations=BF
country	BF	allTaxAsPercentageOfGdps	WorldBank 2017	https://data.worldbank.org/indicator/GC.TAX.TOTL.GD.ZS?locations=BF
country	BF	allCerealYieldKgPerHectares	WorldBank	https://data.worldbank.org/indicator/AG.YLD.CREL.KG?locations=BF
country	BF	allMobilePhoneSubscriptions	WorldBank 2017	https://data.worldbank.org/indicator/IT.CEL.SETS.P2?locations=BF
country	BF	allIncidenceOfMalariaPer1000PopAtRisks	WorldBank 2017	https://data.worldbank.org/indicator/SH.MLR.INCD.P3?locations=BF
country	BF	allYouthUnemployments	WorldBank 2018	https://data.worldbank.org/indicator/SL.UEM.1524.MA.ZS?locations=BF
country	BF	allPrimaryEducationCompletionRates	WorldBank 2018	https://data.worldbank.org/indicator/SE.PRM.ENRR.MA?locations=BF
country	BF	allForeignDirectInvestmentNetInflows	WorldBank	https://data.worldbank.org/indicator/?locations=BF
country	BF	allEmploymentToPopulationRatios	WorldBank	https://data.worldbank.org/indicator/SL.EMP.TOTL.SP.MA.ZS?locations=BF
country	BF	allPrevalenceOfUndernourishments	WorldBank 2017	https://data.worldbank.org/indicator/SN.ITK.DEFC.ZS?locations=BF
country	BF	allNursesAndMidwives	WorldBank	https://data.worldbank.org/indicator/SH.MED.NUMW.P3?locations=BF
country	BF	allPrimarySchoolEnrollments	Worldbank	https://data.worldbank.org/indicator/SE.PRM.ENRR.MA?locations=BF
country	ZM	allSecondarySchoolEnrollments	WorldBank 2018	https://data.worldbank.org/indicator/SE.SEC.ENRR.FE?locations=ZM
country	ZM	allGdpPerCapitas	WorldBank 2017	https://data.worldbank.org/indicator/NY.gdp.PCAP.CD?locations=ZM
country	ZM	allGdps	WorldBank	https://data.worldbank.org/indicator/NY.gdp.MKTP.CD?locations=ZM
country	ZM	allAccessToBasicServices	WorldBank	https://data.worldbank.org/indicator/SH.H2O.BASW.ZS?locations=ZM
country	ZM	allAgriculturalLands	WorldBank	https://data.worldbank.org/indicator/AG.LND.AGRI.ZS?locations=ZM
country	ZM	total_population	WorldBank 2018	https://data.worldbank.org/indicator/SP.POP.TOTL?locations=ZM
country	ZM	allLifeExpectancyAtBirths	WorldBank 2017	https://data.worldbank.org/indicator/SP.DYN.LE00.FE.IN?locations=ZM
country	ZM	allBirthsAttendedBySkilledHealthStaffs	WorldBank	https://data.worldbank.org/indicator/SH.STA.BRTC.ZS?locations=ZM
country	ZM	allMaternalMortalities	WorldBank	https://data.worldbank.org/indicator/SH.STA.MMRT?locations=ZM
country	ZM	allGdpPerCapitaGrowths	WorldBank 2018	https://data.worldbank.org/indicator/NY.gdp.PCAP.KD.ZG?locations=ZM
country	ZM	allTaxRevenues	WorldBank	https://data.worldbank.org/indicator/GC.TAX.TOTL.CN?locations=ZM
country	ZM	allGiniIndices	WorldBank 2017	https://data.worldbank.org/indicator/SI.POV.GINI?locations=ZM
country	ZM	allAccountOwnerships	WorldBank 2018	https://data.worldbank.org/indicator/FX.OWN.TOTL.MA.ZS?locations=ZM
country	ZM	allGdpGrowths	WorldBank	https://data.worldbank.org/indicator/NY.gdp.MKTP.KD.ZG?locations=UG
country	ZM	allAdultLiteracyRates	WorldBank	https://data.worldbank.org/indicator/SE.ADT.LITR.FE.ZS?locations=ZM
country	ZM	allTaxAsPercentageOfGdps	WorldBank 2017	https://data.worldbank.org/indicator/GC.TAX.TOTL.GD.ZS?locations=ZM
country	ZM	allCerealYieldKgPerHectares	WorldBank	https://data.worldbank.org/indicator/AG.YLD.CREL.KG?locations=ZM
country	ZM	allMobilePhoneSubscriptions	WorldBank 2017	https://data.worldbank.org/indicator/IT.CEL.SETS.P2?locations=ZM
country	ZM	allIncidenceOfMalariaPer1000PopAtRisks	WorldBank 2016	https://data.worldbank.org/indicator/SH.MLR.INCD.P3?locations=ZM
country	ZM	allYouthUnemployments	WorldBank 2017	https://data.worldbank.org/indicator/SL.UEM.1524.MA.ZS?locations=ZM
country	ZM	allPrimaryEducationCompletionRates	WorldBank 2018	https://data.worldbank.org/indicator/SE.PRM.ENRR.MA?locations=ZM
country	ZM	allForeignDirectInvestmentNetInflows	WorldBank	https://data.worldbank.org/indicator/?locations=ZM
country	ZM	allEmploymentToPopulationRatios	WorldBank	https://data.worldbank.org/indicator/SL.EMP.TOTL.SP.MA.ZS?locations=ZM
country	ZM	allPrevalenceOfUndernourishments	WorldBank	https://data.worldbank.org/indicator/SN.ITK.DEFC.ZS?locations=ZM
country	ZM	allNursesAndMidwives	WorldBank	https://data.worldbank.org/indicator/SH.MED.NUMW.P3?locations=ZM
country	ZM	allPrimarySchoolEnrollments	WorldBank 2018	https://data.worldbank.org/indicator/SE.PRM.ENRR.MA?locations=ZM
\.


--
-- Name: sources pk_sources; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sources
    ADD CONSTRAINT pk_sources PRIMARY KEY (geo_level, country_code, table_name);


--
-- PostgreSQL database dump complete
--

