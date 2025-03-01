--
-- PostgreSQL database cluster dump
--

-- Started on 2025-02-28 20:13:45

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE cloud_admin;
ALTER ROLE cloud_admin WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS;
CREATE ROLE neon_superuser;
ALTER ROLE neon_superuser WITH NOSUPERUSER INHERIT CREATEROLE CREATEDB NOLOGIN REPLICATION BYPASSRLS;
CREATE ROLE neondb_owner;
ALTER ROLE neondb_owner WITH NOSUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:Z0bBoFrXEyMMjj+pN11d1Q==$eK2GW0pS4KHefq1aDaXFETdv+VQW8o9qTqvXZuGvGZ4=:bLtz12YQcOWfoBOaTPjL1MmYg4268Z2A0qEmpROAQCs=';

--
-- User Configurations
--


--
-- Role memberships
--

GRANT neon_superuser TO neondb_owner WITH INHERIT TRUE GRANTED BY cloud_admin;
GRANT pg_create_subscription TO neon_superuser WITH INHERIT TRUE GRANTED BY cloud_admin;
GRANT pg_monitor TO neon_superuser WITH ADMIN OPTION, INHERIT TRUE GRANTED BY cloud_admin;
GRANT pg_read_all_data TO neon_superuser WITH INHERIT TRUE GRANTED BY cloud_admin;
GRANT pg_write_all_data TO neon_superuser WITH INHERIT TRUE GRANTED BY cloud_admin;






--
-- Databases
--

--
-- Database "template1" dump
--

\connect template1

--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4
-- Dumped by pg_dump version 17.2

-- Started on 2025-02-28 20:13:46

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

-- Completed on 2025-02-28 20:13:49

--
-- PostgreSQL database dump complete
--

--
-- Database "neondb" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4
-- Dumped by pg_dump version 17.2

-- Started on 2025-02-28 20:13:49

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 3353 (class 1262 OID 16389)
-- Name: neondb; Type: DATABASE; Schema: -; Owner: neondb_owner
--

CREATE DATABASE neondb WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = builtin LOCALE = 'C.UTF-8' BUILTIN_LOCALE = 'C.UTF-8';


ALTER DATABASE neondb OWNER TO neondb_owner;

\connect neondb

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- TOC entry 220 (class 1259 OID 57375)
-- Name: Inventories; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public."Inventories" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    quantity integer NOT NULL,
    price double precision NOT NULL,
    description text
);


ALTER TABLE public."Inventories" OWNER TO neondb_owner;

--
-- TOC entry 219 (class 1259 OID 57374)
-- Name: Inventories_id_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public."Inventories_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Inventories_id_seq" OWNER TO neondb_owner;

--
-- TOC entry 3355 (class 0 OID 0)
-- Dependencies: 219
-- Name: Inventories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public."Inventories_id_seq" OWNED BY public."Inventories".id;


--
-- TOC entry 218 (class 1259 OID 57354)
-- Name: Sales; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public."Sales" (
    id integer NOT NULL,
    "itemId" integer NOT NULL,
    "quantitySold" integer NOT NULL,
    "pricePerItem" double precision NOT NULL,
    "totalSaleAmount" double precision NOT NULL,
    "saleDate" timestamp with time zone
);


ALTER TABLE public."Sales" OWNER TO neondb_owner;

--
-- TOC entry 217 (class 1259 OID 57353)
-- Name: Sales_id_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public."Sales_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Sales_id_seq" OWNER TO neondb_owner;

--
-- TOC entry 3356 (class 0 OID 0)
-- Dependencies: 217
-- Name: Sales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public."Sales_id_seq" OWNED BY public."Sales".id;


--
-- TOC entry 3193 (class 2604 OID 57378)
-- Name: Inventories id; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public."Inventories" ALTER COLUMN id SET DEFAULT nextval('public."Inventories_id_seq"'::regclass);


--
-- TOC entry 3192 (class 2604 OID 57357)
-- Name: Sales id; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public."Sales" ALTER COLUMN id SET DEFAULT nextval('public."Sales_id_seq"'::regclass);


--
-- TOC entry 3347 (class 0 OID 57375)
-- Dependencies: 220
-- Data for Name: Inventories; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public."Inventories" (id, name, quantity, price, description) FROM stdin;
3	Keyboard	30	50	Mechanical keyboard
2	Monitor	100	150	24-inch LED screen
1	Laptop	25	900	High-end gaming laptop
4	Mouse	40	20	Wireless mouse
\.


--
-- TOC entry 3345 (class 0 OID 57354)
-- Dependencies: 218
-- Data for Name: Sales; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public."Sales" (id, "itemId", "quantitySold", "pricePerItem", "totalSaleAmount", "saleDate") FROM stdin;
1	1	10	900	9000	2025-03-01 00:45:30.177+00
2	4	10	20	200	2025-03-01 00:46:45.23+00
\.


--
-- TOC entry 3357 (class 0 OID 0)
-- Dependencies: 219
-- Name: Inventories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public."Inventories_id_seq"', 4, true);


--
-- TOC entry 3358 (class 0 OID 0)
-- Dependencies: 217
-- Name: Sales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public."Sales_id_seq"', 2, true);


--
-- TOC entry 3197 (class 2606 OID 57382)
-- Name: Inventories Inventories_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public."Inventories"
    ADD CONSTRAINT "Inventories_pkey" PRIMARY KEY (id);


--
-- TOC entry 3195 (class 2606 OID 57359)
-- Name: Sales Sales_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public."Sales"
    ADD CONSTRAINT "Sales_pkey" PRIMARY KEY (id);


--
-- TOC entry 3198 (class 2606 OID 57383)
-- Name: Sales Sales_itemId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public."Sales"
    ADD CONSTRAINT "Sales_itemId_fkey" FOREIGN KEY ("itemId") REFERENCES public."Inventories"(id) ON UPDATE CASCADE;


--
-- TOC entry 3354 (class 0 OID 0)
-- Dependencies: 3353
-- Name: DATABASE neondb; Type: ACL; Schema: -; Owner: neondb_owner
--

GRANT ALL ON DATABASE neondb TO neon_superuser;


--
-- TOC entry 2050 (class 826 OID 16392)
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: public; Owner: cloud_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE cloud_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO neon_superuser WITH GRANT OPTION;


--
-- TOC entry 2049 (class 826 OID 16391)
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: cloud_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE cloud_admin IN SCHEMA public GRANT ALL ON TABLES TO neon_superuser WITH GRANT OPTION;


-- Completed on 2025-02-28 20:13:52

--
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

\connect postgres

--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4
-- Dumped by pg_dump version 17.2

-- Started on 2025-02-28 20:13:52

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 8 (class 2615 OID 16390)
-- Name: neon; Type: SCHEMA; Schema: -; Owner: cloud_admin
--

CREATE SCHEMA neon;


ALTER SCHEMA neon OWNER TO cloud_admin;

--
-- TOC entry 9 (class 2615 OID 16469)
-- Name: neon_migration; Type: SCHEMA; Schema: -; Owner: cloud_admin
--

CREATE SCHEMA neon_migration;


ALTER SCHEMA neon_migration OWNER TO cloud_admin;

--
-- TOC entry 3 (class 3079 OID 16430)
-- Name: neon; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS neon WITH SCHEMA neon;


--
-- TOC entry 3396 (class 0 OID 0)
-- Dependencies: 3
-- Name: EXTENSION neon; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION neon IS 'cloud storage for PostgreSQL';


--
-- TOC entry 2 (class 3079 OID 16393)
-- Name: pg_stat_statements; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_stat_statements WITH SCHEMA public;


--
-- TOC entry 3397 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION pg_stat_statements; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_stat_statements IS 'track planning and execution statistics of all SQL statements executed';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 230 (class 1259 OID 16470)
-- Name: migration_id; Type: TABLE; Schema: neon_migration; Owner: cloud_admin
--

CREATE TABLE neon_migration.migration_id (
    key integer NOT NULL,
    id bigint DEFAULT 0 NOT NULL
);


ALTER TABLE neon_migration.migration_id OWNER TO cloud_admin;

--
-- TOC entry 229 (class 1259 OID 16462)
-- Name: health_check; Type: TABLE; Schema: public; Owner: cloud_admin
--

CREATE TABLE public.health_check (
    id integer NOT NULL,
    updated_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.health_check OWNER TO cloud_admin;

--
-- TOC entry 228 (class 1259 OID 16461)
-- Name: health_check_id_seq; Type: SEQUENCE; Schema: public; Owner: cloud_admin
--

CREATE SEQUENCE public.health_check_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.health_check_id_seq OWNER TO cloud_admin;

--
-- TOC entry 3401 (class 0 OID 0)
-- Dependencies: 228
-- Name: health_check_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cloud_admin
--

ALTER SEQUENCE public.health_check_id_seq OWNED BY public.health_check.id;


--
-- TOC entry 3229 (class 2604 OID 16465)
-- Name: health_check id; Type: DEFAULT; Schema: public; Owner: cloud_admin
--

ALTER TABLE ONLY public.health_check ALTER COLUMN id SET DEFAULT nextval('public.health_check_id_seq'::regclass);


--
-- TOC entry 3390 (class 0 OID 16470)
-- Dependencies: 230
-- Data for Name: migration_id; Type: TABLE DATA; Schema: neon_migration; Owner: cloud_admin
--

COPY neon_migration.migration_id (key, id) FROM stdin;
0	11
\.


--
-- TOC entry 3389 (class 0 OID 16462)
-- Dependencies: 229
-- Data for Name: health_check; Type: TABLE DATA; Schema: public; Owner: cloud_admin
--

COPY public.health_check (id, updated_at) FROM stdin;
1	2025-02-16 12:16:20.548748+00
\.


--
-- TOC entry 3402 (class 0 OID 0)
-- Dependencies: 228
-- Name: health_check_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cloud_admin
--

SELECT pg_catalog.setval('public.health_check_id_seq', 1, false);


--
-- TOC entry 3235 (class 2606 OID 16475)
-- Name: migration_id migration_id_pkey; Type: CONSTRAINT; Schema: neon_migration; Owner: cloud_admin
--

ALTER TABLE ONLY neon_migration.migration_id
    ADD CONSTRAINT migration_id_pkey PRIMARY KEY (key);


--
-- TOC entry 3233 (class 2606 OID 16468)
-- Name: health_check health_check_pkey; Type: CONSTRAINT; Schema: public; Owner: cloud_admin
--

ALTER TABLE ONLY public.health_check
    ADD CONSTRAINT health_check_pkey PRIMARY KEY (id);


--
-- TOC entry 3398 (class 0 OID 0)
-- Dependencies: 233
-- Name: FUNCTION pg_export_snapshot(); Type: ACL; Schema: pg_catalog; Owner: cloud_admin
--

GRANT ALL ON FUNCTION pg_catalog.pg_export_snapshot() TO neon_superuser;


--
-- TOC entry 3399 (class 0 OID 0)
-- Dependencies: 232
-- Name: FUNCTION pg_log_standby_snapshot(); Type: ACL; Schema: pg_catalog; Owner: cloud_admin
--

GRANT ALL ON FUNCTION pg_catalog.pg_log_standby_snapshot() TO neon_superuser;


--
-- TOC entry 3400 (class 0 OID 0)
-- Dependencies: 231
-- Name: FUNCTION pg_show_replication_origin_status(OUT local_id oid, OUT external_id text, OUT remote_lsn pg_lsn, OUT local_lsn pg_lsn); Type: ACL; Schema: pg_catalog; Owner: cloud_admin
--

GRANT ALL ON FUNCTION pg_catalog.pg_show_replication_origin_status(OUT local_id oid, OUT external_id text, OUT remote_lsn pg_lsn, OUT local_lsn pg_lsn) TO neon_superuser;


-- Completed on 2025-02-28 20:13:55

--
-- PostgreSQL database dump complete
--

-- Completed on 2025-02-28 20:13:55

--
-- PostgreSQL database cluster dump complete
--

