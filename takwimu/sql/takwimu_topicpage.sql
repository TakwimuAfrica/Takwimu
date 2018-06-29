--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.12
-- Dumped by pg_dump version 9.5.12

-- Started on 2018-06-29 20:54:10 EAT

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 273 (class 1259 OID 44950)
-- Name: takwimu_topicpage; Type: TABLE; Schema: public; Owner: takwimu
--

CREATE TABLE public.takwimu_topicpage (
    page_ptr_id integer NOT NULL,
    description text NOT NULL,
    icon character varying
);


ALTER TABLE public.takwimu_topicpage OWNER TO takwimu;

--
-- TOC entry 2542 (class 0 OID 44950)
-- Dependencies: 273
-- Data for Name: takwimu_topicpage; Type: TABLE DATA; Schema: public; Owner: takwimu
--

COPY public.takwimu_topicpage (page_ptr_id, description, icon) FROM stdin;
22		\N
31		\N
33	This is the boko haram section	\N
34	Thus is a test oil economy section	\N
35	This is a test of health topic with data indicators.	\N
38		broadcast-tower
39		chevron-circle-right
16	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec interdum erat id mauris tempor vehicula. Integer vestibulum malesuada turpis ac placerat. Nunc sit amet mollis lorem. Cras blandit in arcu id suscipit. Curabitur in vulputate elit, id vestibulum arcu. Donec eget mi tellus. Donec ipsum dui, dapibus non suscipit sed, pellentesque ut purus.	university
7	Healthiful	medkit
6	Education things are important.	graduation-cap
9	Agriculture Things	subway
13	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec interdum erat id mauris tempor vehicula. Integer vestibulum malesuada turpis ac placerat. Nunc sit amet mollis lorem. Cras blandit in arcu id suscipit. Curabitur in vulputate elit, id vestibulum arcu. Donec eget mi tellus. Donec ipsum dui, dapibus non suscipit sed, pellentesque ut purus.	chart-bar
15	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec interdum erat id mauris tempor vehicula. Integer vestibulum malesuada turpis ac placerat. Nunc sit amet mollis lorem. Cras blandit in arcu id suscipit. Curabitur in vulputate elit, id vestibulum arcu. Donec eget mi tellus. Donec ipsum dui, dapibus non suscipit sed, pellentesque ut purus.	chart-bar
17	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec interdum erat id mauris tempor vehicula. Integer vestibulum malesuada turpis ac placerat. Nunc sit amet mollis lorem. Cras blandit in arcu id suscipit. Curabitur in vulputate elit, id vestibulum arcu. Donec eget mi tellus. Donec ipsum dui, dapibus non suscipit sed, pellentesque ut purus.	users
20	Nigeria’s federal structure was designed to ensure adequate political representation and allocation of resources across the country. However, the system also fosters competition between government tiers over control of resources, and has left many states heavily dependent on their federal allocation rather than developing their own viable tax base.	university
40		crosshairs
\.


--
-- TOC entry 2426 (class 2606 OID 45386)
-- Name: takwimu_topicpage_pkey; Type: CONSTRAINT; Schema: public; Owner: takwimu
--

ALTER TABLE ONLY public.takwimu_topicpage
    ADD CONSTRAINT takwimu_topicpage_pkey PRIMARY KEY (page_ptr_id);


--
-- TOC entry 2427 (class 2606 OID 45759)
-- Name: takwimu_topicpage_page_ptr_id_5d17d7d2_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: takwimu
--

ALTER TABLE ONLY public.takwimu_topicpage
    ADD CONSTRAINT takwimu_topicpage_page_ptr_id_5d17d7d2_fk_wagtailcore_page_id FOREIGN KEY (page_ptr_id) REFERENCES public.wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


-- Completed on 2018-06-29 20:54:10 EAT

--
-- PostgreSQL database dump complete
--

