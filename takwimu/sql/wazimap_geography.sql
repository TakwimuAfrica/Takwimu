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
279	continent	AFR	Africa	\N	\N	\N	Africa	2009
280	country	NG	Nigeria	923768	continent	AFR	Nigeria	2009
281	country	SN	Senegal	196712	continent	AFR	Senegal	2009
282	country	TZ	Tanzania	945087	continent	AFR	Tanzania	2009
283	level1	NG_1_006	Bayelsa	10773	country	NG	Bayelsa	2009
284	level1	NG_1_007	Benue	34059	country	NG	Benue	2009
285	level1	NG_1_008	Borno	70898	country	NG	Borno	2009
286	level1	NG_1_009	Cross River	20156	country	NG	Cross River	2009
287	level1	NG_1_010	Delta	17698	country	NG	Delta	2009
288	level1	NG_1_011	Ebonyi	5670	country	NG	Ebonyi	2009
289	level1	NG_1_012	Edo	17802	country	NG	Edo	2009
290	level1	NG_1_013	Ekiti	6353	country	NG	Ekiti	2009
291	level1	NG_1_014	Enugu	7161	country	NG	Enugu	2009
292	level1	NG_1_015	Federal Capital Territory	7315	country	NG	Federal Capital Territory	2009
293	level1	NG_1_016	Gombe	18768	country	NG	Gombe	2009
294	level1	NG_1_017	Imo	5530	country	NG	Imo	2009
295	level1	NG_1_018	Jigawa	23154	country	NG	Jigawa	2009
296	level1	NG_1_019	Kaduna	46053	country	NG	Kaduna	2009
297	level1	NG_1_020	Kano	20131	country	NG	Kano	2009
298	level1	NG_1_021	Katsina	24192	country	NG	Katsina	2009
299	level1	NG_1_022	Kebbi	36800	country	NG	Kebbi	2009
300	level1	NG_1_023	Kogi	29833	country	NG	Kogi	2009
301	level1	NG_1_024	Kwara	36825	country	NG	Kwara	2009
302	level1	NG_1_025	Lagos	3345	country	NG	Lagos	2009
303	level1	NG_1_026	Nasarawa	27117	country	NG	Nasarawa	2009
304	level1	NG_1_027	Niger	76363	country	NG	Niger	2009
305	level1	NG_1_028	Ogun	16762	country	NG	Ogun	2009
306	level1	NG_1_029	Ondo	15500	country	NG	Ondo	2009
307	level1	NG_1_030	Osun	9251	country	NG	Osun	2009
308	level1	NG_1_031	Oyo	28454	country	NG	Oyo	2009
309	level1	NG_1_032	Plateau	30913	country	NG	Plateau	2009
310	level1	NG_1_033	Rivers	11077	country	NG	Rivers	2009
311	level1	NG_1_034	Sokoto	25973	country	NG	Sokoto	2009
312	level1	NG_1_035	Taraba	54473	country	NG	Taraba	2009
313	level1	NG_1_036	Yobe	45502	country	NG	Yobe	2009
314	level1	NG_1_037	Zamfara	39762	country	NG	Zamfara	2009
315	level1	SN_1_001	Dakar	547	country	SN	Dakar	2009
316	level1	SN_1_002	Diourbel	4824	country	SN	Diourbel	2009
317	level1	SN_1_003	Fatick	6849	country	SN	Fatick	2009
318	level1	SN_1_004	Kaffrine	11262	country	SN	Kaffrine	2009
319	level1	SN_1_005	Kaolack	5357	country	SN	Kaolack	2009
320	level1	SN_1_006	Kedougou	16800	country	SN	Kedougou	2009
321	level1	SN_1_007	Kolda	13771	country	SN	Kolda	2009
322	level1	SN_1_008	Louga	24889	country	SN	Louga	2009
323	level1	SN_1_009	Matam	29445	country	SN	Matam	2009
324	level1	SN_1_010	Saint Louis	19241	country	SN	Saint Louis	2009
325	level1	SN_1_011	Sedhiou	7341	country	SN	Sedhiou	2009
326	level1	SN_1_012	Tambacounda	42364	country	SN	Tambacounda	2009
327	level1	SN_1_013	Thies	6670	country	SN	Thies	2009
328	level1	SN_1_014	Ziguinchor	7352	country	SN	Ziguinchor	2009
329	level1	TZ_1_022	Pwani	32407	country	TZ	Pwani	2009
330	level1	TZ_1_026	Simiyu	2380	country	TZ	Simiyu	2009
331	level1	TZ_1_004	Geita	20054	country	TZ	Geita	2009
332	level1	TZ_1_027	Singida	49437	country	TZ	Singida	2009
333	level1	TZ_1_005	Iringa	58936	country	TZ	Iringa	2009
334	level1	TZ_1_023	Rukwa	75240	country	TZ	Rukwa	2009
335	level1	TZ_1_006	Kagera	39627	country	TZ	Kagera	2009
336	level1	TZ_1_010	Kigoma	45066	country	TZ	Kigoma	2009
337	level1	TZ_1_014	Lindi	67000	country	TZ	Lindi	2009
338	level1	TZ_1_002	Dar es salaam	1393	country	TZ	Dar es salaam	2009
339	level1	TZ_1_003	Dodoma	41311	country	TZ	Dodoma	2009
340	level1	TZ_1_028	Tanga	27348	country	TZ	Tanga	2009
341	level1	TZ_1_019	Mtwara	16707	country	TZ	Mtwara	2009
342	level1	TZ_1_021	Njombe	21347	country	TZ	Njombe	2009
343	level1	TZ_1_029	Tabora	76151	country	TZ	Tabora	2009
344	level1	TZ_1_011	Kilimanjaro	13209	country	TZ	Kilimanjaro	2009
345	level1	TZ_1_025	Shinyanga	40781	country	TZ	Shinyanga	2009
346	level1	TZ_1_016	Mara	31150	country	TZ	Mara	2009
347	level1	TZ_1_024	Ruvuma	66477	country	TZ	Ruvuma	2009
348	level1	TZ_1_020	Mwanza	35187	country	TZ	Mwanza	2009
349	level1	TZ_1_017	Mbeya	62420	country	TZ	Mbeya	2009
350	level1	TZ_1_001	Arusha	34516	country	TZ	Arusha	2009
351	level1	TZ_1_018	Morogoro	73139	country	TZ	Morogoro	2009
352	level1	TZ_1_009	Katavi	45843	country	TZ	Katavi	2009
353	level1	TZ_1_015	Manyara	47913	country	TZ	Manyara	2009
354	level1	TZ_1_012	Kusini Pemba	332	country	TZ	Kusini Pemba	2009
355	level1	TZ_1_008	Kaskazini Unguja	470	country	TZ	Kaskazini Unguja	2009
356	level1	TZ_1_013	Kusini Unguja	854	country	TZ	Kusini Unguja	2009
357	level1	TZ_1_030	Mjini Magharibi	230	country	TZ	Mjini Magharibi	2009
358	level1	TZ_1_007	Kaskazini Pemba	574	country	TZ	Kaskazini Pemba	2009
359	level1	NG_1_001	Abia	6320	country	NG	Abia	2009
360	level1	NG_1_002	Adamawa	36917	country	NG	Adamawa	2009
361	level1	NG_1_003	Akwa Ibom	7081	country	NG	Akwa Ibom	2009
362	level1	NG_1_004	Anambra	4844	country	NG	Anambra	2009
363	level1	NG_1_005	Bauchi	45837	country	NG	Bauchi	2009
364	level1	KE_1_020	Kirinyaga	1478.3	country	KE	Kirinyaga	2009
365	level1	KE_1_021	Murang'a	2524.2	country	KE	Murang'a	2009
366	level1	KE_1_018	Nyandarua	3285.7	country	KE	Nyandarua	2009
367	level1	KE_1_019	Nyeri	3325	country	KE	Nyeri	2009
368	level1	KE_1_024	West Pokot	9123.2	country	KE	West Pokot	2009
369	level1	KE_1_025	Samburu	21065.1	country	KE	Samburu	2009
370	level1	KE_1_022	Kiambu	2538.6	country	KE	Kiambu	2009
371	level1	KE_1_023	Turkana	68232.9	country	KE	Turkana	2009
372	level1	KE_1_028	Elgeyo-Marakwet	3032	country	KE	Elgeyo-Marakwet	2009
373	level1	KE_1_029	Nandi	2855.8	country	KE	Nandi	2009
374	level1	KE_1_026	Trans-Nzoia	2495.2	country	KE	Trans-Nzoia	2009
375	level1	KE_1_027	Uasin Gishu	3392.2	country	KE	Uasin Gishu	2009
376	level1	KE_1_032	Nakuru	7462.4	country	KE	Nakuru	2009
377	level1	KE_1_033	Narok	17950.3	country	KE	Narok	2009
378	level1	KE_1_030	Baringo	10976.4	country	KE	Baringo	2009
379	level1	KE_1_031	Laikipia	9532.2	country	KE	Laikipia	2009
380	level1	KE_1_036	Bomet	2530.9	country	KE	Bomet	2009
381	level1	KE_1_037	Kakamega	3020	country	KE	Kakamega	2009
382	level1	KE_1_034	Kajiado	21871.1	country	KE	Kajiado	2009
383	level1	KE_1_035	Kericho	2436.1	country	KE	Kericho	2009
384	level1	KE_1_040	Busia	1696.3	country	KE	Busia	2009
385	level1	KE_1_041	Siaya	2529.8	country	KE	Siaya	2009
386	level1	KE_1_038	Vihiga	563.8	country	KE	Vihiga	2009
387	level1	KE_1_039	Bungoma	3023.9	country	KE	Bungoma	2009
388	level1	KE_1_044	Migori	2613.5	country	KE	Migori	2009
389	level1	KE_1_045	Kisii	1323	country	KE	Kisii	2009
390	level1	KE_1_042	Kisumu	2085.4	country	KE	Kisumu	2009
391	level1	KE_1_043	Homa Bay	3152.5	country	KE	Homa Bay	2009
392	level1	KE_1_046	Nyamira	897.3	country	KE	Nyamira	2009
393	level1	KE_1_047	Nairobi	703.9	country	KE	Nairobi	2009
394	country	KE	Kenya	580876.3	continent	AFR	Kenya	2009
395	level1	KE_1_001	Mombasa	219.9	country	KE	Mombasa	2009
396	level1	KE_1_004	Tana River	37950.5	country	KE	Tana River	2009
397	level1	KE_1_005	Lamu	6253.3	country	KE	Lamu	2009
398	level1	KE_1_002	Kwale	8267.1	country	KE	Kwale	2009
399	level1	KE_1_003	Kilifi	12539.7	country	KE	Kilifi	2009
400	level1	KE_1_008	Wajir	56773.1	country	KE	Wajir	2009
401	level1	KE_1_009	Mandera	25939.8	country	KE	Mandera	2009
402	level1	KE_1_006	Taita Taveta	17152	country	KE	Taita Taveta	2009
403	level1	KE_1_007	Garissa	44736	country	KE	Garissa	2009
404	level1	KE_1_012	Meru	7006.3	country	KE	Meru	2009
405	level1	KE_1_013	Tharaka-Nithi	2564.4	country	KE	Tharaka-Nithi	2009
406	level1	KE_1_010	Marsabit	70944.1	country	KE	Marsabit	2009
407	level1	KE_1_011	Isiolo	25350.6	country	KE	Isiolo	2009
408	level1	KE_1_016	Machakos	6042.7	country	KE	Machakos	2009
409	level1	KE_1_017	Makueni	8169.8	country	KE	Makueni	2009
410	level1	KE_1_014	Embu	2820.7	country	KE	Embu	2009
411	level1	KE_1_015	Kitui	30429.5	country	KE	Kitui	2009
412	country	ET	Ethiopia	1104000	continent	AFR	Ethiopia	2009
413	level1	ET_1_001	Addis Ababa	526.99	country	ET	Addis Ababa	2009
414	level1	ET_1_002	Afar	72052.78	country	ET	Afar	2009
415	level1	ET_1_003	Amhara	154708.96	country	ET	Amhara	2009
416	level1	ET_1_004	Beneshangul Gumuz	50698.68	country	ET	Beneshangul Gumuz	2009
417	level1	ET_1_005	Dire Dawa	1558.61	country	ET	Dire Dawa	2009
418	level1	ET_1_006	Gambella	29782.82	country	ET	Gambella	2009
419	level1	ET_1_007	Harar	333.94	country	ET	Harar	2009
420	level1	ET_1_008	Oromiya	284537.84	country	ET	Oromiya	2009
421	level1	ET_1_009	SNNPR	105476	country	ET	SNNPR	2009
422	level1	ET_1_010	Somali	279252	country	ET	Somali	2009
423	level1	ET_1_011	Tigray	84722	country	ET	Tigray	2009
424	country	ZA	South Africa	1221037	continent	AFR	South Africa	2009
425	level1	ZA_1_001	KwaZulu-Natal	94361	country	ZA	KwaZulu-Natal	2009
426	level1	ZA_1_002	Free State	129825	country	ZA	KwaZulu-Natal	2009
427	level1	ZA_1_003	Eastern Cape	168966	country	ZA	KwaZulu-Natal	2009
428	level1	ZA_1_004	Mpumalanga	76495	country	ZA	KwaZulu-Natal	2009
429	level1	ZA_1_005	Limpopo	125754	country	ZA	KwaZulu-Natal	2009
430	level1	ZA_1_006	Northern Cape	372889	country	ZA	KwaZulu-Natal	2009
431	level1	ZA_1_007	North West	104882	country	ZA	KwaZulu-Natal	2009
432	level1	ZA_1_008	Western Cape	129462	country	ZA	KwaZulu-Natal	2009
433	level1	ZA_1_009	Gauteng	18178	country	ZA	KwaZulu-Natal	2009
434	country	UG	Uganda	241038	continent	AFR	Uganda	2009
435	country	ZM	Zambia	752618	continent	AFR	Zambia	2009
436	country	BF	Burkina Faso	274200	continent	AFR	Burkina Faso	2009
437	country	CD	Democratic Republic of Congo	2345409	continent	AFR	Democratic Republic of Congo	2009
\.


--
-- Name: wazimap_geography_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.wazimap_geography_id_seq', 423, true);


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

