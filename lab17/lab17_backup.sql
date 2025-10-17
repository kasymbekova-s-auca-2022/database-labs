--
-- PostgreSQL database dump
--

\restrict 43m7cceVX1lQnJBUQCgm8kebnlXoC8iSQMcA8iCy7S34JQG1O5A5rXvvcu8VEfw

-- Dumped from database version 14.19 (Homebrew)
-- Dumped by pg_dump version 14.19 (Homebrew)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: products; Type: TABLE; Schema: public; Owner: symbat
--

CREATE TABLE public.products (
    id integer NOT NULL,
    name character varying(50),
    price numeric(10,2)
);


ALTER TABLE public.products OWNER TO symbat;

--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: symbat
--

CREATE SEQUENCE public.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_id_seq OWNER TO symbat;

--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: symbat
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- Name: products_import; Type: TABLE; Schema: public; Owner: symbat
--

CREATE TABLE public.products_import (
    id integer DEFAULT nextval('public.products_id_seq'::regclass) NOT NULL,
    name character varying(50),
    price numeric(10,2)
);


ALTER TABLE public.products_import OWNER TO symbat;

--
-- Name: products id; Type: DEFAULT; Schema: public; Owner: symbat
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: symbat
--

COPY public.products (id, name, price) FROM stdin;
1	Laptop	1200.00
2	Mouse	25.50
3	Keyboard	45.00
\.


--
-- Data for Name: products_import; Type: TABLE DATA; Schema: public; Owner: symbat
--

COPY public.products_import (id, name, price) FROM stdin;
1	Laptop	1200.00
2	Mouse	25.50
3	Keyboard	45.00
\.


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: symbat
--

SELECT pg_catalog.setval('public.products_id_seq', 3, true);


--
-- Name: products_import products_import_pkey; Type: CONSTRAINT; Schema: public; Owner: symbat
--

ALTER TABLE ONLY public.products_import
    ADD CONSTRAINT products_import_pkey PRIMARY KEY (id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: symbat
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

\unrestrict 43m7cceVX1lQnJBUQCgm8kebnlXoC8iSQMcA8iCy7S34JQG1O5A5rXvvcu8VEfw

