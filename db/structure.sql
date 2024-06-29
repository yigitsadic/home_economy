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

--
-- Name: event_categories; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.event_categories AS ENUM (
    'income',
    'expense',
    'investment',
    'informatic'
);


--
-- Name: event_types; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.event_types AS ENUM (
    'one_time',
    'recurring'
);


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: months; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.months (
    id bigint NOT NULL,
    name character varying NOT NULL,
    year character varying NOT NULL,
    full_name character varying GENERATED ALWAYS AS ((((name)::text || '/'::text) || (year)::text)) STORED,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    total_expense numeric(8,2) DEFAULT 0.0 NOT NULL,
    total_income numeric(8,2) DEFAULT 0.0 NOT NULL,
    total_value_of_investments numeric(8,2) DEFAULT 0.0 NOT NULL
);


--
-- Name: months_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.months_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: months_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.months_id_seq OWNED BY public.months.id;


--
-- Name: recurring_events; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.recurring_events (
    id bigint NOT NULL,
    name character varying NOT NULL,
    category public.event_categories NOT NULL,
    day_of_month smallint NOT NULL,
    financial_value numeric(8,2) DEFAULT 0.0 NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: recurring_events_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.recurring_events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: recurring_events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.recurring_events_id_seq OWNED BY public.recurring_events.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


--
-- Name: months id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.months ALTER COLUMN id SET DEFAULT nextval('public.months_id_seq'::regclass);


--
-- Name: recurring_events id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.recurring_events ALTER COLUMN id SET DEFAULT nextval('public.recurring_events_id_seq'::regclass);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: months months_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.months
    ADD CONSTRAINT months_pkey PRIMARY KEY (id);


--
-- Name: recurring_events recurring_events_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.recurring_events
    ADD CONSTRAINT recurring_events_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: index_months_on_full_name; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_months_on_full_name ON public.months USING btree (full_name);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user", public;

INSERT INTO "schema_migrations" (version) VALUES
('20240629083919'),
('20240629083117'),
('20240629082707'),
('20240624182536');

