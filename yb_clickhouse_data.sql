--
-- YSQL database dump
--

-- Dumped from database version 15.12-YB-2025.2.1.0-b0
-- Dumped by ysql_dump version 15.12-YB-2025.2.1.0-b0

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
-- Name: ybvoyager_metadata; Type: SCHEMA; Schema: -; Owner: ybvoyager
--

CREATE SCHEMA ybvoyager_metadata;


ALTER SCHEMA ybvoyager_metadata OWNER TO ybvoyager;

--
-- Name: observation_level; Type: TYPE; Schema: public; Owner: ybvoyager
--

CREATE TYPE public.observation_level AS ENUM (
    'ERROR',
    'WARNING',
    'DEFAULT',
    'DEBUG'
);


ALTER TYPE public.observation_level OWNER TO ybvoyager;

--
-- Name: observation_type; Type: TYPE; Schema: public; Owner: ybvoyager
--

CREATE TYPE public.observation_type AS ENUM (
    'SPAN',
    'GENERATION',
    'EVENT',
    'AGENT',
    'TOOL',
    'CHAIN',
    'RETRIEVER',
    'EVALUATOR',
    'EMBEDDING',
    'GUARDRAIL'
);


ALTER TYPE public.observation_type OWNER TO ybvoyager;

--
-- Name: score_data_type; Type: TYPE; Schema: public; Owner: ybvoyager
--

CREATE TYPE public.score_data_type AS ENUM (
    'NUMERIC',
    'BOOLEAN',
    'CATEGORICAL'
);


ALTER TYPE public.score_data_type OWNER TO ybvoyager;

SET default_tablespace = '';

--
-- Name: observations; Type: TABLE; Schema: public; Owner: ybvoyager
--

CREATE TABLE public.observations (
    id text NOT NULL,
    project_id text NOT NULL,
    trace_id text NOT NULL,
    parent_observation_id text,
    environment text,
    type public.observation_type NOT NULL,
    name text NOT NULL,
    start_time timestamp with time zone NOT NULL,
    end_time timestamp with time zone,
    level public.observation_level DEFAULT 'DEFAULT'::public.observation_level NOT NULL,
    status_message text,
    version text,
    input text,
    output text,
    metadata jsonb DEFAULT '{}'::jsonb NOT NULL,
    provided_model_name text,
    internal_model_id text,
    model_parameters jsonb,
    provided_usage_details jsonb DEFAULT '{}'::jsonb NOT NULL,
    usage_details jsonb DEFAULT '{}'::jsonb NOT NULL,
    provided_cost_details jsonb DEFAULT '{}'::jsonb NOT NULL,
    cost_details jsonb DEFAULT '{}'::jsonb NOT NULL,
    total_cost numeric(18,12),
    usage_pricing_tier_id text,
    usage_pricing_tier_name text,
    completion_start_time timestamp with time zone,
    prompt_id text,
    prompt_name text,
    prompt_version integer,
    tool_definitions jsonb DEFAULT '{}'::jsonb NOT NULL,
    tool_calls jsonb DEFAULT '[]'::jsonb NOT NULL,
    tool_call_names text[] DEFAULT '{}'::text[] NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    event_ts timestamp with time zone DEFAULT now() NOT NULL,
    is_deleted boolean DEFAULT false NOT NULL,
    CONSTRAINT observations_pkey PRIMARY KEY((project_id) HASH, id ASC, start_time ASC)
)
PARTITION BY RANGE (start_time);


ALTER TABLE public.observations OWNER TO ybvoyager;

SET default_table_access_method = heap;

--
-- Name: observations_2026_03; Type: TABLE; Schema: public; Owner: ybvoyager
--

CREATE TABLE public.observations_2026_03 (
    id text NOT NULL,
    project_id text NOT NULL,
    trace_id text NOT NULL,
    parent_observation_id text,
    environment text,
    type public.observation_type NOT NULL,
    name text NOT NULL,
    start_time timestamp with time zone NOT NULL,
    end_time timestamp with time zone,
    level public.observation_level DEFAULT 'DEFAULT'::public.observation_level NOT NULL,
    status_message text,
    version text,
    input text,
    output text,
    metadata jsonb DEFAULT '{}'::jsonb NOT NULL,
    provided_model_name text,
    internal_model_id text,
    model_parameters jsonb,
    provided_usage_details jsonb DEFAULT '{}'::jsonb NOT NULL,
    usage_details jsonb DEFAULT '{}'::jsonb NOT NULL,
    provided_cost_details jsonb DEFAULT '{}'::jsonb NOT NULL,
    cost_details jsonb DEFAULT '{}'::jsonb NOT NULL,
    total_cost numeric(18,12),
    usage_pricing_tier_id text,
    usage_pricing_tier_name text,
    completion_start_time timestamp with time zone,
    prompt_id text,
    prompt_name text,
    prompt_version integer,
    tool_definitions jsonb DEFAULT '{}'::jsonb NOT NULL,
    tool_calls jsonb DEFAULT '[]'::jsonb NOT NULL,
    tool_call_names text[] DEFAULT '{}'::text[] NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    event_ts timestamp with time zone DEFAULT now() NOT NULL,
    is_deleted boolean DEFAULT false NOT NULL,
    CONSTRAINT observations_2026_03_pkey PRIMARY KEY((project_id) HASH, id ASC, start_time ASC)
)
WITH (colocation='false');


ALTER TABLE public.observations_2026_03 OWNER TO ybvoyager;

--
-- Name: observations_default; Type: TABLE; Schema: public; Owner: ybvoyager
--

CREATE TABLE public.observations_default (
    id text NOT NULL,
    project_id text NOT NULL,
    trace_id text NOT NULL,
    parent_observation_id text,
    environment text,
    type public.observation_type NOT NULL,
    name text NOT NULL,
    start_time timestamp with time zone NOT NULL,
    end_time timestamp with time zone,
    level public.observation_level DEFAULT 'DEFAULT'::public.observation_level NOT NULL,
    status_message text,
    version text,
    input text,
    output text,
    metadata jsonb DEFAULT '{}'::jsonb NOT NULL,
    provided_model_name text,
    internal_model_id text,
    model_parameters jsonb,
    provided_usage_details jsonb DEFAULT '{}'::jsonb NOT NULL,
    usage_details jsonb DEFAULT '{}'::jsonb NOT NULL,
    provided_cost_details jsonb DEFAULT '{}'::jsonb NOT NULL,
    cost_details jsonb DEFAULT '{}'::jsonb NOT NULL,
    total_cost numeric(18,12),
    usage_pricing_tier_id text,
    usage_pricing_tier_name text,
    completion_start_time timestamp with time zone,
    prompt_id text,
    prompt_name text,
    prompt_version integer,
    tool_definitions jsonb DEFAULT '{}'::jsonb NOT NULL,
    tool_calls jsonb DEFAULT '[]'::jsonb NOT NULL,
    tool_call_names text[] DEFAULT '{}'::text[] NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    event_ts timestamp with time zone DEFAULT now() NOT NULL,
    is_deleted boolean DEFAULT false NOT NULL,
    CONSTRAINT observations_default_pkey PRIMARY KEY((project_id) HASH, id ASC, start_time ASC)
)
WITH (colocation='false');


ALTER TABLE public.observations_default OWNER TO ybvoyager;

--
-- Name: scores; Type: TABLE; Schema: public; Owner: ybvoyager
--

CREATE TABLE public.scores (
    id text NOT NULL,
    project_id text NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    trace_id text NOT NULL,
    observation_id text,
    session_id text,
    dataset_run_id text,
    environment text,
    name text NOT NULL,
    value double precision,
    string_value text,
    long_string_value text,
    data_type public.score_data_type NOT NULL,
    source text,
    comment text,
    author_user_id text,
    config_id text,
    queue_id text,
    execution_trace_id text,
    metadata jsonb DEFAULT '{}'::jsonb NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    event_ts timestamp with time zone DEFAULT now() NOT NULL,
    is_deleted boolean DEFAULT false NOT NULL,
    CONSTRAINT scores_pkey PRIMARY KEY((project_id) HASH, id ASC, "timestamp" ASC)
)
PARTITION BY RANGE ("timestamp");


ALTER TABLE public.scores OWNER TO ybvoyager;

--
-- Name: scores_2026_03; Type: TABLE; Schema: public; Owner: ybvoyager
--

CREATE TABLE public.scores_2026_03 (
    id text NOT NULL,
    project_id text NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    trace_id text NOT NULL,
    observation_id text,
    session_id text,
    dataset_run_id text,
    environment text,
    name text NOT NULL,
    value double precision,
    string_value text,
    long_string_value text,
    data_type public.score_data_type NOT NULL,
    source text,
    comment text,
    author_user_id text,
    config_id text,
    queue_id text,
    execution_trace_id text,
    metadata jsonb DEFAULT '{}'::jsonb NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    event_ts timestamp with time zone DEFAULT now() NOT NULL,
    is_deleted boolean DEFAULT false NOT NULL,
    CONSTRAINT scores_2026_03_pkey PRIMARY KEY((project_id) HASH, id ASC, "timestamp" ASC)
)
WITH (colocation='false');


ALTER TABLE public.scores_2026_03 OWNER TO ybvoyager;

--
-- Name: scores_default; Type: TABLE; Schema: public; Owner: ybvoyager
--

CREATE TABLE public.scores_default (
    id text NOT NULL,
    project_id text NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    trace_id text NOT NULL,
    observation_id text,
    session_id text,
    dataset_run_id text,
    environment text,
    name text NOT NULL,
    value double precision,
    string_value text,
    long_string_value text,
    data_type public.score_data_type NOT NULL,
    source text,
    comment text,
    author_user_id text,
    config_id text,
    queue_id text,
    execution_trace_id text,
    metadata jsonb DEFAULT '{}'::jsonb NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    event_ts timestamp with time zone DEFAULT now() NOT NULL,
    is_deleted boolean DEFAULT false NOT NULL,
    CONSTRAINT scores_default_pkey PRIMARY KEY((project_id) HASH, id ASC, "timestamp" ASC)
)
WITH (colocation='false');


ALTER TABLE public.scores_default OWNER TO ybvoyager;

--
-- Name: traces; Type: TABLE; Schema: public; Owner: ybvoyager
--

CREATE TABLE public.traces (
    id text NOT NULL,
    project_id text NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    name text,
    user_id text,
    session_id text,
    environment text,
    public boolean DEFAULT false NOT NULL,
    bookmarked boolean DEFAULT false NOT NULL,
    tags text[] DEFAULT '{}'::text[] NOT NULL,
    input text,
    output text,
    metadata jsonb DEFAULT '{}'::jsonb NOT NULL,
    release text,
    version text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    event_ts timestamp with time zone DEFAULT now() NOT NULL,
    is_deleted boolean DEFAULT false NOT NULL,
    CONSTRAINT traces_pkey PRIMARY KEY((project_id) HASH, id ASC, "timestamp" ASC)
)
PARTITION BY RANGE ("timestamp");


ALTER TABLE public.traces OWNER TO ybvoyager;

--
-- Name: traces_2026_03; Type: TABLE; Schema: public; Owner: ybvoyager
--

CREATE TABLE public.traces_2026_03 (
    id text NOT NULL,
    project_id text NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    name text,
    user_id text,
    session_id text,
    environment text,
    public boolean DEFAULT false NOT NULL,
    bookmarked boolean DEFAULT false NOT NULL,
    tags text[] DEFAULT '{}'::text[] NOT NULL,
    input text,
    output text,
    metadata jsonb DEFAULT '{}'::jsonb NOT NULL,
    release text,
    version text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    event_ts timestamp with time zone DEFAULT now() NOT NULL,
    is_deleted boolean DEFAULT false NOT NULL,
    CONSTRAINT traces_2026_03_pkey PRIMARY KEY((project_id) HASH, id ASC, "timestamp" ASC)
)
WITH (colocation='false');


ALTER TABLE public.traces_2026_03 OWNER TO ybvoyager;

--
-- Name: traces_default; Type: TABLE; Schema: public; Owner: ybvoyager
--

CREATE TABLE public.traces_default (
    id text NOT NULL,
    project_id text NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    name text,
    user_id text,
    session_id text,
    environment text,
    public boolean DEFAULT false NOT NULL,
    bookmarked boolean DEFAULT false NOT NULL,
    tags text[] DEFAULT '{}'::text[] NOT NULL,
    input text,
    output text,
    metadata jsonb DEFAULT '{}'::jsonb NOT NULL,
    release text,
    version text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    event_ts timestamp with time zone DEFAULT now() NOT NULL,
    is_deleted boolean DEFAULT false NOT NULL,
    CONSTRAINT traces_default_pkey PRIMARY KEY((project_id) HASH, id ASC, "timestamp" ASC)
)
WITH (colocation='false');


ALTER TABLE public.traces_default OWNER TO ybvoyager;

--
-- Name: ybvoyager_import_data_batches_metainfo_v3; Type: TABLE; Schema: ybvoyager_metadata; Owner: ybvoyager
--

CREATE TABLE ybvoyager_metadata.ybvoyager_import_data_batches_metainfo_v3 (
    migration_uuid uuid NOT NULL,
    data_file_name text NOT NULL,
    batch_number integer NOT NULL,
    schema_name text NOT NULL,
    table_name text NOT NULL,
    rows_imported bigint,
    CONSTRAINT ybvoyager_import_data_batches_metainfo_v3_pkey PRIMARY KEY((migration_uuid) HASH, data_file_name ASC, batch_number ASC, schema_name ASC, table_name ASC)
);


ALTER TABLE ybvoyager_metadata.ybvoyager_import_data_batches_metainfo_v3 OWNER TO ybvoyager;

--
-- Name: ybvoyager_import_data_event_channels_metainfo; Type: TABLE; Schema: ybvoyager_metadata; Owner: ybvoyager
--

CREATE TABLE ybvoyager_metadata.ybvoyager_import_data_event_channels_metainfo (
    migration_uuid uuid NOT NULL,
    channel_no integer NOT NULL,
    last_applied_vsn bigint,
    num_inserts bigint,
    num_deletes bigint,
    num_updates bigint,
    CONSTRAINT ybvoyager_import_data_event_channels_metainfo_pkey PRIMARY KEY((migration_uuid) HASH, channel_no ASC)
);


ALTER TABLE ybvoyager_metadata.ybvoyager_import_data_event_channels_metainfo OWNER TO ybvoyager;

--
-- Name: ybvoyager_imported_event_count_by_table; Type: TABLE; Schema: ybvoyager_metadata; Owner: ybvoyager
--

CREATE TABLE ybvoyager_metadata.ybvoyager_imported_event_count_by_table (
    migration_uuid uuid NOT NULL,
    table_name text NOT NULL,
    channel_no integer NOT NULL,
    total_events bigint,
    num_inserts bigint,
    num_deletes bigint,
    num_updates bigint,
    CONSTRAINT ybvoyager_imported_event_count_by_table_pkey PRIMARY KEY((migration_uuid) HASH, table_name ASC, channel_no ASC)
);


ALTER TABLE ybvoyager_metadata.ybvoyager_imported_event_count_by_table OWNER TO ybvoyager;

--
-- Name: observations_2026_03; Type: TABLE ATTACH; Schema: public; Owner: ybvoyager
--

ALTER TABLE ONLY public.observations ATTACH PARTITION public.observations_2026_03 FOR VALUES FROM ('2026-03-01 05:30:00+05:30') TO ('2026-04-01 05:30:00+05:30');


--
-- Name: observations_default; Type: TABLE ATTACH; Schema: public; Owner: ybvoyager
--

ALTER TABLE ONLY public.observations ATTACH PARTITION public.observations_default DEFAULT;


--
-- Name: scores_2026_03; Type: TABLE ATTACH; Schema: public; Owner: ybvoyager
--

ALTER TABLE ONLY public.scores ATTACH PARTITION public.scores_2026_03 FOR VALUES FROM ('2026-03-01 05:30:00+05:30') TO ('2026-04-01 05:30:00+05:30');


--
-- Name: scores_default; Type: TABLE ATTACH; Schema: public; Owner: ybvoyager
--

ALTER TABLE ONLY public.scores ATTACH PARTITION public.scores_default DEFAULT;


--
-- Name: traces_2026_03; Type: TABLE ATTACH; Schema: public; Owner: ybvoyager
--

ALTER TABLE ONLY public.traces ATTACH PARTITION public.traces_2026_03 FOR VALUES FROM ('2026-03-01 05:30:00+05:30') TO ('2026-04-01 05:30:00+05:30');


--
-- Name: traces_default; Type: TABLE ATTACH; Schema: public; Owner: ybvoyager
--

ALTER TABLE ONLY public.traces ATTACH PARTITION public.traces_default DEFAULT;


--
-- Data for Name: observations_2026_03; Type: TABLE DATA; Schema: public; Owner: ybvoyager
--

COPY public.observations_2026_03 (id, project_id, trace_id, parent_observation_id, environment, type, name, start_time, end_time, level, status_message, version, input, output, metadata, provided_model_name, internal_model_id, model_parameters, provided_usage_details, usage_details, provided_cost_details, cost_details, total_cost, usage_pricing_tier_id, usage_pricing_tier_name, completion_start_time, prompt_id, prompt_name, prompt_version, tool_definitions, tool_calls, tool_call_names, created_at, updated_at, event_ts, is_deleted) FROM stdin;
01b52ff31417c18c	22222222-2222-4222-8222-222222222222	e95dba671dddd95f196ae8488b51d307	\N	default	SPAN	run_chain	2026-03-11 10:23:10.546+05:30	2026-03-11 10:23:12.012+05:30	DEFAULT	\N	\N	{"args": ["Python"], "kwargs": {}}	Why do Python programmers prefer dark mode?\n\nBecause light attracts bugs! 🐛😄	{"scope": "{\\"name\\":\\"langfuse-sdk\\",\\"version\\":\\"3.7.0\\",\\"attributes\\":{\\"public_key\\":\\"pk-lf-e038c771-f113-46ed-9e10-d4628cf20f16\\"}}", "resourceAttributes": "{\\"telemetry.sdk.language\\":\\"python\\",\\"telemetry.sdk.name\\":\\"opentelemetry\\",\\"telemetry.sdk.version\\":\\"1.39.1\\",\\"service.name\\":\\"unknown_service\\"}"}	\N	\N	\N	{}	{}	{}	{}	\N	\N	\N	\N	\N	\N	\N	{}	[]	{}	2026-03-11 10:23:16.576+05:30	2026-03-11 10:23:16.578+05:30	2026-03-11 10:23:16.578+05:30	f
04cfa985fd5a2ea9	22222222-2222-4222-8222-222222222222	2c88d13b5b3f35acb8c26a87c5d31477	\N	default	SPAN	run_chain	2026-03-11 10:23:16.253+05:30	2026-03-11 10:23:17.121+05:30	DEFAULT	\N	\N	{"args": ["Python"], "kwargs": {}}	Why do Python programmers prefer dark mode?\n\nBecause light attracts bugs! 🐍💡	{"scope": "{\\"name\\":\\"langfuse-sdk\\",\\"version\\":\\"3.7.0\\",\\"attributes\\":{\\"public_key\\":\\"pk-lf-e038c771-f113-46ed-9e10-d4628cf20f16\\"}}", "resourceAttributes": "{\\"telemetry.sdk.language\\":\\"python\\",\\"telemetry.sdk.name\\":\\"opentelemetry\\",\\"telemetry.sdk.version\\":\\"1.39.1\\",\\"service.name\\":\\"unknown_service\\"}"}	\N	\N	\N	{}	{}	{}	{}	\N	\N	\N	\N	\N	\N	\N	{}	[]	{}	2026-03-11 10:23:19.074+05:30	2026-03-11 10:23:19.075+05:30	2026-03-11 10:23:19.075+05:30	f
05ca1ec57ff15716	22222222-2222-4222-8222-222222222222	a69063b300223a8f76d58da86ac1fb2a	85f294c24679fd06	default	CHAIN	ChatPromptTemplate	2026-03-11 10:23:12.014+05:30	2026-03-11 10:23:12.015+05:30	DEFAULT	\N	\N	{"topic": "Python"}	{"messages": [{"content": "Tell me a joke about Python", "additional_kwargs": {}, "response_metadata": {}, "type": "human", "name": null, "id": null}]}	{"tags": "[\\"seq:step:1\\"]", "scope": "{\\"name\\":\\"langfuse-sdk\\",\\"version\\":\\"3.7.0\\",\\"attributes\\":{\\"public_key\\":\\"pk-lf-e038c771-f113-46ed-9e10-d4628cf20f16\\"}}", "resourceAttributes": "{\\"telemetry.sdk.language\\":\\"python\\",\\"telemetry.sdk.name\\":\\"opentelemetry\\",\\"telemetry.sdk.version\\":\\"1.39.1\\",\\"service.name\\":\\"unknown_service\\"}"}	\N	\N	{}	{}	{}	{}	{}	\N	\N	\N	\N	\N	\N	\N	{}	[]	{}	2026-03-11 10:23:16.576+05:30	2026-03-11 10:23:16.578+05:30	2026-03-11 10:23:16.578+05:30	f
08dab6273af0c973	22222222-2222-4222-8222-222222222222	a69063b300223a8f76d58da86ac1fb2a	85f294c24679fd06	default	GENERATION	ChatOpenAI	2026-03-11 10:23:12.016+05:30	2026-03-11 10:23:13.72+05:30	DEFAULT	\N	\N	[{"role": "user", "content": "Tell me a joke about Python"}]	{"role": "assistant", "content": "Why do Python programmers prefer dark mode?\\n\\nBecause light attracts bugs!", "additional_kwargs": {"refusal": null}}	{"tags": "[\\"seq:step:2\\"]", "scope": "{\\"name\\":\\"langfuse-sdk\\",\\"version\\":\\"3.7.0\\",\\"attributes\\":{\\"public_key\\":\\"pk-lf-e038c771-f113-46ed-9e10-d4628cf20f16\\"}}", "ls_provider": "openai", "ls_model_name": "gpt-4o-mini", "ls_model_type": "chat", "resourceAttributes": "{\\"telemetry.sdk.language\\":\\"python\\",\\"telemetry.sdk.name\\":\\"opentelemetry\\",\\"telemetry.sdk.version\\":\\"1.39.1\\",\\"service.name\\":\\"unknown_service\\"}"}	gpt-4o-mini-2024-07-18	clyrjpbe20000t0mzcbwc42rg	{}	{"input": 13, "total": 26, "output": 13, "input_audio": 0, "output_audio": 0, "input_cache_read": 0, "output_reasoning": 0}	{"input": 13, "total": 26, "output": 13, "input_audio": 0, "output_audio": 0, "input_cache_read": 0, "output_reasoning": 0}	{}	{"input": 0.00000195, "total": 0.00000975, "output": 0.0000078, "input_cache_read": 0}	0.000009750000	clyrjpbe20000t0mzcbwc42rg_tier_default	Standard	\N	\N	\N	\N	{}	[]	{}	2026-03-11 10:23:16.576+05:30	2026-03-11 10:23:16.578+05:30	2026-03-11 10:23:16.578+05:30	f
09f0f723c9393d47	22222222-2222-4222-8222-222222222222	2ca2946cf8416dcfe3839c0403848262	c06d47bef6b5a644	default	CHAIN	ChatPromptTemplate	2026-03-11 10:23:15.245+05:30	2026-03-11 10:23:15.245+05:30	DEFAULT	\N	\N	{"topic": "Python"}	{"messages": [{"content": "Tell me a joke about Python", "additional_kwargs": {}, "response_metadata": {}, "type": "human", "name": null, "id": null}]}	{"tags": "[\\"seq:step:1\\"]", "scope": "{\\"name\\":\\"langfuse-sdk\\",\\"version\\":\\"3.7.0\\",\\"attributes\\":{\\"public_key\\":\\"pk-lf-e038c771-f113-46ed-9e10-d4628cf20f16\\"}}", "resourceAttributes": "{\\"telemetry.sdk.language\\":\\"python\\",\\"telemetry.sdk.name\\":\\"opentelemetry\\",\\"telemetry.sdk.version\\":\\"1.39.1\\",\\"service.name\\":\\"unknown_service\\"}"}	\N	\N	{}	{}	{}	{}	{}	\N	\N	\N	\N	\N	\N	\N	{}	[]	{}	2026-03-11 10:23:16.576+05:30	2026-03-11 10:23:16.578+05:30	2026-03-11 10:23:16.578+05:30	f
0d2920b7e69fbd70	22222222-2222-4222-8222-222222222222	ff3a09f8f26320e6bf84254fba4b2552	45267f54447e6776	default	CHAIN	ChatPromptTemplate	2026-03-11 10:23:07.921+05:30	2026-03-11 10:23:07.921+05:30	DEFAULT	\N	\N	{"topic": "Python"}	{"messages": [{"content": "Tell me a joke about Python", "additional_kwargs": {}, "response_metadata": {}, "type": "human", "name": null, "id": null}]}	{"tags": "[\\"seq:step:1\\"]", "scope": "{\\"name\\":\\"langfuse-sdk\\",\\"version\\":\\"3.7.0\\",\\"attributes\\":{\\"public_key\\":\\"pk-lf-e038c771-f113-46ed-9e10-d4628cf20f16\\"}}", "resourceAttributes": "{\\"telemetry.sdk.language\\":\\"python\\",\\"telemetry.sdk.name\\":\\"opentelemetry\\",\\"telemetry.sdk.version\\":\\"1.39.1\\",\\"service.name\\":\\"unknown_service\\"}"}	\N	\N	{}	{}	{}	{}	{}	\N	\N	\N	\N	\N	\N	\N	{}	[]	{}	2026-03-11 10:23:11.564+05:30	2026-03-11 10:23:11.568+05:30	2026-03-11 10:23:11.568+05:30	f
160476cad1de452b	22222222-2222-4222-8222-222222222222	2c88d13b5b3f35acb8c26a87c5d31477	b2f014fbb110bb88	default	CHAIN	ChatPromptTemplate	2026-03-11 10:23:16.254+05:30	2026-03-11 10:23:16.255+05:30	DEFAULT	\N	\N	{"topic": "Python"}	{"messages": [{"content": "Tell me a joke about Python", "additional_kwargs": {}, "response_metadata": {}, "type": "human", "name": null, "id": null}]}	{"tags": "[\\"seq:step:1\\"]", "scope": "{\\"name\\":\\"langfuse-sdk\\",\\"version\\":\\"3.7.0\\",\\"attributes\\":{\\"public_key\\":\\"pk-lf-e038c771-f113-46ed-9e10-d4628cf20f16\\"}}", "resourceAttributes": "{\\"telemetry.sdk.language\\":\\"python\\",\\"telemetry.sdk.name\\":\\"opentelemetry\\",\\"telemetry.sdk.version\\":\\"1.39.1\\",\\"service.name\\":\\"unknown_service\\"}"}	\N	\N	{}	{}	{}	{}	{}	\N	\N	\N	\N	\N	\N	\N	{}	[]	{}	2026-03-11 10:23:16.576+05:30	2026-03-11 10:23:16.578+05:30	2026-03-11 10:23:16.578+05:30	f
1dc20e5664f668b7	22222222-2222-4222-8222-222222222222	ff3a09f8f26320e6bf84254fba4b2552	\N	default	SPAN	run_chain	2026-03-11 10:23:07.92+05:30	2026-03-11 10:23:09.056+05:30	DEFAULT	\N	\N	{"args": ["Python"], "kwargs": {}}	Why do Python programmers prefer dark mode?\n\nBecause light attracts bugs!	{"scope": "{\\"name\\":\\"langfuse-sdk\\",\\"version\\":\\"3.7.0\\",\\"attributes\\":{\\"public_key\\":\\"pk-lf-e038c771-f113-46ed-9e10-d4628cf20f16\\"}}", "resourceAttributes": "{\\"telemetry.sdk.language\\":\\"python\\",\\"telemetry.sdk.name\\":\\"opentelemetry\\",\\"telemetry.sdk.version\\":\\"1.39.1\\",\\"service.name\\":\\"unknown_service\\"}"}	\N	\N	\N	{}	{}	{}	{}	\N	\N	\N	\N	\N	\N	\N	{}	[]	{}	2026-03-11 10:23:11.564+05:30	2026-03-11 10:23:11.568+05:30	2026-03-11 10:23:11.568+05:30	f
22689ee42f1ce90f	22222222-2222-4222-8222-222222222222	45ac0cd76c3a950051336b171ced4ef3	31cc85fed95709d1	default	CHAIN	RunnableSequence	2026-03-11 10:23:13.725+05:30	2026-03-11 10:23:15.241+05:30	DEFAULT	\N	\N	{"topic": "Python"}	Why do Python programmers prefer dark mode?\n\nBecause light attracts bugs! 🐍💻	{"scope": "{\\"name\\":\\"langfuse-sdk\\",\\"version\\":\\"3.7.0\\",\\"attributes\\":{\\"public_key\\":\\"pk-lf-e038c771-f113-46ed-9e10-d4628cf20f16\\"}}", "resourceAttributes": "{\\"telemetry.sdk.language\\":\\"python\\",\\"telemetry.sdk.name\\":\\"opentelemetry\\",\\"telemetry.sdk.version\\":\\"1.39.1\\",\\"service.name\\":\\"unknown_service\\"}"}	\N	\N	{}	{}	{}	{}	{}	\N	\N	\N	\N	\N	\N	\N	{}	[]	{}	2026-03-11 10:23:16.576+05:30	2026-03-11 10:23:16.578+05:30	2026-03-11 10:23:16.578+05:30	f
28b3a741679bd99e	22222222-2222-4222-8222-222222222222	2ca2946cf8416dcfe3839c0403848262	c06d47bef6b5a644	default	CHAIN	StrOutputParser	2026-03-11 10:23:16.252+05:30	2026-03-11 10:23:16.252+05:30	DEFAULT	\N	\N	{"content": "Why do Python programmers prefer dark mode?\\n\\nBecause light attracts bugs!", "additional_kwargs": {"refusal": null}, "response_metadata": {"token_usage": {"completion_tokens": 13, "prompt_tokens": 13, "total_tokens": 26, "completion_tokens_details": {"accepted_prediction_tokens": 0, "audio_tokens": 0, "reasoning_tokens": 0, "rejected_prediction_tokens": 0}, "prompt_tokens_details": {"audio_tokens": 0, "cached_tokens": 0}}, "model_name": "gpt-4o-mini-2024-07-18", "system_fingerprint": "fp_0702c1c457", "id": "chatcmpl-DI5rHxLSlK3Xi8m08ighlfrkwGucy", "service_tier": "default", "finish_reason": "stop", "logprobs": null}, "type": "ai", "name": null, "id": "run--019cdb3d-ef6e-70a1-9e21-148f92cff0e8-0", "example": false, "tool_calls": [], "invalid_tool_calls": [], "usage_metadata": {"input_tokens": 13, "output_tokens": 13, "total_tokens": 26, "input_token_details": {"audio": 0, "cache_read": 0}, "output_token_details": {"audio": 0, "reasoning": 0}}}	Why do Python programmers prefer dark mode?\n\nBecause light attracts bugs!	{"tags": "[\\"seq:step:3\\"]", "scope": "{\\"name\\":\\"langfuse-sdk\\",\\"version\\":\\"3.7.0\\",\\"attributes\\":{\\"public_key\\":\\"pk-lf-e038c771-f113-46ed-9e10-d4628cf20f16\\"}}", "resourceAttributes": "{\\"telemetry.sdk.language\\":\\"python\\",\\"telemetry.sdk.name\\":\\"opentelemetry\\",\\"telemetry.sdk.version\\":\\"1.39.1\\",\\"service.name\\":\\"unknown_service\\"}"}	\N	\N	{}	{}	{}	{}	{}	\N	\N	\N	\N	\N	\N	\N	{}	[]	{}	2026-03-11 10:23:16.576+05:30	2026-03-11 10:23:16.578+05:30	2026-03-11 10:23:16.578+05:30	f
2b2cf6306244e98f	22222222-2222-4222-8222-222222222222	2ca2946cf8416dcfe3839c0403848262	\N	default	SPAN	run_chain	2026-03-11 10:23:15.242+05:30	2026-03-11 10:23:16.253+05:30	DEFAULT	\N	\N	{"args": ["Python"], "kwargs": {}}	Why do Python programmers prefer dark mode?\n\nBecause light attracts bugs!	{"scope": "{\\"name\\":\\"langfuse-sdk\\",\\"version\\":\\"3.7.0\\",\\"attributes\\":{\\"public_key\\":\\"pk-lf-e038c771-f113-46ed-9e10-d4628cf20f16\\"}}", "resourceAttributes": "{\\"telemetry.sdk.language\\":\\"python\\",\\"telemetry.sdk.name\\":\\"opentelemetry\\",\\"telemetry.sdk.version\\":\\"1.39.1\\",\\"service.name\\":\\"unknown_service\\"}"}	\N	\N	\N	{}	{}	{}	{}	\N	\N	\N	\N	\N	\N	\N	{}	[]	{}	2026-03-11 10:23:16.576+05:30	2026-03-11 10:23:16.578+05:30	2026-03-11 10:23:16.578+05:30	f
2ef0dbe42946de14	22222222-2222-4222-8222-222222222222	c77d774a377d6fc36101f1ea4d7e8b0d	79167e53d093b1fd	default	GENERATION	ChatOpenAI	2026-03-11 10:23:09.059+05:30	2026-03-11 10:23:10.545+05:30	DEFAULT	\N	\N	[{"role": "user", "content": "Tell me a joke about Python"}]	{"role": "assistant", "content": "Why do Python programmers prefer dark mode?\\n\\nBecause light attracts bugs! \\ud83d\\udc0d\\ud83d\\udca1", "additional_kwargs": {"refusal": null}}	{"tags": "[\\"seq:step:2\\"]", "scope": "{\\"name\\":\\"langfuse-sdk\\",\\"version\\":\\"3.7.0\\",\\"attributes\\":{\\"public_key\\":\\"pk-lf-e038c771-f113-46ed-9e10-d4628cf20f16\\"}}", "ls_provider": "openai", "ls_model_name": "gpt-4o-mini", "ls_model_type": "chat", "resourceAttributes": "{\\"telemetry.sdk.language\\":\\"python\\",\\"telemetry.sdk.name\\":\\"opentelemetry\\",\\"telemetry.sdk.version\\":\\"1.39.1\\",\\"service.name\\":\\"unknown_service\\"}"}	gpt-4o-mini-2024-07-18	clyrjpbe20000t0mzcbwc42rg	{}	{"input": 13, "total": 31, "output": 18, "input_audio": 0, "output_audio": 0, "input_cache_read": 0, "output_reasoning": 0}	{"input": 13, "total": 31, "output": 18, "input_audio": 0, "output_audio": 0, "input_cache_read": 0, "output_reasoning": 0}	{}	{"input": 0.00000195, "total": 0.00001275, "output": 0.0000108, "input_cache_read": 0}	0.000012750000	clyrjpbe20000t0mzcbwc42rg_tier_default	Standard	\N	\N	\N	\N	{}	[]	{}	2026-03-11 10:23:11.564+05:30	2026-03-11 10:23:11.568+05:30	2026-03-11 10:23:11.568+05:30	f
2f7280e46f4e56ac	22222222-2222-4222-8222-222222222222	c77d774a377d6fc36101f1ea4d7e8b0d	\N	default	SPAN	run_chain	2026-03-11 10:23:09.057+05:30	2026-03-11 10:23:10.546+05:30	DEFAULT	\N	\N	{"args": ["Python"], "kwargs": {}}	Why do Python programmers prefer dark mode?\n\nBecause light attracts bugs! 🐍💡	{"scope": "{\\"name\\":\\"langfuse-sdk\\",\\"version\\":\\"3.7.0\\",\\"attributes\\":{\\"public_key\\":\\"pk-lf-e038c771-f113-46ed-9e10-d4628cf20f16\\"}}", "resourceAttributes": "{\\"telemetry.sdk.language\\":\\"python\\",\\"telemetry.sdk.name\\":\\"opentelemetry\\",\\"telemetry.sdk.version\\":\\"1.39.1\\",\\"service.name\\":\\"unknown_service\\"}"}	\N	\N	\N	{}	{}	{}	{}	\N	\N	\N	\N	\N	\N	\N	{}	[]	{}	2026-03-11 10:23:11.564+05:30	2026-03-11 10:23:11.568+05:30	2026-03-11 10:23:11.568+05:30	f
31cc85fed95709d1	22222222-2222-4222-8222-222222222222	45ac0cd76c3a950051336b171ced4ef3	\N	default	SPAN	run_chain	2026-03-11 10:23:13.723+05:30	2026-03-11 10:23:15.241+05:30	DEFAULT	\N	\N	{"args": ["Python"], "kwargs": {}}	Why do Python programmers prefer dark mode?\n\nBecause light attracts bugs! 🐍💻	{"scope": "{\\"name\\":\\"langfuse-sdk\\",\\"version\\":\\"3.7.0\\",\\"attributes\\":{\\"public_key\\":\\"pk-lf-e038c771-f113-46ed-9e10-d4628cf20f16\\"}}", "resourceAttributes": "{\\"telemetry.sdk.language\\":\\"python\\",\\"telemetry.sdk.name\\":\\"opentelemetry\\",\\"telemetry.sdk.version\\":\\"1.39.1\\",\\"service.name\\":\\"unknown_service\\"}"}	\N	\N	\N	{}	{}	{}	{}	\N	\N	\N	\N	\N	\N	\N	{}	[]	{}	2026-03-11 10:23:16.576+05:30	2026-03-11 10:23:16.578+05:30	2026-03-11 10:23:16.578+05:30	f
3f5d956cb1260def	22222222-2222-4222-8222-222222222222	e95dba671dddd95f196ae8488b51d307	cc35c0674921f380	default	GENERATION	ChatOpenAI	2026-03-11 10:23:10.548+05:30	2026-03-11 10:23:12.011+05:30	DEFAULT	\N	\N	[{"role": "user", "content": "Tell me a joke about Python"}]	{"role": "assistant", "content": "Why do Python programmers prefer dark mode?\\n\\nBecause light attracts bugs! \\ud83d\\udc1b\\ud83d\\ude04", "additional_kwargs": {"refusal": null}}	{"tags": "[\\"seq:step:2\\"]", "scope": "{\\"name\\":\\"langfuse-sdk\\",\\"version\\":\\"3.7.0\\",\\"attributes\\":{\\"public_key\\":\\"pk-lf-e038c771-f113-46ed-9e10-d4628cf20f16\\"}}", "ls_provider": "openai", "ls_model_name": "gpt-4o-mini", "ls_model_type": "chat", "resourceAttributes": "{\\"telemetry.sdk.language\\":\\"python\\",\\"telemetry.sdk.name\\":\\"opentelemetry\\",\\"telemetry.sdk.version\\":\\"1.39.1\\",\\"service.name\\":\\"unknown_service\\"}"}	gpt-4o-mini-2024-07-18	clyrjpbe20000t0mzcbwc42rg	{}	{"input": 13, "total": 31, "output": 18, "input_audio": 0, "output_audio": 0, "input_cache_read": 0, "output_reasoning": 0}	{"input": 13, "total": 31, "output": 18, "input_audio": 0, "output_audio": 0, "input_cache_read": 0, "output_reasoning": 0}	{}	{"input": 0.00000195, "total": 0.00001275, "output": 0.0000108, "input_cache_read": 0}	0.000012750000	clyrjpbe20000t0mzcbwc42rg_tier_default	Standard	\N	\N	\N	\N	{}	[]	{}	2026-03-11 10:23:16.576+05:30	2026-03-11 10:23:16.577+05:30	2026-03-11 10:23:16.577+05:30	f
4500b3036e6f22f6	22222222-2222-4222-8222-222222222222	a69063b300223a8f76d58da86ac1fb2a	85f294c24679fd06	default	CHAIN	StrOutputParser	2026-03-11 10:23:13.721+05:30	2026-03-11 10:23:13.722+05:30	DEFAULT	\N	\N	{"content": "Why do Python programmers prefer dark mode?\\n\\nBecause light attracts bugs!", "additional_kwargs": {"refusal": null}, "response_metadata": {"token_usage": {"completion_tokens": 13, "prompt_tokens": 13, "total_tokens": 26, "completion_tokens_details": {"accepted_prediction_tokens": 0, "audio_tokens": 0, "reasoning_tokens": 0, "rejected_prediction_tokens": 0}, "prompt_tokens_details": {"audio_tokens": 0, "cached_tokens": 0}}, "model_name": "gpt-4o-mini-2024-07-18", "system_fingerprint": "fp_6bedc898d2", "id": "chatcmpl-DI5rF66oMRpFjbGHVnNQy6h37fBbX", "service_tier": "default", "finish_reason": "stop", "logprobs": null}, "type": "ai", "name": null, "id": "run--019cdb3d-e2d0-7210-a67d-a560e1d6944e-0", "example": false, "tool_calls": [], "invalid_tool_calls": [], "usage_metadata": {"input_tokens": 13, "output_tokens": 13, "total_tokens": 26, "input_token_details": {"audio": 0, "cache_read": 0}, "output_token_details": {"audio": 0, "reasoning": 0}}}	Why do Python programmers prefer dark mode?\n\nBecause light attracts bugs!	{"tags": "[\\"seq:step:3\\"]", "scope": "{\\"name\\":\\"langfuse-sdk\\",\\"version\\":\\"3.7.0\\",\\"attributes\\":{\\"public_key\\":\\"pk-lf-e038c771-f113-46ed-9e10-d4628cf20f16\\"}}", "resourceAttributes": "{\\"telemetry.sdk.language\\":\\"python\\",\\"telemetry.sdk.name\\":\\"opentelemetry\\",\\"telemetry.sdk.version\\":\\"1.39.1\\",\\"service.name\\":\\"unknown_service\\"}"}	\N	\N	{}	{}	{}	{}	{}	\N	\N	\N	\N	\N	\N	\N	{}	[]	{}	2026-03-11 10:23:16.576+05:30	2026-03-11 10:23:16.578+05:30	2026-03-11 10:23:16.578+05:30	f
45267f54447e6776	22222222-2222-4222-8222-222222222222	ff3a09f8f26320e6bf84254fba4b2552	1dc20e5664f668b7	default	CHAIN	RunnableSequence	2026-03-11 10:23:07.92+05:30	2026-03-11 10:23:09.056+05:30	DEFAULT	\N	\N	{"topic": "Python"}	Why do Python programmers prefer dark mode?\n\nBecause light attracts bugs!	{"scope": "{\\"name\\":\\"langfuse-sdk\\",\\"version\\":\\"3.7.0\\",\\"attributes\\":{\\"public_key\\":\\"pk-lf-e038c771-f113-46ed-9e10-d4628cf20f16\\"}}", "resourceAttributes": "{\\"telemetry.sdk.language\\":\\"python\\",\\"telemetry.sdk.name\\":\\"opentelemetry\\",\\"telemetry.sdk.version\\":\\"1.39.1\\",\\"service.name\\":\\"unknown_service\\"}"}	\N	\N	{}	{}	{}	{}	{}	\N	\N	\N	\N	\N	\N	\N	{}	[]	{}	2026-03-11 10:23:11.564+05:30	2026-03-11 10:23:11.568+05:30	2026-03-11 10:23:11.568+05:30	f
6889cdd026a8f8c8	22222222-2222-4222-8222-222222222222	ff3a09f8f26320e6bf84254fba4b2552	45267f54447e6776	default	CHAIN	StrOutputParser	2026-03-11 10:23:09.056+05:30	2026-03-11 10:23:09.056+05:30	DEFAULT	\N	\N	{"content": "Why do Python programmers prefer dark mode?\\n\\nBecause light attracts bugs!", "additional_kwargs": {"refusal": null}, "response_metadata": {"token_usage": {"completion_tokens": 13, "prompt_tokens": 13, "total_tokens": 26, "completion_tokens_details": {"accepted_prediction_tokens": 0, "audio_tokens": 0, "reasoning_tokens": 0, "rejected_prediction_tokens": 0}, "prompt_tokens_details": {"audio_tokens": 0, "cached_tokens": 0}}, "model_name": "gpt-4o-mini-2024-07-18", "system_fingerprint": "fp_6bedc898d2", "id": "chatcmpl-DI5rAJGnfyevna7VpH04ITJKn0bn8", "service_tier": "default", "finish_reason": "stop", "logprobs": null}, "type": "ai", "name": null, "id": "run--019cdb3d-d2d1-7532-a334-6ca7b8fcf572-0", "example": false, "tool_calls": [], "invalid_tool_calls": [], "usage_metadata": {"input_tokens": 13, "output_tokens": 13, "total_tokens": 26, "input_token_details": {"audio": 0, "cache_read": 0}, "output_token_details": {"audio": 0, "reasoning": 0}}}	Why do Python programmers prefer dark mode?\n\nBecause light attracts bugs!	{"tags": "[\\"seq:step:3\\"]", "scope": "{\\"name\\":\\"langfuse-sdk\\",\\"version\\":\\"3.7.0\\",\\"attributes\\":{\\"public_key\\":\\"pk-lf-e038c771-f113-46ed-9e10-d4628cf20f16\\"}}", "resourceAttributes": "{\\"telemetry.sdk.language\\":\\"python\\",\\"telemetry.sdk.name\\":\\"opentelemetry\\",\\"telemetry.sdk.version\\":\\"1.39.1\\",\\"service.name\\":\\"unknown_service\\"}"}	\N	\N	{}	{}	{}	{}	{}	\N	\N	\N	\N	\N	\N	\N	{}	[]	{}	2026-03-11 10:23:11.564+05:30	2026-03-11 10:23:11.568+05:30	2026-03-11 10:23:11.568+05:30	f
6ac9b6c39c86e496	22222222-2222-4222-8222-222222222222	ff3a09f8f26320e6bf84254fba4b2552	45267f54447e6776	default	GENERATION	ChatOpenAI	2026-03-11 10:23:07.921+05:30	2026-03-11 10:23:09.055+05:30	DEFAULT	\N	\N	[{"role": "user", "content": "Tell me a joke about Python"}]	{"role": "assistant", "content": "Why do Python programmers prefer dark mode?\\n\\nBecause light attracts bugs!", "additional_kwargs": {"refusal": null}}	{"tags": "[\\"seq:step:2\\"]", "scope": "{\\"name\\":\\"langfuse-sdk\\",\\"version\\":\\"3.7.0\\",\\"attributes\\":{\\"public_key\\":\\"pk-lf-e038c771-f113-46ed-9e10-d4628cf20f16\\"}}", "ls_provider": "openai", "ls_model_name": "gpt-4o-mini", "ls_model_type": "chat", "resourceAttributes": "{\\"telemetry.sdk.language\\":\\"python\\",\\"telemetry.sdk.name\\":\\"opentelemetry\\",\\"telemetry.sdk.version\\":\\"1.39.1\\",\\"service.name\\":\\"unknown_service\\"}"}	gpt-4o-mini-2024-07-18	clyrjpbe20000t0mzcbwc42rg	{}	{"input": 13, "total": 26, "output": 13, "input_audio": 0, "output_audio": 0, "input_cache_read": 0, "output_reasoning": 0}	{"input": 13, "total": 26, "output": 13, "input_audio": 0, "output_audio": 0, "input_cache_read": 0, "output_reasoning": 0}	{}	{"input": 0.00000195, "total": 0.00000975, "output": 0.0000078, "input_cache_read": 0}	0.000009750000	clyrjpbe20000t0mzcbwc42rg_tier_default	Standard	\N	\N	\N	\N	{}	[]	{}	2026-03-11 10:23:11.564+05:30	2026-03-11 10:23:11.568+05:30	2026-03-11 10:23:11.568+05:30	f
7041f5eba667daa5	22222222-2222-4222-8222-222222222222	173e45c27db317c91e25cdaca43e055a	\N	default	SPAN	my-trace	2026-03-11 10:23:06.501+05:30	2026-03-11 10:23:06.501+05:30	DEFAULT	\N	\N	{"text": "hello world"}	{"tokens": 2}	{"scope": "{\\"name\\":\\"langfuse-sdk\\",\\"version\\":\\"3.7.0\\",\\"attributes\\":{\\"public_key\\":\\"pk-lf-e038c771-f113-46ed-9e10-d4628cf20f16\\"}}", "resourceAttributes": "{\\"telemetry.sdk.language\\":\\"python\\",\\"telemetry.sdk.name\\":\\"opentelemetry\\",\\"telemetry.sdk.version\\":\\"1.39.1\\",\\"service.name\\":\\"unknown_service\\"}"}	\N	\N	\N	{}	{}	{}	{}	\N	\N	\N	\N	\N	\N	\N	{}	[]	{}	2026-03-11 10:23:11.563+05:30	2026-03-11 10:23:11.566+05:30	2026-03-11 10:23:11.566+05:30	f
79167e53d093b1fd	22222222-2222-4222-8222-222222222222	c77d774a377d6fc36101f1ea4d7e8b0d	2f7280e46f4e56ac	default	CHAIN	RunnableSequence	2026-03-11 10:23:09.057+05:30	2026-03-11 10:23:10.546+05:30	DEFAULT	\N	\N	{"topic": "Python"}	Why do Python programmers prefer dark mode?\n\nBecause light attracts bugs! 🐍💡	{"scope": "{\\"name\\":\\"langfuse-sdk\\",\\"version\\":\\"3.7.0\\",\\"attributes\\":{\\"public_key\\":\\"pk-lf-e038c771-f113-46ed-9e10-d4628cf20f16\\"}}", "resourceAttributes": "{\\"telemetry.sdk.language\\":\\"python\\",\\"telemetry.sdk.name\\":\\"opentelemetry\\",\\"telemetry.sdk.version\\":\\"1.39.1\\",\\"service.name\\":\\"unknown_service\\"}"}	\N	\N	{}	{}	{}	{}	{}	\N	\N	\N	\N	\N	\N	\N	{}	[]	{}	2026-03-11 10:23:11.564+05:30	2026-03-11 10:23:11.568+05:30	2026-03-11 10:23:11.568+05:30	f
7c8a5cf3b704c2e3	22222222-2222-4222-8222-222222222222	16f35fee363d1c380ed98faef04f568d	f9f37da02d4a0455	default	CHAIN	RunnableSequence	2026-03-11 10:23:06.64+05:30	2026-03-11 10:23:07.919+05:30	DEFAULT	\N	\N	{"topic": "Python"}	Why do Python programmers prefer dark mode?\n\nBecause light attracts bugs!	{"scope": "{\\"name\\":\\"langfuse-sdk\\",\\"version\\":\\"3.7.0\\",\\"attributes\\":{\\"public_key\\":\\"pk-lf-e038c771-f113-46ed-9e10-d4628cf20f16\\"}}", "resourceAttributes": "{\\"telemetry.sdk.language\\":\\"python\\",\\"telemetry.sdk.name\\":\\"opentelemetry\\",\\"telemetry.sdk.version\\":\\"1.39.1\\",\\"service.name\\":\\"unknown_service\\"}"}	\N	\N	{}	{}	{}	{}	{}	\N	\N	\N	\N	\N	\N	\N	{}	[]	{}	2026-03-11 10:23:11.564+05:30	2026-03-11 10:23:11.568+05:30	2026-03-11 10:23:11.568+05:30	f
85f294c24679fd06	22222222-2222-4222-8222-222222222222	a69063b300223a8f76d58da86ac1fb2a	cf026def2e1a537e	default	CHAIN	RunnableSequence	2026-03-11 10:23:12.014+05:30	2026-03-11 10:23:13.722+05:30	DEFAULT	\N	\N	{"topic": "Python"}	Why do Python programmers prefer dark mode?\n\nBecause light attracts bugs!	{"scope": "{\\"name\\":\\"langfuse-sdk\\",\\"version\\":\\"3.7.0\\",\\"attributes\\":{\\"public_key\\":\\"pk-lf-e038c771-f113-46ed-9e10-d4628cf20f16\\"}}", "resourceAttributes": "{\\"telemetry.sdk.language\\":\\"python\\",\\"telemetry.sdk.name\\":\\"opentelemetry\\",\\"telemetry.sdk.version\\":\\"1.39.1\\",\\"service.name\\":\\"unknown_service\\"}"}	\N	\N	{}	{}	{}	{}	{}	\N	\N	\N	\N	\N	\N	\N	{}	[]	{}	2026-03-11 10:23:16.576+05:30	2026-03-11 10:23:16.578+05:30	2026-03-11 10:23:16.578+05:30	f
884c154a2ce19c89	22222222-2222-4222-8222-222222222222	16f35fee363d1c380ed98faef04f568d	7c8a5cf3b704c2e3	default	CHAIN	StrOutputParser	2026-03-11 10:23:07.919+05:30	2026-03-11 10:23:07.919+05:30	DEFAULT	\N	\N	{"content": "Why do Python programmers prefer dark mode?\\n\\nBecause light attracts bugs!", "additional_kwargs": {"refusal": null}, "response_metadata": {"token_usage": {"completion_tokens": 13, "prompt_tokens": 13, "total_tokens": 26, "completion_tokens_details": {"accepted_prediction_tokens": 0, "audio_tokens": 0, "reasoning_tokens": 0, "rejected_prediction_tokens": 0}, "prompt_tokens_details": {"audio_tokens": 0, "cached_tokens": 0}}, "model_name": "gpt-4o-mini-2024-07-18", "system_fingerprint": "fp_6bedc898d2", "id": "chatcmpl-DI5r9TQLDimitzjTrcsKqMnni4UG3", "service_tier": "default", "finish_reason": "stop", "logprobs": null}, "type": "ai", "name": null, "id": "run--019cdb3d-cdd1-71a1-ac92-05ba520cc61f-0", "example": false, "tool_calls": [], "invalid_tool_calls": [], "usage_metadata": {"input_tokens": 13, "output_tokens": 13, "total_tokens": 26, "input_token_details": {"audio": 0, "cache_read": 0}, "output_token_details": {"audio": 0, "reasoning": 0}}}	Why do Python programmers prefer dark mode?\n\nBecause light attracts bugs!	{"tags": "[\\"seq:step:3\\"]", "scope": "{\\"name\\":\\"langfuse-sdk\\",\\"version\\":\\"3.7.0\\",\\"attributes\\":{\\"public_key\\":\\"pk-lf-e038c771-f113-46ed-9e10-d4628cf20f16\\"}}", "resourceAttributes": "{\\"telemetry.sdk.language\\":\\"python\\",\\"telemetry.sdk.name\\":\\"opentelemetry\\",\\"telemetry.sdk.version\\":\\"1.39.1\\",\\"service.name\\":\\"unknown_service\\"}"}	\N	\N	{}	{}	{}	{}	{}	\N	\N	\N	\N	\N	\N	\N	{}	[]	{}	2026-03-11 10:23:11.564+05:30	2026-03-11 10:23:11.567+05:30	2026-03-11 10:23:11.567+05:30	f
8d85a59fdf9b555d	22222222-2222-4222-8222-222222222222	2c88d13b5b3f35acb8c26a87c5d31477	b2f014fbb110bb88	default	GENERATION	ChatOpenAI	2026-03-11 10:23:16.255+05:30	2026-03-11 10:23:17.118+05:30	DEFAULT	\N	\N	[{"role": "user", "content": "Tell me a joke about Python"}]	{"role": "assistant", "content": "Why do Python programmers prefer dark mode?\\n\\nBecause light attracts bugs! \\ud83d\\udc0d\\ud83d\\udca1", "additional_kwargs": {"refusal": null}}	{"tags": "[\\"seq:step:2\\"]", "scope": "{\\"name\\":\\"langfuse-sdk\\",\\"version\\":\\"3.7.0\\",\\"attributes\\":{\\"public_key\\":\\"pk-lf-e038c771-f113-46ed-9e10-d4628cf20f16\\"}}", "ls_provider": "openai", "ls_model_name": "gpt-4o-mini", "ls_model_type": "chat", "resourceAttributes": "{\\"telemetry.sdk.language\\":\\"python\\",\\"telemetry.sdk.name\\":\\"opentelemetry\\",\\"telemetry.sdk.version\\":\\"1.39.1\\",\\"service.name\\":\\"unknown_service\\"}"}	gpt-4o-mini-2024-07-18	clyrjpbe20000t0mzcbwc42rg	{}	{"input": 13, "total": 31, "output": 18, "input_audio": 0, "output_audio": 0, "input_cache_read": 0, "output_reasoning": 0}	{"input": 13, "total": 31, "output": 18, "input_audio": 0, "output_audio": 0, "input_cache_read": 0, "output_reasoning": 0}	{}	{"input": 0.00000195, "total": 0.00001275, "output": 0.0000108, "input_cache_read": 0}	0.000012750000	clyrjpbe20000t0mzcbwc42rg_tier_default	Standard	\N	\N	\N	\N	{}	[]	{}	2026-03-11 10:23:19.074+05:30	2026-03-11 10:23:19.075+05:30	2026-03-11 10:23:19.075+05:30	f
90673e12f814ae13	22222222-2222-4222-8222-222222222222	c77d774a377d6fc36101f1ea4d7e8b0d	79167e53d093b1fd	default	CHAIN	StrOutputParser	2026-03-11 10:23:10.546+05:30	2026-03-11 10:23:10.546+05:30	DEFAULT	\N	\N	{"content": "Why do Python programmers prefer dark mode?\\n\\nBecause light attracts bugs! \\ud83d\\udc0d\\ud83d\\udca1", "additional_kwargs": {"refusal": null}, "response_metadata": {"token_usage": {"completion_tokens": 18, "prompt_tokens": 13, "total_tokens": 31, "completion_tokens_details": {"accepted_prediction_tokens": 0, "audio_tokens": 0, "reasoning_tokens": 0, "rejected_prediction_tokens": 0}, "prompt_tokens_details": {"audio_tokens": 0, "cached_tokens": 0}}, "model_name": "gpt-4o-mini-2024-07-18", "system_fingerprint": "fp_0702c1c457", "id": "chatcmpl-DI5rBrmomc6p5No898pg1doi0ez4Y", "service_tier": "default", "finish_reason": "stop", "logprobs": null}, "type": "ai", "name": null, "id": "run--019cdb3d-d743-7092-8ec2-93093b00aac6-0", "example": false, "tool_calls": [], "invalid_tool_calls": [], "usage_metadata": {"input_tokens": 13, "output_tokens": 18, "total_tokens": 31, "input_token_details": {"audio": 0, "cache_read": 0}, "output_token_details": {"audio": 0, "reasoning": 0}}}	Why do Python programmers prefer dark mode?\n\nBecause light attracts bugs! 🐍💡	{"tags": "[\\"seq:step:3\\"]", "scope": "{\\"name\\":\\"langfuse-sdk\\",\\"version\\":\\"3.7.0\\",\\"attributes\\":{\\"public_key\\":\\"pk-lf-e038c771-f113-46ed-9e10-d4628cf20f16\\"}}", "resourceAttributes": "{\\"telemetry.sdk.language\\":\\"python\\",\\"telemetry.sdk.name\\":\\"opentelemetry\\",\\"telemetry.sdk.version\\":\\"1.39.1\\",\\"service.name\\":\\"unknown_service\\"}"}	\N	\N	{}	{}	{}	{}	{}	\N	\N	\N	\N	\N	\N	\N	{}	[]	{}	2026-03-11 10:23:11.564+05:30	2026-03-11 10:23:11.568+05:30	2026-03-11 10:23:11.568+05:30	f
93162f8d207cb20d	22222222-2222-4222-8222-222222222222	e95dba671dddd95f196ae8488b51d307	cc35c0674921f380	default	CHAIN	StrOutputParser	2026-03-11 10:23:12.011+05:30	2026-03-11 10:23:12.012+05:30	DEFAULT	\N	\N	{"content": "Why do Python programmers prefer dark mode?\\n\\nBecause light attracts bugs! \\ud83d\\udc1b\\ud83d\\ude04", "additional_kwargs": {"refusal": null}, "response_metadata": {"token_usage": {"completion_tokens": 18, "prompt_tokens": 13, "total_tokens": 31, "completion_tokens_details": {"accepted_prediction_tokens": 0, "audio_tokens": 0, "reasoning_tokens": 0, "rejected_prediction_tokens": 0}, "prompt_tokens_details": {"audio_tokens": 0, "cached_tokens": 0}}, "model_name": "gpt-4o-mini-2024-07-18", "system_fingerprint": "fp_0702c1c457", "id": "chatcmpl-DI5rD4nJ19fnjHBTQlpl2zE3Vj6u0", "service_tier": "default", "finish_reason": "stop", "logprobs": null}, "type": "ai", "name": null, "id": "run--019cdb3d-dd14-7b63-9184-114fba6d485a-0", "example": false, "tool_calls": [], "invalid_tool_calls": [], "usage_metadata": {"input_tokens": 13, "output_tokens": 18, "total_tokens": 31, "input_token_details": {"audio": 0, "cache_read": 0}, "output_token_details": {"audio": 0, "reasoning": 0}}}	Why do Python programmers prefer dark mode?\n\nBecause light attracts bugs! 🐛😄	{"tags": "[\\"seq:step:3\\"]", "scope": "{\\"name\\":\\"langfuse-sdk\\",\\"version\\":\\"3.7.0\\",\\"attributes\\":{\\"public_key\\":\\"pk-lf-e038c771-f113-46ed-9e10-d4628cf20f16\\"}}", "resourceAttributes": "{\\"telemetry.sdk.language\\":\\"python\\",\\"telemetry.sdk.name\\":\\"opentelemetry\\",\\"telemetry.sdk.version\\":\\"1.39.1\\",\\"service.name\\":\\"unknown_service\\"}"}	\N	\N	{}	{}	{}	{}	{}	\N	\N	\N	\N	\N	\N	\N	{}	[]	{}	2026-03-11 10:23:16.576+05:30	2026-03-11 10:23:16.577+05:30	2026-03-11 10:23:16.577+05:30	f
943ce8895cdb9e8f	22222222-2222-4222-8222-222222222222	2c88d13b5b3f35acb8c26a87c5d31477	b2f014fbb110bb88	default	CHAIN	StrOutputParser	2026-03-11 10:23:17.12+05:30	2026-03-11 10:23:17.12+05:30	DEFAULT	\N	\N	{"content": "Why do Python programmers prefer dark mode?\\n\\nBecause light attracts bugs! \\ud83d\\udc0d\\ud83d\\udca1", "additional_kwargs": {"refusal": null}, "response_metadata": {"token_usage": {"completion_tokens": 18, "prompt_tokens": 13, "total_tokens": 31, "completion_tokens_details": {"accepted_prediction_tokens": 0, "audio_tokens": 0, "reasoning_tokens": 0, "rejected_prediction_tokens": 0}, "prompt_tokens_details": {"audio_tokens": 0, "cached_tokens": 0}}, "model_name": "gpt-4o-mini-2024-07-18", "system_fingerprint": "fp_6bedc898d2", "id": "chatcmpl-DI5rIAwt5fLCmmwgbMbyDfAVsUipp", "service_tier": "default", "finish_reason": "stop", "logprobs": null}, "type": "ai", "name": null, "id": "run--019cdb3d-f35f-7d42-a140-330a43042cc7-0", "example": false, "tool_calls": [], "invalid_tool_calls": [], "usage_metadata": {"input_tokens": 13, "output_tokens": 18, "total_tokens": 31, "input_token_details": {"audio": 0, "cache_read": 0}, "output_token_details": {"audio": 0, "reasoning": 0}}}	Why do Python programmers prefer dark mode?\n\nBecause light attracts bugs! 🐍💡	{"tags": "[\\"seq:step:3\\"]", "scope": "{\\"name\\":\\"langfuse-sdk\\",\\"version\\":\\"3.7.0\\",\\"attributes\\":{\\"public_key\\":\\"pk-lf-e038c771-f113-46ed-9e10-d4628cf20f16\\"}}", "resourceAttributes": "{\\"telemetry.sdk.language\\":\\"python\\",\\"telemetry.sdk.name\\":\\"opentelemetry\\",\\"telemetry.sdk.version\\":\\"1.39.1\\",\\"service.name\\":\\"unknown_service\\"}"}	\N	\N	{}	{}	{}	{}	{}	\N	\N	\N	\N	\N	\N	\N	{}	[]	{}	2026-03-11 10:23:19.074+05:30	2026-03-11 10:23:19.075+05:30	2026-03-11 10:23:19.075+05:30	f
9aa1619ebf98d3e7	22222222-2222-4222-8222-222222222222	45ac0cd76c3a950051336b171ced4ef3	22689ee42f1ce90f	default	CHAIN	StrOutputParser	2026-03-11 10:23:15.24+05:30	2026-03-11 10:23:15.241+05:30	DEFAULT	\N	\N	{"content": "Why do Python programmers prefer dark mode?\\n\\nBecause light attracts bugs! \\ud83d\\udc0d\\ud83d\\udcbb", "additional_kwargs": {"refusal": null}, "response_metadata": {"token_usage": {"completion_tokens": 18, "prompt_tokens": 13, "total_tokens": 31, "completion_tokens_details": {"accepted_prediction_tokens": 0, "audio_tokens": 0, "reasoning_tokens": 0, "rejected_prediction_tokens": 0}, "prompt_tokens_details": {"audio_tokens": 0, "cached_tokens": 0}}, "model_name": "gpt-4o-mini-2024-07-18", "system_fingerprint": "fp_6bedc898d2", "id": "chatcmpl-DI5rG3VV4KefwdwsF1MrHOH9iFwol", "service_tier": "default", "finish_reason": "stop", "logprobs": null}, "type": "ai", "name": null, "id": "run--019cdb3d-e97e-78e3-9b4c-046deacb256f-0", "example": false, "tool_calls": [], "invalid_tool_calls": [], "usage_metadata": {"input_tokens": 13, "output_tokens": 18, "total_tokens": 31, "input_token_details": {"audio": 0, "cache_read": 0}, "output_token_details": {"audio": 0, "reasoning": 0}}}	Why do Python programmers prefer dark mode?\n\nBecause light attracts bugs! 🐍💻	{"tags": "[\\"seq:step:3\\"]", "scope": "{\\"name\\":\\"langfuse-sdk\\",\\"version\\":\\"3.7.0\\",\\"attributes\\":{\\"public_key\\":\\"pk-lf-e038c771-f113-46ed-9e10-d4628cf20f16\\"}}", "resourceAttributes": "{\\"telemetry.sdk.language\\":\\"python\\",\\"telemetry.sdk.name\\":\\"opentelemetry\\",\\"telemetry.sdk.version\\":\\"1.39.1\\",\\"service.name\\":\\"unknown_service\\"}"}	\N	\N	{}	{}	{}	{}	{}	\N	\N	\N	\N	\N	\N	\N	{}	[]	{}	2026-03-11 10:23:16.576+05:30	2026-03-11 10:23:16.578+05:30	2026-03-11 10:23:16.578+05:30	f
9e4f9ed1cb1aa880	22222222-2222-4222-8222-222222222222	e95dba671dddd95f196ae8488b51d307	cc35c0674921f380	default	CHAIN	ChatPromptTemplate	2026-03-11 10:23:10.547+05:30	2026-03-11 10:23:10.548+05:30	DEFAULT	\N	\N	{"topic": "Python"}	{"messages": [{"content": "Tell me a joke about Python", "additional_kwargs": {}, "response_metadata": {}, "type": "human", "name": null, "id": null}]}	{"tags": "[\\"seq:step:1\\"]", "scope": "{\\"name\\":\\"langfuse-sdk\\",\\"version\\":\\"3.7.0\\",\\"attributes\\":{\\"public_key\\":\\"pk-lf-e038c771-f113-46ed-9e10-d4628cf20f16\\"}}", "resourceAttributes": "{\\"telemetry.sdk.language\\":\\"python\\",\\"telemetry.sdk.name\\":\\"opentelemetry\\",\\"telemetry.sdk.version\\":\\"1.39.1\\",\\"service.name\\":\\"unknown_service\\"}"}	\N	\N	{}	{}	{}	{}	{}	\N	\N	\N	\N	\N	\N	\N	{}	[]	{}	2026-03-11 10:23:11.564+05:30	2026-03-11 10:23:11.568+05:30	2026-03-11 10:23:11.568+05:30	f
a0e6344b1bd703c8	22222222-2222-4222-8222-222222222222	969103b644f4e8759c921ded049b00f8	fb29a099b25f6c0c	default	CHAIN	ChatPromptTemplate	2026-03-11 10:23:17.124+05:30	2026-03-11 10:23:17.124+05:30	DEFAULT	\N	\N	{"topic": "Python"}	{"messages": [{"content": "Tell me a joke about Python", "additional_kwargs": {}, "response_metadata": {}, "type": "human", "name": null, "id": null}]}	{"tags": "[\\"seq:step:1\\"]", "scope": "{\\"name\\":\\"langfuse-sdk\\",\\"version\\":\\"3.7.0\\",\\"attributes\\":{\\"public_key\\":\\"pk-lf-e038c771-f113-46ed-9e10-d4628cf20f16\\"}}", "resourceAttributes": "{\\"telemetry.sdk.language\\":\\"python\\",\\"telemetry.sdk.name\\":\\"opentelemetry\\",\\"telemetry.sdk.version\\":\\"1.39.1\\",\\"service.name\\":\\"unknown_service\\"}"}	\N	\N	{}	{}	{}	{}	{}	\N	\N	\N	\N	\N	\N	\N	{}	[]	{}	2026-03-11 10:23:19.074+05:30	2026-03-11 10:23:19.075+05:30	2026-03-11 10:23:19.075+05:30	f
a7cfef892b381501	22222222-2222-4222-8222-222222222222	16f35fee363d1c380ed98faef04f568d	7c8a5cf3b704c2e3	default	CHAIN	ChatPromptTemplate	2026-03-11 10:23:06.64+05:30	2026-03-11 10:23:06.641+05:30	DEFAULT	\N	\N	{"topic": "Python"}	{"messages": [{"content": "Tell me a joke about Python", "additional_kwargs": {}, "response_metadata": {}, "type": "human", "name": null, "id": null}]}	{"tags": "[\\"seq:step:1\\"]", "scope": "{\\"name\\":\\"langfuse-sdk\\",\\"version\\":\\"3.7.0\\",\\"attributes\\":{\\"public_key\\":\\"pk-lf-e038c771-f113-46ed-9e10-d4628cf20f16\\"}}", "resourceAttributes": "{\\"telemetry.sdk.language\\":\\"python\\",\\"telemetry.sdk.name\\":\\"opentelemetry\\",\\"telemetry.sdk.version\\":\\"1.39.1\\",\\"service.name\\":\\"unknown_service\\"}"}	\N	\N	{}	{}	{}	{}	{}	\N	\N	\N	\N	\N	\N	\N	{}	[]	{}	2026-03-11 10:23:11.564+05:30	2026-03-11 10:23:11.567+05:30	2026-03-11 10:23:11.567+05:30	f
b2f014fbb110bb88	22222222-2222-4222-8222-222222222222	2c88d13b5b3f35acb8c26a87c5d31477	04cfa985fd5a2ea9	default	CHAIN	RunnableSequence	2026-03-11 10:23:16.254+05:30	2026-03-11 10:23:17.121+05:30	DEFAULT	\N	\N	{"topic": "Python"}	Why do Python programmers prefer dark mode?\n\nBecause light attracts bugs! 🐍💡	{"scope": "{\\"name\\":\\"langfuse-sdk\\",\\"version\\":\\"3.7.0\\",\\"attributes\\":{\\"public_key\\":\\"pk-lf-e038c771-f113-46ed-9e10-d4628cf20f16\\"}}", "resourceAttributes": "{\\"telemetry.sdk.language\\":\\"python\\",\\"telemetry.sdk.name\\":\\"opentelemetry\\",\\"telemetry.sdk.version\\":\\"1.39.1\\",\\"service.name\\":\\"unknown_service\\"}"}	\N	\N	{}	{}	{}	{}	{}	\N	\N	\N	\N	\N	\N	\N	{}	[]	{}	2026-03-11 10:23:19.074+05:30	2026-03-11 10:23:19.075+05:30	2026-03-11 10:23:19.075+05:30	f
c06d47bef6b5a644	22222222-2222-4222-8222-222222222222	2ca2946cf8416dcfe3839c0403848262	2b2cf6306244e98f	default	CHAIN	RunnableSequence	2026-03-11 10:23:15.243+05:30	2026-03-11 10:23:16.252+05:30	DEFAULT	\N	\N	{"topic": "Python"}	Why do Python programmers prefer dark mode?\n\nBecause light attracts bugs!	{"scope": "{\\"name\\":\\"langfuse-sdk\\",\\"version\\":\\"3.7.0\\",\\"attributes\\":{\\"public_key\\":\\"pk-lf-e038c771-f113-46ed-9e10-d4628cf20f16\\"}}", "resourceAttributes": "{\\"telemetry.sdk.language\\":\\"python\\",\\"telemetry.sdk.name\\":\\"opentelemetry\\",\\"telemetry.sdk.version\\":\\"1.39.1\\",\\"service.name\\":\\"unknown_service\\"}"}	\N	\N	{}	{}	{}	{}	{}	\N	\N	\N	\N	\N	\N	\N	{}	[]	{}	2026-03-11 10:23:16.576+05:30	2026-03-11 10:23:16.578+05:30	2026-03-11 10:23:16.578+05:30	f
c65acc40bcbbf5a3	22222222-2222-4222-8222-222222222222	969103b644f4e8759c921ded049b00f8	fb29a099b25f6c0c	default	GENERATION	ChatOpenAI	2026-03-11 10:23:17.125+05:30	2026-03-11 10:23:19.046+05:30	ERROR		\N	[{"role": "user", "content": "Tell me a joke about Python"}]	\N	{"tags": "[\\"seq:step:2\\"]", "scope": "{\\"name\\":\\"langfuse-sdk\\",\\"version\\":\\"3.7.0\\",\\"attributes\\":{\\"public_key\\":\\"pk-lf-e038c771-f113-46ed-9e10-d4628cf20f16\\"}}", "ls_provider": "openai", "ls_model_name": "gpt-4o-mini", "ls_model_type": "chat", "resourceAttributes": "{\\"telemetry.sdk.language\\":\\"python\\",\\"telemetry.sdk.name\\":\\"opentelemetry\\",\\"telemetry.sdk.version\\":\\"1.39.1\\",\\"service.name\\":\\"unknown_service\\"}"}	gpt-4o-mini	clyrjp56f0000t0mzapoocd7u	{}	{}	{}	{"total": 0}	{"total": 0}	0.000000000000	clyrjp56f0000t0mzapoocd7u_tier_default	Standard	\N	\N	\N	\N	{}	[]	{}	2026-03-11 10:23:19.074+05:30	2026-03-11 10:23:19.075+05:30	2026-03-11 10:23:19.075+05:30	f
cbd6581a6132c500	22222222-2222-4222-8222-222222222222	2ca2946cf8416dcfe3839c0403848262	c06d47bef6b5a644	default	GENERATION	ChatOpenAI	2026-03-11 10:23:15.246+05:30	2026-03-11 10:23:16.251+05:30	DEFAULT	\N	\N	[{"role": "user", "content": "Tell me a joke about Python"}]	{"role": "assistant", "content": "Why do Python programmers prefer dark mode?\\n\\nBecause light attracts bugs!", "additional_kwargs": {"refusal": null}}	{"tags": "[\\"seq:step:2\\"]", "scope": "{\\"name\\":\\"langfuse-sdk\\",\\"version\\":\\"3.7.0\\",\\"attributes\\":{\\"public_key\\":\\"pk-lf-e038c771-f113-46ed-9e10-d4628cf20f16\\"}}", "ls_provider": "openai", "ls_model_name": "gpt-4o-mini", "ls_model_type": "chat", "resourceAttributes": "{\\"telemetry.sdk.language\\":\\"python\\",\\"telemetry.sdk.name\\":\\"opentelemetry\\",\\"telemetry.sdk.version\\":\\"1.39.1\\",\\"service.name\\":\\"unknown_service\\"}"}	gpt-4o-mini-2024-07-18	clyrjpbe20000t0mzcbwc42rg	{}	{"input": 13, "total": 26, "output": 13, "input_audio": 0, "output_audio": 0, "input_cache_read": 0, "output_reasoning": 0}	{"input": 13, "total": 26, "output": 13, "input_audio": 0, "output_audio": 0, "input_cache_read": 0, "output_reasoning": 0}	{}	{"input": 0.00000195, "total": 0.00000975, "output": 0.0000078, "input_cache_read": 0}	0.000009750000	clyrjpbe20000t0mzcbwc42rg_tier_default	Standard	\N	\N	\N	\N	{}	[]	{}	2026-03-11 10:23:16.576+05:30	2026-03-11 10:23:16.578+05:30	2026-03-11 10:23:16.578+05:30	f
cc35c0674921f380	22222222-2222-4222-8222-222222222222	e95dba671dddd95f196ae8488b51d307	01b52ff31417c18c	default	CHAIN	RunnableSequence	2026-03-11 10:23:10.547+05:30	2026-03-11 10:23:12.012+05:30	DEFAULT	\N	\N	{"topic": "Python"}	Why do Python programmers prefer dark mode?\n\nBecause light attracts bugs! 🐛😄	{"scope": "{\\"name\\":\\"langfuse-sdk\\",\\"version\\":\\"3.7.0\\",\\"attributes\\":{\\"public_key\\":\\"pk-lf-e038c771-f113-46ed-9e10-d4628cf20f16\\"}}", "resourceAttributes": "{\\"telemetry.sdk.language\\":\\"python\\",\\"telemetry.sdk.name\\":\\"opentelemetry\\",\\"telemetry.sdk.version\\":\\"1.39.1\\",\\"service.name\\":\\"unknown_service\\"}"}	\N	\N	{}	{}	{}	{}	{}	\N	\N	\N	\N	\N	\N	\N	{}	[]	{}	2026-03-11 10:23:16.576+05:30	2026-03-11 10:23:16.577+05:30	2026-03-11 10:23:16.577+05:30	f
ce86d63fbb3b9442	22222222-2222-4222-8222-222222222222	45ac0cd76c3a950051336b171ced4ef3	22689ee42f1ce90f	default	GENERATION	ChatOpenAI	2026-03-11 10:23:13.727+05:30	2026-03-11 10:23:15.238+05:30	DEFAULT	\N	\N	[{"role": "user", "content": "Tell me a joke about Python"}]	{"role": "assistant", "content": "Why do Python programmers prefer dark mode?\\n\\nBecause light attracts bugs! \\ud83d\\udc0d\\ud83d\\udcbb", "additional_kwargs": {"refusal": null}}	{"tags": "[\\"seq:step:2\\"]", "scope": "{\\"name\\":\\"langfuse-sdk\\",\\"version\\":\\"3.7.0\\",\\"attributes\\":{\\"public_key\\":\\"pk-lf-e038c771-f113-46ed-9e10-d4628cf20f16\\"}}", "ls_provider": "openai", "ls_model_name": "gpt-4o-mini", "ls_model_type": "chat", "resourceAttributes": "{\\"telemetry.sdk.language\\":\\"python\\",\\"telemetry.sdk.name\\":\\"opentelemetry\\",\\"telemetry.sdk.version\\":\\"1.39.1\\",\\"service.name\\":\\"unknown_service\\"}"}	gpt-4o-mini-2024-07-18	clyrjpbe20000t0mzcbwc42rg	{}	{"input": 13, "total": 31, "output": 18, "input_audio": 0, "output_audio": 0, "input_cache_read": 0, "output_reasoning": 0}	{"input": 13, "total": 31, "output": 18, "input_audio": 0, "output_audio": 0, "input_cache_read": 0, "output_reasoning": 0}	{}	{"input": 0.00000195, "total": 0.00001275, "output": 0.0000108, "input_cache_read": 0}	0.000012750000	clyrjpbe20000t0mzcbwc42rg_tier_default	Standard	\N	\N	\N	\N	{}	[]	{}	2026-03-11 10:23:16.576+05:30	2026-03-11 10:23:16.578+05:30	2026-03-11 10:23:16.578+05:30	f
cf026def2e1a537e	22222222-2222-4222-8222-222222222222	a69063b300223a8f76d58da86ac1fb2a	\N	default	SPAN	run_chain	2026-03-11 10:23:12.013+05:30	2026-03-11 10:23:13.723+05:30	DEFAULT	\N	\N	{"args": ["Python"], "kwargs": {}}	Why do Python programmers prefer dark mode?\n\nBecause light attracts bugs!	{"scope": "{\\"name\\":\\"langfuse-sdk\\",\\"version\\":\\"3.7.0\\",\\"attributes\\":{\\"public_key\\":\\"pk-lf-e038c771-f113-46ed-9e10-d4628cf20f16\\"}}", "resourceAttributes": "{\\"telemetry.sdk.language\\":\\"python\\",\\"telemetry.sdk.name\\":\\"opentelemetry\\",\\"telemetry.sdk.version\\":\\"1.39.1\\",\\"service.name\\":\\"unknown_service\\"}"}	\N	\N	\N	{}	{}	{}	{}	\N	\N	\N	\N	\N	\N	\N	{}	[]	{}	2026-03-11 10:23:16.576+05:30	2026-03-11 10:23:16.578+05:30	2026-03-11 10:23:16.578+05:30	f
dffe0531067b4bb9	22222222-2222-4222-8222-222222222222	c77d774a377d6fc36101f1ea4d7e8b0d	79167e53d093b1fd	default	CHAIN	ChatPromptTemplate	2026-03-11 10:23:09.057+05:30	2026-03-11 10:23:09.059+05:30	DEFAULT	\N	\N	{"topic": "Python"}	{"messages": [{"content": "Tell me a joke about Python", "additional_kwargs": {}, "response_metadata": {}, "type": "human", "name": null, "id": null}]}	{"tags": "[\\"seq:step:1\\"]", "scope": "{\\"name\\":\\"langfuse-sdk\\",\\"version\\":\\"3.7.0\\",\\"attributes\\":{\\"public_key\\":\\"pk-lf-e038c771-f113-46ed-9e10-d4628cf20f16\\"}}", "resourceAttributes": "{\\"telemetry.sdk.language\\":\\"python\\",\\"telemetry.sdk.name\\":\\"opentelemetry\\",\\"telemetry.sdk.version\\":\\"1.39.1\\",\\"service.name\\":\\"unknown_service\\"}"}	\N	\N	{}	{}	{}	{}	{}	\N	\N	\N	\N	\N	\N	\N	{}	[]	{}	2026-03-11 10:23:11.564+05:30	2026-03-11 10:23:11.568+05:30	2026-03-11 10:23:11.568+05:30	f
ec0c9aee501efa99	22222222-2222-4222-8222-222222222222	969103b644f4e8759c921ded049b00f8	\N	default	SPAN	run_chain	2026-03-11 10:23:17.122+05:30	2026-03-11 10:23:19.046+05:30	DEFAULT	\N	\N	{"args": ["Python"], "kwargs": {}}	\N	{"scope": "{\\"name\\":\\"langfuse-sdk\\",\\"version\\":\\"3.7.0\\",\\"attributes\\":{\\"public_key\\":\\"pk-lf-e038c771-f113-46ed-9e10-d4628cf20f16\\"}}", "resourceAttributes": "{\\"telemetry.sdk.language\\":\\"python\\",\\"telemetry.sdk.name\\":\\"opentelemetry\\",\\"telemetry.sdk.version\\":\\"1.39.1\\",\\"service.name\\":\\"unknown_service\\"}"}	\N	\N	\N	{}	{}	{}	{}	\N	\N	\N	\N	\N	\N	\N	{}	[]	{}	2026-03-11 10:23:19.074+05:30	2026-03-11 10:23:19.075+05:30	2026-03-11 10:23:19.075+05:30	f
f4690f52e1703637	22222222-2222-4222-8222-222222222222	16f35fee363d1c380ed98faef04f568d	7c8a5cf3b704c2e3	default	GENERATION	ChatOpenAI	2026-03-11 10:23:06.641+05:30	2026-03-11 10:23:07.918+05:30	DEFAULT	\N	\N	[{"role": "user", "content": "Tell me a joke about Python"}]	{"role": "assistant", "content": "Why do Python programmers prefer dark mode?\\n\\nBecause light attracts bugs!", "additional_kwargs": {"refusal": null}}	{"tags": "[\\"seq:step:2\\"]", "scope": "{\\"name\\":\\"langfuse-sdk\\",\\"version\\":\\"3.7.0\\",\\"attributes\\":{\\"public_key\\":\\"pk-lf-e038c771-f113-46ed-9e10-d4628cf20f16\\"}}", "ls_provider": "openai", "ls_model_name": "gpt-4o-mini", "ls_model_type": "chat", "resourceAttributes": "{\\"telemetry.sdk.language\\":\\"python\\",\\"telemetry.sdk.name\\":\\"opentelemetry\\",\\"telemetry.sdk.version\\":\\"1.39.1\\",\\"service.name\\":\\"unknown_service\\"}"}	gpt-4o-mini-2024-07-18	clyrjpbe20000t0mzcbwc42rg	{}	{"input": 13, "total": 26, "output": 13, "input_audio": 0, "output_audio": 0, "input_cache_read": 0, "output_reasoning": 0}	{"input": 13, "total": 26, "output": 13, "input_audio": 0, "output_audio": 0, "input_cache_read": 0, "output_reasoning": 0}	{}	{"input": 0.00000195, "total": 0.00000975, "output": 0.0000078, "input_cache_read": 0}	0.000009750000	clyrjpbe20000t0mzcbwc42rg_tier_default	Standard	\N	\N	\N	\N	{}	[]	{}	2026-03-11 10:23:11.564+05:30	2026-03-11 10:23:11.567+05:30	2026-03-11 10:23:11.567+05:30	f
f9f37da02d4a0455	22222222-2222-4222-8222-222222222222	16f35fee363d1c380ed98faef04f568d	\N	default	SPAN	run_chain	2026-03-11 10:23:06.501+05:30	2026-03-11 10:23:07.919+05:30	DEFAULT	\N	\N	{"args": ["Python"], "kwargs": {}}	Why do Python programmers prefer dark mode?\n\nBecause light attracts bugs!	{"scope": "{\\"name\\":\\"langfuse-sdk\\",\\"version\\":\\"3.7.0\\",\\"attributes\\":{\\"public_key\\":\\"pk-lf-e038c771-f113-46ed-9e10-d4628cf20f16\\"}}", "resourceAttributes": "{\\"telemetry.sdk.language\\":\\"python\\",\\"telemetry.sdk.name\\":\\"opentelemetry\\",\\"telemetry.sdk.version\\":\\"1.39.1\\",\\"service.name\\":\\"unknown_service\\"}"}	\N	\N	\N	{}	{}	{}	{}	\N	\N	\N	\N	\N	\N	\N	{}	[]	{}	2026-03-11 10:23:11.564+05:30	2026-03-11 10:23:11.568+05:30	2026-03-11 10:23:11.568+05:30	f
fb29a099b25f6c0c	22222222-2222-4222-8222-222222222222	969103b644f4e8759c921ded049b00f8	ec0c9aee501efa99	default	CHAIN	RunnableSequence	2026-03-11 10:23:17.123+05:30	2026-03-11 10:23:19.046+05:30	ERROR		\N	{"topic": "Python"}	\N	{"scope": "{\\"name\\":\\"langfuse-sdk\\",\\"version\\":\\"3.7.0\\",\\"attributes\\":{\\"public_key\\":\\"pk-lf-e038c771-f113-46ed-9e10-d4628cf20f16\\"}}", "resourceAttributes": "{\\"telemetry.sdk.language\\":\\"python\\",\\"telemetry.sdk.name\\":\\"opentelemetry\\",\\"telemetry.sdk.version\\":\\"1.39.1\\",\\"service.name\\":\\"unknown_service\\"}"}	\N	\N	{}	{}	{}	{}	{}	\N	\N	\N	\N	\N	\N	\N	{}	[]	{}	2026-03-11 10:23:19.074+05:30	2026-03-11 10:23:19.075+05:30	2026-03-11 10:23:19.075+05:30	f
feab78ffdb7411e8	22222222-2222-4222-8222-222222222222	45ac0cd76c3a950051336b171ced4ef3	22689ee42f1ce90f	default	CHAIN	ChatPromptTemplate	2026-03-11 10:23:13.726+05:30	2026-03-11 10:23:13.726+05:30	DEFAULT	\N	\N	{"topic": "Python"}	{"messages": [{"content": "Tell me a joke about Python", "additional_kwargs": {}, "response_metadata": {}, "type": "human", "name": null, "id": null}]}	{"tags": "[\\"seq:step:1\\"]", "scope": "{\\"name\\":\\"langfuse-sdk\\",\\"version\\":\\"3.7.0\\",\\"attributes\\":{\\"public_key\\":\\"pk-lf-e038c771-f113-46ed-9e10-d4628cf20f16\\"}}", "resourceAttributes": "{\\"telemetry.sdk.language\\":\\"python\\",\\"telemetry.sdk.name\\":\\"opentelemetry\\",\\"telemetry.sdk.version\\":\\"1.39.1\\",\\"service.name\\":\\"unknown_service\\"}"}	\N	\N	{}	{}	{}	{}	{}	\N	\N	\N	\N	\N	\N	\N	{}	[]	{}	2026-03-11 10:23:16.576+05:30	2026-03-11 10:23:16.578+05:30	2026-03-11 10:23:16.578+05:30	f
\.


--
-- Data for Name: observations_default; Type: TABLE DATA; Schema: public; Owner: ybvoyager
--

COPY public.observations_default (id, project_id, trace_id, parent_observation_id, environment, type, name, start_time, end_time, level, status_message, version, input, output, metadata, provided_model_name, internal_model_id, model_parameters, provided_usage_details, usage_details, provided_cost_details, cost_details, total_cost, usage_pricing_tier_id, usage_pricing_tier_name, completion_start_time, prompt_id, prompt_name, prompt_version, tool_definitions, tool_calls, tool_call_names, created_at, updated_at, event_ts, is_deleted) FROM stdin;
\.


--
-- Data for Name: scores_2026_03; Type: TABLE DATA; Schema: public; Owner: ybvoyager
--

COPY public.scores_2026_03 (id, project_id, "timestamp", trace_id, observation_id, session_id, dataset_run_id, environment, name, value, string_value, long_string_value, data_type, source, comment, author_user_id, config_id, queue_id, execution_trace_id, metadata, created_at, updated_at, event_ts, is_deleted) FROM stdin;
\.


--
-- Data for Name: scores_default; Type: TABLE DATA; Schema: public; Owner: ybvoyager
--

COPY public.scores_default (id, project_id, "timestamp", trace_id, observation_id, session_id, dataset_run_id, environment, name, value, string_value, long_string_value, data_type, source, comment, author_user_id, config_id, queue_id, execution_trace_id, metadata, created_at, updated_at, event_ts, is_deleted) FROM stdin;
\.


--
-- Data for Name: traces_2026_03; Type: TABLE DATA; Schema: public; Owner: ybvoyager
--

COPY public.traces_2026_03 (id, project_id, "timestamp", name, user_id, session_id, environment, public, bookmarked, tags, input, output, metadata, release, version, created_at, updated_at, event_ts, is_deleted) FROM stdin;
16f35fee363d1c380ed98faef04f568d	22222222-2222-4222-8222-222222222222	2026-03-11 10:23:06.501+05:30	run_chain	\N	\N	default	f	f	{}	{"args": ["Python"], "kwargs": {}}	Why do Python programmers prefer dark mode?\n\nBecause light attracts bugs!	{"scope": "{\\"name\\":\\"langfuse-sdk\\",\\"version\\":\\"3.7.0\\",\\"attributes\\":{\\"public_key\\":\\"pk-lf-e038c771-f113-46ed-9e10-d4628cf20f16\\"}}", "resourceAttributes": "{\\"telemetry.sdk.language\\":\\"python\\",\\"telemetry.sdk.name\\":\\"opentelemetry\\",\\"telemetry.sdk.version\\":\\"1.39.1\\",\\"service.name\\":\\"unknown_service\\"}"}	\N	\N	2026-03-11 10:23:11.579+05:30	2026-03-11 10:23:11.633+05:30	2026-03-11 10:23:11.633+05:30	f
173e45c27db317c91e25cdaca43e055a	22222222-2222-4222-8222-222222222222	2026-03-11 10:23:06.501+05:30	my-trace	user-123	\N	default	f	f	{}	{"text": "hello world"}	{"tokens": 2}	{"scope": "{\\"name\\":\\"langfuse-sdk\\",\\"version\\":\\"3.7.0\\",\\"attributes\\":{\\"public_key\\":\\"pk-lf-e038c771-f113-46ed-9e10-d4628cf20f16\\"}}", "resourceAttributes": "{\\"telemetry.sdk.language\\":\\"python\\",\\"telemetry.sdk.name\\":\\"opentelemetry\\",\\"telemetry.sdk.version\\":\\"1.39.1\\",\\"service.name\\":\\"unknown_service\\"}"}	\N	\N	2026-03-11 10:23:11.578+05:30	2026-03-11 10:23:11.603+05:30	2026-03-11 10:23:11.603+05:30	f
2c88d13b5b3f35acb8c26a87c5d31477	22222222-2222-4222-8222-222222222222	2026-03-11 10:23:16.253+05:30	run_chain	\N	\N	default	f	f	{}	{"args": ["Python"], "kwargs": {}}	Why do Python programmers prefer dark mode?\n\nBecause light attracts bugs! 🐍💡	{"scope": "{\\"name\\":\\"langfuse-sdk\\",\\"version\\":\\"3.7.0\\",\\"attributes\\":{\\"public_key\\":\\"pk-lf-e038c771-f113-46ed-9e10-d4628cf20f16\\"}}", "resourceAttributes": "{\\"telemetry.sdk.language\\":\\"python\\",\\"telemetry.sdk.name\\":\\"opentelemetry\\",\\"telemetry.sdk.version\\":\\"1.39.1\\",\\"service.name\\":\\"unknown_service\\"}"}	\N	\N	2026-03-11 10:23:16.589+05:30	2026-03-11 10:23:19.092+05:30	2026-03-11 10:23:19.092+05:30	f
2ca2946cf8416dcfe3839c0403848262	22222222-2222-4222-8222-222222222222	2026-03-11 10:23:15.242+05:30	run_chain	\N	\N	default	f	f	{}	{"args": ["Python"], "kwargs": {}}	Why do Python programmers prefer dark mode?\n\nBecause light attracts bugs!	{"scope": "{\\"name\\":\\"langfuse-sdk\\",\\"version\\":\\"3.7.0\\",\\"attributes\\":{\\"public_key\\":\\"pk-lf-e038c771-f113-46ed-9e10-d4628cf20f16\\"}}", "resourceAttributes": "{\\"telemetry.sdk.language\\":\\"python\\",\\"telemetry.sdk.name\\":\\"opentelemetry\\",\\"telemetry.sdk.version\\":\\"1.39.1\\",\\"service.name\\":\\"unknown_service\\"}"}	\N	\N	2026-03-11 10:23:16.589+05:30	2026-03-11 10:23:16.61+05:30	2026-03-11 10:23:16.61+05:30	f
45ac0cd76c3a950051336b171ced4ef3	22222222-2222-4222-8222-222222222222	2026-03-11 10:23:13.723+05:30	run_chain	\N	\N	default	f	f	{}	{"args": ["Python"], "kwargs": {}}	Why do Python programmers prefer dark mode?\n\nBecause light attracts bugs! 🐍💻	{"scope": "{\\"name\\":\\"langfuse-sdk\\",\\"version\\":\\"3.7.0\\",\\"attributes\\":{\\"public_key\\":\\"pk-lf-e038c771-f113-46ed-9e10-d4628cf20f16\\"}}", "resourceAttributes": "{\\"telemetry.sdk.language\\":\\"python\\",\\"telemetry.sdk.name\\":\\"opentelemetry\\",\\"telemetry.sdk.version\\":\\"1.39.1\\",\\"service.name\\":\\"unknown_service\\"}"}	\N	\N	2026-03-11 10:23:16.588+05:30	2026-03-11 10:23:16.609+05:30	2026-03-11 10:23:16.609+05:30	f
969103b644f4e8759c921ded049b00f8	22222222-2222-4222-8222-222222222222	2026-03-11 10:23:17.122+05:30	run_chain	\N	\N	default	f	f	{}	{"args": ["Python"], "kwargs": {}}	\N	{"scope": "{\\"name\\":\\"langfuse-sdk\\",\\"version\\":\\"3.7.0\\",\\"attributes\\":{\\"public_key\\":\\"pk-lf-e038c771-f113-46ed-9e10-d4628cf20f16\\"}}", "resourceAttributes": "{\\"telemetry.sdk.language\\":\\"python\\",\\"telemetry.sdk.name\\":\\"opentelemetry\\",\\"telemetry.sdk.version\\":\\"1.39.1\\",\\"service.name\\":\\"unknown_service\\"}"}	\N	\N	2026-03-11 10:23:19.083+05:30	2026-03-11 10:23:19.094+05:30	2026-03-11 10:23:19.094+05:30	f
a69063b300223a8f76d58da86ac1fb2a	22222222-2222-4222-8222-222222222222	2026-03-11 10:23:12.013+05:30	run_chain	\N	\N	default	f	f	{}	{"args": ["Python"], "kwargs": {}}	Why do Python programmers prefer dark mode?\n\nBecause light attracts bugs!	{"scope": "{\\"name\\":\\"langfuse-sdk\\",\\"version\\":\\"3.7.0\\",\\"attributes\\":{\\"public_key\\":\\"pk-lf-e038c771-f113-46ed-9e10-d4628cf20f16\\"}}", "resourceAttributes": "{\\"telemetry.sdk.language\\":\\"python\\",\\"telemetry.sdk.name\\":\\"opentelemetry\\",\\"telemetry.sdk.version\\":\\"1.39.1\\",\\"service.name\\":\\"unknown_service\\"}"}	\N	\N	2026-03-11 10:23:16.589+05:30	2026-03-11 10:23:16.608+05:30	2026-03-11 10:23:16.608+05:30	f
c77d774a377d6fc36101f1ea4d7e8b0d	22222222-2222-4222-8222-222222222222	2026-03-11 10:23:09.057+05:30	run_chain	\N	\N	default	f	f	{}	{"args": ["Python"], "kwargs": {}}	Why do Python programmers prefer dark mode?\n\nBecause light attracts bugs! 🐍💡	{"scope": "{\\"name\\":\\"langfuse-sdk\\",\\"version\\":\\"3.7.0\\",\\"attributes\\":{\\"public_key\\":\\"pk-lf-e038c771-f113-46ed-9e10-d4628cf20f16\\"}}", "resourceAttributes": "{\\"telemetry.sdk.language\\":\\"python\\",\\"telemetry.sdk.name\\":\\"opentelemetry\\",\\"telemetry.sdk.version\\":\\"1.39.1\\",\\"service.name\\":\\"unknown_service\\"}"}	\N	\N	2026-03-11 10:23:11.578+05:30	2026-03-11 10:23:11.639+05:30	2026-03-11 10:23:11.639+05:30	f
e95dba671dddd95f196ae8488b51d307	22222222-2222-4222-8222-222222222222	2026-03-11 10:23:10.546+05:30	run_chain	\N	\N	default	f	f	{}	{"args": ["Python"], "kwargs": {}}	Why do Python programmers prefer dark mode?\n\nBecause light attracts bugs! 🐛😄	{"scope": "{\\"name\\":\\"langfuse-sdk\\",\\"version\\":\\"3.7.0\\",\\"attributes\\":{\\"public_key\\":\\"pk-lf-e038c771-f113-46ed-9e10-d4628cf20f16\\"}}", "resourceAttributes": "{\\"telemetry.sdk.language\\":\\"python\\",\\"telemetry.sdk.name\\":\\"opentelemetry\\",\\"telemetry.sdk.version\\":\\"1.39.1\\",\\"service.name\\":\\"unknown_service\\"}"}	\N	\N	2026-03-11 10:23:11.579+05:30	2026-03-11 10:23:16.6+05:30	2026-03-11 10:23:16.6+05:30	f
ff3a09f8f26320e6bf84254fba4b2552	22222222-2222-4222-8222-222222222222	2026-03-11 10:23:07.92+05:30	run_chain	\N	\N	default	f	f	{}	{"args": ["Python"], "kwargs": {}}	Why do Python programmers prefer dark mode?\n\nBecause light attracts bugs!	{"scope": "{\\"name\\":\\"langfuse-sdk\\",\\"version\\":\\"3.7.0\\",\\"attributes\\":{\\"public_key\\":\\"pk-lf-e038c771-f113-46ed-9e10-d4628cf20f16\\"}}", "resourceAttributes": "{\\"telemetry.sdk.language\\":\\"python\\",\\"telemetry.sdk.name\\":\\"opentelemetry\\",\\"telemetry.sdk.version\\":\\"1.39.1\\",\\"service.name\\":\\"unknown_service\\"}"}	\N	\N	2026-03-11 10:23:11.579+05:30	2026-03-11 10:23:11.64+05:30	2026-03-11 10:23:11.64+05:30	f
\.


--
-- Data for Name: traces_default; Type: TABLE DATA; Schema: public; Owner: ybvoyager
--

COPY public.traces_default (id, project_id, "timestamp", name, user_id, session_id, environment, public, bookmarked, tags, input, output, metadata, release, version, created_at, updated_at, event_ts, is_deleted) FROM stdin;
\.


--
-- Data for Name: ybvoyager_import_data_batches_metainfo_v3; Type: TABLE DATA; Schema: ybvoyager_metadata; Owner: ybvoyager
--

COPY ybvoyager_metadata.ybvoyager_import_data_batches_metainfo_v3 (migration_uuid, data_file_name, batch_number, schema_name, table_name, rows_imported) FROM stdin;
68048a8a-68ca-4c01-a02c-177d57b338a9	/Users/kushidhar/code/langfuse-export-dir-4/data/observations_2026_03_data.sql	0	public	observations	45
68048a8a-68ca-4c01-a02c-177d57b338a9	/Users/kushidhar/code/langfuse-export-dir-4/data/traces_2026_03_data.sql	0	public	traces	10
\.


--
-- Data for Name: ybvoyager_import_data_event_channels_metainfo; Type: TABLE DATA; Schema: ybvoyager_metadata; Owner: ybvoyager
--

COPY ybvoyager_metadata.ybvoyager_import_data_event_channels_metainfo (migration_uuid, channel_no, last_applied_vsn, num_inserts, num_deletes, num_updates) FROM stdin;
\.


--
-- Data for Name: ybvoyager_imported_event_count_by_table; Type: TABLE DATA; Schema: ybvoyager_metadata; Owner: ybvoyager
--

COPY ybvoyager_metadata.ybvoyager_imported_event_count_by_table (migration_uuid, table_name, channel_no, total_events, num_inserts, num_deletes, num_updates) FROM stdin;
\.


--
-- Name: observations_2026_03_pkey; Type: INDEX ATTACH; Schema: public; Owner: ybvoyager
--

ALTER INDEX public.observations_pkey ATTACH PARTITION public.observations_2026_03_pkey;


--
-- Name: observations_default_pkey; Type: INDEX ATTACH; Schema: public; Owner: ybvoyager
--

ALTER INDEX public.observations_pkey ATTACH PARTITION public.observations_default_pkey;


--
-- Name: scores_2026_03_pkey; Type: INDEX ATTACH; Schema: public; Owner: ybvoyager
--

ALTER INDEX public.scores_pkey ATTACH PARTITION public.scores_2026_03_pkey;


--
-- Name: scores_default_pkey; Type: INDEX ATTACH; Schema: public; Owner: ybvoyager
--

ALTER INDEX public.scores_pkey ATTACH PARTITION public.scores_default_pkey;


--
-- Name: traces_2026_03_pkey; Type: INDEX ATTACH; Schema: public; Owner: ybvoyager
--

ALTER INDEX public.traces_pkey ATTACH PARTITION public.traces_2026_03_pkey;


--
-- Name: traces_default_pkey; Type: INDEX ATTACH; Schema: public; Owner: ybvoyager
--

ALTER INDEX public.traces_pkey ATTACH PARTITION public.traces_default_pkey;


--
-- YSQL database dump complete
--

