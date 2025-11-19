--
-- PostgreSQL database dump
--

-- Dumped from database version 16.9
-- Dumped by pg_dump version 16.9

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
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: public; Owner: xnat
--

CREATE SEQUENCE public.hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.hibernate_sequence OWNER TO xnat;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: xhbm_alias_token; Type: TABLE; Schema: public; Owner: xnat
--

CREATE TABLE public.xhbm_alias_token (
    id bigint NOT NULL,
    created timestamp without time zone NOT NULL,
    disabled timestamp without time zone NOT NULL,
    enabled boolean DEFAULT true,
    "timestamp" timestamp without time zone NOT NULL,
    alias character varying(255) NOT NULL,
    estimated_expiration_time timestamp without time zone,
    secret character varying(255) NOT NULL,
    single_use boolean NOT NULL,
    xdat_user_id character varying(255) NOT NULL
);


ALTER TABLE public.xhbm_alias_token OWNER TO xnat;

--
-- Name: xhbm_alias_token_id_seq; Type: SEQUENCE; Schema: public; Owner: xnat
--

CREATE SEQUENCE public.xhbm_alias_token_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.xhbm_alias_token_id_seq OWNER TO xnat;

--
-- Name: xhbm_alias_token_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xnat
--

ALTER SEQUENCE public.xhbm_alias_token_id_seq OWNED BY public.xhbm_alias_token.id;


--
-- Name: xhbm_alias_token_validipaddresses; Type: TABLE; Schema: public; Owner: xnat
--

CREATE TABLE public.xhbm_alias_token_validipaddresses (
    alias_token bigint NOT NULL,
    validipaddresses character varying(255)
);


ALTER TABLE public.xhbm_alias_token_validipaddresses OWNER TO xnat;

--
-- Name: xhbm_archive_processor_instance; Type: TABLE; Schema: public; Owner: xnat
--

CREATE TABLE public.xhbm_archive_processor_instance (
    id bigint NOT NULL,
    created timestamp without time zone NOT NULL,
    disabled timestamp without time zone NOT NULL,
    enabled boolean DEFAULT true,
    "timestamp" timestamp without time zone NOT NULL,
    label character varying(255),
    location character varying(255),
    priority integer NOT NULL,
    processor_class character varying(255),
    scope character varying(255)
);


ALTER TABLE public.xhbm_archive_processor_instance OWNER TO xnat;

--
-- Name: xhbm_archive_processor_instance_aud; Type: TABLE; Schema: public; Owner: xnat
--

CREATE TABLE public.xhbm_archive_processor_instance_aud (
    id bigint NOT NULL,
    rev integer NOT NULL,
    revtype smallint,
    label character varying(255),
    location character varying(255),
    priority integer,
    processor_class character varying(255),
    scope character varying(255)
);


ALTER TABLE public.xhbm_archive_processor_instance_aud OWNER TO xnat;

--
-- Name: xhbm_archive_processor_instance_aud_id_seq; Type: SEQUENCE; Schema: public; Owner: xnat
--

CREATE SEQUENCE public.xhbm_archive_processor_instance_aud_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.xhbm_archive_processor_instance_aud_id_seq OWNER TO xnat;

--
-- Name: xhbm_archive_processor_instance_aud_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xnat
--

ALTER SEQUENCE public.xhbm_archive_processor_instance_aud_id_seq OWNED BY public.xhbm_archive_processor_instance_aud.id;


--
-- Name: xhbm_archive_processor_instance_id_seq; Type: SEQUENCE; Schema: public; Owner: xnat
--

CREATE SEQUENCE public.xhbm_archive_processor_instance_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.xhbm_archive_processor_instance_id_seq OWNER TO xnat;

--
-- Name: xhbm_archive_processor_instance_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xnat
--

ALTER SEQUENCE public.xhbm_archive_processor_instance_id_seq OWNED BY public.xhbm_archive_processor_instance.id;


--
-- Name: xhbm_archive_processor_instance_parameters; Type: TABLE; Schema: public; Owner: xnat
--

CREATE TABLE public.xhbm_archive_processor_instance_parameters (
    archive_processor_instance bigint NOT NULL,
    value character varying(255),
    parameter_name character varying(255) NOT NULL
);


ALTER TABLE public.xhbm_archive_processor_instance_parameters OWNER TO xnat;

--
-- Name: xhbm_archive_processor_instance_parameters_aud; Type: TABLE; Schema: public; Owner: xnat
--

CREATE TABLE public.xhbm_archive_processor_instance_parameters_aud (
    rev integer NOT NULL,
    archive_processor_instance bigint NOT NULL,
    value character varying(255) NOT NULL,
    parameter_name character varying(255) NOT NULL,
    revtype smallint
);


ALTER TABLE public.xhbm_archive_processor_instance_parameters_aud OWNER TO xnat;

--
-- Name: xhbm_archive_processor_instance_project_ids_list; Type: TABLE; Schema: public; Owner: xnat
--

CREATE TABLE public.xhbm_archive_processor_instance_project_ids_list (
    archive_processor_instance bigint NOT NULL,
    project_ids_list character varying(255)
);


ALTER TABLE public.xhbm_archive_processor_instance_project_ids_list OWNER TO xnat;

--
-- Name: xhbm_archive_processor_instance_project_ids_list_aud; Type: TABLE; Schema: public; Owner: xnat
--

CREATE TABLE public.xhbm_archive_processor_instance_project_ids_list_aud (
    rev integer NOT NULL,
    archive_processor_instance bigint NOT NULL,
    project_ids_list character varying(255) NOT NULL,
    revtype smallint
);


ALTER TABLE public.xhbm_archive_processor_instance_project_ids_list_aud OWNER TO xnat;

--
-- Name: xhbm_archive_processor_instance_scp_blacklist; Type: TABLE; Schema: public; Owner: xnat
--

CREATE TABLE public.xhbm_archive_processor_instance_scp_blacklist (
    archive_processor_instance bigint NOT NULL,
    scp_blacklist character varying(255)
);


ALTER TABLE public.xhbm_archive_processor_instance_scp_blacklist OWNER TO xnat;

--
-- Name: xhbm_archive_processor_instance_scp_blacklist_aud; Type: TABLE; Schema: public; Owner: xnat
--

CREATE TABLE public.xhbm_archive_processor_instance_scp_blacklist_aud (
    rev integer NOT NULL,
    archive_processor_instance bigint NOT NULL,
    scp_blacklist character varying(255) NOT NULL,
    revtype smallint
);


ALTER TABLE public.xhbm_archive_processor_instance_scp_blacklist_aud OWNER TO xnat;

--
-- Name: xhbm_archive_processor_instance_scp_whitelist; Type: TABLE; Schema: public; Owner: xnat
--

CREATE TABLE public.xhbm_archive_processor_instance_scp_whitelist (
    archive_processor_instance bigint NOT NULL,
    scp_whitelist character varying(255)
);


ALTER TABLE public.xhbm_archive_processor_instance_scp_whitelist OWNER TO xnat;

--
-- Name: xhbm_archive_processor_instance_scp_whitelist_aud; Type: TABLE; Schema: public; Owner: xnat
--

CREATE TABLE public.xhbm_archive_processor_instance_scp_whitelist_aud (
    rev integer NOT NULL,
    archive_processor_instance bigint NOT NULL,
    scp_whitelist character varying(255) NOT NULL,
    revtype smallint
);


ALTER TABLE public.xhbm_archive_processor_instance_scp_whitelist_aud OWNER TO xnat;

--
-- Name: xhbm_automation_event_ids; Type: TABLE; Schema: public; Owner: xnat
--

CREATE TABLE public.xhbm_automation_event_ids (
    id bigint NOT NULL,
    created timestamp without time zone NOT NULL,
    disabled timestamp without time zone NOT NULL,
    enabled boolean DEFAULT true,
    "timestamp" timestamp without time zone NOT NULL,
    external_id character varying(255),
    src_event_class character varying(255)
);


ALTER TABLE public.xhbm_automation_event_ids OWNER TO xnat;

--
-- Name: xhbm_automation_event_ids_id_seq; Type: SEQUENCE; Schema: public; Owner: xnat
--

CREATE SEQUENCE public.xhbm_automation_event_ids_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.xhbm_automation_event_ids_id_seq OWNER TO xnat;

--
-- Name: xhbm_automation_event_ids_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xnat
--

ALTER SEQUENCE public.xhbm_automation_event_ids_id_seq OWNED BY public.xhbm_automation_event_ids.id;


--
-- Name: xhbm_automation_event_ids_ids; Type: TABLE; Schema: public; Owner: xnat
--

CREATE TABLE public.xhbm_automation_event_ids_ids (
    id bigint NOT NULL,
    created timestamp without time zone NOT NULL,
    disabled timestamp without time zone NOT NULL,
    enabled boolean DEFAULT true,
    "timestamp" timestamp without time zone NOT NULL,
    counter bigint,
    event_id character varying(255),
    parent_automation_event_ids bigint
);


ALTER TABLE public.xhbm_automation_event_ids_ids OWNER TO xnat;

--
-- Name: xhbm_automation_event_ids_ids_id_seq; Type: SEQUENCE; Schema: public; Owner: xnat
--

CREATE SEQUENCE public.xhbm_automation_event_ids_ids_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.xhbm_automation_event_ids_ids_id_seq OWNER TO xnat;

--
-- Name: xhbm_automation_event_ids_ids_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xnat
--

ALTER SEQUENCE public.xhbm_automation_event_ids_ids_id_seq OWNED BY public.xhbm_automation_event_ids_ids.id;


--
-- Name: xhbm_automation_filters; Type: TABLE; Schema: public; Owner: xnat
--

CREATE TABLE public.xhbm_automation_filters (
    id bigint NOT NULL,
    created timestamp without time zone NOT NULL,
    disabled timestamp without time zone NOT NULL,
    enabled boolean DEFAULT true,
    "timestamp" timestamp without time zone NOT NULL,
    external_id character varying(255),
    field character varying(255),
    src_event_class character varying(255)
);


ALTER TABLE public.xhbm_automation_filters OWNER TO xnat;

--
-- Name: xhbm_automation_filters_id_seq; Type: SEQUENCE; Schema: public; Owner: xnat
--

CREATE SEQUENCE public.xhbm_automation_filters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.xhbm_automation_filters_id_seq OWNER TO xnat;

--
-- Name: xhbm_automation_filters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xnat
--

ALTER SEQUENCE public.xhbm_automation_filters_id_seq OWNED BY public.xhbm_automation_filters.id;


--
-- Name: xhbm_automation_filters_values; Type: TABLE; Schema: public; Owner: xnat
--

CREATE TABLE public.xhbm_automation_filters_values (
    automation_filters bigint NOT NULL,
    "values" character varying(255)
);


ALTER TABLE public.xhbm_automation_filters_values OWNER TO xnat;

--
-- Name: xhbm_category; Type: TABLE; Schema: public; Owner: xnat
--

CREATE TABLE public.xhbm_category (
    id bigint NOT NULL,
    created timestamp without time zone NOT NULL,
    disabled timestamp without time zone NOT NULL,
    enabled boolean DEFAULT true,
    "timestamp" timestamp without time zone NOT NULL,
    event character varying(255),
    scope integer
);


ALTER TABLE public.xhbm_category OWNER TO xnat;

--
-- Name: xhbm_category_id_seq; Type: SEQUENCE; Schema: public; Owner: xnat
--

CREATE SEQUENCE public.xhbm_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.xhbm_category_id_seq OWNER TO xnat;

--
-- Name: xhbm_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xnat
--

ALTER SEQUENCE public.xhbm_category_id_seq OWNED BY public.xhbm_category.id;


--
-- Name: xhbm_channel; Type: TABLE; Schema: public; Owner: xnat
--

CREATE TABLE public.xhbm_channel (
    id bigint NOT NULL,
    created timestamp without time zone NOT NULL,
    disabled timestamp without time zone NOT NULL,
    enabled boolean DEFAULT true,
    "timestamp" timestamp without time zone NOT NULL,
    format character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.xhbm_channel OWNER TO xnat;

--
-- Name: xhbm_channel_id_seq; Type: SEQUENCE; Schema: public; Owner: xnat
--

CREATE SEQUENCE public.xhbm_channel_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.xhbm_channel_id_seq OWNER TO xnat;

--
-- Name: xhbm_channel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xnat
--

ALTER SEQUENCE public.xhbm_channel_id_seq OWNED BY public.xhbm_channel.id;


--
-- Name: xhbm_compute_environment_config_entity; Type: TABLE; Schema: public; Owner: xnat
--

CREATE TABLE public.xhbm_compute_environment_config_entity (
    id bigint NOT NULL,
    created timestamp without time zone NOT NULL,
    disabled timestamp without time zone NOT NULL,
    enabled boolean DEFAULT true,
    "timestamp" timestamp without time zone NOT NULL
);


ALTER TABLE public.xhbm_compute_environment_config_entity OWNER TO xnat;

--
-- Name: xhbm_compute_environment_config_entity_config_types; Type: TABLE; Schema: public; Owner: xnat
--

CREATE TABLE public.xhbm_compute_environment_config_entity_config_types (
    compute_environment_config_entity bigint NOT NULL,
    config_types character varying(255)
);


ALTER TABLE public.xhbm_compute_environment_config_entity_config_types OWNER TO xnat;

--
-- Name: xhbm_compute_environment_config_entity_id_seq; Type: SEQUENCE; Schema: public; Owner: xnat
--

CREATE SEQUENCE public.xhbm_compute_environment_config_entity_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.xhbm_compute_environment_config_entity_id_seq OWNER TO xnat;

--
-- Name: xhbm_compute_environment_config_entity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xnat
--

ALTER SEQUENCE public.xhbm_compute_environment_config_entity_id_seq OWNED BY public.xhbm_compute_environment_config_entity.id;


--
-- Name: xhbm_compute_environment_entity; Type: TABLE; Schema: public; Owner: xnat
--

CREATE TABLE public.xhbm_compute_environment_entity (
    id bigint NOT NULL,
    created timestamp without time zone NOT NULL,
    disabled timestamp without time zone NOT NULL,
    enabled boolean DEFAULT true,
    "timestamp" timestamp without time zone NOT NULL,
    command character varying(255),
    image character varying(255),
    name character varying(255),
    compute_environment_config bigint
);


ALTER TABLE public.xhbm_compute_environment_entity OWNER TO xnat;

--
-- Name: xhbm_compute_environment_entity_environment_variables; Type: TABLE; Schema: public; Owner: xnat
--

CREATE TABLE public.xhbm_compute_environment_entity_environment_variables (
    compute_environment_entity bigint NOT NULL,
    key character varying(255),
    value character varying(255)
);


ALTER TABLE public.xhbm_compute_environment_entity_environment_variables OWNER TO xnat;

--
-- Name: xhbm_compute_environment_entity_id_seq; Type: SEQUENCE; Schema: public; Owner: xnat
--

CREATE SEQUENCE public.xhbm_compute_environment_entity_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.xhbm_compute_environment_entity_id_seq OWNER TO xnat;

--
-- Name: xhbm_compute_environment_entity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xnat
--

ALTER SEQUENCE public.xhbm_compute_environment_entity_id_seq OWNED BY public.xhbm_compute_environment_entity.id;


--
-- Name: xhbm_compute_environment_entity_mounts; Type: TABLE; Schema: public; Owner: xnat
--

CREATE TABLE public.xhbm_compute_environment_entity_mounts (
    compute_environment_entity bigint NOT NULL,
    container_path character varying(255),
    local_path character varying(255),
    read_only boolean NOT NULL,
    volume_name character varying(255)
);


ALTER TABLE public.xhbm_compute_environment_entity_mounts OWNER TO xnat;

--
-- Name: xhbm_compute_environment_hardware_options_entity; Type: TABLE; Schema: public; Owner: xnat
--

CREATE TABLE public.xhbm_compute_environment_hardware_options_entity (
    allow_all_hardware boolean NOT NULL,
    compute_environment_config bigint NOT NULL
);


ALTER TABLE public.xhbm_compute_environment_hardware_options_entity OWNER TO xnat;

--
-- Name: xhbm_compute_environment_hardware_options_hardware_config; Type: TABLE; Schema: public; Owner: xnat
--

CREATE TABLE public.xhbm_compute_environment_hardware_options_hardware_config (
    compute_environment_hardware_options_id bigint NOT NULL,
    hardware_config_id bigint NOT NULL
);


ALTER TABLE public.xhbm_compute_environment_hardware_options_hardware_config OWNER TO xnat;

--
-- Name: xhbm_compute_environment_scope_entity; Type: TABLE; Schema: public; Owner: xnat
--

CREATE TABLE public.xhbm_compute_environment_scope_entity (
    id bigint NOT NULL,
    enabled boolean NOT NULL,
    scope character varying(255),
    compute_environment_config bigint,
    scopes_key integer
);


ALTER TABLE public.xhbm_compute_environment_scope_entity OWNER TO xnat;

--
-- Name: xhbm_compute_environment_scope_entity_id_seq; Type: SEQUENCE; Schema: public; Owner: xnat
--

CREATE SEQUENCE public.xhbm_compute_environment_scope_entity_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.xhbm_compute_environment_scope_entity_id_seq OWNER TO xnat;

--
-- Name: xhbm_compute_environment_scope_entity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xnat
--

ALTER SEQUENCE public.xhbm_compute_environment_scope_entity_id_seq OWNED BY public.xhbm_compute_environment_scope_entity.id;


--
-- Name: xhbm_compute_environment_scope_entity_ids; Type: TABLE; Schema: public; Owner: xnat
--

CREATE TABLE public.xhbm_compute_environment_scope_entity_ids (
    compute_environment_scope_entity bigint NOT NULL,
    ids character varying(255)
);


ALTER TABLE public.xhbm_compute_environment_scope_entity_ids OWNER TO xnat;

--
-- Name: xhbm_conditional_initialization_task_status; Type: TABLE; Schema: public; Owner: xnat
--

CREATE TABLE public.xhbm_conditional_initialization_task_status (
    id bigint NOT NULL,
    created timestamp without time zone NOT NULL,
    disabled timestamp without time zone NOT NULL,
    enabled boolean DEFAULT true,
    "timestamp" timestamp without time zone NOT NULL,
    status character varying(255),
    task_name character varying(255)
);


ALTER TABLE public.xhbm_conditional_initialization_task_status OWNER TO xnat;

--
-- Name: xhbm_conditional_initialization_task_status_id_seq; Type: SEQUENCE; Schema: public; Owner: xnat
--

CREATE SEQUENCE public.xhbm_conditional_initialization_task_status_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.xhbm_conditional_initialization_task_status_id_seq OWNER TO xnat;

--
-- Name: xhbm_conditional_initialization_task_status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xnat
--

ALTER SEQUENCE public.xhbm_conditional_initialization_task_status_id_seq OWNED BY public.xhbm_conditional_initialization_task_status.id;


--
-- Name: xhbm_configuration; Type: TABLE; Schema: public; Owner: xnat
--

CREATE TABLE public.xhbm_configuration (
    id bigint NOT NULL,
    created timestamp without time zone NOT NULL,
    disabled timestamp without time zone NOT NULL,
    enabled boolean DEFAULT true,
    "timestamp" timestamp without time zone NOT NULL,
    entity_id character varying(255),
    path character varying(255),
    project bigint,
    reason character varying(255),
    scope integer,
    status character varying(255),
    tool character varying(255),
    unversioned boolean DEFAULT false,
    version integer NOT NULL,
    xnat_user character varying(255),
    config_data bigint
);


ALTER TABLE public.xhbm_configuration OWNER TO xnat;

--
-- Name: xhbm_configuration_data; Type: TABLE; Schema: public; Owner: xnat
--

CREATE TABLE public.xhbm_configuration_data (
    id bigint NOT NULL,
    created timestamp without time zone NOT NULL,
    disabled timestamp without time zone NOT NULL,
    enabled boolean DEFAULT true,
    "timestamp" timestamp without time zone NOT NULL,
    contents text
);


ALTER TABLE public.xhbm_configuration_data OWNER TO xnat;

--
-- Name: xhbm_configuration_data_configurations; Type: TABLE; Schema: public; Owner: xnat
--

CREATE TABLE public.xhbm_configuration_data_configurations (
    configuration_data bigint NOT NULL,
    configurations bigint NOT NULL
);


ALTER TABLE public.xhbm_configuration_data_configurations OWNER TO xnat;

--
-- Name: xhbm_configuration_data_id_seq; Type: SEQUENCE; Schema: public; Owner: xnat
--

CREATE SEQUENCE public.xhbm_configuration_data_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.xhbm_configuration_data_id_seq OWNER TO xnat;

--
-- Name: xhbm_configuration_data_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xnat
--

ALTER SEQUENCE public.xhbm_configuration_data_id_seq OWNED BY public.xhbm_configuration_data.id;


--
-- Name: xhbm_configuration_id_seq; Type: SEQUENCE; Schema: public; Owner: xnat
--

CREATE SEQUENCE public.xhbm_configuration_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.xhbm_configuration_id_seq OWNER TO xnat;

--
-- Name: xhbm_configuration_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xnat
--

ALTER SEQUENCE public.xhbm_configuration_id_seq OWNED BY public.xhbm_configuration.id;


--
-- Name: xhbm_constraint_config_entity; Type: TABLE; Schema: public; Owner: xnat
--

CREATE TABLE public.xhbm_constraint_config_entity (
    id bigint NOT NULL,
    created timestamp without time zone NOT NULL,
    disabled timestamp without time zone NOT NULL,
    enabled boolean DEFAULT true,
    "timestamp" timestamp without time zone NOT NULL
);


ALTER TABLE public.xhbm_constraint_config_entity OWNER TO xnat;

--
-- Name: xhbm_constraint_config_entity_id_seq; Type: SEQUENCE; Schema: public; Owner: xnat
--

CREATE SEQUENCE public.xhbm_constraint_config_entity_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.xhbm_constraint_config_entity_id_seq OWNER TO xnat;

--
-- Name: xhbm_constraint_config_entity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xnat
--

ALTER SEQUENCE public.xhbm_constraint_config_entity_id_seq OWNED BY public.xhbm_constraint_config_entity.id;


--
-- Name: xhbm_constraint_entity; Type: TABLE; Schema: public; Owner: xnat
--

CREATE TABLE public.xhbm_constraint_entity (
    created timestamp without time zone NOT NULL,
    disabled timestamp without time zone NOT NULL,
    enabled boolean DEFAULT true,
    "timestamp" timestamp without time zone NOT NULL,
    key character varying(255),
    operator character varying(255),
    constraint_config bigint NOT NULL
);


ALTER TABLE public.xhbm_constraint_entity OWNER TO xnat;

--
-- Name: xhbm_constraint_entity_constraint_values; Type: TABLE; Schema: public; Owner: xnat
--

CREATE TABLE public.xhbm_constraint_entity_constraint_values (
    constraint_entity_constraint_config bigint NOT NULL,
    constraint_values character varying(255)
);


ALTER TABLE public.xhbm_constraint_entity_constraint_values OWNER TO xnat;

--
-- Name: xhbm_constraint_scope_entity; Type: TABLE; Schema: public; Owner: xnat
--

CREATE TABLE public.xhbm_constraint_scope_entity (
    id bigint NOT NULL,
    enabled boolean NOT NULL,
    scope character varying(255),
    constraint_config bigint,
    scopes_key integer
);


ALTER TABLE public.xhbm_constraint_scope_entity OWNER TO xnat;

--
-- Name: xhbm_constraint_scope_entity_id_seq; Type: SEQUENCE; Schema: public; Owner: xnat
--

CREATE SEQUENCE public.xhbm_constraint_scope_entity_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.xhbm_constraint_scope_entity_id_seq OWNER TO xnat;

--
-- Name: xhbm_constraint_scope_entity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xnat
--

ALTER SEQUENCE public.xhbm_constraint_scope_entity_id_seq OWNED BY public.xhbm_constraint_scope_entity.id;


--
-- Name: xhbm_constraint_scope_entity_ids; Type: TABLE; Schema: public; Owner: xnat
--

CREATE TABLE public.xhbm_constraint_scope_entity_ids (
    constraint_scope_entity bigint NOT NULL,
    ids character varying(255)
);


ALTER TABLE public.xhbm_constraint_scope_entity_ids OWNER TO xnat;

--
-- Name: xhbm_custom_variable_applies_to; Type: TABLE; Schema: public; Owner: xnat
--

CREATE TABLE public.xhbm_custom_variable_applies_to (
    id bigint NOT NULL,
    created timestamp without time zone NOT NULL,
    disabled timestamp without time zone NOT NULL,
    enabled boolean DEFAULT true,
    "timestamp" timestamp without time zone NOT NULL,
    data_type character varying(255) NOT NULL,
    entity_id character varying(255),
    protocol character varying(255),
    scan_type character varying(255),
    scope integer NOT NULL,
    sub_type character varying(255),
    visit character varying(255)
);


ALTER TABLE public.xhbm_custom_variable_applies_to OWNER TO xnat;

--
-- Name: xhbm_custom_variable_applies_to_id_seq; Type: SEQUENCE; Schema: public; Owner: xnat
--

CREATE SEQUENCE public.xhbm_custom_variable_applies_to_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.xhbm_custom_variable_applies_to_id_seq OWNER TO xnat;

--
-- Name: xhbm_custom_variable_applies_to_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xnat
--

ALTER SEQUENCE public.xhbm_custom_variable_applies_to_id_seq OWNED BY public.xhbm_custom_variable_applies_to.id;


--
-- Name: xhbm_custom_variable_form; Type: TABLE; Schema: public; Owner: xnat
--

CREATE TABLE public.xhbm_custom_variable_form (
    id bigint NOT NULL,
    created timestamp without time zone NOT NULL,
    disabled timestamp without time zone NOT NULL,
    enabled boolean DEFAULT true,
    "timestamp" timestamp without time zone NOT NULL,
    form_creator character varying(255),
    formiojson_definition jsonb,
    form_uuid uuid,
    z_index integer NOT NULL
);


ALTER TABLE public.xhbm_custom_variable_form OWNER TO xnat;

--
-- Name: xhbm_custom_variable_form_applies_to; Type: TABLE; Schema: public; Owner: xnat
--

CREATE TABLE public.xhbm_custom_variable_form_applies_to (
    id bigint NOT NULL,
    created timestamp without time zone NOT NULL,
    disabled timestamp without time zone NOT NULL,
    enabled boolean DEFAULT true,
    status character varying(255),
    "timestamp" timestamp without time zone NOT NULL,
    xnat_user character varying(255),
    custom_variable_form bigint NOT NULL,
    custom_variable_applies_to bigint NOT NULL
);


ALTER TABLE public.xhbm_custom_variable_form_applies_to OWNER TO xnat;

--
-- Name: xhbm_custom_variable_form_applies_to_id_seq; Type: SEQUENCE; Schema: public; Owner: xnat
--

CREATE SEQUENCE public.xhbm_custom_variable_form_applies_to_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.xhbm_custom_variable_form_applies_to_id_seq OWNER TO xnat;

--
-- Name: xhbm_custom_variable_form_applies_to_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xnat
--

ALTER SEQUENCE public.xhbm_custom_variable_form_applies_to_id_seq OWNED BY public.xhbm_custom_variable_form_applies_to.id;


--
-- Name: xhbm_custom_variable_form_id_seq; Type: SEQUENCE; Schema: public; Owner: xnat
--

CREATE SEQUENCE public.xhbm_custom_variable_form_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.xhbm_custom_variable_form_id_seq OWNER TO xnat;

--
-- Name: xhbm_custom_variable_form_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xnat
--

ALTER SEQUENCE public.xhbm_custom_variable_form_id_seq OWNED BY public.xhbm_custom_variable_form.id;


--
-- Name: xhbm_data_cache_item; Type: TABLE; Schema: public; Owner: xnat
--

CREATE TABLE public.xhbm_data_cache_item (
    id bigint NOT NULL,
    created timestamp without time zone NOT NULL,
    disabled timestamp without time zone NOT NULL,
    enabled boolean DEFAULT true,
    "timestamp" timestamp without time zone NOT NULL,
    key character varying(255),
    type character varying(255),
    value text
);


ALTER TABLE public.xhbm_data_cache_item OWNER TO xnat;

--
-- Name: xhbm_data_cache_item_id_seq; Type: SEQUENCE; Schema: public; Owner: xnat
--

CREATE SEQUENCE public.xhbm_data_cache_item_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.xhbm_data_cache_item_id_seq OWNER TO xnat;

--
-- Name: xhbm_data_cache_item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xnat
--

ALTER SEQUENCE public.xhbm_data_cache_item_id_seq OWNED BY public.xhbm_data_cache_item.id;


--
-- Name: xhbm_definition; Type: TABLE; Schema: public; Owner: xnat
--

CREATE TABLE public.xhbm_definition (
    id bigint NOT NULL,
    created timestamp without time zone NOT NULL,
    disabled timestamp without time zone NOT NULL,
    enabled boolean DEFAULT true,
    "timestamp" timestamp without time zone NOT NULL,
    entity bigint NOT NULL,
    category bigint
);


ALTER TABLE public.xhbm_definition OWNER TO xnat;

--
-- Name: xhbm_definition_id_seq; Type: SEQUENCE; Schema: public; Owner: xnat
--

CREATE SEQUENCE public.xhbm_definition_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.xhbm_definition_id_seq OWNER TO xnat;

--
-- Name: xhbm_definition_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xnat
--

ALTER SEQUENCE public.xhbm_definition_id_seq OWNED BY public.xhbm_definition.id;


--
-- Name: xhbm_dicom_inbox_import_request; Type: TABLE; Schema: public; Owner: xnat
--

CREATE TABLE public.xhbm_dicom_inbox_import_request (
    id bigint NOT NULL,
    created timestamp without time zone NOT NULL,
    disabled timestamp without time zone NOT NULL,
    enabled boolean DEFAULT true,
    "timestamp" timestamp without time zone NOT NULL,
    cleanup_after_import boolean,
    resolution character varying(255),
    session_path character varying(255),
    status integer,
    username character varying(255)
);


ALTER TABLE public.xhbm_dicom_inbox_import_request OWNER TO xnat;

--
-- Name: xhbm_dicom_inbox_import_request_id_seq; Type: SEQUENCE; Schema: public; Owner: xnat
--

CREATE SEQUENCE public.xhbm_dicom_inbox_import_request_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.xhbm_dicom_inbox_import_request_id_seq OWNER TO xnat;

--
-- Name: xhbm_dicom_inbox_import_request_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xnat
--

ALTER SEQUENCE public.xhbm_dicom_inbox_import_request_id_seq OWNED BY public.xhbm_dicom_inbox_import_request.id;


--
-- Name: xhbm_dicom_inbox_import_request_parameters; Type: TABLE; Schema: public; Owner: xnat
--

CREATE TABLE public.xhbm_dicom_inbox_import_request_parameters (
    dicom_inbox_import_request bigint NOT NULL,
    parameters character varying(255),
    parameters_key character varying(255) NOT NULL
);


ALTER TABLE public.xhbm_dicom_inbox_import_request_parameters OWNER TO xnat;

--
-- Name: xhbm_dicom_mapping_entity; Type: TABLE; Schema: public; Owner: xnat
--

CREATE TABLE public.xhbm_dicom_mapping_entity (
    id bigint NOT NULL,
    created timestamp without time zone NOT NULL,
    disabled timestamp without time zone NOT NULL,
    enabled boolean DEFAULT true,
    "timestamp" timestamp without time zone NOT NULL,
    add_param_attribute boolean DEFAULT true,
    dicom_tag character varying(255),
    field_name character varying(255) NOT NULL,
    field_type character varying(255) NOT NULL,
    schema_element character varying(255) NOT NULL,
    scope character varying(255) NOT NULL,
    scope_object_id character varying(255)
);


ALTER TABLE public.xhbm_dicom_mapping_entity OWNER TO xnat;

--
-- Name: xhbm_dicom_mapping_entity_id_seq; Type: SEQUENCE; Schema: public; Owner: xnat
--

CREATE SEQUENCE public.xhbm_dicom_mapping_entity_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.xhbm_dicom_mapping_entity_id_seq OWNER TO xnat;

--
-- Name: xhbm_dicom_mapping_entity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xnat
--

ALTER SEQUENCE public.xhbm_dicom_mapping_entity_id_seq OWNED BY public.xhbm_dicom_mapping_entity.id;


--
-- Name: xhbm_dicomscpinstance; Type: TABLE; Schema: public; Owner: xnat
--

CREATE TABLE public.xhbm_dicomscpinstance (
    id bigint NOT NULL,
    created timestamp without time zone NOT NULL,
    disabled timestamp without time zone NOT NULL,
    enabled boolean DEFAULT true,
    "timestamp" timestamp without time zone NOT NULL,
    ae_title character varying(255),
    anonymization_enabled boolean NOT NULL,
    custom_processing boolean NOT NULL,
    direct_archive boolean NOT NULL,
    file_namer character varying(255),
    identifier character varying(255),
    port integer NOT NULL,
    project_routing_expression character varying(255),
    routing_expressions_enabled boolean NOT NULL,
    session_routing_expression character varying(255),
    subject_routing_expression character varying(255),
    whitelist_enabled boolean NOT NULL
);


ALTER TABLE public.xhbm_dicomscpinstance OWNER TO xnat;

--
-- Name: xhbm_dicomscpinstance_id_seq; Type: SEQUENCE; Schema: public; Owner: xnat
--

CREATE SEQUENCE public.xhbm_dicomscpinstance_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.xhbm_dicomscpinstance_id_seq OWNER TO xnat;

--
-- Name: xhbm_dicomscpinstance_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xnat
--

ALTER SEQUENCE public.xhbm_dicomscpinstance_id_seq OWNED BY public.xhbm_dicomscpinstance.id;


--
-- Name: xhbm_dicomscpinstance_whitelist; Type: TABLE; Schema: public; Owner: xnat
--

CREATE TABLE public.xhbm_dicomscpinstance_whitelist (
    scp_id bigint NOT NULL,
    whitelist character varying(255)
);


ALTER TABLE public.xhbm_dicomscpinstance_whitelist OWNER TO xnat;

--
-- Name: xhbm_direct_archive_session; Type: TABLE; Schema: public; Owner: xnat
--

CREATE TABLE public.xhbm_direct_archive_session (
    id bigint NOT NULL,
    created timestamp without time zone NOT NULL,
    disabled timestamp without time zone NOT NULL,
    enabled boolean DEFAULT true,
    "timestamp" timestamp without time zone NOT NULL,
    folder_name character varying(255),
    last_built_date timestamp without time zone,
    location character varying(255),
    message character varying(255),
    name character varying(255),
    prevent_anon boolean,
    project character varying(255),
    protocol character varying(255),
    scan_date timestamp without time zone,
    scan_time character varying(255),
    source character varying(255),
    status character varying(255),
    subject character varying(255),
    tag character varying(255),
    time_zone character varying(255),
    timestamp_uid character varying(255),
    upload_date timestamp without time zone,
    visit character varying(255)
);


ALTER TABLE public.xhbm_direct_archive_session OWNER TO xnat;

--
-- Name: xhbm_direct_archive_session_id_seq; Type: SEQUENCE; Schema: public; Owner: xnat
--

CREATE SEQUENCE public.xhbm_direct_archive_session_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.xhbm_direct_archive_session_id_seq OWNER TO xnat;

--
-- Name: xhbm_direct_archive_session_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xnat
--

ALTER SEQUENCE public.xhbm_direct_archive_session_id_seq OWNED BY public.xhbm_direct_archive_session.id;


--
-- Name: xhbm_event; Type: TABLE; Schema: public; Owner: xnat
--

CREATE TABLE public.xhbm_event (
    id bigint NOT NULL,
    created timestamp without time zone NOT NULL,
    disabled timestamp without time zone NOT NULL,
    enabled boolean DEFAULT true,
    "timestamp" timestamp without time zone NOT NULL,
    event_id character varying(255),
    event_label character varying(255)
);


ALTER TABLE public.xhbm_event OWNER TO xnat;

--
-- Name: xhbm_event_filters; Type: TABLE; Schema: public; Owner: xnat
--

CREATE TABLE public.xhbm_event_filters (
    id bigint NOT NULL,
    filter_var character varying(255),
    event_filters bigint
);


ALTER TABLE public.xhbm_event_filters OWNER TO xnat;

--
-- Name: xhbm_event_filters_filter_vals; Type: TABLE; Schema: public; Owner: xnat
--

CREATE TABLE public.xhbm_event_filters_filter_vals (
    event_filters bigint NOT NULL,
    filter_vals character varying(255)
);


ALTER TABLE public.xhbm_event_filters_filter_vals OWNER TO xnat;

--
-- Name: xhbm_event_filters_id_seq; Type: SEQUENCE; Schema: public; Owner: xnat
--

CREATE SEQUENCE public.xhbm_event_filters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.xhbm_event_filters_id_seq OWNER TO xnat;

--
-- Name: xhbm_event_filters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xnat
--

ALTER SEQUENCE public.xhbm_event_filters_id_seq OWNED BY public.xhbm_event_filters.id;


--
-- Name: xhbm_event_id_seq; Type: SEQUENCE; Schema: public; Owner: xnat
--

CREATE SEQUENCE public.xhbm_event_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.xhbm_event_id_seq OWNER TO xnat;

--
-- Name: xhbm_event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xnat
--

ALTER SEQUENCE public.xhbm_event_id_seq OWNED BY public.xhbm_event.id;


--
-- Name: xhbm_event_service_filter_entity; Type: TABLE; Schema: public; Owner: xnat
--

CREATE TABLE public.xhbm_event_service_filter_entity (
    id bigint NOT NULL,
    event_type character varying(255),
    json_path_filter character varying(255),
    name character varying(255),
    node_filter_string character varying(255),
    schedule character varying(255),
    schedule_description character varying(255),
    status character varying(255)
);


ALTER TABLE public.xhbm_event_service_filter_entity OWNER TO xnat;

--
-- Name: xhbm_event_service_filter_entity_id_seq; Type: SEQUENCE; Schema: public; Owner: xnat
--

CREATE SEQUENCE public.xhbm_event_service_filter_entity_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.xhbm_event_service_filter_entity_id_seq OWNER TO xnat;

--
-- Name: xhbm_event_service_filter_entity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xnat
--

ALTER SEQUENCE public.xhbm_event_service_filter_entity_id_seq OWNED BY public.xhbm_event_service_filter_entity.id;


--
-- Name: xhbm_event_service_filter_entity_project_ids; Type: TABLE; Schema: public; Owner: xnat
--

CREATE TABLE public.xhbm_event_service_filter_entity_project_ids (
    event_service_filter_entity bigint NOT NULL,
    project_ids character varying(255)
);


ALTER TABLE public.xhbm_event_service_filter_entity_project_ids OWNER TO xnat;

--
-- Name: xhbm_event_service_payload_entity; Type: TABLE; Schema: public; Owner: xnat
--

CREATE TABLE public.xhbm_event_service_payload_entity (
    id bigint NOT NULL,
    compressed boolean,
    payload oid
);


ALTER TABLE public.xhbm_event_service_payload_entity OWNER TO xnat;

--
-- Name: xhbm_event_service_payload_entity_id_seq; Type: SEQUENCE; Schema: public; Owner: xnat
--

CREATE SEQUENCE public.xhbm_event_service_payload_entity_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.xhbm_event_service_payload_entity_id_seq OWNER TO xnat;

--
-- Name: xhbm_event_service_payload_entity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xnat
--

ALTER SEQUENCE public.xhbm_event_service_payload_entity_id_seq OWNED BY public.xhbm_event_service_payload_entity.id;


--
-- Name: xhbm_event_specific_fields; Type: TABLE; Schema: public; Owner: xnat
--

CREATE TABLE public.xhbm_event_specific_fields (
    id bigint NOT NULL,
    field_name character varying(255),
    field_val character varying(255),
    event_specific_fields bigint
);


ALTER TABLE public.xhbm_event_specific_fields OWNER TO xnat;

--
-- Name: xhbm_event_specific_fields_id_seq; Type: SEQUENCE; Schema: public; Owner: xnat
--

CREATE SEQUENCE public.xhbm_event_specific_fields_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.xhbm_event_specific_fields_id_seq OWNER TO xnat;

--
-- Name: xhbm_event_specific_fields_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xnat
--

ALTER SEQUENCE public.xhbm_event_specific_fields_id_seq OWNED BY public.xhbm_event_specific_fields.id;


--
-- Name: xhbm_event_tracking_data; Type: TABLE; Schema: public; Owner: xnat
--

CREATE TABLE public.xhbm_event_tracking_data (
    id bigint NOT NULL,
    created timestamp without time zone NOT NULL,
    disabled timestamp without time zone NOT NULL,
    enabled boolean DEFAULT true,
    "timestamp" timestamp without time zone NOT NULL,
    final_message text,
    key text,
    payload text,
    succeeded boolean,
    user_id integer
);


ALTER TABLE public.xhbm_event_tracking_data OWNER TO xnat;

--
-- Name: xhbm_event_tracking_data_id_seq; Type: SEQUENCE; Schema: public; Owner: xnat
--

CREATE SEQUENCE public.xhbm_event_tracking_data_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.xhbm_event_tracking_data_id_seq OWNER TO xnat;

--
-- Name: xhbm_event_tracking_data_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xnat
--

ALTER SEQUENCE public.xhbm_event_tracking_data_id_seq OWNED BY public.xhbm_event_tracking_data.id;


--
-- Name: xhbm_feature_definition; Type: TABLE; Schema: public; Owner: xnat
--

CREATE TABLE public.xhbm_feature_definition (
    id bigint NOT NULL,
    created timestamp without time zone NOT NULL,
    disabled timestamp without time zone NOT NULL,
    enabled boolean DEFAULT true,
    "timestamp" timestamp without time zone NOT NULL,
    banned boolean,
    description character varying(255),
    key character varying(255),
    name character varying(255),
    on_by_default boolean
);


ALTER TABLE public.xhbm_feature_definition OWNER TO xnat;

--
-- Name: xhbm_feature_definition_id_seq; Type: SEQUENCE; Schema: public; Owner: xnat
--

CREATE SEQUENCE public.xhbm_feature_definition_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.xhbm_feature_definition_id_seq OWNER TO xnat;

--
-- Name: xhbm_feature_definition_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xnat
--

ALTER SEQUENCE public.xhbm_feature_definition_id_seq OWNED BY public.xhbm_feature_definition.id;


--
-- Name: xhbm_file_store_info; Type: TABLE; Schema: public; Owner: xnat
--

CREATE TABLE public.xhbm_file_store_info (
    id bigint NOT NULL,
    created timestamp without time zone NOT NULL,
    disabled timestamp without time zone NOT NULL,
    enabled boolean DEFAULT true,
    "timestamp" timestamp without time zone NOT NULL,
    checksum character varying(255),
    coordinates character varying(255),
    size bigint NOT NULL,
    store_uri bytea
);


ALTER TABLE public.xhbm_file_store_info OWNER TO xnat;

--
-- Name: xhbm_file_store_info_aud; Type: TABLE; Schema: public; Owner: xnat
--

CREATE TABLE public.xhbm_file_store_info_aud (
    id bigint NOT NULL,
    rev integer NOT NULL,
    revtype smallint,
    checksum character varying(255),
    coordinates character varying(255),
    size bigint,
    store_uri bytea
);


ALTER TABLE public.xhbm_file_store_info_aud OWNER TO xnat;

--
-- Name: xhbm_file_store_info_aud_id_seq; Type: SEQUENCE; Schema: public; Owner: xnat
--

CREATE SEQUENCE public.xhbm_file_store_info_aud_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.xhbm_file_store_info_aud_id_seq OWNER TO xnat;

--
-- Name: xhbm_file_store_info_aud_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xnat
--

ALTER SEQUENCE public.xhbm_file_store_info_aud_id_seq OWNED BY public.xhbm_file_store_info_aud.id;


--
-- Name: xhbm_file_store_info_id_seq; Type: SEQUENCE; Schema: public; Owner: xnat
--

CREATE SEQUENCE public.xhbm_file_store_info_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.xhbm_file_store_info_id_seq OWNER TO xnat;

--
-- Name: xhbm_file_store_info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xnat
--

ALTER SEQUENCE public.xhbm_file_store_info_id_seq OWNED BY public.xhbm_file_store_info.id;


--
-- Name: xhbm_group_feature; Type: TABLE; Schema: public; Owner: xnat
--

CREATE TABLE public.xhbm_group_feature (
    id bigint NOT NULL,
    created timestamp without time zone NOT NULL,
    disabled timestamp without time zone NOT NULL,
    enabled boolean DEFAULT true,
    "timestamp" timestamp without time zone NOT NULL,
    blocked boolean,
    feature character varying(255),
    group_id character varying(255),
    on_by_default boolean,
    tag character varying(255)
);


ALTER TABLE public.xhbm_group_feature OWNER TO xnat;

--
-- Name: xhbm_group_feature_id_seq; Type: SEQUENCE; Schema: public; Owner: xnat
--

CREATE SEQUENCE public.xhbm_group_feature_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.xhbm_group_feature_id_seq OWNER TO xnat;

--
-- Name: xhbm_group_feature_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xnat
--

ALTER SEQUENCE public.xhbm_group_feature_id_seq OWNED BY public.xhbm_group_feature.id;


--
-- Name: xhbm_hardware_config_entity; Type: TABLE; Schema: public; Owner: xnat
--

CREATE TABLE public.xhbm_hardware_config_entity (
    id bigint NOT NULL,
    created timestamp without time zone NOT NULL,
    disabled timestamp without time zone NOT NULL,
    enabled boolean DEFAULT true,
    "timestamp" timestamp without time zone NOT NULL
);


ALTER TABLE public.xhbm_hardware_config_entity OWNER TO xnat;

--
-- Name: xhbm_hardware_config_entity_id_seq; Type: SEQUENCE; Schema: public; Owner: xnat
--

CREATE SEQUENCE public.xhbm_hardware_config_entity_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.xhbm_hardware_config_entity_id_seq OWNER TO xnat;

--
-- Name: xhbm_hardware_config_entity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xnat
--

ALTER SEQUENCE public.xhbm_hardware_config_entity_id_seq OWNED BY public.xhbm_hardware_config_entity.id;


--
-- Name: xhbm_hardware_constraint_entity; Type: TABLE; Schema: public; Owner: xnat
--

CREATE TABLE public.xhbm_hardware_constraint_entity (
    id bigint NOT NULL,
    created timestamp without time zone NOT NULL,
    disabled timestamp without time zone NOT NULL,
    enabled boolean DEFAULT true,
    "timestamp" timestamp without time zone NOT NULL,
    key character varying(255),
    operator character varying(255),
    hardware_entity_id bigint
);


ALTER TABLE public.xhbm_hardware_constraint_entity OWNER TO xnat;

--
-- Name: xhbm_hardware_constraint_entity_constraint_values; Type: TABLE; Schema: public; Owner: xnat
--

CREATE TABLE public.xhbm_hardware_constraint_entity_constraint_values (
    hardware_constraint_entity bigint NOT NULL,
    constraint_values character varying(255)
);


ALTER TABLE public.xhbm_hardware_constraint_entity_constraint_values OWNER TO xnat;

--
-- Name: xhbm_hardware_constraint_entity_id_seq; Type: SEQUENCE; Schema: public; Owner: xnat
--

CREATE SEQUENCE public.xhbm_hardware_constraint_entity_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.xhbm_hardware_constraint_entity_id_seq OWNER TO xnat;

--
-- Name: xhbm_hardware_constraint_entity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xnat
--

ALTER SEQUENCE public.xhbm_hardware_constraint_entity_id_seq OWNED BY public.xhbm_hardware_constraint_entity.id;


--
-- Name: xhbm_hardware_entity; Type: TABLE; Schema: public; Owner: xnat
--

CREATE TABLE public.xhbm_hardware_entity (
    id bigint NOT NULL,
    created timestamp without time zone NOT NULL,
    disabled timestamp without time zone NOT NULL,
    enabled boolean DEFAULT true,
    "timestamp" timestamp without time zone NOT NULL,
    cpu_limit double precision,
    cpu_reservation double precision,
    memory_limit character varying(255),
    memory_reservation character varying(255),
    name character varying(255),
    hardware_config bigint
);


ALTER TABLE public.xhbm_hardware_entity OWNER TO xnat;

--
-- Name: xhbm_hardware_entity_environment_variables; Type: TABLE; Schema: public; Owner: xnat
--

CREATE TABLE public.xhbm_hardware_entity_environment_variables (
    hardware_entity bigint NOT NULL,
    key character varying(255),
    value character varying(255)
);


ALTER TABLE public.xhbm_hardware_entity_environment_variables OWNER TO xnat;

--
-- Name: xhbm_hardware_entity_generic_resources; Type: TABLE; Schema: public; Owner: xnat
--

CREATE TABLE public.xhbm_hardware_entity_generic_resources (
    hardware_entity bigint NOT NULL,
    name character varying(255),
    value character varying(255)
);


ALTER TABLE public.xhbm_hardware_entity_generic_resources OWNER TO xnat;

--
-- Name: xhbm_hardware_entity_id_seq; Type: SEQUENCE; Schema: public; Owner: xnat
--

CREATE SEQUENCE public.xhbm_hardware_entity_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.xhbm_hardware_entity_id_seq OWNER TO xnat;

--
-- Name: xhbm_hardware_entity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xnat
--

ALTER SEQUENCE public.xhbm_hardware_entity_id_seq OWNED BY public.xhbm_hardware_entity.id;


--
-- Name: xhbm_hardware_scope_entity; Type: TABLE; Schema: public; Owner: xnat
--

CREATE TABLE public.xhbm_hardware_scope_entity (
    id bigint NOT NULL,
    enabled boolean NOT NULL,
    scope character varying(255),
    hardware_config bigint,
    scopes_key integer
);


ALTER TABLE public.xhbm_hardware_scope_entity OWNER TO xnat;

--
-- Name: xhbm_hardware_scope_entity_id_seq; Type: SEQUENCE; Schema: public; Owner: xnat
--

CREATE SEQUENCE public.xhbm_hardware_scope_entity_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.xhbm_hardware_scope_entity_id_seq OWNER TO xnat;

--
-- Name: xhbm_hardware_scope_entity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xnat
--

ALTER SEQUENCE public.xhbm_hardware_scope_entity_id_seq OWNED BY public.xhbm_hardware_scope_entity.id;


--
-- Name: xhbm_hardware_scope_entity_ids; Type: TABLE; Schema: public; Owner: xnat
--

CREATE TABLE public.xhbm_hardware_scope_entity_ids (
    hardware_scope_entity bigint NOT NULL,
    ids character varying(255)
);


ALTER TABLE public.xhbm_hardware_scope_entity_ids OWNER TO xnat;

--
-- Name: xhbm_host_info; Type: TABLE; Schema: public; Owner: xnat
--

CREATE TABLE public.xhbm_host_info (
    id bigint NOT NULL,
    created timestamp without time zone NOT NULL,
    disabled timestamp without time zone NOT NULL,
    enabled boolean DEFAULT true,
    "timestamp" timestamp without time zone NOT NULL,
    host_name character varying(255)
);


ALTER TABLE public.xhbm_host_info OWNER TO xnat;

--
-- Name: xhbm_host_info_id_seq; Type: SEQUENCE; Schema: public; Owner: xnat
--

CREATE SEQUENCE public.xhbm_host_info_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.xhbm_host_info_id_seq OWNER TO xnat;

--
-- Name: xhbm_host_info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xnat
--

ALTER SEQUENCE public.xhbm_host_info_id_seq OWNED BY public.xhbm_host_info.id;


--
-- Name: xhbm_notification; Type: TABLE; Schema: public; Owner: xnat
--

CREATE TABLE public.xhbm_notification (
    id bigint NOT NULL,
    created timestamp without time zone NOT NULL,
    disabled timestamp without time zone NOT NULL,
    enabled boolean DEFAULT true,
    "timestamp" timestamp without time zone NOT NULL,
    parameter_format character varying(255),
    parameters text,
    definition bigint
);


ALTER TABLE public.xhbm_notification OWNER TO xnat;

--
-- Name: xhbm_notification_id_seq; Type: SEQUENCE; Schema: public; Owner: xnat
--

CREATE SEQUENCE public.xhbm_notification_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.xhbm_notification_id_seq OWNER TO xnat;

--
-- Name: xhbm_notification_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xnat
--

ALTER SEQUENCE public.xhbm_notification_id_seq OWNED BY public.xhbm_notification.id;


--
-- Name: xhbm_persistent_event; Type: TABLE; Schema: public; Owner: xnat
--

CREATE TABLE public.xhbm_persistent_event (
    id bigint NOT NULL,
    created timestamp without time zone NOT NULL,
    disabled timestamp without time zone NOT NULL,
    enabled boolean DEFAULT true,
    "timestamp" timestamp without time zone NOT NULL,
    entity_id character varying(255),
    entity_type character varying(255),
    event_id character varying(255),
    external_id character varying(255),
    src_event_class character varying(255),
    user_id integer
);


ALTER TABLE public.xhbm_persistent_event OWNER TO xnat;

--
-- Name: xhbm_persistent_event_id_seq; Type: SEQUENCE; Schema: public; Owner: xnat
--

CREATE SEQUENCE public.xhbm_persistent_event_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.xhbm_persistent_event_id_seq OWNER TO xnat;

--
-- Name: xhbm_persistent_event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xnat
--

ALTER SEQUENCE public.xhbm_persistent_event_id_seq OWNED BY public.xhbm_persistent_event.id;


--
-- Name: xhbm_preference; Type: TABLE; Schema: public; Owner: xnat
--

CREATE TABLE public.xhbm_preference (
    id bigint NOT NULL,
    created timestamp without time zone NOT NULL,
    disabled timestamp without time zone NOT NULL,
    enabled boolean DEFAULT true,
    "timestamp" timestamp without time zone NOT NULL,
    entity_id character varying(255),
    name character varying(255) NOT NULL,
    scope integer,
    value character varying(65535) NOT NULL,
    tool bigint
);


ALTER TABLE public.xhbm_preference OWNER TO xnat;

--
-- Name: xhbm_preference_id_seq; Type: SEQUENCE; Schema: public; Owner: xnat
--

CREATE SEQUENCE public.xhbm_preference_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.xhbm_preference_id_seq OWNER TO xnat;

--
-- Name: xhbm_preference_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xnat
--

ALTER SEQUENCE public.xhbm_preference_id_seq OWNED BY public.xhbm_preference.id;


--
-- Name: xhbm_resource_survey_request; Type: TABLE; Schema: public; Owner: xnat
--

CREATE TABLE public.xhbm_resource_survey_request (
    id bigint NOT NULL,
    created timestamp without time zone NOT NULL,
    disabled timestamp without time zone NOT NULL,
    enabled boolean DEFAULT true,
    "timestamp" timestamp without time zone NOT NULL,
    closing_date timestamp without time zone,
    experiment_id character varying(255) NOT NULL,
    experiment_label character varying(255),
    mitigation_report json,
    mitigation_requester character varying(255),
    project_id character varying(255) NOT NULL,
    request_time character varying(255) NOT NULL,
    requester character varying(255) NOT NULL,
    resource_id integer NOT NULL,
    resource_label character varying(255) NOT NULL,
    resource_uri character varying(255) NOT NULL,
    rsn_status character varying(255),
    scan_description character varying(255),
    scan_id integer NOT NULL,
    scan_label character varying(255),
    subject_id character varying(255) NOT NULL,
    subject_label character varying(255),
    survey_report json,
    workflow_id integer NOT NULL,
    xsi_type character varying(255) NOT NULL,
    CONSTRAINT xhbm_resource_survey_request_resource_id_check CHECK ((resource_id >= 1))
);


ALTER TABLE public.xhbm_resource_survey_request OWNER TO xnat;

--
-- Name: xhbm_resource_survey_request_id_seq; Type: SEQUENCE; Schema: public; Owner: xnat
--

CREATE SEQUENCE public.xhbm_resource_survey_request_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.xhbm_resource_survey_request_id_seq OWNER TO xnat;

--
-- Name: xhbm_resource_survey_request_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xnat
--

ALTER SEQUENCE public.xhbm_resource_survey_request_id_seq OWNED BY public.xhbm_resource_survey_request.id;


--
-- Name: xhbm_revinfo; Type: TABLE; Schema: public; Owner: xnat
--

CREATE TABLE public.xhbm_revinfo (
    rev integer NOT NULL,
    revtstmp bigint
);


ALTER TABLE public.xhbm_revinfo OWNER TO xnat;

--
-- Name: xhbm_script; Type: TABLE; Schema: public; Owner: xnat
--

CREATE TABLE public.xhbm_script (
    id bigint NOT NULL,
    created timestamp without time zone NOT NULL,
    disabled timestamp without time zone NOT NULL,
    enabled boolean DEFAULT true,
    "timestamp" timestamp without time zone NOT NULL,
    content text,
    description character varying(255),
    language character varying(255),
    script_id character varying(255),
    script_label character varying(255)
);


ALTER TABLE public.xhbm_script OWNER TO xnat;

--
-- Name: xhbm_script_aud; Type: TABLE; Schema: public; Owner: xnat
--

CREATE TABLE public.xhbm_script_aud (
    id bigint NOT NULL,
    rev integer NOT NULL,
    revtype smallint,
    content text,
    description character varying(255),
    language character varying(255),
    script_id character varying(255),
    script_label character varying(255)
);


ALTER TABLE public.xhbm_script_aud OWNER TO xnat;

--
-- Name: xhbm_script_aud_id_seq; Type: SEQUENCE; Schema: public; Owner: xnat
--

CREATE SEQUENCE public.xhbm_script_aud_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.xhbm_script_aud_id_seq OWNER TO xnat;

--
-- Name: xhbm_script_aud_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xnat
--

ALTER SEQUENCE public.xhbm_script_aud_id_seq OWNED BY public.xhbm_script_aud.id;


--
-- Name: xhbm_script_id_seq; Type: SEQUENCE; Schema: public; Owner: xnat
--

CREATE SEQUENCE public.xhbm_script_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.xhbm_script_id_seq OWNER TO xnat;

--
-- Name: xhbm_script_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xnat
--

ALTER SEQUENCE public.xhbm_script_id_seq OWNED BY public.xhbm_script.id;


--
-- Name: xhbm_script_launch_request_event; Type: TABLE; Schema: public; Owner: xnat
--

CREATE TABLE public.xhbm_script_launch_request_event (
    id bigint NOT NULL
);


ALTER TABLE public.xhbm_script_launch_request_event OWNER TO xnat;

--
-- Name: xhbm_script_launch_request_event_id_seq; Type: SEQUENCE; Schema: public; Owner: xnat
--

CREATE SEQUENCE public.xhbm_script_launch_request_event_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.xhbm_script_launch_request_event_id_seq OWNER TO xnat;

--
-- Name: xhbm_script_launch_request_event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xnat
--

ALTER SEQUENCE public.xhbm_script_launch_request_event_id_seq OWNED BY public.xhbm_script_launch_request_event.id;


--
-- Name: xhbm_script_trigger; Type: TABLE; Schema: public; Owner: xnat
--

CREATE TABLE public.xhbm_script_trigger (
    id bigint NOT NULL,
    created timestamp without time zone NOT NULL,
    disabled timestamp without time zone NOT NULL,
    enabled boolean DEFAULT true,
    "timestamp" timestamp without time zone NOT NULL,
    association character varying(255) NOT NULL,
    description character varying(255),
    event character varying(255),
    script_id character varying(255) NOT NULL,
    src_event_class character varying(255),
    trigger_id character varying(255) NOT NULL
);


ALTER TABLE public.xhbm_script_trigger OWNER TO xnat;

--
-- Name: xhbm_script_trigger_id_seq; Type: SEQUENCE; Schema: public; Owner: xnat
--

CREATE SEQUENCE public.xhbm_script_trigger_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.xhbm_script_trigger_id_seq OWNER TO xnat;

--
-- Name: xhbm_script_trigger_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xnat
--

ALTER SEQUENCE public.xhbm_script_trigger_id_seq OWNED BY public.xhbm_script_trigger.id;


--
-- Name: xhbm_script_trigger_template; Type: TABLE; Schema: public; Owner: xnat
--

CREATE TABLE public.xhbm_script_trigger_template (
    id bigint NOT NULL,
    created timestamp without time zone NOT NULL,
    disabled timestamp without time zone NOT NULL,
    enabled boolean DEFAULT true,
    "timestamp" timestamp without time zone NOT NULL,
    description character varying(255),
    template_id character varying(255)
);


ALTER TABLE public.xhbm_script_trigger_template OWNER TO xnat;

--
-- Name: xhbm_script_trigger_template_associated_entities; Type: TABLE; Schema: public; Owner: xnat
--

CREATE TABLE public.xhbm_script_trigger_template_associated_entities (
    script_trigger_template bigint NOT NULL,
    associated_entities character varying(255)
);


ALTER TABLE public.xhbm_script_trigger_template_associated_entities OWNER TO xnat;

--
-- Name: xhbm_script_trigger_template_id_seq; Type: SEQUENCE; Schema: public; Owner: xnat
--

CREATE SEQUENCE public.xhbm_script_trigger_template_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.xhbm_script_trigger_template_id_seq OWNER TO xnat;

--
-- Name: xhbm_script_trigger_template_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xnat
--

ALTER SEQUENCE public.xhbm_script_trigger_template_id_seq OWNED BY public.xhbm_script_trigger_template.id;


--
-- Name: xhbm_script_trigger_template_triggers; Type: TABLE; Schema: public; Owner: xnat
--

CREATE TABLE public.xhbm_script_trigger_template_triggers (
    script_trigger_template bigint NOT NULL,
    triggers bigint NOT NULL
);


ALTER TABLE public.xhbm_script_trigger_template_triggers OWNER TO xnat;

--
-- Name: xhbm_spawner_element; Type: TABLE; Schema: public; Owner: xnat
--

CREATE TABLE public.xhbm_spawner_element (
    id bigint NOT NULL,
    created timestamp without time zone NOT NULL,
    disabled timestamp without time zone NOT NULL,
    enabled boolean DEFAULT true,
    "timestamp" timestamp without time zone NOT NULL,
    description character varying(1024),
    element_id character varying(255) NOT NULL,
    label character varying(255),
    namespace character varying(255) DEFAULT 'xnat'::character varying NOT NULL,
    restricted character varying(255),
    yaml text
);


ALTER TABLE public.xhbm_spawner_element OWNER TO xnat;

--
-- Name: xhbm_spawner_element_id_seq; Type: SEQUENCE; Schema: public; Owner: xnat
--

CREATE SEQUENCE public.xhbm_spawner_element_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.xhbm_spawner_element_id_seq OWNER TO xnat;

--
-- Name: xhbm_spawner_element_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xnat
--

ALTER SEQUENCE public.xhbm_spawner_element_id_seq OWNED BY public.xhbm_spawner_element.id;


--
-- Name: xhbm_study_routing; Type: TABLE; Schema: public; Owner: xnat
--

CREATE TABLE public.xhbm_study_routing (
    id bigint NOT NULL,
    created timestamp without time zone NOT NULL,
    disabled timestamp without time zone NOT NULL,
    enabled boolean DEFAULT true,
    "timestamp" timestamp without time zone NOT NULL,
    label character varying(255),
    project_id character varying(255),
    study_instance_uid character varying(255) NOT NULL,
    subject_id character varying(255),
    user_id character varying(255)
);


ALTER TABLE public.xhbm_study_routing OWNER TO xnat;

--
-- Name: xhbm_study_routing_id_seq; Type: SEQUENCE; Schema: public; Owner: xnat
--

CREATE SEQUENCE public.xhbm_study_routing_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.xhbm_study_routing_id_seq OWNER TO xnat;

--
-- Name: xhbm_study_routing_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xnat
--

ALTER SEQUENCE public.xhbm_study_routing_id_seq OWNED BY public.xhbm_study_routing.id;


--
-- Name: xhbm_subscriber; Type: TABLE; Schema: public; Owner: xnat
--

CREATE TABLE public.xhbm_subscriber (
    id bigint NOT NULL,
    created timestamp without time zone NOT NULL,
    disabled timestamp without time zone NOT NULL,
    enabled boolean DEFAULT true,
    "timestamp" timestamp without time zone NOT NULL,
    emails character varying(255),
    name character varying(255)
);


ALTER TABLE public.xhbm_subscriber OWNER TO xnat;

--
-- Name: xhbm_subscriber_id_seq; Type: SEQUENCE; Schema: public; Owner: xnat
--

CREATE SEQUENCE public.xhbm_subscriber_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.xhbm_subscriber_id_seq OWNER TO xnat;

--
-- Name: xhbm_subscriber_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xnat
--

ALTER SEQUENCE public.xhbm_subscriber_id_seq OWNED BY public.xhbm_subscriber.id;


--
-- Name: xhbm_subscription; Type: TABLE; Schema: public; Owner: xnat
--

CREATE TABLE public.xhbm_subscription (
    id bigint NOT NULL,
    created timestamp without time zone NOT NULL,
    disabled timestamp without time zone NOT NULL,
    enabled boolean DEFAULT true,
    "timestamp" timestamp without time zone NOT NULL,
    subscriber_type integer,
    definition bigint,
    subscriber bigint
);


ALTER TABLE public.xhbm_subscription OWNER TO xnat;

--
-- Name: xhbm_subscription_channels; Type: TABLE; Schema: public; Owner: xnat
--

CREATE TABLE public.xhbm_subscription_channels (
    subscription bigint NOT NULL,
    channels bigint NOT NULL
);


ALTER TABLE public.xhbm_subscription_channels OWNER TO xnat;

--
-- Name: xhbm_subscription_delivery_entity; Type: TABLE; Schema: public; Owner: xnat
--

CREATE TABLE public.xhbm_subscription_delivery_entity (
    id bigint NOT NULL,
    created timestamp without time zone NOT NULL,
    disabled timestamp without time zone NOT NULL,
    enabled boolean DEFAULT true,
    "timestamp" timestamp without time zone NOT NULL,
    action_inputs oid,
    action_user_login character varying(255),
    description character varying(255),
    error_state boolean,
    event_type character varying(255),
    eventuuid uuid,
    project_id character varying(255),
    status integer,
    status_message character varying(255),
    status_timestamp timestamp without time zone,
    subscription_id bigint,
    subscription bigint,
    triggering_event_entity bigint
);


ALTER TABLE public.xhbm_subscription_delivery_entity OWNER TO xnat;

--
-- Name: xhbm_subscription_delivery_entity_id_seq; Type: SEQUENCE; Schema: public; Owner: xnat
--

CREATE SEQUENCE public.xhbm_subscription_delivery_entity_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.xhbm_subscription_delivery_entity_id_seq OWNER TO xnat;

--
-- Name: xhbm_subscription_delivery_entity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xnat
--

ALTER SEQUENCE public.xhbm_subscription_delivery_entity_id_seq OWNED BY public.xhbm_subscription_delivery_entity.id;


--
-- Name: xhbm_subscription_delivery_payload; Type: TABLE; Schema: public; Owner: xnat
--

CREATE TABLE public.xhbm_subscription_delivery_payload (
    payload_id bigint,
    delivery_id bigint NOT NULL
);


ALTER TABLE public.xhbm_subscription_delivery_payload OWNER TO xnat;

--
-- Name: xhbm_subscription_entity; Type: TABLE; Schema: public; Owner: xnat
--

CREATE TABLE public.xhbm_subscription_entity (
    id bigint NOT NULL,
    created timestamp without time zone NOT NULL,
    disabled timestamp without time zone NOT NULL,
    enabled boolean DEFAULT true,
    "timestamp" timestamp without time zone NOT NULL,
    act_as_event_user boolean,
    action_key character varying(255),
    action_provider character varying(255),
    active boolean,
    custom_listener_id character varying(255),
    name character varying(255),
    subscription_owner character varying(255),
    event_service_filter_entity bigint
);


ALTER TABLE public.xhbm_subscription_entity OWNER TO xnat;

--
-- Name: xhbm_subscription_entity_attributes; Type: TABLE; Schema: public; Owner: xnat
--

CREATE TABLE public.xhbm_subscription_entity_attributes (
    subscription_entity bigint NOT NULL,
    attributes character varying(255),
    attributes_key character varying(255) NOT NULL
);


ALTER TABLE public.xhbm_subscription_entity_attributes OWNER TO xnat;

--
-- Name: xhbm_subscription_entity_id_seq; Type: SEQUENCE; Schema: public; Owner: xnat
--

CREATE SEQUENCE public.xhbm_subscription_entity_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.xhbm_subscription_entity_id_seq OWNER TO xnat;

--
-- Name: xhbm_subscription_entity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xnat
--

ALTER SEQUENCE public.xhbm_subscription_entity_id_seq OWNED BY public.xhbm_subscription_entity.id;


--
-- Name: xhbm_subscription_id_seq; Type: SEQUENCE; Schema: public; Owner: xnat
--

CREATE SEQUENCE public.xhbm_subscription_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.xhbm_subscription_id_seq OWNER TO xnat;

--
-- Name: xhbm_subscription_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xnat
--

ALTER SEQUENCE public.xhbm_subscription_id_seq OWNED BY public.xhbm_subscription.id;


--
-- Name: xhbm_timed_event_status_entity; Type: TABLE; Schema: public; Owner: xnat
--

CREATE TABLE public.xhbm_timed_event_status_entity (
    id bigint NOT NULL,
    message oid,
    status character varying(255),
    status_timestamp timestamp without time zone,
    subscription_delivery_entity bigint
);


ALTER TABLE public.xhbm_timed_event_status_entity OWNER TO xnat;

--
-- Name: xhbm_timed_event_status_entity_id_seq; Type: SEQUENCE; Schema: public; Owner: xnat
--

CREATE SEQUENCE public.xhbm_timed_event_status_entity_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.xhbm_timed_event_status_entity_id_seq OWNER TO xnat;

--
-- Name: xhbm_timed_event_status_entity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xnat
--

ALTER SEQUENCE public.xhbm_timed_event_status_entity_id_seq OWNED BY public.xhbm_timed_event_status_entity.id;


--
-- Name: xhbm_tool; Type: TABLE; Schema: public; Owner: xnat
--

CREATE TABLE public.xhbm_tool (
    id bigint NOT NULL,
    created timestamp without time zone NOT NULL,
    disabled timestamp without time zone NOT NULL,
    enabled boolean DEFAULT true,
    "timestamp" timestamp without time zone NOT NULL,
    resolver character varying(255),
    strict boolean NOT NULL,
    tool_description character varying(255),
    tool_id character varying(255) NOT NULL,
    tool_name character varying(255) NOT NULL
);


ALTER TABLE public.xhbm_tool OWNER TO xnat;

--
-- Name: xhbm_tool_id_seq; Type: SEQUENCE; Schema: public; Owner: xnat
--

CREATE SEQUENCE public.xhbm_tool_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.xhbm_tool_id_seq OWNER TO xnat;

--
-- Name: xhbm_tool_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xnat
--

ALTER SEQUENCE public.xhbm_tool_id_seq OWNED BY public.xhbm_tool.id;


--
-- Name: xhbm_triggering_event_entity; Type: TABLE; Schema: public; Owner: xnat
--

CREATE TABLE public.xhbm_triggering_event_entity (
    id bigint NOT NULL,
    event_name character varying(255),
    object_label character varying(255),
    status character varying(255),
    xnat_type character varying(255),
    is_xsi_type boolean,
    xsi_uri character varying(255)
);


ALTER TABLE public.xhbm_triggering_event_entity OWNER TO xnat;

--
-- Name: xhbm_triggering_event_entity_id_seq; Type: SEQUENCE; Schema: public; Owner: xnat
--

CREATE SEQUENCE public.xhbm_triggering_event_entity_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.xhbm_triggering_event_entity_id_seq OWNER TO xnat;

--
-- Name: xhbm_triggering_event_entity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xnat
--

ALTER SEQUENCE public.xhbm_triggering_event_entity_id_seq OWNED BY public.xhbm_triggering_event_entity.id;


--
-- Name: xhbm_user_change_request; Type: TABLE; Schema: public; Owner: xnat
--

CREATE TABLE public.xhbm_user_change_request (
    id bigint NOT NULL,
    created timestamp without time zone NOT NULL,
    disabled timestamp without time zone NOT NULL,
    enabled boolean DEFAULT true,
    "timestamp" timestamp without time zone NOT NULL,
    change_id character varying(255),
    field_to_change character varying(255),
    guid character varying(255),
    new_value character varying(255),
    username character varying(255)
);


ALTER TABLE public.xhbm_user_change_request OWNER TO xnat;

--
-- Name: xhbm_user_change_request_id_seq; Type: SEQUENCE; Schema: public; Owner: xnat
--

CREATE SEQUENCE public.xhbm_user_change_request_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.xhbm_user_change_request_id_seq OWNER TO xnat;

--
-- Name: xhbm_user_change_request_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xnat
--

ALTER SEQUENCE public.xhbm_user_change_request_id_seq OWNED BY public.xhbm_user_change_request.id;


--
-- Name: xhbm_user_registration_data; Type: TABLE; Schema: public; Owner: xnat
--

CREATE TABLE public.xhbm_user_registration_data (
    id bigint NOT NULL,
    created timestamp without time zone NOT NULL,
    disabled timestamp without time zone NOT NULL,
    enabled boolean DEFAULT true,
    "timestamp" timestamp without time zone NOT NULL,
    comments character varying(255),
    login character varying(255) NOT NULL,
    organization character varying(255),
    phone character varying(255)
);


ALTER TABLE public.xhbm_user_registration_data OWNER TO xnat;

--
-- Name: xhbm_user_registration_data_id_seq; Type: SEQUENCE; Schema: public; Owner: xnat
--

CREATE SEQUENCE public.xhbm_user_registration_data_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.xhbm_user_registration_data_id_seq OWNER TO xnat;

--
-- Name: xhbm_user_registration_data_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xnat
--

ALTER SEQUENCE public.xhbm_user_registration_data_id_seq OWNED BY public.xhbm_user_registration_data.id;


--
-- Name: xhbm_user_role; Type: TABLE; Schema: public; Owner: xnat
--

CREATE TABLE public.xhbm_user_role (
    id bigint NOT NULL,
    created timestamp without time zone NOT NULL,
    disabled timestamp without time zone NOT NULL,
    enabled boolean DEFAULT true,
    "timestamp" timestamp without time zone NOT NULL,
    role character varying(255),
    username character varying(255)
);


ALTER TABLE public.xhbm_user_role OWNER TO xnat;

--
-- Name: xhbm_user_role_id_seq; Type: SEQUENCE; Schema: public; Owner: xnat
--

CREATE SEQUENCE public.xhbm_user_role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.xhbm_user_role_id_seq OWNER TO xnat;

--
-- Name: xhbm_user_role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xnat
--

ALTER SEQUENCE public.xhbm_user_role_id_seq OWNED BY public.xhbm_user_role.id;


--
-- Name: xhbm_xdat_user_auth; Type: TABLE; Schema: public; Owner: xnat
--

CREATE TABLE public.xhbm_xdat_user_auth (
    id bigint NOT NULL,
    created timestamp without time zone NOT NULL,
    disabled timestamp without time zone NOT NULL,
    enabled boolean DEFAULT true,
    "timestamp" timestamp without time zone NOT NULL,
    auth_method character varying(255),
    auth_method_id character varying(255),
    auth_user character varying(255),
    failed_login_attempts integer,
    last_login_attempt timestamp without time zone,
    last_successful_login timestamp without time zone,
    lockout_time timestamp without time zone,
    password_updated timestamp without time zone,
    xdat_username character varying(255)
);


ALTER TABLE public.xhbm_xdat_user_auth OWNER TO xnat;

--
-- Name: xhbm_xdat_user_auth_id_seq; Type: SEQUENCE; Schema: public; Owner: xnat
--

CREATE SEQUENCE public.xhbm_xdat_user_auth_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.xhbm_xdat_user_auth_id_seq OWNER TO xnat;

--
-- Name: xhbm_xdat_user_auth_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xnat
--

ALTER SEQUENCE public.xhbm_xdat_user_auth_id_seq OWNED BY public.xhbm_xdat_user_auth.id;


--
-- Name: xhbm_xft_field_exclusion; Type: TABLE; Schema: public; Owner: xnat
--

CREATE TABLE public.xhbm_xft_field_exclusion (
    id bigint NOT NULL,
    created timestamp without time zone NOT NULL,
    disabled timestamp without time zone NOT NULL,
    enabled boolean DEFAULT true,
    "timestamp" timestamp without time zone NOT NULL,
    pattern character varying(255),
    scope integer,
    target_id character varying(255)
);


ALTER TABLE public.xhbm_xft_field_exclusion OWNER TO xnat;

--
-- Name: xhbm_xft_field_exclusion_id_seq; Type: SEQUENCE; Schema: public; Owner: xnat
--

CREATE SEQUENCE public.xhbm_xft_field_exclusion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.xhbm_xft_field_exclusion_id_seq OWNER TO xnat;

--
-- Name: xhbm_xft_field_exclusion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xnat
--

ALTER SEQUENCE public.xhbm_xft_field_exclusion_id_seq OWNED BY public.xhbm_xft_field_exclusion.id;


--
-- Name: xhbm_xnat_node_info; Type: TABLE; Schema: public; Owner: xnat
--

CREATE TABLE public.xhbm_xnat_node_info (
    id bigint NOT NULL,
    created timestamp without time zone NOT NULL,
    disabled timestamp without time zone NOT NULL,
    enabled boolean DEFAULT true,
    "timestamp" timestamp without time zone NOT NULL,
    host_name character varying(255),
    is_active boolean,
    last_check_in timestamp without time zone,
    last_initialized timestamp without time zone,
    last_ip_address character varying(255),
    node_id character varying(255)
);


ALTER TABLE public.xhbm_xnat_node_info OWNER TO xnat;

--
-- Name: xhbm_xnat_node_info_id_seq; Type: SEQUENCE; Schema: public; Owner: xnat
--

CREATE SEQUENCE public.xhbm_xnat_node_info_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.xhbm_xnat_node_info_id_seq OWNER TO xnat;

--
-- Name: xhbm_xnat_node_info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xnat
--

ALTER SEQUENCE public.xhbm_xnat_node_info_id_seq OWNED BY public.xhbm_xnat_node_info.id;


--
-- Name: xhbm_xnat_task_info; Type: TABLE; Schema: public; Owner: xnat
--

CREATE TABLE public.xhbm_xnat_task_info (
    id bigint NOT NULL,
    created timestamp without time zone NOT NULL,
    disabled timestamp without time zone NOT NULL,
    enabled boolean DEFAULT true,
    "timestamp" timestamp without time zone NOT NULL,
    last_run timestamp without time zone,
    task_id character varying(255),
    xnat_node_info_id bigint
);


ALTER TABLE public.xhbm_xnat_task_info OWNER TO xnat;

--
-- Name: xhbm_xnat_task_info_id_seq; Type: SEQUENCE; Schema: public; Owner: xnat
--

CREATE SEQUENCE public.xhbm_xnat_task_info_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.xhbm_xnat_task_info_id_seq OWNER TO xnat;

--
-- Name: xhbm_xnat_task_info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xnat
--

ALTER SEQUENCE public.xhbm_xnat_task_info_id_seq OWNED BY public.xhbm_xnat_task_info.id;


--
-- Name: xhbm_alias_token id; Type: DEFAULT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_alias_token ALTER COLUMN id SET DEFAULT nextval('public.xhbm_alias_token_id_seq'::regclass);


--
-- Name: xhbm_archive_processor_instance id; Type: DEFAULT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_archive_processor_instance ALTER COLUMN id SET DEFAULT nextval('public.xhbm_archive_processor_instance_id_seq'::regclass);


--
-- Name: xhbm_archive_processor_instance_aud id; Type: DEFAULT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_archive_processor_instance_aud ALTER COLUMN id SET DEFAULT nextval('public.xhbm_archive_processor_instance_aud_id_seq'::regclass);


--
-- Name: xhbm_automation_event_ids id; Type: DEFAULT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_automation_event_ids ALTER COLUMN id SET DEFAULT nextval('public.xhbm_automation_event_ids_id_seq'::regclass);


--
-- Name: xhbm_automation_event_ids_ids id; Type: DEFAULT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_automation_event_ids_ids ALTER COLUMN id SET DEFAULT nextval('public.xhbm_automation_event_ids_ids_id_seq'::regclass);


--
-- Name: xhbm_automation_filters id; Type: DEFAULT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_automation_filters ALTER COLUMN id SET DEFAULT nextval('public.xhbm_automation_filters_id_seq'::regclass);


--
-- Name: xhbm_category id; Type: DEFAULT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_category ALTER COLUMN id SET DEFAULT nextval('public.xhbm_category_id_seq'::regclass);


--
-- Name: xhbm_channel id; Type: DEFAULT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_channel ALTER COLUMN id SET DEFAULT nextval('public.xhbm_channel_id_seq'::regclass);


--
-- Name: xhbm_compute_environment_config_entity id; Type: DEFAULT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_compute_environment_config_entity ALTER COLUMN id SET DEFAULT nextval('public.xhbm_compute_environment_config_entity_id_seq'::regclass);


--
-- Name: xhbm_compute_environment_entity id; Type: DEFAULT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_compute_environment_entity ALTER COLUMN id SET DEFAULT nextval('public.xhbm_compute_environment_entity_id_seq'::regclass);


--
-- Name: xhbm_compute_environment_scope_entity id; Type: DEFAULT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_compute_environment_scope_entity ALTER COLUMN id SET DEFAULT nextval('public.xhbm_compute_environment_scope_entity_id_seq'::regclass);


--
-- Name: xhbm_conditional_initialization_task_status id; Type: DEFAULT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_conditional_initialization_task_status ALTER COLUMN id SET DEFAULT nextval('public.xhbm_conditional_initialization_task_status_id_seq'::regclass);


--
-- Name: xhbm_configuration id; Type: DEFAULT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_configuration ALTER COLUMN id SET DEFAULT nextval('public.xhbm_configuration_id_seq'::regclass);


--
-- Name: xhbm_configuration_data id; Type: DEFAULT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_configuration_data ALTER COLUMN id SET DEFAULT nextval('public.xhbm_configuration_data_id_seq'::regclass);


--
-- Name: xhbm_constraint_config_entity id; Type: DEFAULT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_constraint_config_entity ALTER COLUMN id SET DEFAULT nextval('public.xhbm_constraint_config_entity_id_seq'::regclass);


--
-- Name: xhbm_constraint_scope_entity id; Type: DEFAULT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_constraint_scope_entity ALTER COLUMN id SET DEFAULT nextval('public.xhbm_constraint_scope_entity_id_seq'::regclass);


--
-- Name: xhbm_custom_variable_applies_to id; Type: DEFAULT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_custom_variable_applies_to ALTER COLUMN id SET DEFAULT nextval('public.xhbm_custom_variable_applies_to_id_seq'::regclass);


--
-- Name: xhbm_custom_variable_form id; Type: DEFAULT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_custom_variable_form ALTER COLUMN id SET DEFAULT nextval('public.xhbm_custom_variable_form_id_seq'::regclass);


--
-- Name: xhbm_custom_variable_form_applies_to id; Type: DEFAULT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_custom_variable_form_applies_to ALTER COLUMN id SET DEFAULT nextval('public.xhbm_custom_variable_form_applies_to_id_seq'::regclass);


--
-- Name: xhbm_data_cache_item id; Type: DEFAULT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_data_cache_item ALTER COLUMN id SET DEFAULT nextval('public.xhbm_data_cache_item_id_seq'::regclass);


--
-- Name: xhbm_definition id; Type: DEFAULT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_definition ALTER COLUMN id SET DEFAULT nextval('public.xhbm_definition_id_seq'::regclass);


--
-- Name: xhbm_dicom_inbox_import_request id; Type: DEFAULT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_dicom_inbox_import_request ALTER COLUMN id SET DEFAULT nextval('public.xhbm_dicom_inbox_import_request_id_seq'::regclass);


--
-- Name: xhbm_dicom_mapping_entity id; Type: DEFAULT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_dicom_mapping_entity ALTER COLUMN id SET DEFAULT nextval('public.xhbm_dicom_mapping_entity_id_seq'::regclass);


--
-- Name: xhbm_dicomscpinstance id; Type: DEFAULT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_dicomscpinstance ALTER COLUMN id SET DEFAULT nextval('public.xhbm_dicomscpinstance_id_seq'::regclass);


--
-- Name: xhbm_direct_archive_session id; Type: DEFAULT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_direct_archive_session ALTER COLUMN id SET DEFAULT nextval('public.xhbm_direct_archive_session_id_seq'::regclass);


--
-- Name: xhbm_event id; Type: DEFAULT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_event ALTER COLUMN id SET DEFAULT nextval('public.xhbm_event_id_seq'::regclass);


--
-- Name: xhbm_event_filters id; Type: DEFAULT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_event_filters ALTER COLUMN id SET DEFAULT nextval('public.xhbm_event_filters_id_seq'::regclass);


--
-- Name: xhbm_event_service_filter_entity id; Type: DEFAULT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_event_service_filter_entity ALTER COLUMN id SET DEFAULT nextval('public.xhbm_event_service_filter_entity_id_seq'::regclass);


--
-- Name: xhbm_event_service_payload_entity id; Type: DEFAULT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_event_service_payload_entity ALTER COLUMN id SET DEFAULT nextval('public.xhbm_event_service_payload_entity_id_seq'::regclass);


--
-- Name: xhbm_event_specific_fields id; Type: DEFAULT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_event_specific_fields ALTER COLUMN id SET DEFAULT nextval('public.xhbm_event_specific_fields_id_seq'::regclass);


--
-- Name: xhbm_event_tracking_data id; Type: DEFAULT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_event_tracking_data ALTER COLUMN id SET DEFAULT nextval('public.xhbm_event_tracking_data_id_seq'::regclass);


--
-- Name: xhbm_feature_definition id; Type: DEFAULT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_feature_definition ALTER COLUMN id SET DEFAULT nextval('public.xhbm_feature_definition_id_seq'::regclass);


--
-- Name: xhbm_file_store_info id; Type: DEFAULT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_file_store_info ALTER COLUMN id SET DEFAULT nextval('public.xhbm_file_store_info_id_seq'::regclass);


--
-- Name: xhbm_file_store_info_aud id; Type: DEFAULT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_file_store_info_aud ALTER COLUMN id SET DEFAULT nextval('public.xhbm_file_store_info_aud_id_seq'::regclass);


--
-- Name: xhbm_group_feature id; Type: DEFAULT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_group_feature ALTER COLUMN id SET DEFAULT nextval('public.xhbm_group_feature_id_seq'::regclass);


--
-- Name: xhbm_hardware_config_entity id; Type: DEFAULT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_hardware_config_entity ALTER COLUMN id SET DEFAULT nextval('public.xhbm_hardware_config_entity_id_seq'::regclass);


--
-- Name: xhbm_hardware_constraint_entity id; Type: DEFAULT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_hardware_constraint_entity ALTER COLUMN id SET DEFAULT nextval('public.xhbm_hardware_constraint_entity_id_seq'::regclass);


--
-- Name: xhbm_hardware_entity id; Type: DEFAULT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_hardware_entity ALTER COLUMN id SET DEFAULT nextval('public.xhbm_hardware_entity_id_seq'::regclass);


--
-- Name: xhbm_hardware_scope_entity id; Type: DEFAULT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_hardware_scope_entity ALTER COLUMN id SET DEFAULT nextval('public.xhbm_hardware_scope_entity_id_seq'::regclass);


--
-- Name: xhbm_host_info id; Type: DEFAULT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_host_info ALTER COLUMN id SET DEFAULT nextval('public.xhbm_host_info_id_seq'::regclass);


--
-- Name: xhbm_notification id; Type: DEFAULT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_notification ALTER COLUMN id SET DEFAULT nextval('public.xhbm_notification_id_seq'::regclass);


--
-- Name: xhbm_persistent_event id; Type: DEFAULT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_persistent_event ALTER COLUMN id SET DEFAULT nextval('public.xhbm_persistent_event_id_seq'::regclass);


--
-- Name: xhbm_preference id; Type: DEFAULT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_preference ALTER COLUMN id SET DEFAULT nextval('public.xhbm_preference_id_seq'::regclass);


--
-- Name: xhbm_resource_survey_request id; Type: DEFAULT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_resource_survey_request ALTER COLUMN id SET DEFAULT nextval('public.xhbm_resource_survey_request_id_seq'::regclass);


--
-- Name: xhbm_script id; Type: DEFAULT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_script ALTER COLUMN id SET DEFAULT nextval('public.xhbm_script_id_seq'::regclass);


--
-- Name: xhbm_script_aud id; Type: DEFAULT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_script_aud ALTER COLUMN id SET DEFAULT nextval('public.xhbm_script_aud_id_seq'::regclass);


--
-- Name: xhbm_script_launch_request_event id; Type: DEFAULT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_script_launch_request_event ALTER COLUMN id SET DEFAULT nextval('public.xhbm_script_launch_request_event_id_seq'::regclass);


--
-- Name: xhbm_script_trigger id; Type: DEFAULT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_script_trigger ALTER COLUMN id SET DEFAULT nextval('public.xhbm_script_trigger_id_seq'::regclass);


--
-- Name: xhbm_script_trigger_template id; Type: DEFAULT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_script_trigger_template ALTER COLUMN id SET DEFAULT nextval('public.xhbm_script_trigger_template_id_seq'::regclass);


--
-- Name: xhbm_spawner_element id; Type: DEFAULT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_spawner_element ALTER COLUMN id SET DEFAULT nextval('public.xhbm_spawner_element_id_seq'::regclass);


--
-- Name: xhbm_study_routing id; Type: DEFAULT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_study_routing ALTER COLUMN id SET DEFAULT nextval('public.xhbm_study_routing_id_seq'::regclass);


--
-- Name: xhbm_subscriber id; Type: DEFAULT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_subscriber ALTER COLUMN id SET DEFAULT nextval('public.xhbm_subscriber_id_seq'::regclass);


--
-- Name: xhbm_subscription id; Type: DEFAULT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_subscription ALTER COLUMN id SET DEFAULT nextval('public.xhbm_subscription_id_seq'::regclass);


--
-- Name: xhbm_subscription_delivery_entity id; Type: DEFAULT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_subscription_delivery_entity ALTER COLUMN id SET DEFAULT nextval('public.xhbm_subscription_delivery_entity_id_seq'::regclass);


--
-- Name: xhbm_subscription_entity id; Type: DEFAULT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_subscription_entity ALTER COLUMN id SET DEFAULT nextval('public.xhbm_subscription_entity_id_seq'::regclass);


--
-- Name: xhbm_timed_event_status_entity id; Type: DEFAULT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_timed_event_status_entity ALTER COLUMN id SET DEFAULT nextval('public.xhbm_timed_event_status_entity_id_seq'::regclass);


--
-- Name: xhbm_tool id; Type: DEFAULT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_tool ALTER COLUMN id SET DEFAULT nextval('public.xhbm_tool_id_seq'::regclass);


--
-- Name: xhbm_triggering_event_entity id; Type: DEFAULT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_triggering_event_entity ALTER COLUMN id SET DEFAULT nextval('public.xhbm_triggering_event_entity_id_seq'::regclass);


--
-- Name: xhbm_user_change_request id; Type: DEFAULT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_user_change_request ALTER COLUMN id SET DEFAULT nextval('public.xhbm_user_change_request_id_seq'::regclass);


--
-- Name: xhbm_user_registration_data id; Type: DEFAULT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_user_registration_data ALTER COLUMN id SET DEFAULT nextval('public.xhbm_user_registration_data_id_seq'::regclass);


--
-- Name: xhbm_user_role id; Type: DEFAULT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_user_role ALTER COLUMN id SET DEFAULT nextval('public.xhbm_user_role_id_seq'::regclass);


--
-- Name: xhbm_xdat_user_auth id; Type: DEFAULT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_xdat_user_auth ALTER COLUMN id SET DEFAULT nextval('public.xhbm_xdat_user_auth_id_seq'::regclass);


--
-- Name: xhbm_xft_field_exclusion id; Type: DEFAULT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_xft_field_exclusion ALTER COLUMN id SET DEFAULT nextval('public.xhbm_xft_field_exclusion_id_seq'::regclass);


--
-- Name: xhbm_xnat_node_info id; Type: DEFAULT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_xnat_node_info ALTER COLUMN id SET DEFAULT nextval('public.xhbm_xnat_node_info_id_seq'::regclass);


--
-- Name: xhbm_xnat_task_info id; Type: DEFAULT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_xnat_task_info ALTER COLUMN id SET DEFAULT nextval('public.xhbm_xnat_task_info_id_seq'::regclass);


--
-- Data for Name: xhbm_alias_token; Type: TABLE DATA; Schema: public; Owner: xnat
--

COPY public.xhbm_alias_token (id, created, disabled, enabled, "timestamp", alias, estimated_expiration_time, secret, single_use, xdat_user_id) FROM stdin;
\.


--
-- Data for Name: xhbm_alias_token_validipaddresses; Type: TABLE DATA; Schema: public; Owner: xnat
--

COPY public.xhbm_alias_token_validipaddresses (alias_token, validipaddresses) FROM stdin;
\.


--
-- Data for Name: xhbm_archive_processor_instance; Type: TABLE DATA; Schema: public; Owner: xnat
--

COPY public.xhbm_archive_processor_instance (id, created, disabled, enabled, "timestamp", label, location, priority, processor_class, scope) FROM stdin;
1	2025-11-10 06:43:18.839	1970-01-01 00:00:00	t	2025-11-10 06:43:18.839	Site Anonymization	AfterAddedToPrearchiveDatabase	10	org.nrg.xnat.processors.MizerArchiveProcessor	site
2	2025-11-10 06:43:18.888	1970-01-01 00:00:00	t	2025-11-10 06:43:18.888	Remapping	AfterProjectSet	10	org.nrg.xnat.processors.StudyRemappingArchiveProcessor	site
\.


--
-- Data for Name: xhbm_archive_processor_instance_aud; Type: TABLE DATA; Schema: public; Owner: xnat
--

COPY public.xhbm_archive_processor_instance_aud (id, rev, revtype, label, location, priority, processor_class, scope) FROM stdin;
1	1	0	Site Anonymization	AfterAddedToPrearchiveDatabase	10	org.nrg.xnat.processors.MizerArchiveProcessor	site
2	2	0	Remapping	AfterProjectSet	10	org.nrg.xnat.processors.StudyRemappingArchiveProcessor	site
\.


--
-- Data for Name: xhbm_archive_processor_instance_parameters; Type: TABLE DATA; Schema: public; Owner: xnat
--

COPY public.xhbm_archive_processor_instance_parameters (archive_processor_instance, value, parameter_name) FROM stdin;
\.


--
-- Data for Name: xhbm_archive_processor_instance_parameters_aud; Type: TABLE DATA; Schema: public; Owner: xnat
--

COPY public.xhbm_archive_processor_instance_parameters_aud (rev, archive_processor_instance, value, parameter_name, revtype) FROM stdin;
\.


--
-- Data for Name: xhbm_archive_processor_instance_project_ids_list; Type: TABLE DATA; Schema: public; Owner: xnat
--

COPY public.xhbm_archive_processor_instance_project_ids_list (archive_processor_instance, project_ids_list) FROM stdin;
\.


--
-- Data for Name: xhbm_archive_processor_instance_project_ids_list_aud; Type: TABLE DATA; Schema: public; Owner: xnat
--

COPY public.xhbm_archive_processor_instance_project_ids_list_aud (rev, archive_processor_instance, project_ids_list, revtype) FROM stdin;
\.


--
-- Data for Name: xhbm_archive_processor_instance_scp_blacklist; Type: TABLE DATA; Schema: public; Owner: xnat
--

COPY public.xhbm_archive_processor_instance_scp_blacklist (archive_processor_instance, scp_blacklist) FROM stdin;
\.


--
-- Data for Name: xhbm_archive_processor_instance_scp_blacklist_aud; Type: TABLE DATA; Schema: public; Owner: xnat
--

COPY public.xhbm_archive_processor_instance_scp_blacklist_aud (rev, archive_processor_instance, scp_blacklist, revtype) FROM stdin;
\.


--
-- Data for Name: xhbm_archive_processor_instance_scp_whitelist; Type: TABLE DATA; Schema: public; Owner: xnat
--

COPY public.xhbm_archive_processor_instance_scp_whitelist (archive_processor_instance, scp_whitelist) FROM stdin;
\.


--
-- Data for Name: xhbm_archive_processor_instance_scp_whitelist_aud; Type: TABLE DATA; Schema: public; Owner: xnat
--

COPY public.xhbm_archive_processor_instance_scp_whitelist_aud (rev, archive_processor_instance, scp_whitelist, revtype) FROM stdin;
\.


--
-- Data for Name: xhbm_automation_event_ids; Type: TABLE DATA; Schema: public; Owner: xnat
--

COPY public.xhbm_automation_event_ids (id, created, disabled, enabled, "timestamp", external_id, src_event_class) FROM stdin;
\.


--
-- Data for Name: xhbm_automation_event_ids_ids; Type: TABLE DATA; Schema: public; Owner: xnat
--

COPY public.xhbm_automation_event_ids_ids (id, created, disabled, enabled, "timestamp", counter, event_id, parent_automation_event_ids) FROM stdin;
\.


--
-- Data for Name: xhbm_automation_filters; Type: TABLE DATA; Schema: public; Owner: xnat
--

COPY public.xhbm_automation_filters (id, created, disabled, enabled, "timestamp", external_id, field, src_event_class) FROM stdin;
\.


--
-- Data for Name: xhbm_automation_filters_values; Type: TABLE DATA; Schema: public; Owner: xnat
--

COPY public.xhbm_automation_filters_values (automation_filters, "values") FROM stdin;
\.


--
-- Data for Name: xhbm_category; Type: TABLE DATA; Schema: public; Owner: xnat
--

COPY public.xhbm_category (id, created, disabled, enabled, "timestamp", event, scope) FROM stdin;
\.


--
-- Data for Name: xhbm_channel; Type: TABLE DATA; Schema: public; Owner: xnat
--

COPY public.xhbm_channel (id, created, disabled, enabled, "timestamp", format, name) FROM stdin;
\.


--
-- Data for Name: xhbm_compute_environment_config_entity; Type: TABLE DATA; Schema: public; Owner: xnat
--

COPY public.xhbm_compute_environment_config_entity (id, created, disabled, enabled, "timestamp") FROM stdin;
\.


--
-- Data for Name: xhbm_compute_environment_config_entity_config_types; Type: TABLE DATA; Schema: public; Owner: xnat
--

COPY public.xhbm_compute_environment_config_entity_config_types (compute_environment_config_entity, config_types) FROM stdin;
\.


--
-- Data for Name: xhbm_compute_environment_entity; Type: TABLE DATA; Schema: public; Owner: xnat
--

COPY public.xhbm_compute_environment_entity (id, created, disabled, enabled, "timestamp", command, image, name, compute_environment_config) FROM stdin;
\.


--
-- Data for Name: xhbm_compute_environment_entity_environment_variables; Type: TABLE DATA; Schema: public; Owner: xnat
--

COPY public.xhbm_compute_environment_entity_environment_variables (compute_environment_entity, key, value) FROM stdin;
\.


--
-- Data for Name: xhbm_compute_environment_entity_mounts; Type: TABLE DATA; Schema: public; Owner: xnat
--

COPY public.xhbm_compute_environment_entity_mounts (compute_environment_entity, container_path, local_path, read_only, volume_name) FROM stdin;
\.


--
-- Data for Name: xhbm_compute_environment_hardware_options_entity; Type: TABLE DATA; Schema: public; Owner: xnat
--

COPY public.xhbm_compute_environment_hardware_options_entity (allow_all_hardware, compute_environment_config) FROM stdin;
\.


--
-- Data for Name: xhbm_compute_environment_hardware_options_hardware_config; Type: TABLE DATA; Schema: public; Owner: xnat
--

COPY public.xhbm_compute_environment_hardware_options_hardware_config (compute_environment_hardware_options_id, hardware_config_id) FROM stdin;
\.


--
-- Data for Name: xhbm_compute_environment_scope_entity; Type: TABLE DATA; Schema: public; Owner: xnat
--

COPY public.xhbm_compute_environment_scope_entity (id, enabled, scope, compute_environment_config, scopes_key) FROM stdin;
\.


--
-- Data for Name: xhbm_compute_environment_scope_entity_ids; Type: TABLE DATA; Schema: public; Owner: xnat
--

COPY public.xhbm_compute_environment_scope_entity_ids (compute_environment_scope_entity, ids) FROM stdin;
\.


--
-- Data for Name: xhbm_conditional_initialization_task_status; Type: TABLE DATA; Schema: public; Owner: xnat
--

COPY public.xhbm_conditional_initialization_task_status (id, created, disabled, enabled, "timestamp", status, task_name) FROM stdin;
\.


--
-- Data for Name: xhbm_configuration; Type: TABLE DATA; Schema: public; Owner: xnat
--

COPY public.xhbm_configuration (id, created, disabled, enabled, "timestamp", entity_id, path, project, reason, scope, status, tool, unversioned, version, xnat_user, config_data) FROM stdin;
1	2025-11-10 06:43:18.43	1970-01-01 00:00:00	t	2025-11-10 06:43:18.43	\N	script	\N		0	enabled	anon	f	1	admin	1
2	2025-11-10 06:43:18.518	1970-01-01 00:00:00	t	2025-11-10 06:43:18.518	\N	tracers	\N		0	enabled	tracers	f	1	admin	2
3	2025-11-10 06:43:18.524	1970-01-01 00:00:00	t	2025-11-10 06:43:18.524	\N	script	\N		0	enabled	anon	f	2	admin	1
4	2025-11-10 06:43:18.601	1970-01-01 00:00:00	t	2025-11-10 06:43:18.601	\N	tracers	\N		0	enabled	tracers	f	2	admin	2
\.


--
-- Data for Name: xhbm_configuration_data; Type: TABLE DATA; Schema: public; Owner: xnat
--

COPY public.xhbm_configuration_data (id, created, disabled, enabled, "timestamp", contents) FROM stdin;
1	2025-11-10 06:43:18.42	1970-01-01 00:00:00	t	2025-11-10 06:43:18.42	//\n// Default XNAT anonymization script\n// XNAT http://www.xnat.org\n// Copyright (c) 2005-2017, Washington University School of Medicine and Howard Hughes Medical Institute\n// All Rights Reserved\n//\n// Released under the Simplified BSD.\n//\nversion "6.1"\nproject != "Unassigned" ? (0008,1030) := project\n(0010,0010) := subject\n(0010,0020) := session
2	2025-11-10 06:43:18.512	1970-01-01 00:00:00	t	2025-11-10 06:43:18.512	PIB\nFDG
\.


--
-- Data for Name: xhbm_configuration_data_configurations; Type: TABLE DATA; Schema: public; Owner: xnat
--

COPY public.xhbm_configuration_data_configurations (configuration_data, configurations) FROM stdin;
\.


--
-- Data for Name: xhbm_constraint_config_entity; Type: TABLE DATA; Schema: public; Owner: xnat
--

COPY public.xhbm_constraint_config_entity (id, created, disabled, enabled, "timestamp") FROM stdin;
\.


--
-- Data for Name: xhbm_constraint_entity; Type: TABLE DATA; Schema: public; Owner: xnat
--

COPY public.xhbm_constraint_entity (created, disabled, enabled, "timestamp", key, operator, constraint_config) FROM stdin;
\.


--
-- Data for Name: xhbm_constraint_entity_constraint_values; Type: TABLE DATA; Schema: public; Owner: xnat
--

COPY public.xhbm_constraint_entity_constraint_values (constraint_entity_constraint_config, constraint_values) FROM stdin;
\.


--
-- Data for Name: xhbm_constraint_scope_entity; Type: TABLE DATA; Schema: public; Owner: xnat
--

COPY public.xhbm_constraint_scope_entity (id, enabled, scope, constraint_config, scopes_key) FROM stdin;
\.


--
-- Data for Name: xhbm_constraint_scope_entity_ids; Type: TABLE DATA; Schema: public; Owner: xnat
--

COPY public.xhbm_constraint_scope_entity_ids (constraint_scope_entity, ids) FROM stdin;
\.


--
-- Data for Name: xhbm_custom_variable_applies_to; Type: TABLE DATA; Schema: public; Owner: xnat
--

COPY public.xhbm_custom_variable_applies_to (id, created, disabled, enabled, "timestamp", data_type, entity_id, protocol, scan_type, scope, sub_type, visit) FROM stdin;
\.


--
-- Data for Name: xhbm_custom_variable_form; Type: TABLE DATA; Schema: public; Owner: xnat
--

COPY public.xhbm_custom_variable_form (id, created, disabled, enabled, "timestamp", form_creator, formiojson_definition, form_uuid, z_index) FROM stdin;
\.


--
-- Data for Name: xhbm_custom_variable_form_applies_to; Type: TABLE DATA; Schema: public; Owner: xnat
--

COPY public.xhbm_custom_variable_form_applies_to (id, created, disabled, enabled, status, "timestamp", xnat_user, custom_variable_form, custom_variable_applies_to) FROM stdin;
\.


--
-- Data for Name: xhbm_data_cache_item; Type: TABLE DATA; Schema: public; Owner: xnat
--

COPY public.xhbm_data_cache_item (id, created, disabled, enabled, "timestamp", key, type, value) FROM stdin;
\.


--
-- Data for Name: xhbm_definition; Type: TABLE DATA; Schema: public; Owner: xnat
--

COPY public.xhbm_definition (id, created, disabled, enabled, "timestamp", entity, category) FROM stdin;
\.


--
-- Data for Name: xhbm_dicom_inbox_import_request; Type: TABLE DATA; Schema: public; Owner: xnat
--

COPY public.xhbm_dicom_inbox_import_request (id, created, disabled, enabled, "timestamp", cleanup_after_import, resolution, session_path, status, username) FROM stdin;
\.


--
-- Data for Name: xhbm_dicom_inbox_import_request_parameters; Type: TABLE DATA; Schema: public; Owner: xnat
--

COPY public.xhbm_dicom_inbox_import_request_parameters (dicom_inbox_import_request, parameters, parameters_key) FROM stdin;
\.


--
-- Data for Name: xhbm_dicom_mapping_entity; Type: TABLE DATA; Schema: public; Owner: xnat
--

COPY public.xhbm_dicom_mapping_entity (id, created, disabled, enabled, "timestamp", add_param_attribute, dicom_tag, field_name, field_type, schema_element, scope, scope_object_id) FROM stdin;
\.


--
-- Data for Name: xhbm_dicomscpinstance; Type: TABLE DATA; Schema: public; Owner: xnat
--

COPY public.xhbm_dicomscpinstance (id, created, disabled, enabled, "timestamp", ae_title, anonymization_enabled, custom_processing, direct_archive, file_namer, identifier, port, project_routing_expression, routing_expressions_enabled, session_routing_expression, subject_routing_expression, whitelist_enabled) FROM stdin;
1	2025-11-10 06:43:18.716	1970-01-01 00:00:00	t	2025-11-10 06:43:18.716	XNAT	t	f	f	\N	dicomObjectIdentifier	8104	\N	f	\N	\N	f
\.


--
-- Data for Name: xhbm_dicomscpinstance_whitelist; Type: TABLE DATA; Schema: public; Owner: xnat
--

COPY public.xhbm_dicomscpinstance_whitelist (scp_id, whitelist) FROM stdin;
\.


--
-- Data for Name: xhbm_direct_archive_session; Type: TABLE DATA; Schema: public; Owner: xnat
--

COPY public.xhbm_direct_archive_session (id, created, disabled, enabled, "timestamp", folder_name, last_built_date, location, message, name, prevent_anon, project, protocol, scan_date, scan_time, source, status, subject, tag, time_zone, timestamp_uid, upload_date, visit) FROM stdin;
\.


--
-- Data for Name: xhbm_event; Type: TABLE DATA; Schema: public; Owner: xnat
--

COPY public.xhbm_event (id, created, disabled, enabled, "timestamp", event_id, event_label) FROM stdin;
\.


--
-- Data for Name: xhbm_event_filters; Type: TABLE DATA; Schema: public; Owner: xnat
--

COPY public.xhbm_event_filters (id, filter_var, event_filters) FROM stdin;
\.


--
-- Data for Name: xhbm_event_filters_filter_vals; Type: TABLE DATA; Schema: public; Owner: xnat
--

COPY public.xhbm_event_filters_filter_vals (event_filters, filter_vals) FROM stdin;
\.


--
-- Data for Name: xhbm_event_service_filter_entity; Type: TABLE DATA; Schema: public; Owner: xnat
--

COPY public.xhbm_event_service_filter_entity (id, event_type, json_path_filter, name, node_filter_string, schedule, schedule_description, status) FROM stdin;
\.


--
-- Data for Name: xhbm_event_service_filter_entity_project_ids; Type: TABLE DATA; Schema: public; Owner: xnat
--

COPY public.xhbm_event_service_filter_entity_project_ids (event_service_filter_entity, project_ids) FROM stdin;
\.


--
-- Data for Name: xhbm_event_service_payload_entity; Type: TABLE DATA; Schema: public; Owner: xnat
--

COPY public.xhbm_event_service_payload_entity (id, compressed, payload) FROM stdin;
\.


--
-- Data for Name: xhbm_event_specific_fields; Type: TABLE DATA; Schema: public; Owner: xnat
--

COPY public.xhbm_event_specific_fields (id, field_name, field_val, event_specific_fields) FROM stdin;
\.


--
-- Data for Name: xhbm_event_tracking_data; Type: TABLE DATA; Schema: public; Owner: xnat
--

COPY public.xhbm_event_tracking_data (id, created, disabled, enabled, "timestamp", final_message, key, payload, succeeded, user_id) FROM stdin;
\.


--
-- Data for Name: xhbm_feature_definition; Type: TABLE DATA; Schema: public; Owner: xnat
--

COPY public.xhbm_feature_definition (id, created, disabled, enabled, "timestamp", banned, description, key, name, on_by_default) FROM stdin;
1	2025-11-10 06:42:52.354	1970-01-01 00:00:00	t	2025-11-10 06:42:52.354	f	(deprecated) Allows users to use to Tagged Uploader for additional files on MR Sessions.	tagged_upload	MR Tagged Upload	f
2	2025-11-10 06:42:52.36	1970-01-01 00:00:00	t	2025-11-10 06:42:52.36	f	Allows users to view and approve Quarantined uploads.	QuarantineReview	Quarantine Review	f
3	2025-11-10 06:42:52.367	1970-01-01 00:00:00	t	2025-11-10 06:42:52.367	f	Allows non QuarantineReview users to view the Resource Quarantine Tab on the project report.	ResourceQuarantine	Resource Quarantine	f
4	2025-11-10 06:42:52.369	1970-01-01 00:00:00	t	2025-11-10 06:42:52.369	f	Allows users to use to upload additional scans to an existing image session via 'Upload Scans'.	upload_scans	Upload Additional Scans	f
5	2025-11-10 06:42:52.373	1970-01-01 00:00:00	t	2025-11-10 06:42:52.373	f	Allows users to upload files to any level based on project pre-configuration.	configurable_resource_uploader	Configurable Resource Uploader	t
6	2025-11-10 06:42:52.376	1970-01-01 00:00:00	t	2025-11-10 06:42:52.376	f	Allows users to use the Manage Files dialog.	manage_files	File Manager	t
7	2025-11-10 06:42:52.378	1970-01-01 00:00:00	t	2025-11-10 06:42:52.378	f	Allows users to download data via the UI	data_download	Data Download	t
8	2025-11-10 06:42:52.38	1970-01-01 00:00:00	t	2025-11-10 06:42:52.38	f	Allows users to share data from one project to another.	project_sharing	Project Sharing	t
\.


--
-- Data for Name: xhbm_file_store_info; Type: TABLE DATA; Schema: public; Owner: xnat
--

COPY public.xhbm_file_store_info (id, created, disabled, enabled, "timestamp", checksum, coordinates, size, store_uri) FROM stdin;
\.


--
-- Data for Name: xhbm_file_store_info_aud; Type: TABLE DATA; Schema: public; Owner: xnat
--

COPY public.xhbm_file_store_info_aud (id, rev, revtype, checksum, coordinates, size, store_uri) FROM stdin;
\.


--
-- Data for Name: xhbm_group_feature; Type: TABLE DATA; Schema: public; Owner: xnat
--

COPY public.xhbm_group_feature (id, created, disabled, enabled, "timestamp", blocked, feature, group_id, on_by_default, tag) FROM stdin;
\.


--
-- Data for Name: xhbm_hardware_config_entity; Type: TABLE DATA; Schema: public; Owner: xnat
--

COPY public.xhbm_hardware_config_entity (id, created, disabled, enabled, "timestamp") FROM stdin;
\.


--
-- Data for Name: xhbm_hardware_constraint_entity; Type: TABLE DATA; Schema: public; Owner: xnat
--

COPY public.xhbm_hardware_constraint_entity (id, created, disabled, enabled, "timestamp", key, operator, hardware_entity_id) FROM stdin;
\.


--
-- Data for Name: xhbm_hardware_constraint_entity_constraint_values; Type: TABLE DATA; Schema: public; Owner: xnat
--

COPY public.xhbm_hardware_constraint_entity_constraint_values (hardware_constraint_entity, constraint_values) FROM stdin;
\.


--
-- Data for Name: xhbm_hardware_entity; Type: TABLE DATA; Schema: public; Owner: xnat
--

COPY public.xhbm_hardware_entity (id, created, disabled, enabled, "timestamp", cpu_limit, cpu_reservation, memory_limit, memory_reservation, name, hardware_config) FROM stdin;
\.


--
-- Data for Name: xhbm_hardware_entity_environment_variables; Type: TABLE DATA; Schema: public; Owner: xnat
--

COPY public.xhbm_hardware_entity_environment_variables (hardware_entity, key, value) FROM stdin;
\.


--
-- Data for Name: xhbm_hardware_entity_generic_resources; Type: TABLE DATA; Schema: public; Owner: xnat
--

COPY public.xhbm_hardware_entity_generic_resources (hardware_entity, name, value) FROM stdin;
\.


--
-- Data for Name: xhbm_hardware_scope_entity; Type: TABLE DATA; Schema: public; Owner: xnat
--

COPY public.xhbm_hardware_scope_entity (id, enabled, scope, hardware_config, scopes_key) FROM stdin;
\.


--
-- Data for Name: xhbm_hardware_scope_entity_ids; Type: TABLE DATA; Schema: public; Owner: xnat
--

COPY public.xhbm_hardware_scope_entity_ids (hardware_scope_entity, ids) FROM stdin;
\.


--
-- Data for Name: xhbm_host_info; Type: TABLE DATA; Schema: public; Owner: xnat
--

COPY public.xhbm_host_info (id, created, disabled, enabled, "timestamp", host_name) FROM stdin;
\.


--
-- Data for Name: xhbm_notification; Type: TABLE DATA; Schema: public; Owner: xnat
--

COPY public.xhbm_notification (id, created, disabled, enabled, "timestamp", parameter_format, parameters, definition) FROM stdin;
\.


--
-- Data for Name: xhbm_persistent_event; Type: TABLE DATA; Schema: public; Owner: xnat
--

COPY public.xhbm_persistent_event (id, created, disabled, enabled, "timestamp", entity_id, entity_type, event_id, external_id, src_event_class, user_id) FROM stdin;
\.


--
-- Data for Name: xhbm_preference; Type: TABLE DATA; Schema: public; Owner: xnat
--

COPY public.xhbm_preference (id, created, disabled, enabled, "timestamp", entity_id, name, scope, value, tool) FROM stdin;
1	2025-11-10 06:42:35.775	1970-01-01 00:00:00	t	2025-11-10 06:42:35.775		reactorWorkQueueDispatcherRingBufferSizePower	0	13	1
2	2025-11-10 06:42:35.801	1970-01-01 00:00:00	t	2025-11-10 06:42:35.801		defaultTimeout	0	-1	1
3	2025-11-10 06:42:35.812	1970-01-01 00:00:00	t	2025-11-10 06:42:35.812		allowCoreThreadTimeOut	0	true	1
4	2025-11-10 06:42:35.828	1970-01-01 00:00:00	t	2025-11-10 06:42:35.828		eventTrackingDataCleanupFrequency	0	24	1
5	2025-11-10 06:42:35.845	1970-01-01 00:00:00	t	2025-11-10 06:42:35.845		eventTrackingDataCleanupTtl	0	30	1
6	2025-11-10 06:42:35.862	1970-01-01 00:00:00	t	2025-11-10 06:42:35.862		corePoolSize	0	10	1
7	2025-11-10 06:42:35.876	1970-01-01 00:00:00	t	2025-11-10 06:42:35.876		maxPoolSize	0	2048	1
8	2025-11-10 06:42:35.892	1970-01-01 00:00:00	t	2025-11-10 06:42:35.892		keepAliveSeconds	0	60	1
9	2025-11-10 06:42:35.906	1970-01-01 00:00:00	t	2025-11-10 06:42:35.906		reactorWorkQueueDispatcherPoolSize	0	20	1
10	2025-11-10 06:42:37.116	1970-01-01 00:00:00	t	2025-11-10 06:42:37.116		enableCsrfToken	0	true	2
11	2025-11-10 06:42:37.144	1970-01-01 00:00:00	t	2025-11-10 06:42:37.144		uiDisplaySeriesDescription	0	true	2
12	2025-11-10 06:42:37.163	1970-01-01 00:00:00	t	2025-11-10 06:42:37.163		aliasTokenTimeout	0	2 days	2
13	2025-11-10 06:42:37.178	1970-01-01 00:00:00	t	2025-11-10 06:42:37.178		uiShowLeftBar	0	true	2
14	2025-11-10 06:42:37.189	1970-01-01 00:00:00	t	2025-11-10 06:42:37.189		defaultToSortedListings	0	true	2
15	2025-11-10 06:42:37.199	1970-01-01 00:00:00	t	2025-11-10 06:42:37.199		emailVerification	0	true	2
16	2025-11-10 06:42:37.215	1970-01-01 00:00:00	t	2025-11-10 06:42:37.215		requireChangeJustification	0	false	2
17	2025-11-10 06:42:37.229	1970-01-01 00:00:00	t	2025-11-10 06:42:37.229		maxFailedLoginsLockoutDuration	0	1 hour	2
18	2025-11-10 06:42:37.237	1970-01-01 00:00:00	t	2025-11-10 06:42:37.237		uiShowPrearchiveFileActions	0	true	2
19	2025-11-10 06:42:37.253	1970-01-01 00:00:00	t	2025-11-10 06:42:37.253		maxNumberOfSessionsForJobsWithSharedData	0	100000	2
20	2025-11-10 06:42:37.266	1970-01-01 00:00:00	t	2025-11-10 06:42:37.266		reloadPrearcDatabaseOnStartup	0	false	2
21	2025-11-10 06:42:37.275	1970-01-01 00:00:00	t	2025-11-10 06:42:37.275		passwordHistoryDuration	0	1 year	2
22	2025-11-10 06:42:37.291	1970-01-01 00:00:00	t	2025-11-10 06:42:37.291		siteWideAlertType	0	message	2
23	2025-11-10 06:42:37.304	1970-01-01 00:00:00	t	2025-11-10 06:42:37.304		allowNonAdminsToClaimUnassignedSessions	0	true	2
24	2025-11-10 06:42:37.316	1970-01-01 00:00:00	t	2025-11-10 06:42:37.316		uiShowLeftBarProjects	0	true	2
25	2025-11-10 06:42:37.332	1970-01-01 00:00:00	t	2025-11-10 06:42:37.332		requireImageAssessorLabels	0	false	2
26	2025-11-10 06:42:37.345	1970-01-01 00:00:00	t	2025-11-10 06:42:37.345		uiAllowPetTracerConfiguration	0	true	2
27	2025-11-10 06:42:37.362	1970-01-01 00:00:00	t	2025-11-10 06:42:37.362		uiPrearchiveHideArchiveBtn	0	false	2
28	2025-11-10 06:42:37.37	1970-01-01 00:00:00	t	2025-11-10 06:42:37.37		preventCrossModalityMerge	0	true	2
29	2025-11-10 06:42:37.379	1970-01-01 00:00:00	t	2025-11-10 06:42:37.379		sessionTimeoutMessage	0	Session timed out at TIMEOUT_TIME.	2
30	2025-11-10 06:42:37.388	1970-01-01 00:00:00	t	2025-11-10 06:42:37.388		adminEmail	0	admin@example.com	2
31	2025-11-10 06:42:37.422	1970-01-01 00:00:00	t	2025-11-10 06:42:37.422		dataPaths	0	['/xapi/**', '/data/**', '/REST/**', '/fs/**']	2
32	2025-11-10 06:42:37.432	1970-01-01 00:00:00	t	2025-11-10 06:42:37.432		uiAllowBlockedSubjectAssessorView	0	false	2
33	2025-11-10 06:42:37.441	1970-01-01 00:00:00	t	2025-11-10 06:42:37.441		separateSecondaryDicomOnArchive	0	true	2
34	2025-11-10 06:42:37.451	1970-01-01 00:00:00	t	2025-11-10 06:42:37.451		requireSaltedPasswords	0	false	2
35	2025-11-10 06:42:37.46	1970-01-01 00:00:00	t	2025-11-10 06:42:37.46		uiDisplayScanModality	0	false	2
36	2025-11-10 06:42:37.475	1970-01-01 00:00:00	t	2025-11-10 06:42:37.475		databaseUpdateRequiredWarning	0		2
37	2025-11-10 06:42:37.488	1970-01-01 00:00:00	t	2025-11-10 06:42:37.488		failMergeOn	0	[]	2
38	2025-11-10 06:42:37.499	1970-01-01 00:00:00	t	2025-11-10 06:42:37.499		siteWideAlertMessage	0		2
39	2025-11-10 06:42:37.509	1970-01-01 00:00:00	t	2025-11-10 06:42:37.509		htmlResourceRenderingWhitelist	0	['bmp', 'gif', 'jpeg', 'jpg', 'png', 'tiff', 'txt', 'xml']	2
40	2025-11-10 06:42:37.525	1970-01-01 00:00:00	t	2025-11-10 06:42:37.525		requireEventName	0	false	2
41	2025-11-10 06:42:37.536	1970-01-01 00:00:00	t	2025-11-10 06:42:37.536		uiAllowProjectDelete	0	true	2
42	2025-11-10 06:42:37.552	1970-01-01 00:00:00	t	2025-11-10 06:42:37.552		enableSitewideSeriesImportFilter	0	false	2
43	2025-11-10 06:42:37.564	1970-01-01 00:00:00	t	2025-11-10 06:42:37.564		securityMaxLoginInterval	0	1	2
44	2025-11-10 06:42:37.571	1970-01-01 00:00:00	t	2025-11-10 06:42:37.571		addCountFieldsToProjectListings	0	true	2
45	2025-11-10 06:42:37.582	1970-01-01 00:00:00	t	2025-11-10 06:42:37.582		concurrentMaxSessions	0	1000	2
46	2025-11-10 06:42:37.593	1970-01-01 00:00:00	t	2025-11-10 06:42:37.593		uiDisplaySeriesClass	0	false	2
47	2025-11-10 06:42:37.601	1970-01-01 00:00:00	t	2025-11-10 06:42:37.601		zipCompressionMethod	0	0	2
48	2025-11-10 06:42:37.609	1970-01-01 00:00:00	t	2025-11-10 06:42:37.609		siteDescriptionType	0	Text	2
49	2025-11-10 06:42:37.619	1970-01-01 00:00:00	t	2025-11-10 06:42:37.619		siteDescriptionText	0	Welcome to **XNAT**: You can change this site description by clicking the **Administer->Site Administration** menu option, and modifying the **Site Description** setting on the **Site Setup** tab.	2
50	2025-11-10 06:42:37.627	1970-01-01 00:00:00	t	2025-11-10 06:42:37.627		cachePath	0	/data/xnat/cache	2
51	2025-11-10 06:42:37.639	1970-01-01 00:00:00	t	2025-11-10 06:42:37.639		uiShowLeftBarBrowse	0	true	2
52	2025-11-10 06:42:37.655	1970-01-01 00:00:00	t	2025-11-10 06:42:37.655		securityChannel	0	any	2
53	2025-11-10 06:42:37.666	1970-01-01 00:00:00	t	2025-11-10 06:42:37.666		ipsThatCanSendEmailsThroughRest	0	^.*$	2
54	2025-11-10 06:42:37.675	1970-01-01 00:00:00	t	2025-11-10 06:42:37.675		checksums	0	false	2
55	2025-11-10 06:42:37.687	1970-01-01 00:00:00	t	2025-11-10 06:42:37.687		zipExtensions	0	zip,jar,rar,ear,gar,mrb	2
56	2025-11-10 06:42:37.696	1970-01-01 00:00:00	t	2025-11-10 06:42:37.696		passwordExpirationType	0	Interval	2
57	2025-11-10 06:42:37.704	1970-01-01 00:00:00	t	2025-11-10 06:42:37.704		mainPageSearchDatatypeOptions	0	['xnat:mrSessionData', 'xnat:petSessionData', 'xnat:ctSessionData']	2
58	2025-11-10 06:42:37.713	1970-01-01 00:00:00	t	2025-11-10 06:42:37.713		sitewideSeriesImportFilter	0		2
59	2025-11-10 06:42:37.721	1970-01-01 00:00:00	t	2025-11-10 06:42:37.721		siteLogoPath	0	/images/logo.png	2
60	2025-11-10 06:42:37.729	1970-01-01 00:00:00	t	2025-11-10 06:42:37.729		allowHtmlResourceRendering	0	false	2
61	2025-11-10 06:42:37.737	1970-01-01 00:00:00	t	2025-11-10 06:42:37.737		userRegistration	0	false	2
62	2025-11-10 06:42:37.745	1970-01-01 00:00:00	t	2025-11-10 06:42:37.745		passwordExpirationDate	0		2
63	2025-11-10 06:42:37.754	1970-01-01 00:00:00	t	2025-11-10 06:42:37.754		uiAllowScanAddition	0	true	2
64	2025-11-10 06:42:37.761	1970-01-01 00:00:00	t	2025-11-10 06:42:37.761		uiHideXnatUploadAssistantDownload	0	true	2
65	2025-11-10 06:42:37.769	1970-01-01 00:00:00	t	2025-11-10 06:42:37.769		siteLoginLanding	0	/screens/QuickSearch.vm	2
66	2025-11-10 06:42:37.776	1970-01-01 00:00:00	t	2025-11-10 06:42:37.776		uiShowRecentExptListScannerName	0	false	2
68	2025-11-10 06:42:37.797	1970-01-01 00:00:00	t	2025-11-10 06:42:37.797		uiAllowScanTypeModification	0	true	2
69	2025-11-10 06:42:37.809	1970-01-01 00:00:00	t	2025-11-10 06:42:37.809		securityLastModifiedInterval	0	1	2
70	2025-11-10 06:42:37.817	1970-01-01 00:00:00	t	2025-11-10 06:42:37.817		uiShowScanTypeMapping	0	true	2
71	2025-11-10 06:42:37.829	1970-01-01 00:00:00	t	2025-11-10 06:42:37.829		uiExptAllowLabelChange	0	true	2
72	2025-11-10 06:42:37.843	1970-01-01 00:00:00	t	2025-11-10 06:42:37.843		roleRepositoryService	0	org.nrg.xdat.security.services.impl.RoleRepositoryServiceImpl	2
74	2025-11-10 06:42:37.864	1970-01-01 00:00:00	t	2025-11-10 06:42:37.864		primaryAdminUsername	0	admin	2
75	2025-11-10 06:42:37.873	1970-01-01 00:00:00	t	2025-11-10 06:42:37.873		ftpPath	0	/data/xnat/ftp	2
76	2025-11-10 06:42:37.88	1970-01-01 00:00:00	t	2025-11-10 06:42:37.88		restrictUserListAccessToAdmins	0	false	2
77	2025-11-10 06:42:37.889	1970-01-01 00:00:00	t	2025-11-10 06:42:37.889		siteDescriptionPage	0	/screens/site_description.vm	2
78	2025-11-10 06:42:37.898	1970-01-01 00:00:00	t	2025-11-10 06:42:37.898		uiShowAdminManageSiteFeatures	0	true	2
79	2025-11-10 06:42:37.907	1970-01-01 00:00:00	t	2025-11-10 06:42:37.907		dicomFileNameTemplate	0	${StudyInstanceUID}-${SeriesNumber}-${InstanceNumber}-${HashSOPClassUIDWithSOPInstanceUID}	2
80	2025-11-10 06:42:37.915	1970-01-01 00:00:00	t	2025-11-10 06:42:37.915		sessionXmlRebuilderRepeat	0	60000	2
81	2025-11-10 06:42:37.923	1970-01-01 00:00:00	t	2025-11-10 06:42:37.923		uiDebugExtensionPoints	0	false	2
82	2025-11-10 06:42:37.933	1970-01-01 00:00:00	t	2025-11-10 06:42:37.933		imageSessionDisplayNamePlural	0	Sessions	2
83	2025-11-10 06:42:37.946	1970-01-01 00:00:00	t	2025-11-10 06:42:37.946		displayedUserIdentifierType	0	USERNAME	2
84	2025-11-10 06:42:37.959	1970-01-01 00:00:00	t	2025-11-10 06:42:37.959		uiDateTimeSecondsFormat	0	MM/dd/yyyy HH:mm:ss.SSS	2
85	2025-11-10 06:42:37.973	1970-01-01 00:00:00	t	2025-11-10 06:42:37.973		aliasTokenTimeoutSchedule	0	0 0 * * * *	2
86	2025-11-10 06:42:37.982	1970-01-01 00:00:00	t	2025-11-10 06:42:37.982		interactiveAgentIds	0	['.*MSIE.*', '.*Mozilla.*', '.*AppleWebKit.*', '.*Opera.*']	2
87	2025-11-10 06:42:37.99	1970-01-01 00:00:00	t	2025-11-10 06:42:37.99		maintainFileHistory	0	false	2
88	2025-11-10 06:42:37.998	1970-01-01 00:00:00	t	2025-11-10 06:42:37.998		triagePath	0		2
89	2025-11-10 06:42:38.006	1970-01-01 00:00:00	t	2025-11-10 06:42:38.006		passwordComplexityMessage	0	Password is not sufficiently complex.	2
90	2025-11-10 06:42:38.013	1970-01-01 00:00:00	t	2025-11-10 06:42:38.013		uiShowLeftBarFavorites	0	true	2
91	2025-11-10 06:42:38.021	1970-01-01 00:00:00	t	2025-11-10 06:42:38.021		emailVerificationMessage	0	Dear FULL_NAME,\n<br><br>We received a request to register an account for you on SITE_NAME. If you would like to register, please confirm your email address by clicking this link: <a href="VERIFICATION_URL">Verify Email</a>\n (This link will expire in 24 hours.)AUTO_ENABLE_TEXT<br><br>If you did not initiate this request, you can safely ignore this email.	2
92	2025-11-10 06:42:38.032	1970-01-01 00:00:00	t	2025-11-10 06:42:38.032		emailProjectAccessRequestToAdmin	0	true	2
93	2025-11-10 06:42:38.039	1970-01-01 00:00:00	t	2025-11-10 06:42:38.039		securityExternalUserParDisabled	0	false	2
94	2025-11-10 06:42:38.047	1970-01-01 00:00:00	t	2025-11-10 06:42:38.047		sessionArchiveTimeoutInterval	0	600	2
95	2025-11-10 06:42:38.056	1970-01-01 00:00:00	t	2025-11-10 06:42:38.056		pathErrorWarning	0		2
96	2025-11-10 06:42:38.063	1970-01-01 00:00:00	t	2025-11-10 06:42:38.063		csrfEmailAlert	0	false	2
97	2025-11-10 06:42:38.071	1970-01-01 00:00:00	t	2025-11-10 06:42:38.071		uiTimeFormat	0	HH:mm:ss	2
98	2025-11-10 06:42:38.081	1970-01-01 00:00:00	t	2025-11-10 06:42:38.081		showChangeJustification	0	false	2
99	2025-11-10 06:42:38.089	1970-01-01 00:00:00	t	2025-11-10 06:42:38.089		defaultProjectAutoArchiveSetting	0	4	2
100	2025-11-10 06:42:38.097	1970-01-01 00:00:00	t	2025-11-10 06:42:38.097		uiShowProjectManageFiles	0	true	2
101	2025-11-10 06:42:38.104	1970-01-01 00:00:00	t	2025-11-10 06:42:38.104		useSopInstanceUidToUniquelyIdentifyDicom	0	true	2
102	2025-11-10 06:42:38.111	1970-01-01 00:00:00	t	2025-11-10 06:42:38.111		featureService	0	org.nrg.xdat.security.services.impl.FeatureServiceImpl	2
103	2025-11-10 06:42:38.119	1970-01-01 00:00:00	t	2025-11-10 06:42:38.119		uiAllowMoreProjectInvestigators	0	true	2
104	2025-11-10 06:42:38.125	1970-01-01 00:00:00	t	2025-11-10 06:42:38.125		siteUrl	0		2
105	2025-11-10 06:42:38.133	1970-01-01 00:00:00	t	2025-11-10 06:42:38.133		passwordExpirationInterval	0	1 year	2
106	2025-11-10 06:42:38.143	1970-01-01 00:00:00	t	2025-11-10 06:42:38.143		uiLoginFailureMessage	0	Your login attempt failed because the username and password combination you provided was invalid or your user already has the maximum number of user sessions open. After %d failed login attempts, your user account will be locked. If you believe your account is currently locked, you can:<ul><li>Unlock it by resetting your password</li><li>Wait one hour for it to unlock automatically</li></ul>	2
108	2025-11-10 06:42:38.159	1970-01-01 00:00:00	t	2025-11-10 06:42:38.159		scanTypeMapping	0	true	2
109	2025-11-10 06:42:38.171	1970-01-01 00:00:00	t	2025-11-10 06:42:38.171		imageSessionDisplayNameSingular	0	Session	2
110	2025-11-10 06:42:38.179	1970-01-01 00:00:00	t	2025-11-10 06:42:38.179		uiAllowNonAdminProjectCreation	0	true	2
111	2025-11-10 06:42:38.187	1970-01-01 00:00:00	t	2025-11-10 06:42:38.187		receivedFileUser	0	admin	2
112	2025-11-10 06:42:38.196	1970-01-01 00:00:00	t	2025-11-10 06:42:38.196		defaultToPagedRestfulLists	0	false	2
113	2025-11-10 06:42:38.209	1970-01-01 00:00:00	t	2025-11-10 06:42:38.209		maxFailedLogins	0	20	2
114	2025-11-10 06:42:38.218	1970-01-01 00:00:00	t	2025-11-10 06:42:38.218		pipelinePath	0	/data/xnat/pipeline	2
115	2025-11-10 06:42:38.231	1970-01-01 00:00:00	t	2025-11-10 06:42:38.231		enableSitewideAnonymizationScript	0	true	2
116	2025-11-10 06:42:38.24	1970-01-01 00:00:00	t	2025-11-10 06:42:38.24		uiAllowSubjectCreateFromExptEdit	0	true	2
117	2025-11-10 06:42:38.248	1970-01-01 00:00:00	t	2025-11-10 06:42:38.248		uiShowRecentExptListDate	0	false	2
118	2025-11-10 06:42:38.29	1970-01-01 00:00:00	t	2025-11-10 06:42:38.29		par	0	true	2
119	2025-11-10 06:42:38.301	1970-01-01 00:00:00	t	2025-11-10 06:42:38.301		processingUrl	0		2
120	2025-11-10 06:42:38.308	1970-01-01 00:00:00	t	2025-11-10 06:42:38.308		requireLogin	0	true	2
121	2025-11-10 06:42:38.317	1970-01-01 00:00:00	t	2025-11-10 06:42:38.317		inactivityBeforeLockout	0	1 year	2
122	2025-11-10 06:42:38.325	1970-01-01 00:00:00	t	2025-11-10 06:42:38.325		fileOperationUsedForJobsWithSharedData	0	hard_link	2
123	2025-11-10 06:42:38.333	1970-01-01 00:00:00	t	2025-11-10 06:42:38.333		uiAllowQuarantine	0	true	2
124	2025-11-10 06:42:38.341	1970-01-01 00:00:00	t	2025-11-10 06:42:38.341		uiShowLeftBarSearch	0	true	2
125	2025-11-10 06:42:38.349	1970-01-01 00:00:00	t	2025-11-10 06:42:38.349		canResetFailedLoginsWithForgotPassword	0	true	2
126	2025-11-10 06:42:38.364	1970-01-01 00:00:00	t	2025-11-10 06:42:38.364		uiDateTimeFormat	0	yyyy-MM-dd HH:mm:ss	2
127	2025-11-10 06:42:38.375	1970-01-01 00:00:00	t	2025-11-10 06:42:38.375		uiExptAllowSubjectChange	0	true	2
128	2025-11-10 06:42:38.384	1970-01-01 00:00:00	t	2025-11-10 06:42:38.384		sessionXmlRebuilderInterval	0	5	2
107	2025-11-10 06:42:38.15	1970-01-01 00:00:00	t	2025-11-10 06:43:18.575		sitewidePetTracers	0	PIB\nFDG	2
130	2025-11-10 06:42:38.404	1970-01-01 00:00:00	t	2025-11-10 06:42:38.404		inactivityBeforeLockoutSchedule	0	0 0 1 * * ?	2
131	2025-11-10 06:42:38.413	1970-01-01 00:00:00	t	2025-11-10 06:42:38.413		sessionTimeout	0	15 minutes	2
132	2025-11-10 06:42:38.422	1970-01-01 00:00:00	t	2025-11-10 06:42:38.422		securityAllowNonPrivateProjects	0	true	2
133	2025-11-10 06:42:38.431	1970-01-01 00:00:00	t	2025-11-10 06:42:38.431		backupDeletedToCache	0	false	2
134	2025-11-10 06:42:38.441	1970-01-01 00:00:00	t	2025-11-10 06:42:38.441		roleService	0	org.nrg.xdat.security.services.impl.RoleServiceImpl	2
135	2025-11-10 06:42:38.451	1970-01-01 00:00:00	t	2025-11-10 06:42:38.451		enableDicomReceiver	0	true	2
136	2025-11-10 06:42:38.462	1970-01-01 00:00:00	t	2025-11-10 06:42:38.462		enableDicomReceiverPropertyChangedListener	0	org.nrg.dcm.DicomSCPSiteConfigurationListener	2
137	2025-11-10 06:42:38.472	1970-01-01 00:00:00	t	2025-11-10 06:42:38.472		prearchivePath	0	/data/xnat/prearchive	2
138	2025-11-10 06:42:38.482	1970-01-01 00:00:00	t	2025-11-10 06:42:38.482		passwordComplexity	0	^.*$	2
139	2025-11-10 06:42:38.491	1970-01-01 00:00:00	t	2025-11-10 06:42:38.491		archivePath	0	/data/xnat/archive	2
140	2025-11-10 06:42:38.499	1970-01-01 00:00:00	t	2025-11-10 06:42:38.499		buildPath	0	/data/xnat/build	2
141	2025-11-10 06:42:38.515	1970-01-01 00:00:00	t	2025-11-10 06:42:38.515		enabledProviders	0	['localdb']	2
142	2025-11-10 06:42:38.526	1970-01-01 00:00:00	t	2025-11-10 06:42:38.526		allowDataAdmins	0	true	2
143	2025-11-10 06:42:38.539	1970-01-01 00:00:00	t	2025-11-10 06:42:38.539		uiShowManageFiles	0	true	2
144	2025-11-10 06:42:38.546	1970-01-01 00:00:00	t	2025-11-10 06:42:38.546		passwordReuseRestriction	0	None	2
145	2025-11-10 06:42:38.555	1970-01-01 00:00:00	t	2025-11-10 06:42:38.555		matchSecurityProtocol	0	false	2
146	2025-11-10 06:42:38.562	1970-01-01 00:00:00	t	2025-11-10 06:42:38.562		siteWideAlertStatus	0	0	2
147	2025-11-10 06:42:38.569	1970-01-01 00:00:00	t	2025-11-10 06:42:38.569		uiExptAllowProjectChange	0	true	2
148	2025-11-10 06:42:38.58	1970-01-01 00:00:00	t	2025-11-10 06:42:38.58		displayHostName	0	multinode	2
149	2025-11-10 06:42:38.588	1970-01-01 00:00:00	t	2025-11-10 06:42:38.588		securityNewUserRegistrationDisabled	0	false	2
150	2025-11-10 06:42:38.597	1970-01-01 00:00:00	t	2025-11-10 06:42:38.597		securityLocalDbParRegistrationDisabled	0	false	2
151	2025-11-10 06:42:38.605	1970-01-01 00:00:00	t	2025-11-10 06:42:38.605		uiDateFormat	0	yyyy-MM-dd	2
152	2025-11-10 06:42:38.612	1970-01-01 00:00:00	t	2025-11-10 06:42:38.612		inboxPath	0	/data/xnat/inbox	2
153	2025-11-10 06:42:38.619	1970-01-01 00:00:00	t	2025-11-10 06:42:38.619		projectAllowAutoArchive	0	true	2
154	2025-11-10 06:42:38.626	1970-01-01 00:00:00	t	2025-11-10 06:42:38.626		resetFailedLoginsSchedule	0	0 0 * * * *	2
155	2025-11-10 06:42:38.634	1970-01-01 00:00:00	t	2025-11-10 06:42:38.634		uiHideCompressedUploaderUploadOption	0	false	2
156	2025-11-10 06:42:38.641	1970-01-01 00:00:00	t	2025-11-10 06:42:38.641		uiAllowAdvancedSearch	0	true	2
157	2025-11-10 06:42:38.648	1970-01-01 00:00:00	t	2025-11-10 06:42:38.648		featureRepositoryService	0	org.nrg.xdat.security.services.impl.FeatureRepositoryServiceImpl	2
158	2025-11-10 06:42:38.656	1970-01-01 00:00:00	t	2025-11-10 06:42:38.656		siteHomeLayout	0	/Index.vm	2
159	2025-11-10 06:42:38.663	1970-01-01 00:00:00	t	2025-11-10 06:42:38.663		siteLandingLayout	0	/Index.vm	2
160	2025-11-10 06:42:38.674	1970-01-01 00:00:00	t	2025-11-10 06:42:38.674		uiDefaultCompressedUploaderImporter	0	DICOM-zip	2
161	2025-11-10 06:42:38.683	1970-01-01 00:00:00	t	2025-11-10 06:42:38.683		uiHideDesktopClientDownload	0	false	2
162	2025-11-10 06:42:38.689	1970-01-01 00:00:00	t	2025-11-10 06:42:38.689		sitewideSeriesImportFilterMode	0	blacklist	2
163	2025-11-10 06:42:38.695	1970-01-01 00:00:00	t	2025-11-10 06:42:38.695		sitewidePetMr	0		2
164	2025-11-10 06:42:38.711	1970-01-01 00:00:00	t	2025-11-10 06:42:38.711		siteId	0	XNAT	2
165	2025-11-10 06:42:38.718	1970-01-01 00:00:00	t	2025-11-10 06:42:38.718		rerunProjectAnonOnRename	0	false	2
166	2025-11-10 06:42:38.724	1970-01-01 00:00:00	t	2025-11-10 06:42:38.724		uiNewUserRequireCaptcha	0	false	2
167	2025-11-10 06:42:38.735	1970-01-01 00:00:00	t	2025-11-10 06:42:38.735		uiAllowNewUserComments	0	true	2
168	2025-11-10 06:42:38.742	1970-01-01 00:00:00	t	2025-11-10 06:42:38.742		removeScanAggregateFields	0	false	2
169	2025-11-10 06:42:38.749	1970-01-01 00:00:00	t	2025-11-10 06:42:38.749		siteHome	0	/screens/QuickSearch.vm	2
170	2025-11-10 06:42:40.597	1970-01-01 00:00:00	t	2025-11-10 06:42:40.597		allowedPluginOpenUrls	0		3
171	2025-11-10 06:42:41.287	1970-01-01 00:00:00	t	2025-11-10 06:42:41.287		allowInsecureCookies	0	false	4
172	2025-11-10 06:42:46.807	1970-01-01 00:00:00	t	2025-11-10 06:42:46.807		emailMessageEmailAddressChangeRequest	0	<p>A request was made to change the email address for the user with username USER_USERNAME to NEW_EMAIL. If you did not make this request, someone else may have gotten access to your account and you should contact the site administrator: ADMIN_MAIL_LINK.</p>	5
173	2025-11-10 06:42:46.931	1970-01-01 00:00:00	t	2025-11-10 06:42:46.931		smtpProtocol	0	smtp	5
174	2025-11-10 06:42:46.94	1970-01-01 00:00:00	t	2025-11-10 06:42:46.94		smtpEnabled	0	true	5
175	2025-11-10 06:42:46.972	1970-01-01 00:00:00	t	2025-11-10 06:42:46.972		emailMessageSystemPathError	0	<p>The following system path errors have been discovered:\n<br>ERRORS_LIST</p>	5
176	2025-11-10 06:42:46.981	1970-01-01 00:00:00	t	2025-11-10 06:42:46.981		smtpPort	0	25	5
177	2025-11-10 06:42:46.991	1970-01-01 00:00:00	t	2025-11-10 06:42:46.991		smtpHostname	0	localhost	5
178	2025-11-10 06:42:46.998	1970-01-01 00:00:00	t	2025-11-10 06:42:46.998		emailMessageProjectAccessDenial	0	<p>We regret to inform you that your request to access the PROJECT_NAME project has been denied.  Please consult the project manager for additional details at USER_EMAIL.</p>\n<p>The SITE_NAME team.<br>\nSITE_LINK <br>\nADMIN_MAIL_LINK</p>	5
179	2025-11-10 06:42:47.013	1970-01-01 00:00:00	t	2025-11-10 06:42:47.013		emailAllowNonuserSubscribers	0	true	5
180	2025-11-10 06:42:47.023	1970-01-01 00:00:00	t	2025-11-10 06:42:47.023		copyAdminOnPageEmails	0	true	5
181	2025-11-10 06:42:47.035	1970-01-01 00:00:00	t	2025-11-10 06:42:47.035		emailMessageUploadByReferenceSuccess	0	<p>The upload by reference requested by USER_USERNAME has finished successfully.\n<br>DUPLICATES_LIST</p>	5
182	2025-11-10 06:42:47.043	1970-01-01 00:00:00	t	2025-11-10 06:42:47.043		notifyAdminPipelineEmails	0	true	5
183	2025-11-10 06:42:47.053	1970-01-01 00:00:00	t	2025-11-10 06:42:47.053		smtpStartTls	0	false	5
184	2025-11-10 06:42:47.061	1970-01-01 00:00:00	t	2025-11-10 06:42:47.061		emailMessagePipelineDefaultSuccess	0	<p>Dear USER_FIRSTNAME USER_LASTNAME,</p>\n <p>PIPELINE_NAME has completed without errors for EXPERIMENT_NAME.</p>\n <p>Details are available at SUCCESS_URL. <br>\nSITE_NAME team</p>	5
185	2025-11-10 06:42:47.072	1970-01-01 00:00:00	t	2025-11-10 06:42:47.072		suppressJMSFailureNotifications	0	false	5
186	2025-11-10 06:42:47.08	1970-01-01 00:00:00	t	2025-11-10 06:42:47.08		smtpSslTrust	0		5
187	2025-11-10 06:42:47.095	1970-01-01 00:00:00	t	2025-11-10 06:42:47.095		smtpPassword	0		5
188	2025-11-10 06:42:47.104	1970-01-01 00:00:00	t	2025-11-10 06:42:47.104		emailMessageAddressChanged	0	<p>Your email address was successfully changed to NEW_EMAIL.</p>	5
73	2025-11-10 06:42:37.856	1970-01-01 00:00:00	t	2025-11-10 06:57:53.265		initialized	0	false	2
189	2025-11-10 06:42:47.111	1970-01-01 00:00:00	t	2025-11-10 06:42:47.111		helpContactInfo	0		5
190	2025-11-10 06:42:47.118	1970-01-01 00:00:00	t	2025-11-10 06:42:47.118		emailMessageNewUserVerification	0	<p>USER_FIRSTNAME USER_LASTNAME, </p>\n<p>We received a request to register an account for you on XNAT. If you did not make this request, you can safely ignore this email. </p>\n<p>If you would like to register, please confirm your email address by clicking this link within the next 24 hours: VERIFY_URL </p>\n<p>ENABLED_MESSAGE</p>\n<p>To request a new email verification link, please click this link and select "Resend email verification": FORGOT_LOGIN_URL</p>	5
191	2025-11-10 06:42:47.125	1970-01-01 00:00:00	t	2025-11-10 06:42:47.125		emailMessagePipelineAutorunSuccess	0	<p>Dear USER_FIRSTNAME USER_LASTNAME,</p>\n <p>The following session was archived in SITE_NAME <ul style="list-style-type:none;"> <li> Project: PROJECT_NAME</li> <li>Subject: SUBJECT_NAME</li> <li>Session: EXPERIMENT_NAME</li> </ul><p>Additional details for this session are available SUCCESS_URL.\n<br>SITE_NAME team</p>	5
192	2025-11-10 06:42:47.133	1970-01-01 00:00:00	t	2025-11-10 06:42:47.133		emailMessageUserRegistration	0	<p>Dear USER_FIRSTNAME USER_LASTNAME,</p> <p>Welcome to the SITE_NAME Web Archive!</p> <p>You can now log on to the SITE_NAME at: SITE_LINK</p><p>Your username is: USER_USERNAME</p> <p>For support, contact the ADMIN_MAIL_LINK</p>	5
193	2025-11-10 06:42:47.15	1970-01-01 00:00:00	t	2025-11-10 06:42:47.15		emailMessageNewUserNotification	0	<p>New User Created</p>\n<ul style="list-style-type:none;"> <li>Time: TIME</li> <li>Site: SITE_NAME</li> <li>Host: SITE_LINK</li> <li>Username: USER_USERNAME</li> <li>First: USER_FIRSTNAME</li> <li>Last: USER_LASTNAME</li> <li>Phone: USER_PHONE</li> <li>Lab: LAB_NAME</li> <li>Email: USER_EMAIL</li> </ul><p>This account has been created and automatically enabled based on the current system configuration.</p>\nPROJECT_ACCESS_REQUESTS<p> REVIEW_LINK </p>\n<p>User Comments: USER_COMMENTS</p>	5
194	2025-11-10 06:42:47.167	1970-01-01 00:00:00	t	2025-11-10 06:42:47.167		emailMessageProjectRequestAccess	0	<p>Hello,</p>\n<p>We received a request to access the PROJECT_NAME project from a user on SITE_NAME as a(n) RQ_ACCESS_LEVEL. Granting this kind of access in this project will mean the user can LIST_PERMISSIONS</p>\n<p>Login: USER_USERNAME<br>\nEmail: USER_EMAIL<br>\nFirstname: USER_FIRSTNAME<br>\nLastname: USER_LASTNAME<br>Comments: RQA_COMMENTS<br>\nTo approve or deny this project access request, please click the following link: ACCESS_URL</p>\n<p>The SITE_NAME team.<br>\nSITE_LINK <br>\nADMIN_MAIL_LINK</p>	5
195	2025-11-10 06:42:47.178	1970-01-01 00:00:00	t	2025-11-10 06:42:47.178		emailMessageUnauthorizedDataAttempt	0	<p>Unauthorized access TYPE USER_DETAILS prevented</p>	5
196	2025-11-10 06:42:47.187	1970-01-01 00:00:00	t	2025-11-10 06:42:47.187		emailMessageInviteProjectAccess	0	<p>Hello,</p>\n<p>You have been invited to join the PROJECT_NAME project on SITE_NAME by USER_FIRSTNAME USER_LASTNAME. If you were not expecting to receive this invitation, you can safely ignore this email.\n</p><p>To accept this invitation and begin working in this project, please click the following link: ACCEPT_URL \n<br />\n<br /></p><p>The SITE_NAME team.\n<br />SITE_LINK \n<br />ADMIN_MAIL_LINK</p>	5
197	2025-11-10 06:42:47.199	1970-01-01 00:00:00	t	2025-11-10 06:42:47.199		smtpUsername	0		5
198	2025-11-10 06:42:47.214	1970-01-01 00:00:00	t	2025-11-10 06:42:47.214		emailMessageForgotPasswordReset	0	<p>Dear USER_FIRSTNAME USER_LASTNAME,</p>\n<p>Please click this link to reset your password: RESET_LINK</p> \n<p>This link will expire in 2 hours.</p>	5
199	2025-11-10 06:42:47.228	1970-01-01 00:00:00	t	2025-11-10 06:42:47.228		emailMessageDataAlertCustom	0	<p>Hello, </p> <p>USER_FIRSTNAME USER_LASTNAME thought you might be interested in a data set contained in the SITE_NAME. Please follow REQUEST_LINK to view the data.</p>\n<p>Message from sender:<br>\nSENDER_MESSAGE<br>\n</p> <p>This email was sent by the SITE_LINK data management system on TIME_SENT. If you have questions or concerns, please contact HELP_CONTACT</p>.	5
200	2025-11-10 06:42:47.237	1970-01-01 00:00:00	t	2025-11-10 06:42:47.237		notifyAdminSessionTransfer	0	true	5
201	2025-11-10 06:42:47.244	1970-01-01 00:00:00	t	2025-11-10 06:42:47.244		userEmailForReportProblem	0	false	5
202	2025-11-10 06:42:47.25	1970-01-01 00:00:00	t	2025-11-10 06:42:47.25		emailMessageNewUserRequest	0	<p>New User Request</p>\n<ul style="list-style-type:none;"> <li> Time: TIME</li> <li>Site: SITE_NAME</li> <li>Host: SITE_LINK</li> <li>Username: USER_USERNAME</li> <li>First: USER_FIRSTNAME</li> <li>Last: USER_LASTNAME</li> <li>Phone: USER_PHONE</li> <li>Lab: LAB_NAME</li> <li>Email: USER_EMAIL</li> </ul><p>This account has been created but will be disabled until you enable the account. You must log in before enabling the account.</p>\n<p>PROJECT_ACCESS_REQUESTS</p>\n<p> REVIEW_LINK </p>\n<p>User Comments: USER_COMMENTS</p>	5
203	2025-11-10 06:42:47.256	1970-01-01 00:00:00	t	2025-11-10 06:42:47.256		notifyAdminUserRegistration	0	false	5
204	2025-11-10 06:42:47.262	1970-01-01 00:00:00	t	2025-11-10 06:42:47.262		emailMessageErrorMessage	0	<p>Error Thrown:</p>\n <ul style="list-style-type:none;"> <li>Host: SITE_NAME</li> <li>User: USER_LOGIN (USER_USERNAME USER_LASTNAME)</li> <li>Time: ERROR_TIME</li> <li>Error: ERROR_MESSAGE</li> </ul>	5
205	2025-11-10 06:42:47.269	1970-01-01 00:00:00	t	2025-11-10 06:42:47.269		emailPrefix	0	XNAT	5
206	2025-11-10 06:42:47.275	1970-01-01 00:00:00	t	2025-11-10 06:42:47.275		emailMessageBatchWorkflowComplete	0	<p>Dear USER_FIRSTNAME USER_LASTNAME,</p>\n <p>The following batch procedure has been completed: \n<br>PROCESS_NAME </p>\n<p>NUMBER_MESSAGES successful transfer(s).\n<br>MESSAGES_LIST \n<br>ERRORS_LIST \n<br>Details for this project are available at SITE_LINK.</p>\n<p>The SITE_NAME team.<br>\nSITE_LINK <br>\n ADMIN_MAIL_LINK </p>	5
207	2025-11-10 06:42:47.281	1970-01-01 00:00:00	t	2025-11-10 06:42:47.281		notifyAdminProjectAccessRequest	0	true	5
208	2025-11-10 06:42:47.295	1970-01-01 00:00:00	t	2025-11-10 06:42:47.295		copyAdminOnNotifications	0	true	5
209	2025-11-10 06:42:47.304	1970-01-01 00:00:00	t	2025-11-10 06:42:47.304		smtpAuth	0	false	5
210	2025-11-10 06:42:47.315	1970-01-01 00:00:00	t	2025-11-10 06:42:47.315		emailMessagePipelineDefaultFailure	0	<p>The pipeline PIPELINE_NAME encountered an error.</p> <ul style="list-style-type:none;"> <li>Project: PROJECT_NAME</li> <li>Experiment: EXPERIMENT_NAME</li> <li>Pipeline Step: PIPELINE_STEP </li> </ul><p>The SITE_NAME technical team is aware of the issue and will notify you when it has been resolved.</p>\n <p>We appreciate your patience. Please contact CONTACT_EMAIL with questions or concerns.</p>\n<p>ATTACHMENTS_STATEMENT<br>\nPIPELINE_PARAMETERS<br>\nSTDOUT<br>\nSTDERR</p>	5
211	2025-11-10 06:42:47.322	1970-01-01 00:00:00	t	2025-11-10 06:42:47.322		emailMessageProjectAccessApproval	0	<p>Hello,</p>\n<p>You have been granted access to the PROJECT_NAME project as a member of the RQ_ACCESS_LEVEL group.</p>\n<p>To proceed to SITE_LINK and begin working with this project, please click the following link: ACCESS_URL</p>\n<p>The SITE_NAME team.<br>\nSITE_LINK <br>\nADMIN_MAIL_LINK </p>	5
212	2025-11-10 06:42:47.33	1970-01-01 00:00:00	t	2025-11-10 06:42:47.33		emailMessageVerifyEmailChangeRequest	0	<p>A request was made to change the email address for the user with username USER_USERNAME to this address. If you did not make this request, you can ignore this email. If you made this request and wish to have this change take effect, please log into your account and click CHANGE_EMAIL_LINK.</p>	5
213	2025-11-10 06:42:47.337	1970-01-01 00:00:00	t	2025-11-10 06:42:47.337		emailMessageForgotUsernameRequest	0	<p>You requested your username, which is: USER_USERNAME</p>\n <p>Please login to the site for additional user information SITE_LINK.</p>\n	5
214	2025-11-10 06:42:47.35	1970-01-01 00:00:00	t	2025-11-10 06:42:47.35		emailMessageUploadByReferenceFailure	0	<p>The upload by reference requested by USER_USERNAME has encountered an error.</p>\n <p>Please contact your IT staff or the application logs for more information.</p>	5
215	2025-11-10 06:42:47.363	1970-01-01 00:00:00	t	2025-11-10 06:42:47.363		emailMessageDisabledUserVerification	0	<p>Expired User Reverified</p>\n<ul style="list-style-type:none;"> <li>Date: DATE_INPUT</li> <li>Site: SITE_NAME</li> <li>Host: SITE_LINK</li> <li>Username: USER_USERNAME</li> <li>First: USER_FIRSTNAME</li> <li>Last: USER_LASTNAME</li></ul>ENABLED_MESSAGE	5
216	2025-11-10 06:42:52.09	1970-01-01 00:00:00	t	2025-11-10 06:42:52.09		purgeAndRefreshOnStartup	0	true	6
217	2025-11-10 06:42:52.472	1970-01-01 00:00:00	t	2025-11-10 06:42:52.472		internalScriptingEnabled	0	true	7
218	2025-11-10 06:42:52.515	1970-01-01 00:00:00	t	2025-11-10 06:42:52.515		fileStorePath	0	/data/xnat/fileStore	8
219	2025-11-10 06:42:52.553	1970-01-01 00:00:00	t	2025-11-10 06:42:52.553		allowAutoRunProjectOverride	0	false	9
220	2025-11-10 06:42:52.561	1970-01-01 00:00:00	t	2025-11-10 06:42:52.561		autoRunEnabled	0	false	9
221	2025-11-10 06:42:52.617	1970-01-01 00:00:00	t	2025-11-10 06:42:52.617		defaultAdminPassword	0	admin	10
222	2025-11-10 06:42:52.748	1970-01-01 00:00:00	t	2025-11-10 06:42:52.748		projectOwnerFormCreationEnabled	0	false	11
223	2025-11-10 06:42:52.756	1970-01-01 00:00:00	t	2025-11-10 06:42:52.757		customVariableMigrationEnabled	0	false	11
224	2025-11-10 06:42:54.34	1970-01-01 00:00:00	t	2025-11-10 06:42:54.34		enabled	0	false	12
67	2025-11-10 06:42:37.788	1970-01-01 00:00:00	t	2025-11-10 06:43:18.469		sitewideAnonymizationScript	0	//\n// Default XNAT anonymization script\n// XNAT http://www.xnat.org\n// Copyright (c) 2005-2017, Washington University School of Medicine and Howard Hughes Medical Institute\n// All Rights Reserved\n//\n// Released under the Simplified BSD.\n//\nversion "6.1"\nproject != "Unassigned" ? (0008,1030) := project\n(0010,0010) := subject\n(0010,0020) := session	2
129	2025-11-10 06:42:38.394	1970-01-01 00:00:00	t	2025-11-10 06:58:29.29		enableProjectsSeriesImportFilter	0		2
\.


--
-- Data for Name: xhbm_resource_survey_request; Type: TABLE DATA; Schema: public; Owner: xnat
--

COPY public.xhbm_resource_survey_request (id, created, disabled, enabled, "timestamp", closing_date, experiment_id, experiment_label, mitigation_report, mitigation_requester, project_id, request_time, requester, resource_id, resource_label, resource_uri, rsn_status, scan_description, scan_id, scan_label, subject_id, subject_label, survey_report, workflow_id, xsi_type) FROM stdin;
\.


--
-- Data for Name: xhbm_revinfo; Type: TABLE DATA; Schema: public; Owner: xnat
--

COPY public.xhbm_revinfo (rev, revtstmp) FROM stdin;
1	1762756998863
2	1762756998889
\.


--
-- Data for Name: xhbm_script; Type: TABLE DATA; Schema: public; Owner: xnat
--

COPY public.xhbm_script (id, created, disabled, enabled, "timestamp", content, description, language, script_id, script_label) FROM stdin;
\.


--
-- Data for Name: xhbm_script_aud; Type: TABLE DATA; Schema: public; Owner: xnat
--

COPY public.xhbm_script_aud (id, rev, revtype, content, description, language, script_id, script_label) FROM stdin;
\.


--
-- Data for Name: xhbm_script_launch_request_event; Type: TABLE DATA; Schema: public; Owner: xnat
--

COPY public.xhbm_script_launch_request_event (id) FROM stdin;
\.


--
-- Data for Name: xhbm_script_trigger; Type: TABLE DATA; Schema: public; Owner: xnat
--

COPY public.xhbm_script_trigger (id, created, disabled, enabled, "timestamp", association, description, event, script_id, src_event_class, trigger_id) FROM stdin;
\.


--
-- Data for Name: xhbm_script_trigger_template; Type: TABLE DATA; Schema: public; Owner: xnat
--

COPY public.xhbm_script_trigger_template (id, created, disabled, enabled, "timestamp", description, template_id) FROM stdin;
\.


--
-- Data for Name: xhbm_script_trigger_template_associated_entities; Type: TABLE DATA; Schema: public; Owner: xnat
--

COPY public.xhbm_script_trigger_template_associated_entities (script_trigger_template, associated_entities) FROM stdin;
\.


--
-- Data for Name: xhbm_script_trigger_template_triggers; Type: TABLE DATA; Schema: public; Owner: xnat
--

COPY public.xhbm_script_trigger_template_triggers (script_trigger_template, triggers) FROM stdin;
\.


--
-- Data for Name: xhbm_spawner_element; Type: TABLE DATA; Schema: public; Owner: xnat
--

COPY public.xhbm_spawner_element (id, created, disabled, enabled, "timestamp", description, element_id, label, namespace, restricted, yaml) FROM stdin;
103	2025-11-10 06:58:29.811	1970-01-01 00:00:00	t	2025-11-10 06:58:29.811		tabGroups	tabGroups	siteAdmin	\N	tabGroups:\n    xnatSetup: Site Settings\n    manageAccess: Manage Access\n    manageNotifications: Manage Notifications\n    manageData: Manage Data\n    processing: Processing\n    projectCustomization: Project Customization\n    advanced: Advanced XNAT Settings\n    other: Other\n\n\n
104	2025-11-10 06:58:29.827	1970-01-01 00:00:00	t	2025-11-10 06:58:29.827	The id used to refer to this site (also used to generate database ids). The Site ID must start with a letter and contain only letters, numbers and underscores. No spaces or non-alphanumeric characters.\n	siteId	Site ID	siteAdmin	\N	siteId:\n    kind: panel.input.text\n    name: siteId\n    label: Site ID\n    validation: id-strict max-length:24 onblur\n    description: >\n        The id used to refer to this site (also used to generate database ids).\n        The Site ID must start with a letter and contain only letters, numbers\n        and underscores. No spaces or non-alphanumeric characters.\n\n
105	2025-11-10 06:58:29.829	1970-01-01 00:00:00	t	2025-11-10 06:58:29.829		siteUrl	Site Url	siteAdmin	\N	siteUrl:\n    kind: panel.element\n    label: Site Url\n    info: >\n        <p>This should be a functional address (i.e. if the user pasted this address in their web browser, they should come to the site). You are required to guarantee that this address is functional for reaching the site.</p>\n        <p>Note: "localhost" only works if the web browser is located on the same machine. </p>\n    contents:\n        siteUrlInput:\n            kind: input.text\n            name: siteUrl\n            validation: url onblur\n            after: >\n                <p class="description">The address you want visible to users in emails, and other external links. Include http(s) protocol.</p>\n\n
106	2025-11-10 06:58:29.831	1970-01-01 00:00:00	t	2025-11-10 06:58:29.831		siteDescriptionPage	siteDescriptionPage	siteAdmin	\N	siteDescriptionPage:\n    tag: input|type=text|name=siteDescriptionPage|size=30|class=uri onblur|data-validate=uri onblur\n    after: >\n        <p class="description">Specify a velocity template file to display on the login page</p>\n\n
107	2025-11-10 06:58:29.834	1970-01-01 00:00:00	t	2025-11-10 06:58:29.834		siteDescriptionText	siteDescriptionText	siteAdmin	\N	siteDescriptionText:\n    tag: textarea|data-code-editor=html|data-code-language=html\n    element:\n        name: siteDescriptionText\n        rows: 8\n    after: >\n        <p class="description">Specify a simple text description of this site.</p>\n\n
108	2025-11-10 06:58:29.843	1970-01-01 00:00:00	t	2025-11-10 06:58:29.843		siteDescriptionType	Site Description	siteAdmin	\N	siteDescriptionType:\n    kind: panel.element\n    label: Site Description\n    info: >\n        <p>The site description will show up on the login page and can be utilized to describe the purpose of this\n        site, or notify users of important application status messages (ie. "The system is down for maintenance").</p>\n        <p>Administrators can opt to display a simple text message, or specify a velocity template reference containing\n        the content to be displayed.</p>\n    contents:\n        info:\n            tag: p\n            element:\n                style: "margin: 3px 0 8px 0;"\n            content: Select a site description option below\n        siteDescriptionTypePage:\n            kind: input.radio\n            name: siteDescriptionType\n            id: siteDescriptionTypePage\n            value: Page\n            after: >\n                <label class="pad5h" for="siteDescriptionTypePage">Page</label>\n        siteDescriptionTypeText:\n            kind: input.radio\n            name: siteDescriptionType\n            id: siteDescriptionTypeText\n            value: Text\n            after: >\n                <label class="pad5h" for="siteDescriptionTypeText">Text (Markdown)</label>\n        pagePath:\n            tag: div.input-bundle.page\n            contents:\n                ${siteDescriptionPage}\n        pageText:\n            tag: div.input-bundle.text\n            contents:\n                ${siteDescriptionText}\n        siteInfoJs:\n            tag: script|src=/scripts/xnat/admin/siteInfo.js\n\n
109	2025-11-10 06:58:29.845	1970-01-01 00:00:00	t	2025-11-10 06:58:29.845		siteLogo	Site Logo Path	siteAdmin	\N	siteLogo:\n    kind: panel.element\n    label: Site Logo Path\n    info: >\n        <p>The site log should be specified by its path within the web application. The default XNAT site logo is\n        located at <b>/images/logo.png</b>. The maximum recommended size for a logo is 240w x 120h.</p>\n        <p><b>Note:</b> Your logo can be located at any path within the web application, but, for it to be available to\n        be displayed to users who are not logged in, that path must be an <i>open URL</i> in the XNAT security\n        configuration. The <b>/images</b> folder and its descendants are already configured as open URLs.</p>\n    contents:\n        siteLogoPath:\n            kind: input.text\n            placeholder: /images/logo.png\n            validation: uri onblur\n            after: >\n                <p class="description">The path to the file to be used as the site logo.</p>\n\n
110	2025-11-10 06:58:29.846	1970-01-01 00:00:00	t	2025-11-10 06:58:29.846	The page users will land on immediately after logging in.	siteLoginLanding	Site Login Landing	siteAdmin	\N	siteLoginLanding:\n    kind: panel.input.text\n    name: siteLoginLanding\n    label: Site Login Landing\n    validation: uri onblur\n    description: "The page users will land on immediately after logging in."\n\n
111	2025-11-10 06:58:29.847	1970-01-01 00:00:00	t	2025-11-10 06:58:29.847		siteLandingLayout	Site Landing Layout	siteAdmin	\N	siteLandingLayout:\n    kind: panel.input.text\n    name: siteLandingLayout\n    label: Site Landing Layout\n\n
112	2025-11-10 06:58:29.85	1970-01-01 00:00:00	t	2025-11-10 06:58:29.85	The page users will land on by clicking the XNAT logo in the menu bar.	siteHome	Site Home	siteAdmin	\N	siteHome:\n    kind: panel.input.text\n    name: siteHome\n    label: Site Home\n    validation: uri onblur\n    description: "The page users will land on by clicking the XNAT logo in the menu bar."\n\n
113	2025-11-10 06:58:29.852	1970-01-01 00:00:00	t	2025-11-10 06:58:29.852		siteHomeLayout	Site Home Layout	siteAdmin	\N	siteHomeLayout:\n    kind: panel.input.text\n    name: siteHomeLayout\n    label: Site Home Layout\n\n
114	2025-11-10 06:58:29.854	1970-01-01 00:00:00	t	2025-11-10 06:58:29.854	The address to be used for processing. If this is left blank, pipelines will use the site URL. If your pipelines need to connect to an internal URL, different from your external site URL, provide one here.\n	processingUrl	Processing Url	siteAdmin	\N	processingUrl:\n    kind: panel.input.text\n    name: processingUrl\n    label: Processing Url\n    validation: allow-empty url onblur\n    description: >\n        The address to be used for processing. If this is left blank, pipelines will use the site\n        URL. If your pipelines need to connect to an internal URL, different from your external\n        site URL, provide one here.\n\n\n
115	2025-11-10 06:58:29.858	1970-01-01 00:00:00	t	2025-11-10 06:58:29.858		adminEmail	Site Admin Email	siteAdmin	\N	adminEmail:\n    kind: panel.element\n    label: Site Admin Email\n    info: >\n        <p>This address will receive frequent emails on system events, such as errors, processing completion, new user registration and so on. </p>\n        <p>Additional emails for specific notification types can be configured on the Notifications tab.</p>\n    contents:\n        adminEmailInput:\n            kind: input.email\n            name: adminEmail\n            validation: email onblur\n            after: >\n                <p class="description">The administrative email account to receive system emails.</p>\n\n
116	2025-11-10 06:58:29.86	1970-01-01 00:00:00	t	2025-11-10 06:58:29.86	The login name of an enabled and valid user with site administrator privileges. This field must be valid for proper system functioning.\n	primaryAdminUsername	Primary Admin Username	siteAdmin	\N	primaryAdminUsername:\n    kind: panel.input.text\n    name: primaryAdminUsername\n    label: Primary Admin Username\n    validation: id-strict max-length:40 onblur\n    placeholder: User account to use when performing system functions\n    description: >\n        The login name of an enabled and valid user with site administrator privileges. This field must be valid for proper system functioning.\n\n
117	2025-11-10 06:58:29.864	1970-01-01 00:00:00	t	2025-11-10 06:58:29.864		siteInfo	Site Information	siteAdmin	\N	siteInfo:\n    kind: panel.form\n    name: siteInfo\n    label: Site Information\n    method: POST\n    contentType: json\n    url: /xapi/siteConfig\n    contents:\n        ${siteId}\n        ${siteUrl}\n        ${siteDescriptionType}\n        ${siteLogo}\n        ${siteLoginLanding}\n        ${siteHome}\n\n
118	2025-11-10 06:58:29.868	1970-01-01 00:00:00	t	2025-11-10 06:58:29.868		adminInfo	Admin Information	siteAdmin	\N	adminInfo:\n    kind: panel.form\n    name: adminInfo\n    label: Admin Information\n    method: POST\n    contentType: json\n    url: /xapi/siteConfig\n    contents:\n        ${adminEmail}\n        ${primaryAdminUsername}\n\n\n\n
119	2025-11-10 06:58:29.871	1970-01-01 00:00:00	t	2025-11-10 06:58:29.871	If set to "Restricted", the site is more secure, but this restricts project owners from being able to administer users in their projects directly.\n	generalSecuritySettings	General Site Security Settings	siteAdmin	\N	generalSecuritySettings:\n    kind: panel.form\n    name: generalSecuritySettings\n    label: General Site Security Settings\n    method: POST\n    contentType: json\n    url: /xapi/siteConfig\n    contents:\n        securityChannel:\n            kind: panel.element\n            label: Security Channel\n            info: >\n                <p>If you're using another service for SSL termination, including a front-end proxy such as Apache HTTPD\n                or nginx, or a load balancer such as AWS elastic load balancing, you should leave the security channel\n                set to "any".</p>\n                <p>For more information, see <a target="_blank" href="https://wiki.xnat.org/documentation/xnat-administration/xnat-security-settings-in-the-admin-ui">our documentation page</a>.</p>\n            contents:\n                securityChannelMenu:\n                    kind: select.menu\n                    name: securityChannel\n                    options:\n                        any: Any\n                        http: http\n                        https: https\n                    after: >\n                        <p class="description">Set the http/s protocol used to access your XNAT installation</p>\n        restrictUserListAccessToAdmins:\n            kind: panel.input.switchbox\n            name: restrictUserListAccessToAdmins\n            label: "Restrict user list access <br>to site administrators"\n            onText: Restricted\n            offText: Not Restricted\n            description: >\n                If set to "Restricted", the site is more secure, but this restricts project owners from being able to\n                administer users in their projects directly.\n        uiAllowNonAdminProjectCreation:\n            kind: panel.input.switchbox\n            label: "Allow non-administrators <br>to create projects"\n            onText: Allow\n            offText: Do Not Allow\n            description: >\n                If set to "Do Not Allow", the site is more secure, but this can make it more difficult for\n                regular users to create new projects for their research efforts.\n        allowNonAdminsToClaimUnassignedSessions:\n            kind: panel.input.switchbox\n            name: allowNonAdminsToClaimUnassignedSessions\n            label: "Allow non-administrators <br>to find and claim <br>unassigned sessions"\n            onText: Allow\n            offText: Do Not Allow\n            description: >\n                Setting this to "Do Not Allow" removes the "Find My Study" feature for non-administrators. But it can also make it harder for users to get their\n                data into XNAT and increase the burden on site administrators.\n        displayHostName:\n            kind: panel.select.single\n            name: displayHostName\n            label: Display host name in footer\n            options:\n                always: "Always"\n                multinode: "When multinode"\n                never: "Never"\n            description: >\n                When set to <b>Always</b> the host name is always displayed even in a single-server deployment.\n                When set to <b>Multinode</b>, the host name is only displayed when XNAT nodes detect a multi-server configuration.\n                When set to <b>Never</b>, the host name is not displayed.\n        renderHtmlResources:\n            kind: panel.input.switchbox\n            label: Resource Rendering\n            name: allowHtmlResourceRendering\n            onText: Allow\n            offText: Do Not Allow\n            description: >\n                Setting this to "Allow" will mean that resources specified in the whitelist below\n                will be rendered by your web browser. Rendering includes execution of any code that might be present. See note for details.\n        renderHtmlResourceTypePanel:\n            tag: div#html-resource-options\n            contents:\n                htmlResourceRenderingWhitelist:\n                    kind: panel.element\n                    label: Resource Rendering Whitelist\n                    contents:\n                        htmlResourceRenderingWhitelistInput:\n                            kind: textarea.list\n                            name: htmlResourceRenderingWhitelist\n                            delim: ','\n                            after: >\n                                <p class="description">\n                                List all allowed resource file extensions, separated by commas (ex: "png, jpg, gif").\n                                You can use a single <code>*</code> item to allow all file extensions. Supported mime types are listed in the article listed above:\n                                <a href="https://wiki.xnat.org/documentation/xnat-administration/how-to-restrict-rendering-of-xnat-resources" target="_new">How To Restrict Rendering of XNAT Resources</a>.\n                                </p>\n\n                securitySettingsScript:\n                    tag: script|src=/scripts/xnat/admin/securitySettings.js\n\n        ipsThatCanSendEmailsThroughRest:\n            kind: panel.element\n            label: Email-enabled IP Addresses\n            info: >\n                <p>By default this is set to allow all IPs but should be changed so that malicious users do not use your XNAT server to send phishing emails.</p>\n            contents:\n                ipsThatCanSendEmailsThroughRestInput:\n                    kind: input.text\n                    name: ipsThatCanSendEmailsThroughRest\n                    after: >\n                        <p class="description">This must be a regular expression (do not include bounding '/' characters) which matches\n                        trusted IPs from which users or pipelines should be able to send emails via an XNAT REST call.</p>\n                    validation: "!pattern:^/"\n                    element:\n                        data:\n                            message: Please do not include bounding "/" characters in your regex pattern.\n\n
120	2025-11-10 06:58:29.873	1970-01-01 00:00:00	t	2025-11-10 06:58:29.873	If required, then only registered users will be able to access your site. If not required, anyone visiting your site will automatically be logged in as 'guest' with access to public data.\n	userAuthenticationSettings	User Authentication Settings	siteAdmin	\N	userAuthenticationSettings:\n    kind: panel.form\n    name: userAuthenticationSettings\n    label: User Authentication Settings\n    method: POST\n    url: /xapi/siteConfig\n    contentType: json\n    contents:\n        requireLogin:\n            kind: panel.input.switchbox\n            name: requireLogin\n            label: Require User Login\n            onText: Required\n            offText: Not Required\n            description: >\n                If required, then only registered users will be able to access your site. If not required, anyone\n                visiting your site will automatically be logged in as 'guest' with access to public data.\n        enabledProviders:\n            kind: panel.input.textList\n            label: Enabled Authentication Providers\n            description: >\n                Specifies the authentication providers that are currently enabled on the XNAT server. "localdb" refers to the default XNAT provider.\n        securityNewUserRegistrationDisabled:\n            kind: panel.input.switchbox\n            name: securityNewUserRegistrationDisabled\n            label: Hide User Registration Options\n            onText: Registration DISABLED on Home Page\n            offText: Registration Enabled on Home Page\n            description: >\n                If set to TRUE, user registration via localdb is hidden on the home page.\n        securityLocalDbParRegistrationDisabled:\n            kind: panel.input.switchbox\n            name: securityLocalDbParRegistrationDisabled\n            label: Disable Local DB Project Access Requests\n            onText: PARs DISABLED for localDB\n            offText: PARs Enabled for localDB\n            description: >\n                If set to TRUE, project access requests cannot be sent to create new accounts via XNAT's default localdb authentication provider\n        securityExternalUserParDisabled:\n            kind: panel.input.switchbox\n            name: securityExternalUserParDisabled\n            label: Disable External Project Access Requests\n            onText: PARs DISABLED for External Authentication Methods\n            offText: PARs Enabled for External Authentication Methods\n            description: >\n                If set to TRUE, project access requests cannot be sent to create new accounts via external authentication providers, i.e. LDAP.\n\n\n
121	2025-11-10 06:58:29.875	1970-01-01 00:00:00	t	2025-11-10 06:58:29.875	Interval for timing out user sessions. Uses <a target="_blank" href="http://www.postgresql.org/docs/9.0/static/functions-datetime.html">PostgreSQL interval notation</a>.\n	userLoginsSessionControls	User Logins / Session Controls	siteAdmin	\N	userLoginsSessionControls:\n    kind: panel.form\n    name: userLoginsSessionControls\n    label: User Logins / Session Controls\n    method: POST\n    url: /xapi/siteConfig\n    contentType: json\n    contents:\n        userSessionSubhead:\n            kind: panel.subhead\n            text: User Session Controls\n        sessionTimeout:\n            kind: panel.input.text\n            name: sessionTimeout\n            label: User Session Timeout\n            validation: interval onblur\n            description: >\n                Interval for timing out user sessions. Uses\n                <a target="_blank" href="http://www.postgresql.org/docs/9.0/static/functions-datetime.html">PostgreSQL interval notation</a>.\n        aliasTokenTimeout:\n            kind: panel.input.text\n            name: aliasTokenTimeout\n            label: Alias Token Timeout\n            validation: interval onblur\n            description: >\n                Interval for timing out alias tokens. Uses\n                <a target="_blank" href="http://www.postgresql.org/docs/9.0/static/functions-datetime.html">PostgreSQL interval notation</a>.\n        aliasTokenTimeoutSchedule:\n            kind: panel.input.text\n            name: aliasTokenTimeoutSchedule\n            label: Alias Token Timeout Schedule\n            validation: cron onblur\n            description: >\n                How often to check alias tokens for timeout (0 0 * * * * means it runs every hour). Uses basic\n                <a target="_blank" href="https://docs.spring.io/spring-framework/reference/integration/scheduling.html#scheduling-cron-expression">Cron notation</a> (lists and ranges aren't supported).\n        sessionTimeoutMessage:\n            kind: panel.textarea\n            name: sessionTimeoutMessage\n            label: Session Timeout Message\n            code: html\n            description: Alert message provided to users after a session timeout. TIMEOUT_TIME will be replaced by the timeout time.\n        maximumConcurrentSessions:\n            kind: panel.input.number\n            name: concurrentMaxSessions\n            label: Maximum Concurrent Sessions\n            validation: integer gte:1 onblur\n            description: The maximum number of permitted sessions a user can have open simultaneously. Tomcat restart required to take effect.\n        loginFailureSubhead:\n            kind: panel.subhead\n            text: Managing Failed Logins\n        loginFailureMessage:\n            kind: panel.textarea\n            name: uiLoginFailureMessage\n            label: Login Failure Message\n            code: html\n            description: Text to show when a user fails to login. "%d" is replaced by the count of failed logins.\n        maximumFailedLogins:\n            kind: panel.input.number\n            name: maxFailedLogins\n            label: Maximum Failed Logins\n            validation: integer gte:-1 lte:9999 !eq:0 onblur\n            description: Number of failed login attempts before accounts are temporarily locked. (-1 disables feature)\n        failedLoginLockoutDuration:\n            kind: panel.input.text\n            name: maxFailedLoginsLockoutDuration\n            label: Failed Logins Lockout Duration\n            validation: interval onblur\n            description: >\n                Interval of time to lock user accounts that have exceeded the max_failed_logins count. Uses\n                <a target="_blank" href="http://www.postgresql.org/docs/9.0/static/functions-datetime.html">PostgreSQL interval notation</a>.\n        resetFailedLoginsSchedule:\n            kind: panel.input.text\n            name: resetFailedLoginsSchedule\n            label: Reset Failed Logins Schedule\n            validation: cron onblur\n            description: >\n                How often to check if the Failed Logins Lockout Duration time has expired so locked out users can be allowed to log in again (0 0 * * * * means it runs every hour). Uses basic\n                <a target="_blank" href="https://docs.spring.io/spring-framework/reference/integration/scheduling.html#scheduling-cron-expression">Cron notation</a> (lists and ranges aren't supported).\n        canResetFailedLoginsWithForgotPassword:\n            kind: panel.input.switchbox\n            name: canResetFailedLoginsWithForgotPassword\n            label: Reset failed login count on forgot password\n            onText: Enabled\n            offText: Disabled\n            description: >\n                If set to "Enabled", a locked out user will be able to request a forgot password email\n                and click the link from that email to change their password and unlock their account.\n        userLockoutSettings:\n            kind: panel.subhead\n            text: User Lockout Settings\n        userInactivityLockout:\n            kind: panel.input.text\n            name: inactivityBeforeLockout\n            label: User Inactivity Lockout\n            validation: interval onblur\n            description: >\n                Interval of inactivity before a user account is disabled. Uses\n                <a target="_blank" href="http://www.postgresql.org/docs/9.0/static/functions-datetime.html">PostgreSQL interval notation</a>.\n        inactivityBeforeLockoutSchedule:\n            kind: panel.input.text\n            name: inactivityBeforeLockoutSchedule\n            label: Inactivity Lockout Schedule\n            validation: cron onblur\n            description: >\n                How often to check user accounts for inactivity (0 0 1 * * * means it runs at 1AM every day). Uses basic\n                <a target="_blank" href="https://docs.spring.io/spring-framework/reference/integration/scheduling.html#scheduling-cron-expression">Cron notation</a> (lists and ranges aren't supported).\n        userClientIdentificationSubhead:\n            kind: panel.subhead\n            text: User Client Identification\n        interactiveAgentIds:\n            kind: panel.input.textList\n            size: 60\n            name: interactiveAgentIds\n            delim: ","\n            label: Interactive Agent IDs\n            placeholder: .*MSIE.*, .*Mozilla.*, .*AppleWebKit.*, .*Opera.*\n            description: >\n                Regular-expression patterns that define user-agent header values that indicate whether a particular\n                request comes from an interactive agent (e.g. a browser) or some other kind of tool, such as curl or other\n                scriptable or automatable client. Separate multiple agent IDs with commas.\n        dataPaths:\n            kind: panel.element\n            label: Data Paths\n            info: >\n                <p>XNAT uses these paths in conjunction with the interactive agent IDs above to determine the response to certain calls. For\n                example, instead of simply returning a "404 Not Found" error when an inaccessible resource is indicated,\n                a call to a data path by a browser may be redirected to the login page. </p>\n            contents:\n                dataPathsInput:\n                    kind: input.textList\n                    size: 60\n                    name: dataPaths\n                    delim: ","\n                    placeholder: /xapi/**, /data/**, /REST/**, /fs/**\n                    after: >\n                        <p class="description">URL patterns that represent data paths (e.g. REST API calls). Separate multiple data paths with commas.\n                        Uses <a target="_blank" href="https://ant.apache.org/manual/dirtasks.html">Apache Ant Pattern Notation</a></p>\n\n
122	2025-11-10 06:58:29.877	1970-01-01 00:00:00	t	2025-11-10 06:58:29.877		passwordExpirationInterval	Password Expiration (Interval)	siteAdmin	\N	passwordExpirationInterval:\n    kind: input.text\n    name: passwordExpirationInterval\n    label: Password Expiration (Interval)\n    validation: interval onblur\n    after: >\n        <p class="description">Interval of time after which unchanged passwords expire and users have to change them.\n        Uses <a target="_blank" href="http://www.postgresql.org/docs/9.0/static/functions-datetime.html">PostgreSQL interval notation</a>.</p>\n\n
123	2025-11-10 06:58:29.879	1970-01-01 00:00:00	t	2025-11-10 06:58:29.879		passwordExpirationDate	Password Expiration (Date)	siteAdmin	\N	passwordExpirationDate:\n    kind: input.text\n    name: passwordExpirationDate\n    label: Password Expiration (Date)\n    validation: allow-empty date-iso onblur\n    after: >\n        <span id="datePicker">&nbsp;&nbsp;\n        <span id="openCal-passwordExpirationDate" class="fa fa-calendar"></span>\n        <br>\n        <p class="description">Expire passwords that were last changed before this date and require those users to change them.</p>\n        </span>\n\n
124	2025-11-10 06:58:29.881	1970-01-01 00:00:00	t	2025-11-10 06:58:29.881	Must be a valid regular expression. Do not include bounding '/' characters.	passwords	Passwords	siteAdmin	\N	passwords:\n    kind: panel.form\n    name: passwords\n    label: Passwords\n    method: POST\n    url: /xapi/siteConfig\n    contentType: json\n    contents:\n        passwordComplexity:\n            kind: panel.input.text\n            name: passwordComplexity\n            label: Password Complexity\n            description: Must be a valid regular expression. Do not include bounding '/' characters.\n            validation: "!pattern:^/"\n            element:\n                data:\n                    message: Please do not include bounding "/" characters in your regex pattern.\n        passwordComplexityMessage:\n            kind: panel.textarea\n            name: passwordComplexityMessage\n            label: Password Complexity Message\n            code: html\n        passwordExpiration:\n            kind: panel.element\n            label: Password Expiration\n            info: >\n                <p>A <b>password expiration interval</b> specifies the length of time users have before they must change their passwords (Specified in <a target="_blank" href="http://www.postgresql.org/docs/9.0/static/functions-datetime.html">PostgreSQL interval notation</a>).</p><p>Alternatively, a <b>password expiration date</b> can be configured to expire passwords that were last changed before it. This is useful for purging access to obsolete accounts.</p>\n            contents:\n                info:\n                    tag: p\n                    element:\n                        style: "margin: 3px 0 8px 0;"\n                    content: Select a password expiration type below\n                passwordExpirationTypeDisabled:\n                    kind: input.radio\n                    id: passwordExpirationTypeDisabled\n                    name: passwordExpirationType\n                    value: Disabled\n                    after: >\n                        <label class="pad5h" for="passwordExpirationTypeDisabled">Disabled</label>\n                passwordExpirationTypeInterval:\n                    kind: input.radio\n                    id: passwordExpirationTypeInterval\n                    name: passwordExpirationType\n                    value: Interval\n                    after: >\n                        <label class="pad5h" for="passwordExpirationTypeInterval">Interval</label>\n                passwordExpirationTypeDate:\n                    kind: input.radio\n                    id: passwordExpirationTypeDate\n                    name: passwordExpirationType\n                    value: Date\n                    after: >\n                        <label class="pad5h" for="passwordExpirationTypeDate">Date</label>\n                passwordExpirationInterval:\n                    tag: div.input-bundle.interval\n                    contents:\n                        ${passwordExpirationInterval}\n                passwordExpirationDate:\n                    tag: div.input-bundle.date\n                    contents:\n                        ${passwordExpirationDate}\n        passwordReuseRestriction:\n            kind: panel.select.single\n            id: password-reuse-restriction\n            name: passwordReuseRestriction\n            label: Password Reuse Restriction\n            options:\n                None: None\n                Historical: Historical\n            description: >\n                If set to "Historical", users cannot reuse a password that was previously used within a defined duration of time\n        passwordHistoryDuration:\n            kind: panel.input.text\n            id: password-history-duration\n            name: passwordHistoryDuration\n            label: Password History\n            validation: interval onblur\n            description: >\n                Interval for which users cannot reuse an old password of theirs. Uses <a target="_blank" href="http://www.postgresql.org/docs/9.0/static/functions-datetime.html">PostgreSQL interval notation</a>.\n        passwordsjs:\n            tag: script|src=/scripts/xnat/admin/passwords.js\n\n\n
125	2025-11-10 06:58:29.883	1970-01-01 00:00:00	t	2025-11-10 06:58:29.883	If set to "Required" (highly recommended), all POST, PUT, and DELETE requests will require a token to prevent CSRF attacks\n	csrf	CSRF	siteAdmin	\N	csrf:\n    kind: panel.form\n    name: csrf\n    label: CSRF\n    method: POST\n    url: /xapi/siteConfig\n    contentType: json\n    contents:\n        enableCsrfToken:\n            kind: panel.input.switchbox\n            name: enableCsrfToken\n            label: Require CSRF Token\n            onText: Required\n            offText: Not Required\n            description: >\n                If set to "Required" (highly recommended), all POST, PUT, and DELETE requests will require a token to prevent CSRF attacks\n        csrfEmailAlert:\n            kind: panel.input.switchbox\n            name: csrfEmailAlert\n            label: CSRF Email Alert\n            onText: Enabled\n            offText: Disabled\n            description: >\n                If enabled, this site will email the site admin whenever a CSRF attack is attempted\n\n\n\n
126	2025-11-10 06:58:29.888	1970-01-01 00:00:00	t	2025-11-10 06:58:29.888	This setting must be enabled in order for your XNAT to send notification emails.\n	emailServerSettings	Mail Server Settings	siteAdmin	\N	emailServerSettings:\n    kind: panel.form\n    method: POST\n    contentType: json\n    url: /xapi/notifications\n    name: emailServerSettings\n    label: Mail Server Settings\n    contents:\n        emailSettingsWarning:\n            tag: div.message\n            element:\n                style:\n                    marginBottom: 24px\n                html: >\n                    XNAT relies on its mail servers to send messages to its users as well as to alert admins when certain events happen. In addition, a properly configured mail server is necessary for users to be able to get sent links to reset their password when they forget it.\n\n        smtpEnabled:\n            kind: panel.input.switchbox\n            label: Enable SMTP\n            onText: Enabled\n            offText: Disabled\n            description: >\n                This setting must be enabled in order for your XNAT to send notification emails.\n\n        serverSettings:\n            kind: panel.subhead\n            text: Server\n        smtpHostname:\n            kind: panel.input.text\n            label: Host\n            placeholder: localhost\n        smtpPort:\n            kind: panel.input.number\n            label: Port\n            placeholder: 25\n            validation: allow-empty integer\n        smtpProtocol:\n            kind: panel.input.text\n            label: Protocol\n            placeholder: smtp\n\n        authentication:\n            kind: panel.subhead\n            text: Authentication\n        smtpAuth:\n            kind: panel.input.switchbox\n            label: SMTP Auth\n            onText: Enabled\n            offText: Disabled\n        smtpUsername:\n            kind: panel.input.text\n            label: Username\n        smtpPassword:\n            kind: panel.input.password\n            label: Password\n\n        otherSettings:\n            kind: panel.subhead\n            text: Other Settings\n        smtpStartTls:\n            kind: panel.input.switchbox\n            label: Start TLS\n            onText: Enabled\n            offText: Disabled\n        smtpSslTrust:\n            kind: panel.input.text\n            label: SSL Trust\n        emailPrefix:\n            kind: panel.input.text\n            label: Email Prefix\n            placeholder: XNAT\n\n\n
127	2025-11-10 06:58:29.892	1970-01-01 00:00:00	t	2025-11-10 06:58:29.892	Enter your message text here. You can use HTML to enter links or add emphasis as needed.	siteWideAlerts	Site-wide Alerts	siteAdmin	\N	siteWideAlerts:\n    kind: panel.form\n    name: siteWideAlerts\n    label: Site-wide Alerts\n    method: POST\n    contentType: json\n    url: /xapi/siteConfig\n    contents:\n        siteWideAlertInfo:\n            tag: div.message\n            element:\n                style:\n                    marginBottom: 24px\n                html: >\n                    <p>This panel can be used to create a notification banner that will be visible for all site visitors and logged-in users.\n                    You can determine whether the banner is visible only on the login page, or on all site pages.</p>\n                    <p>There are three stylistic treatments: </p>\n                    <ul>\n                        <li>"message" is informational</li>\n                        <li>"alert" calls attention to critical info, such as scheduled maintenance downtime</li>\n                        <li>"error" calls attention to severe info, such as a known bug or broken functionality</li>\n                    </ul>\n\n        siteWideAlertStatus:\n            kind: panel.select.single\n            name: siteWideAlertStatus\n            label: Enable Alert Message\n            options:\n                "0": "Off"\n                1: "On (Login Page Only)"\n                2: "On (Login and Site Header)"\n            element:\n                title: Enable Alert Message\n\n        siteWideAlertMessage:\n            kind: panel.textarea\n            name: siteWideAlertMessage\n            label: Alert Message\n            code: html\n            description: Enter your message text here. You can use HTML to enter links or add emphasis as needed.\n\n        siteWideAlertType:\n            kind: panel.select.single\n            name: siteWideAlertType\n            label: Alert Type\n            description: "Default: Alert"\n            options:\n                message:\n                    label: Message\n                    value: message\n                alert:\n                    label: Alert\n                    value: alert\n                error:\n                    label: Error\n                    value: error\n            element:\n                title: Select Alert Type\n\n\n
128	2025-11-10 06:58:29.894	1970-01-01 00:00:00	t	2025-11-10 06:58:29.894	Email address used for general help contact information in outgoing emails and pipeline notifications\n	notifications	Notification Options	siteAdmin	\N	notifications:\n    kind: panel.form\n    name: notifications\n    label: Notification Options\n    url: /xapi/notifications\n    method: POST\n    contentType: json\n    contents:\n        helpContactInfo:\n            kind: panel.input.email\n            label: "Help Contact Info"\n            validation: allow-empty email onblur\n            description: >\n                Email address used for general help contact information in outgoing emails and pipeline notifications\n\n\n        emailAllowNonuserSubscribers:\n            kind: panel.element\n            label: "Allow Nonuser Subscribers"\n            info: >\n                <p>The notification email addresses defined in this panel, and as the site admin email, can potentially be sent to any email address.</p>\n                <p>This setting determines whether this site should allow notifications to be sent to email addresses that do not belong to valid users of this XNAT site. If set to \\"Do Not Allow\\", the site is more secure from exploitation as a spam relay, but restricts the addresses that can be used when alerting administrators to system events.</p>\n            contents:\n                emailAllowNonuserSubscribersInput:\n                    kind: select.single\n                    name: emailAllowNonuserSubscribers\n                    options:\n                        true: Allow\n                        false: Do Not Allow\n                    after: >\n                        <p class="description">If set to "Allow", site notifications can be sent to email addresses other than those belonging to users of this XNAT site</p>\n\n        emailRecipientErrorMessages:\n            kind: panel.input.email\n            label: "Error Messages"\n            name: "emailRecipientErrorMessages"\n            description: "What email address(es) should receive error emails. Separate multiple email addresses with commas. If empty, emails will be sent to the site administrator email address."\n            size: 50\n            validation: allow-empty emails onblur\n        emailRecipientIssueReports:\n            kind: panel.input.email\n            label: "Issue Reports"\n            name: "emailRecipientIssueReports"\n            description: "What email address(es) should receive issue reports. Separate multiple email addresses with commas. If empty, emails will be sent to the site administrator email address."\n            size: 50\n            validation: allow-empty emails onblur\n        userEmailForReportProblem:\n            kind: panel.input.switchbox\n            name: userEmailForReportProblem\n            label: "Issue Reports Sender"\n            onText: Reporter\n            offText: Admin\n            description: "If reporter, issue report emails will be sent from the email of the reporting user as opposed to the admin email (default)."\n        emailRecipientNewUserAlert:\n            kind: panel.input.email\n            label: "New User Alert"\n            name: "emailRecipientNewUserAlert"\n            description: "What email address(es) should receive New User Registration emails. Separate multiple email addresses with commas. If empty, emails will be sent to the site administrator email address."\n            size: 50\n            validation: allow-empty emails onblur\n        emailRecipientUpdate:\n            kind: panel.input.email\n            label: "Updates"\n            name: "emailRecipientUpdate"\n            description: "What email address(es) should receive update emails. Separate multiple email addresses with commas. If empty, emails will be sent to the site administrator email address."\n            size: 50\n            validation: allow-empty emails onblur\n        copyAdminOnNotifications:\n            kind: panel.input.switchbox\n            name: copyAdminOnNotifications\n            label: "Copy Administrator on Notifications"\n            onText: Enabled\n            offText: Disabled\n            description: "If enabled, the primary administrator will receive a copy of error, issue, new user, and update notifications."\n        suppressJMSFailureNotifications:\n            kind: panel.input.switchbox\n            name: suppressJMSFailureNotifications\n            label: "Suppress JMS Error email notifications"\n            onText: Suppress Notifications\n            offText: Allow Notifications\n            description: "JMS errors are always entered in the logs. This setting determines whether JMS errors should also trigger a notification email, or whether those emails should be suppressed."\n\n
129	2025-11-10 06:58:29.896	1970-01-01 00:00:00	t	2025-11-10 06:58:29.896	Toggle which email template appears in the panel below	notificationEmails	Notification Emails	siteAdmin	\N	notificationEmails:\n    kind: panel.form\n    name: notificationEmails\n    label: Notification Emails\n    url: /xapi/notifications\n    method: POST\n    contentType: json\n    contents:\n        notificationsDocumentationNote:\n            tag: div.message\n            element:\n                style:\n                    marginBottom: 24px\n                html: >\n                    Each of these system notifications are sent to users based on various actions. Each notification email has a set of usable shortcodes, such as "USER_USERNAME". For help with system notifications, see <a href="https://wiki.xnat.org/documentation/xnat-administration/notifications-and-alerts-in-xnat">Notifications and Alerts in XNAT.</a>\n        notificationEmailSelector:\n            kind: panel.select.single\n            name: notificationEmailSelector\n            id: notification-email-selector\n            label: Select Email Template\n            description: Toggle which email template appears in the panel below\n        notificationScript:\n            tag: script|src=/scripts/xnat/admin/notificationManagement.js\n        notificationEmailContainer:\n            tag: div\n            element:\n                id: notification-email-container\n            contents:\n                emailMessageUserRegistration:\n                    kind: panel.textarea\n                    label: "User Registration"\n                    code: html\n                    description: >\n                        Text of message emailed to users upon registration. Link for email validation is auto-populated. Available shortcodes:<br>\n                        USER_FIRSTNAME - The first name of the user who will be sent the message.<br>\n                        USER_LASTNAME - The last name of the user who will be sent the message.<br>\n                        SITE_NAME - The name of the xnat site.<br>\n                        SITE_LINK - The link to the xnat site.<br>\n                        USER_USERNAME - The username of the new user.<br>\n                        ADMIN_MAIL_LINK - The link to email the site admin.\n\n                emailMessageForgotUsernameRequest:\n                    kind: panel.textarea\n                    label: "Forgot Username Request"\n                    code: html\n                    description: >\n                        Text of message emailed to users upon lost username request. Available shortcodes: <br>\n                        USER_USERNAME - The requested username <br>\n                        SITE_LINK - The link to the xnat site.\n\n                emailMessageForgotPasswordReset:\n                    kind: panel.textarea\n                    label: "Password Reset"\n                    code: html\n                    description: >\n                        Text of message emailed to users upon lost password reset. Link for password reset is auto-populated. Available shortcodes: <br>\n                        USER_FIRSTNAME - The first name of the user receiving the password reset. <br>\n                        USER_LASTNAME - The last name of the user receiving the password reset. <br>\n                        RESET_LINK - The link used to reset the password.\n\n                emailMessageNewUserVerification:\n                    kind: panel.textarea\n                    label: "New User Verification"\n                    code: html\n                    description: >\n                        Text of the message emailed to users to verify a new user account. Available shortcodes: <br>\n                        USER_FIRSTNAME - The new user's first name. <br>\n                        USER_LASTNAME - The new user's last name. <br>\n                        VERIFY_URL - The URL used to verify the new account. <br>\n                        ENABLED_MESSAGE - A message indicating whether the user account is now enabled, includes a login link. <br>\n                        FORGOT_LOGIN_URL - The URL used if the user has forgotten their login information.\n\n                emailMessageProjectRequestAccess:\n                    kind: panel.textarea\n                    label: "Project Access Request"\n                    code: html\n                    description: >\n                        Text of the message sent out when a user requests access to a project. Available shortcodes: <br>\n                        PROJECT_NAME - The name of the project the user is attempting to access. <br>\n                        SITE_NAME - The name of the xnat site. <br>\n                        RQ_ACCESS_LEVEL - The level of access (member, collaborator, etc.) that is being requested. <br>\n                        LIST_PERMISSIONS - The permissions associated with the level requested. <br>\n                        USER_USERNAME - The username of the requesting user. <br>\n                        USER_EMAIL - The email of the requesting user. <br>\n                        USER_FIRSTNAME - The first name of the requesting user. <br>\n                        USER_LASTNAME - The last name of the requesting user. <br>\n                        RQA_COMMENTS - The comments that the user attached to their request. <br>\n                        ACCESS_URL - The URL used to respond to the access request. <br>\n                        SITE_LINK - The link to the xnat site. <br>\n                        ADMIN_MAIL_LINK - The link to email the site admin.\n\n                emailMessageProjectAccessApproval:\n                    kind: panel.textarea\n                    label: "Project Access Approval"\n                    code: html\n                    description: >\n                        Text of the message sent out when a user's project access is approved. Available shortcodes: <br>\n                        PROJECT_NAME - The name of the project. <br>\n                        RQ_ACCESS_LEVEL - The level of access (member, collaborator, etc.) that is being granted. <br>\n                        ACCESS_URL - The URL used to access the project. <br>\n                        SITE_LINK - The link to the xnat site. <br>\n                        SITE_NAME - The name of the xnat site. <br>\n                        ADMIN_MAIL_LINK - The link to email the site admin.\n\n                emailMessageProjectAccessDenial:\n                    kind: panel.textarea\n                    label: "Project Access Denial"\n                    code: html\n                    description: >\n                        Text of the message sent out when a user's project access is denied. Available shortcodes: <br>\n                        PROJECT_NAME - The name of the project for which access was requested. <br>\n                        USER_EMAIL - The email of the project manager. <br>\n                        SITE_LINK - The link to the xnat site. <br>\n                        SITE_NAME - The name of the xnat site. <br>\n                        ADMIN_MAIL_LINK - The link to email the site admin.\n\n                emailMessageInviteProjectAccess:\n                    kind: panel.textarea\n                    label: "Project Access Invitation"\n                    code: html\n                    description: >\n                        Text of the email sent out when a user is invited to join a project. Available shortcodes: <br>\n                        PROJECT_NAME - The name of the project. <br>\n                        USER_FIRSTNAME - The first name of the user extending the invitation. <br>\n                        USER_LASTNAME - The last name of the user extending the invitation. <br>\n                        ACCEPT_URL - The URL to be used to accept the invitation to join the project. <br>\n                        SITE_LINK - The link to the xnat site. <br>\n                        SITE_NAME - The name of the xnat site. <br>\n                        ADMIN_MAIL_LINK - The link to email the site admin.\n\n                emailMessageDisabledUserVerification:\n                    kind: panel.textarea\n                    label: "Disabled User Verification"\n                    code: html\n                    description: >\n                        Text of the message sent out when a previously disabled user account is verified and reactivated. Available shortcodes: <br>\n                        DATE_INPUT - The date on which the user was re-verified. <br>\n                        SITE_NAME - The name of the xnat site. <br>\n                        SITE_LINK - The link to the xnat site. <br>\n                        USER_USERNAME - The username of the re-verified user. <br>\n                        USER_FIRSTNAME - The first name of the re-verified user. <br>\n                        USER_LASTNAME - The last name of the re-verified user. <br>\n                        ENABLED_MESSAGE - A message indicating whether the user account is now enabled, includes a login link.\n\n                emailMessageErrorMessage:\n                    kind: panel.textarea\n                    label: "Error Occurred"\n                    code: html\n                    description: >\n                        Text of the message sent out when an error has occurred within the system. Available shortcodes: <br>\n                        SITE_NAME - The name of the xnat site. <br>\n                        USER_LOGIN - The login information for the user associated with the error. <br>\n                        USER_FIRSTNAME - The first name of the associated with the error. <br>\n                        USER_LASTNAME - The last name of the associated with the error. <br>\n                        ERROR_TIME - The time of the error. <br>\n                        ERROR_MESSAGE - The error message.\n\n                emailMessageNewUserNotification:\n                    kind: panel.textarea\n                    label: "New User Notification"\n                    code: html\n                    description: >\n                        Text of the message sent out when a new user account registration has been created. Available shortcodes: <br>\n                        TIME - The time of user creation. <br>\n                        SITE_NAME - The name of the xnat site.  <br>\n                        SITE_LINK - The link to the xnat site. <br>\n                        USER_USERNAME - The username of the new user. <br>\n                        USER_FIRSTNAME - The first name of the new user. <br>\n                        USER_LASTNAME - The last name of the new user. <br>\n                        USER_PHONE - The phone number of the new user. <br>\n                        LAB_NAME - The name of the lab the new user is under. <br>\n                        USER_EMAIL - The email address of the new user. <br>\n                        PROJECT_ACCESS_REQUESTS - Projects for which the new user has access requests (blank if none). <br>\n                        REVIEW_LINK - The link used to accept or deny the request. <br>\n                        USER_COMMENTS - The comments provided to the administrator by the new user.\n\n                emailMessageNewUserRequest:\n                    kind: panel.textarea\n                    label: "New User Request"\n                    code: html\n                    description: >\n                        Text of the message sent out when a new user account is created but has not yet been enabled. Available shortcodes: <br>\n                        TIME - The time of user creation. <br>\n                        SITE_NAME - The name of the xnat site. <br>\n                        SITE_LINK - The link to the xnat site. <br>\n                        USER_USERNAME - The username of the new user. <br>\n                        USER_FIRSTNAME - The first name of the new user. <br>\n                        USER_LASTNAME - The last name of the new user. <br>\n                        USER_PHONE - The phone number of the new user. <br>\n                        LAB_NAME - The name of the lab the new user is under. <br>\n                        USER_EMAIL - The email address of the new user. <br>\n                        PROJECT_ACCESS_REQUESTS - Projects for which the new user has access requests (blank if none) <br>\n                        REVIEW_LINK - The link used to accept or deny the request. <br>\n                        USER_COMMENTS - The comments provided to the administrator by the new user.\n\n                emailMessagePipelineDefaultSuccess:\n                    kind: panel.textarea\n                    label: "Pipeline Success"\n                    code: html\n                    description: >\n                        Text of the message sent out when an experiment pipeline has completed successfully without errors. Available shortcodes: <br>\n                        USER_FIRSTNAME - The first name of the contacted user. <br>\n                        USER_LASTNAME - The last name of the contacted user. <br>\n                        PIPELINE_NAME - The name of the pipeline. <br>\n                        EXPERIMENT_NAME - The name of the experiment on which the pipeline ran. <br>\n                        SUCCESS_URL - Link for details on the pipeline run. <br>\n                        SITE_NAME - The name of the xnat site.\n\n                emailMessagePipelineDefaultFailure:\n                    kind: panel.textarea\n                    label: "Pipeline Failure"\n                    code: html\n                    description: >\n                        Text of the message sent out when an experiment pipeline fails before completion due to error. Available shortcodes: <br>\n                        PIPELINE_NAME - The name of the pipeline. <br>\n                        PROJECT_NAME - The name of the project in which the pipeline failed. <br>\n                        EXPERIMENT_NAME - The name of the experiment on which the pipeline failed. <br>\n                        PIPELINE_STEP - The step at which the pipeline failed. <br>\n                        SITE_NAME - The name of the xnat site. <br>\n                        CONTACT_EMAIL - The email at which a user can contact the site team for help. <br>\n                        ATTACHMENTS_STATEMENT - Other information about the pipeline failures if applicable. <br>\n                        PIPELINE_PARAMETERS - The parameters of the specific pipeline run. </br>\n                        STDOUT - The stdout of the pipeline error. <br>\n                        STDERR - The stderr of the pipeline error.\n\n                emailMessagePipelineAutorunSuccess:\n                    kind: panel.textarea\n                    label: "Pipeline Autorun Success"\n                    code: html\n                    description: >\n                        Text of the message sent out when an automated pipeline is run successfully and a session is archived in the system. Available shortcodes: <br>\n                        USER_FIRSTNAME - The first name of the contacted user. <br>\n                        USER_LASTNAME - The last name of the contacted user. <br>\n                        SITE_NAME - The name of the xnat site. <br>\n                        PROJECT_NAME - The name of the project in which the pipeline ran. <br>\n                        SUBJECT_NAME - The name of the subject on which the pipeline ran. <br>\n                        EXPERIMENT_NAME - The name of the experiment on which the pipeline ran. <br>\n                        SUCCESS_URL - Link for details on the pipeline run.\n\n                emailMessageBatchWorkflowComplete:\n                    kind: panel.textarea\n                    label: "Batch Transfer Complete"\n                    code: html\n                    description: >\n                        Text of the message when a batch data transfer to the archive has been successfully completed. Available shortcodes: <br>\n                        USER_FIRSTNAME - The first name of the contacted user. <br>\n                        USER_LASTNAME - The last name of the contacted user. <br>\n                        PROCESS_NAME - The name of the process that has been completed. <br>\n                        NUMBER_MESSAGES - Number of messages transferred. <br>\n                        MESSAGES_LIST - List of transferred messages. <br>\n                        ERRORS_LIST - List of any errors that occurred during the transfer. <br>\n                        SITE_LINK - The link to the xnat site. <br>\n                        SITE_NAME - The name of the xnat site. <br>\n                        ADMIN_MAIL_LINK - The link to email the site admin.\n\n                emailMessageUnauthorizedDataAttempt:\n                    kind: panel.textarea\n                    label: "Unauthorized Data Attempt"\n                    code: html\n                    description: >\n                        Text of the message sent when one of several types of unauthorized data or login access attempts are recognized by the system. Available shortcodes: <br>\n                        TYPE - The type of data attempt. <br>\n                        USER_DETAILS - The details on the user who attempted to access the data (if known and applicable).\n\n                emailMessageEmailAddressChangeRequest:\n                    kind: panel.textarea\n                    label: "Email Change Request"\n                    code: html\n                    description: >\n                        Text of the message sent to alert a user that someone has requested to change the email for the account associated with that email address. Available shortcodes: <br>\n                        USER_USERNAME - The username of the account. <br>\n                        NEW_EMAIL - The new email for the account. <br>\n                        ADMIN_MAIL_LINK - The link to email the site admin.\n\n                emailMessageVerifyEmailChangeRequest:\n                    kind: panel.textarea\n                    label: "Verify Email Change Request"\n                    code: html\n                    description: >\n                        Text of the message sent to a new email address for a user to verify the change made to the account's associated email. Available shortcodes: <br>\n                        USER_USERNAME - The username of the account. <br>\n                        CHANGE_EMAIL_LINK - The link to change the email address.\n\n                emailMessageAddressChanged:\n                    kind: panel.textarea\n                    label: "Email Address Successfully Changed"\n                    code: html\n                    description: >\n                        Text of the message sent to both the former and new email address associated with an account to alert the user that the email has successfully been changed. <br>\n                        NEW_EMAIL - The new email address for the account.\n\n                emailMessageSystemPathError:\n                    kind: panel.textarea\n                    label: "System Path Error"\n                    code: html\n                    description: >\n                        Text of the message sent when XNAT is unable to find the filesystem (e.g,, archive, build, prearchive directories). Available shortcodes: <br>\n                        ERRORS_LIST - The list of the errors that have been found.\n\n                emailMessageUploadByReferenceSuccess:\n                    kind: panel.textarea\n                    label: "Upload By Reference Success"\n                    code: html\n                    description: >\n                        Text of the message sent when a user has uploaded a file or files to the system by reference. Available shortcodes: <br>\n                        USER_USERNAME - The user who requested the upload. <br>\n                        DUPLICATES_LIST - The list of the duplicate files (if applicable).\n\n                emailMessageUploadByReferenceFailure:\n                    kind: panel.textarea\n                    label: "Upload By Reference Failure"\n                    code: html\n                    description: >\n                        Text of the message sent when a user has attempted to upload a file or files to the system by reference but the process failed. Available shortcodes: <br>\n                        USER_USERNAME - The user who requested the upload.\n\n                emailMessageDataAlertCustom:\n                    kind: panel.textarea\n                    label: "Data Alert Custom Email"\n                    code: html\n                    description: >\n                        Text of the message sent out by from one user to another to alert them of possibly useful data. Available shortcodes: <br>\n                        USER_FIRSTNAME - The first name of the user who initiates the message. <br>\n                        USER_LASTNAME- The last name of the user who initiates the message. <br>\n                        SITE_NAME - The name of the xnat site. <br>\n                        REQUEST_LINK - The link the user can follow to view the data. <br>\n                        SENDER_MESSAGE - The message sent by the user alongside the data alert. <br>\n                        SITE_LINK - The link to the xnat site. <br>\n                        TIME_SENT - The time at which the information was sent. <br>\n                        HELP_CONTACT - Email address at which help can be reached.\n\n\n
130	2025-11-10 06:58:29.9	1970-01-01 00:00:00	t	2025-11-10 06:58:29.9		dateFormatting	Standard Date Formatting	siteAdmin	\N	dateFormatting:\n    kind: panel.form\n    name: dateFormatting\n    id: admin-date-formatting-panel\n    label: Standard Date Formatting\n    url: /xapi/siteConfig\n    method: POST\n    contentType: json\n    contents:\n        dateFormatDescription:\n            tag: div.message\n            element:\n                style:\n                    marginBottom: 24px\n                html: >\n                    These preferred date formats are not necessarily followed in all parts of XNAT. Date formatting uses the <a href="https://docs.oracle.com/javase/7/docs/api/java/text/SimpleDateFormat.html" target="_blank">Java SimpleDateFormat syntax</a>.\n                    <br><br>\n                    <strong>Updates in this panel require a Tomcat restart to be applied.</strong>\n        dateFormatInput:\n            kind: panel.input.text\n            name: uiDateFormat\n            label: Date Format\n            placeholder: yyyy-MM-dd\n        timeFormatInput:\n            kind: panel.input.text\n            name: uiTimeFormat\n            label: Time Format\n            placeholder: HH:mm\n        datetimeFormatInput:\n            kind: panel.input.text\n            name: uiDateTimeFormat\n            label: Date/time Format\n            placeholder: yyyy-MM-dd HH:mm\n        dateTimeSecondsFormatInput:\n            kind: panel.input.text\n            name: uiDateTimeSecondsFormat\n            label: Date/time/seconds Format\n            placeholder: yyyy-MM-dd HH:mm ss.SSS\n        dateFormatScript:\n            tag: script|src=/scripts/xnat/admin/datetimeManagement.js\n\n\n
153	2025-11-10 06:58:29.967	1970-01-01 00:00:00	t	2025-11-10 06:58:29.967	The DICOM Filename Template controls naming of DICOM files ingested via GradualDicomImporter  (e.g., gradual-DICOM, DICOM-zip, C-STORE), unless rename = false. Variables must be  <a href="https://www.dcm4che.org/docs/dcm4che-2.0.17-apidocs/org/dcm4che2/data/Tag.html" target="_blank">dcm4che tag names</a>, or to compute a hash of tags, use <code>HashTag1WithTag2WithTag3</code>  (etc). Variables should be demarcated with <code>${}</code> per the  <a href="https://commons.apache.org/proper/commons-text/apidocs/org/apache/commons/text/StringSubstitutor.html" target="_blank">StringSubstitutor</a> class. <strong>Use extreme caution when changing this value: it must  be unique per instance or data will be overwritten silently.</strong> Additionally, changing this value  may lead to duplicated DICOM files on merge unless using SOP Instance UID to uniquely identify DICOM,  controlled below.\n	dicomNaming	DICOM File Naming	siteAdmin	\N	dicomNaming:\n    kind: panel.form\n    label: DICOM File Naming\n    method: POST\n    contentType: json\n    url: /xapi/siteConfig\n    contents:\n        dicomFileNameTemplate:\n            kind: panel.input.text\n            size: 100\n            name: dicomFileNameTemplate\n            label: DICOM Filename Template\n            validation: not-empty\n            description: >\n                The DICOM Filename Template controls naming of DICOM files ingested via GradualDicomImporter \n                (e.g., gradual-DICOM, DICOM-zip, C-STORE), unless rename = false. Variables must be \n                <a href="https://www.dcm4che.org/docs/dcm4che-2.0.17-apidocs/org/dcm4che2/data/Tag.html"\n                target="_blank">dcm4che tag names</a>, or to compute a hash of tags, use <code>HashTag1WithTag2WithTag3</code> \n                (etc). Variables should be demarcated with <code>${}</code> per the \n                <a href="https://commons.apache.org/proper/commons-text/apidocs/org/apache/commons/text/StringSubstitutor.html"\n                target="_blank">StringSubstitutor</a> class. <strong>Use extreme caution when changing this value: it must \n                be unique per instance or data will be overwritten silently.</strong> Additionally, changing this value \n                may lead to duplicated DICOM files on merge unless using SOP Instance UID to uniquely identify DICOM, \n                controlled below.\n        useSopInstanceUidToUniquelyIdentifyDicom:\n            kind: panel.input.switchbox\n            name: useSopInstanceUidToUniquelyIdentifyDicom\n            label: "Use SOP Instance UID to uniquely identify a DICOM file?"\n            onText: Yes, use SOP Instance UID\n            offText: No, use file name\n            description: >\n                SOP Instance UID should uniquely identify a DICOM file, and using this setting will prevent XNAT \n                storing duplicate files when file names change due to source, import method, or updates to the \n                "dicomFileNameTemplate" configuration setting. However, using file name is offered for backward \n                compatibility or handling non-compliant scenarios.\n\n\n
131	2025-11-10 06:58:29.902	1970-01-01 00:00:00	t	2025-11-10 06:58:29.902	<p>Sorting of tables can add several seconds onto larger queries.  On small instances, this isn't an issue.  But on servers with millions of entries, this can impact performance. This setting determines whether all data listings are sorted by default (on initial access).  Set to 'Disabled' on large instances.</p> <p>Default: Enabled</p>\n	searchPerformance	Search Performance	siteAdmin	\N	searchPerformance:\n    kind: panel.form\n    name: searchPerformance\n    id: admin-search-performance-panel\n    label: Search Performance\n    url: /xapi/siteConfig\n    method: POST\n    contentType: json\n    contents:\n        sortedListing:\n            kind: panel.input.switchbox\n            name: defaultToSortedListings\n            onText: Enabled\n            offText: Disabled\n            checked: true\n            label: "Sort Search Listings By Default"\n            description: >\n                <p>Sorting of tables can add several seconds onto larger queries.  On small instances, this isn't an issue.  But on servers with millions of entries, this can impact performance. This setting determines whether all data listings are sorted by default (on initial access).  Set to 'Disabled' on large instances.</p>\n                <p>Default: Enabled</p>\n        countsOnProject:\n            kind: panel.input.switchbox\n            label: "Include Summary Counts in Project Data Listings"\n            name: addCountFieldsToProjectListings\n            onText: Enabled\n            offText: Disabled\n            checked: true\n            description: >\n                <p>Aggregate functions are costly on large systems (i.e. millions of rows).  Disabling count fields can improve performance.  This setting determines whether count fields (like MR Count) should be included in project level listings (like Subjects). If Enabled, counts of child objects will be automatically included in project data listings. If Disabled, counts of child objects will only be available if display documents are manually configured to add them.</p>\n                <p>Default: Enabled</p>\n        scanCountAgg:\n            kind: panel.input.switchbox\n            label: "Exclude Scan Aggregate Fields From Data Listings"\n            name: removeScanAggregateFields\n            onText: Enabled (Scan aggregate fields are excluded)\n            offText: Disabled (Scan aggregate fields are shown)\n            checked: false\n            description: >\n                <p>Aggregate functions are costly on large systems (i.e. millions of rows).  Excluding count fields can improve performance.  This setting overrides Display Document configuration to exclude Scan Aggregate Counts if they are otherwise configured to be displayed.</p>\n                <p>Default: Disabled</p>\n\n\n
132	2025-11-10 06:58:29.905	1970-01-01 00:00:00	t	2025-11-10 06:58:29.905	Select a new global theme from those available on the system.	themeManagement	Theme Management	siteAdmin	\N	themeManagement:\n    kind: panel\n    name: themeManagement\n    id: theme-management-panel\n    label: Theme Management\n    footer: false\n    contents:\n        themeDocumentationNote:\n            tag: div.message\n            element:\n                style:\n                    marginBottom: 24px\n                html: >\n                    For help with themes, see <a href="https://wiki.xnat.org/documentation/xnat-administration/working-with-ui-themes">Working with UI Themes in XNAT</a>\n        themeStyle:\n            tag: style\n            content: |\n                input.theme-uploader { width:244px; display: inline !important; }\n                body #theme-management-panel div.element-wrapper { position: relative; top: -5px; }\n        themeSelectorForm:\n            tag: "form|id=theme-selector"\n            contents:\n                themeSelection:\n                    kind: panel.select.single\n                    id: theme-selection\n                    name: themeSelection\n                    label: Select Theme\n                    description: Select a new global theme from those available on the system.\n                    element:\n                        style: "width:230px;margin-right:10px;"\n                    afterElement: >\n                        <span style="display:inline-block;margin-left:10px"></span>\n                        <button id="activate-theme" class="btn btn-sm" type="submit">Set Theme</button>\n                        <button id="remove-theme" class="btn btn-sm">Delete</button>\n        uploadTheme:\n            kind: panel.input.file\n            id: xnat-theme-upload\n            className: theme-uploader\n            name: themePackage\n            label: Upload Theme\n            description: Upload a zipped theme package for selection above.\n        themeScript:\n            tag: script|src=/scripts/xnat/admin/themeManagement.js\n\n
133	2025-11-10 06:58:29.909	1970-01-01 00:00:00	t	2025-11-10 06:58:29.909	When Site-wide Feature Management is enabled, a new menu item will appear in the Administer menu in the top navigation. This page will allow site admins to set default appearance of defined features in the UI. <a href="https://wiki.xnat.org/documentation/xnat-administration/enabling-features-at-the-site-wide-level" target="_blank">See documentation</a>\n	adminControls	Admin UI Controls	siteAdmin	\N	adminControls:\n    kind: panel.form\n    label: Admin UI Controls\n    url: /xapi/siteConfig\n    method: POST\n    contentType: json\n    contents:\n        enableSitewideFeatures:\n            kind: panel.input.switchbox\n            label: Enable Site-wide Feature Management\n            name: uiShowAdminManageSiteFeatures\n            onText: Enabled\n            offText: Disabled\n            description: >\n                When Site-wide Feature Management is enabled, a new menu item will appear in the Administer menu in the top navigation.\n                This page will allow site admins to set default appearance of defined features in the UI.\n                <a href="https://wiki.xnat.org/documentation/xnat-administration/enabling-features-at-the-site-wide-level" target="_blank">See documentation</a>\n\n
134	2025-11-10 06:58:29.911	1970-01-01 00:00:00	t	2025-11-10 06:58:29.911		displayedUserIdentifier	Displayed User Identifier	siteAdmin	\N	displayedUserIdentifier:\n    kind: panel.form\n    label: Displayed User Identifier\n    url: /xapi/siteConfig\n    method: POST\n    contentType: json\n    contents:\n        displayedUserIdentifierType:\n            kind: panel.element\n            label: Displayed User Identifier Type\n            contents:\n                displayedUserIdentifierTypeMenu:\n                    kind: select.menu\n                    name: displayedUserIdentifierType\n                    options:\n                        USERNAME: Username\n                        EMAIL: Email\n                        NAME_FIRST_SPACE_LAST: Name (First Last)\n                        NAME_LAST_COMMA_FIRST: Name (Last, First)\n                    after: >\n                        <p class="description">Sets the user identifier displayed at the top right of each page. To see the change after you modify and save this value, you'll need to refresh the page.</p>\n
135	2025-11-10 06:58:29.913	1970-01-01 00:00:00	t	2025-11-10 06:58:29.913		searchTabsHomePage	Quick Search Datatype Options	siteAdmin	\N	searchTabsHomePage:\n    kind: panel.form\n    label: Quick Search Datatype Options\n    footer: false\n    contents:\n        mainPageSearchDatatypeOptions:\n            tag: "div#quick-search-datatypes"\n        afterButton: >\n                <button id="update-quick-search" class="btn btn-sm" type="submit" style="margin-top:15px;">Update Options</button>\n        jqueryUi:\n            tag: script|src="~/scripts/lib/jquery-ui/jquery-ui.min.js"\n        jqueryUiCss:\n            tag: link|rel="stylesheet"|type="text/css"|href="~/scripts/lib/jquery-ui/jquery-ui.css"\n        chosenScript:\n            tag: script|src="~/scripts/lib/jquery-plugins/chosen/chosen.jquery.js"\n        chosenCss:\n            tag: link|rel="stylesheet"|type="text/css"|href="~/scripts/lib/jquery-plugins/chosen/chosen.css"\n        quickSearchDatatypeScript:\n            tag: script|src=/scripts/xnat/admin/quickSearchDatatypeInputs.js\n\n\n\n
136	2025-11-10 06:58:29.915	1970-01-01 00:00:00	t	2025-11-10 06:58:29.915		pluginTable	pluginTable	siteAdmin	\N	pluginTable:\n    tag: "div#plugin-table-container"\n\n
137	2025-11-10 06:58:29.918	1970-01-01 00:00:00	t	2025-11-10 06:58:29.918		pluginTableScript	pluginTableScript	siteAdmin	\N	pluginTableScript:\n    tag: script|src=/scripts/xnat/admin/pluginManager.js\n\n
138	2025-11-10 06:58:29.919	1970-01-01 00:00:00	t	2025-11-10 06:58:29.919		pluginList	List of Installed Plugins	siteAdmin	\N	pluginList:\n    kind: panel\n    name: pluginList\n    label: List of Installed Plugins\n    footer: false\n    contents:\n        ${pluginTable}\n        ${pluginTableScript}\n\n\n
139	2025-11-10 06:58:29.924	1970-01-01 00:00:00	t	2025-11-10 06:58:29.924		pluginOpenUrlsConfig	pluginOpenUrlsConfig	siteAdmin	\N	pluginOpenUrlsConfig:\n    tag: div\n    contents:\n        pluginOpenUrlsContainer:\n            tag: "div#plugin-open-urls-config"\n        pluginOpenUrlsScript:\n            tag: script|src=/scripts/xnat/admin/pluginOpenUrlsManager.js\n\n
140	2025-11-10 06:58:29.926	1970-01-01 00:00:00	t	2025-11-10 06:58:29.926		pluginOpenUrlsPanel	Plugin Open URLs	siteAdmin	\N	pluginOpenUrlsPanel:\n    kind: panel\n    label: Plugin Open URLs\n    footer: false\n    contents:\n        ${pluginOpenUrlsConfig}\n\n\n
154	2025-11-10 06:58:29.97	1970-01-01 00:00:00	t	2025-11-10 06:58:29.97		pipelineSettings	Pipeline Settings	siteAdmin	\N	pipelineSettings:\n    kind: panel.form\n    label: Pipeline Settings\n    method: POST\n    contentType: json\n    url: /xapi/siteConfig\n    contents:\n        ${processingUrl}\n\n\n
141	2025-11-10 06:58:29.928	1970-01-01 00:00:00	t	2025-11-10 06:58:29.928	If email verification is required (recommended), newly registered users and users who change their email address must verify their email address before their account is verified. Verification happens via a link sent to the submitted email.\n	registrationOptionsPanel	Registration Options	siteAdmin	\N	registrationOptionsPanel:\n    kind: panel.form\n    label: Registration Options\n    url: /xapi/siteConfig\n    method: POST\n    contentType: json\n    contents:\n        registrationOptionsMessage:\n            tag: div.message\n            element:\n                style:\n                    marginBottom: 24px\n                html: >\n                    These settings control auto-enabling and auto-verification of user accounts on registration. Email notifications\n                    to site administrators on new user registrations are not affected by these settings.\n        requireEmailVerificationToRegister:\n            kind: panel.input.switchbox\n            label: "Require Email Verification"\n            name: emailVerification\n            onText: Required\n            offText: Not Required\n            description: >\n                If email verification is required (recommended), newly registered users and users who change their email address must\n                verify their email address before their account is verified. Verification happens via a link sent to the submitted email.\n        autoEnableUserRegistration:\n            kind: panel.input.switchbox\n            name: userRegistration\n            label: "Auto-enable <br>User Registration"\n            onText: Auto-enable\n            offText: Do Not Auto-enable\n            description: >\n                If set to "Auto-enable", user accounts will be enabled automatically when the user registers. If not, new user accounts\n                must be manually enabled by a site administrator.\n        autoEnablePar:\n            kind: panel.input.switchbox\n            label: "Auto-enable with <br>Project Access Request"\n            name: par\n            onText: Auto-enable\n            offText: Do Not Auto-enable\n            description: >\n                If an unregistered user receives a Project Access Request via email, the site administrator could assume that\n                the project owner knows this user and can verify the validity of their account. This setting allows for auto-enabling\n                users who register accounts after receiving a Project Access Request, overriding the Auto-enable setting above.\n        uiAllowNewUserComments:\n            kind: panel.input.switchbox\n            label: "Allow User Comments <br>on Registration"\n            onText: Allow\n            offText: Do Not Allow\n            description: >\n                User comments, if allowed, are displayed in the email notifications sent to the site administrator.\n\n
142	2025-11-10 06:58:29.931	1970-01-01 00:00:00	t	2025-11-10 06:58:29.931	Enforce requirement of a reCAPTCHA in the User Registration page.\n	captchaOptionsPanel	CAPTCHA Options	siteAdmin	\N	captchaOptionsPanel:\n    kind: panel.form\n    label: CAPTCHA Options\n    url: /xapi/siteConfig\n    method: POST\n    contentType: json\n    contents:\n        captchaOptionsMessage:\n            tag: div.message\n            element:\n                style:\n                    marginBottom: 24px\n                html: >\n                    These settings control whether <a href="https://developers.google.com/recaptcha" target="_blank">Google \n                    reCAPTCHA</a> is enabled on the <strong>User Registration</strong> page.<br><br>\n                    <strong>Important:</strong> To use reCAPTCHA, you must register your site with Google and obtain site and\n                    secret keys. When <a href="https://cloud.google.com/security/products/recaptcha" target="_blank">creating \n                    your keys</a>, make sure you set <strong>reCAPTCHA type</strong> to <strong>score-based (v3)</strong>.\n        uiNewUserRequireCaptcha:\n            kind: panel.input.switchbox\n            label: "Enable reCAPTCHA on User Registration page"\n            onText: Require\n            offText: Not Required\n            checked: false\n            description: >\n                Enforce requirement of a reCAPTCHA in the User Registration page.\n        uiNewUserCaptchaPublic:\n            kind: panel.input.text\n            name: uiNewUserCaptchaPublic\n            label: Google reCAPTCHA Site (Public) Key\n        uiNewUserCaptchaPrivate:\n            kind: panel.input.text\n            name: uiNewUserCaptchaPrivate\n            label: Google reCAPTCHA Secret Key\n\n\n
143	2025-11-10 06:58:29.933	1970-01-01 00:00:00	t	2025-11-10 06:58:29.933	If set to "Hidden", the Compressed Uploader is removed from the "Upload > Images" menu. (The DICOM-zip importer is enabled regardless of this setting.)\n	uploadChannels	Image Session Upload Methods	siteAdmin	\N	uploadChannels:\n    kind: panel.form\n    name: uploadChannels\n    label: "Image Session Upload Methods"\n    method: POST\n    contentType: json\n    url: /xapi/siteConfig\n    contents:\n        uiHideCompressedUploaderUploadOption:\n            kind: panel.input.switchbox\n            label: "Hide Compressed Uploader"\n            onText: Hidden\n            offText: Available\n            description: >\n                If set to "Hidden", the Compressed Uploader is removed from the "Upload > Images" menu.\n                (The DICOM-zip importer is enabled regardless of this setting.)\n        uiDefaultUploaderImporter:\n            kind: panel.element\n            label: Default Uploader Importer\n            contents:\n                info:\n                    tag: p\n                    element:\n                        style: "margin: 3px 0 8px 0;"\n                    content: Select the default uploader importer\n                uploaderUploadDicomZip:\n                    kind: input.radio\n                    name: uiDefaultCompressedUploaderImporter\n                    id: uploaderDicomZip\n                    value: DICOM-zip\n                    after: >\n                        <label class="pad5h" for="uploaderDicomZip">DICOM-Zip</label>\n                uploaderUploadSessionImporter:\n                    kind: input.radio\n                    name: uiDefaultCompressedUploaderImporter\n                    id: uploaderSI\n                    value: SI\n                    after: >\n                        <label class="pad5h" for="uploaderSI">Session Importer</label>\n                        <p class="description">\n                        Select the import handler default. The compressed uploader and the restful import API will use this value by default, but\n                        users will be able to select which handler to use on the compressed uploader page or the url of the API call. </p>\n                        <p class="description">DICOM-zip is recommended for consistency with other upload mechanisms (C-STORE, XNAT Desktop Client), \n                        and despite its name, it does support tar, tar.gz, tgz, as well.</p> \n                        <p class="description">Session Importer (SI) is deprecated but offered for backward consistency\n                        e.g., if they're uploading a lot of ECAT.</p>\n        uiHideXnatUploadAssistantDownload:\n            kind: panel.input.switchbox\n            label: "Hide XNAT Upload Assistant"\n            onText: Hidden\n            offText: Available\n            description: >\n                If set to "Hidden", the legacy XNAT Upload Assistant is removed from the "Upload > Images" menu.\n
144	2025-11-10 06:58:29.937	1970-01-01 00:00:00	t	2025-11-10 06:58:29.937	This should be the login name of an enabled and valid user. The specified user must be a site administrator.\n	sessionBuilder	Session Builder	siteAdmin	\N	sessionBuilder:\n    kind: panel.form\n    name: sessionBuilder\n    label: "Session Builder"\n    method: POST\n    contentType: json\n    url: /xapi/siteConfig\n    contents:\n        receivedFileUser:\n            kind: panel.input.text\n            label: Received File User\n            validation: id-strict max-length:40 onblur\n            placeholder: User account for performing import and archiving operations\n            description: >\n                This should be the login name of an enabled and valid user. The specified user must be a site\n                administrator.\n        reloadPrearcDatabaseOnStartup:\n            kind: panel.input.switchbox\n            label: "Reload Prearchive Database<br>On Start-up"\n            onText: Enabled\n            offText: Disabled\n            description: >\n                This controls whether the prearchive database is rebuilt when your XNAT server restarts. This can help\n                keep your system in sync with the data in prearchive, but can add to system load at start-up, especially\n                on systems that handle a lot of incoming data.\n        sessionXmlRebuilderRepeat:\n            kind: panel.input.number\n            label: Session Idle Check Interval\n            validation: integer onblur\n            placeholder: Interval in milliseconds\n            afterElement: <span class="after">milliseconds</span>\n            description: >\n                This controls how often the system checks to see if any incoming DICOM sessions in the prearchive have\n                been idle for longer than the configured session idle time. This value should be specified in\n                milliseconds and defaults to 60,000 ms or one minute.\n        sessionXmlRebuilderInterval:\n            kind: panel.input.number\n            label: Session Idle Time\n            validation: integer onblur\n            placeholder: Time in minutes\n            afterElement: <span class="after">minutes</span>\n            description: >\n                This tells the system how long a DICOM session should sit idle&mdash;that is, with no new data added to the\n                session&mdash;before attempting to build a session document from the DICOM data. This value is specified in\n                minutes and defaults to 5 minutes.\n\n
145	2025-11-10 06:58:29.939	1970-01-01 00:00:00	t	2025-11-10 06:58:29.939	This is the site-wide anonymization script applied to all incoming and archiving DICOM resources. This script can also be supplemented by anonymization operations specified at the project level. The script must conform to <a href="https://wiki.xnat.org/display/XTOOLS/DicomEdit" target="_blank">DicomEdit</a> format.<br><br>Note that if the site-wide anonymization is enabled, even with an empty script, it will add a deidentification method status entry to DICOM headers. To allow DICOM files to be imported without any changes, disable site-wide anonymization.\n	anonymization	Anonymization Script (Site Wide)	siteAdmin	\N	anonymization:\n    kind: panel.form\n    name: Anonymization\n    label: "Anonymization Script (Site Wide)"\n    method: POST\n    contentType: json\n    url: /xapi/siteConfig\n    contents:\n        enableSitewideAnonymizationScript:\n            kind: panel.input.switchbox\n            label: "Enable Site-wide <br>Anonymization Script"\n            onText: Enabled\n            offText: Disabled\n        sitewideAnonymizationScript:\n            kind: panel.textarea\n            label: "Edit Anonymization Script"\n            code: text\n            description: >\n                This is the site-wide anonymization script applied to all incoming and archiving DICOM resources. This script can also be supplemented by anonymization operations specified at the project level. The script must conform to <a href="https://wiki.xnat.org/display/XTOOLS/DicomEdit" target="_blank">DicomEdit</a> format.<br><br>Note that if the site-wide anonymization is enabled, even with an empty script, it will add a deidentification method status entry to DICOM headers. To allow DICOM files to be imported without any changes, disable site-wide anonymization.\n\n
146	2025-11-10 06:58:29.943	1970-01-01 00:00:00	t	2025-11-10 06:58:29.943	On some systems, the project level anonymization script is used to insert the project, subject and/or label into the DICOM headers. If the these values are changed, the values can become out of sync. This setting controls whether the project level anonymization script is rerun when the image session's label, subject or project is changed to correct the value in the DICOM. Default is Disabled to prevent accidental DICOM modification.\n	rerunProjectAnon	Re-running project level anonymization	siteAdmin	\N	rerunProjectAnon:\n    kind: panel.form\n    name: ProjectAnon\n    label: "Re-running project level anonymization"\n    method: POST\n    contentType: json\n    url: /xapi/siteConfig\n    contents:\n        rerunProjectAnonOnRename:\n            kind: panel.input.switchbox\n            label: "Rerun project level anonymization on changes to image session's label, subject or project"\n            onText: Enabled\n            offText: Disabled\n            description: >\n                On some systems, the project level anonymization script is used to insert the project, subject and/or label into the DICOM headers. If the these values are changed, the values can become out of sync. This setting controls whether the project level anonymization script is rerun when the image session's label, subject or project is changed to correct the value in the DICOM. Default is Disabled to prevent accidental DICOM modification.\n\n\n
147	2025-11-10 06:58:29.949	1970-01-01 00:00:00	t	2025-11-10 06:58:29.949	Creating a <b>whitelist</b> means that <i>only</i> DICOM series with a series description that matches one of series filter patterns will be considered by XNAT import tools such as the upload assistant. Creating a <b>blacklist</b> means that all DICOM series will be considered <i>except</i> for series that have one of the specified series filter patterns. A <b>modality map</b> lets you specify boolean expressions in JavaScript that can use DICOM header values from incoming DICOM objects to decide the appropriate modality for the destination session.\n	seriesImportFilter	Series Import Filter (Site Wide)	siteAdmin	\N	seriesImportFilter:\n    kind: panel.form\n    name: seriesImportFilter\n    label: "Series Import Filter (Site Wide)"\n    method: POST\n    contentType: json\n    url: /xapi/siteConfig\n    contents:\n        cautionMessage:\n            tag: div.warning.bold\n            content: >\n                Caution: This feature has been deprecated as of XNAT 1.8.10 and will be removed from XNAT in the 1.10 release. Series filtering and rejection can now be managed natively within DicomEdit anonymization scripts. See <a href="https://wiki.xnat.org/documentation/how-to-write-a-series-import-filter" target="_blank">documentation for details</a>. (Note: Support for modality maps will not be preserved.)\n        enableSitewideSeriesImportFilter:\n            kind: panel.input.switchbox\n            name: enableSitewideSeriesImportFilter\n            label: "Enable Site-wide <br>Series Import Filter"\n            onText: Enabled\n            offText: Disabled\n        sitewideSeriesImportFilterMode:\n            kind: panel.select.single\n            name: sitewideSeriesImportFilterMode\n            label: Filter Mode\n            description: >\n                Creating a <b>whitelist</b> means that <i>only</i> DICOM series with a series description that matches one of series filter patterns will be considered by XNAT import tools such as the upload assistant. Creating a <b>blacklist</b> means that all DICOM series will be considered <i>except</i> for series that have one of the specified series filter patterns. A <b>modality map</b> lets you specify boolean expressions in JavaScript that can use DICOM header values from incoming DICOM objects to decide the appropriate modality for the destination session.\n            options:\n                whitelist: Whitelist\n                blacklist: Blacklist\n                modalityMap: Modality Map\n        sitewideSeriesImportFilter:\n            kind: panel.textarea\n            name: sitewideSeriesImportFilter\n            label: "Edit Series Import Filter"\n            code: text\n            description: >\n                The series filters can be written as exact string matches, but also can be regular expressions. The regular expressions are evaluated using the\n                <a href="http://docs.oracle.com/javase/tutorial/essential/regex/" target="_blank">Java regular expression syntax</a>. These expressions are case-insensitive,\n                i.e. the string "SAG LOCALIZER" will also match "Sag Localizer".\n
148	2025-11-10 06:58:29.954	1970-01-01 00:00:00	t	2025-11-10 06:58:29.954	This is the site-wide list of PET tracers. List entries should be separated by whitespace. Project owners can specify their own lists as needed.\n	petTracers	Pet Tracers (Site Wide)	siteAdmin	\N	petTracers:\n    kind: panel.form\n    name: petTracers\n    label: "Pet Tracers (Site Wide)"\n    method: POST\n    contentType: json\n    url: /xapi/siteConfig\n    contents:\n        sitewidePetTracers:\n            kind: panel.textarea\n            name: sitewidePetTracers\n            label: "Pet Tracers"\n            code: text\n            validation: max-length:1000\n            description: >\n                This is the site-wide list of PET tracers. List entries should be separated by whitespace. Project owners can specify their own lists as needed.\n\n
149	2025-11-10 06:58:29.958	1970-01-01 00:00:00	t	2025-11-10 06:58:29.958	When data is received from a PET-MR scanner, XNAT can treat this as a single PET/MR imaging session, a single PET imaging session, or separate the data into PET and MR sessions\n	petMr	Separate PET-MR (Site Wide)	siteAdmin	\N	petMr:\n    kind: panel.form\n    name: petMr\n    label: "Separate PET-MR (Site Wide)"\n    method: POST\n    contentType: json\n    url: /xapi/siteConfig\n    contents:\n        petMr:\n            kind: panel.select.single\n            name: sitewidePetMr\n            label: "Separate PET-MR"\n            description: >\n                When data is received from a PET-MR scanner, XNAT can treat this as a single PET/MR imaging session, a single PET imaging session, or separate the data into PET and MR sessions\n            options:\n                petmr: Create as PET/MR session\n                pet: Create as PET session\n                separate: Separate into PET and MR sessions\n\n\n
150	2025-11-10 06:58:29.961	1970-01-01 00:00:00	t	2025-11-10 06:58:29.961	Reference: <a href="https://wiki.xnat.org/documentation/xnat-administration/xnat-custom-dicom-routing-rules-in-the-admin-ui" target="_blank">Custom DICOM Routing Formatting Guide</a>.\n	projectRouting	Project Routing (Site Wide)	siteAdmin	\N	projectRouting:\n    kind: panel.form\n    name: projectRouting\n    label: "Project Routing (Site Wide)"\n    method: PUT\n    contentType: json\n    url: /data/config/dicom/projectRules\n    contents:\n        customDicomRoutingMessage:\n            tag: div.message\n            element:\n                style:\n                    marginBottom: 24px\n                html:\n                    Each of the Custom DICOM Routing panels allow you to set a custom routing scheme for determining Project,\n                    Subject, or Session Label from the DICOM fields in incoming data as it is being handled by the session importer.\n                    See <a target="_blank" href="https://wiki.xnat.org/documentation/xnat-administration/xnat-custom-dicom-routing-rules-in-the-admin-ui">\n                    Custom DICOM Routing Documentation</a> for guidance formatting these fields.\n                    Note that each of these settings will take precedence over the <a target="_blank" href="https://wiki.xnat.org/documentation/how-to-use-xnat/image-session-upload-methods-in-xnat/how-xnat-scans-dicom-to-map-to-project-subject-session">\n                    default XNAT routing rules</a>.\n        enableSitewideProjectRouting:\n            kind: panel.input.switchbox\n            label: "Enable Custom Site-wide <br>Project Routing"\n            name: status\n            id: enableSitewideProjectRouting\n            onValue: enabled\n            values: enabled|disabled\n            onText: Enabled\n            offText: Disabled\n        sitewideProjectRouting:\n            kind: panel.textarea\n            label: "Edit Project Routing Rules"\n            name: contents\n            id: sitewideProjectRouting\n            code: text\n            description: >\n                Reference: <a href="https://wiki.xnat.org/documentation/xnat-administration/xnat-custom-dicom-routing-rules-in-the-admin-ui" target="_blank">Custom DICOM Routing Formatting Guide</a>.\n\n\n
151	2025-11-10 06:58:29.963	1970-01-01 00:00:00	t	2025-11-10 06:58:29.963	Reference: <a href="https://wiki.xnat.org/documentation/xnat-administration/xnat-custom-dicom-routing-rules-in-the-admin-ui" target="_blank">Custom DICOM Routing Formatting Guide</a>.\n	subjectRouting	Subject Routing (Site Wide)	siteAdmin	\N	subjectRouting:\n    kind: panel.form\n    name: subjectRouting\n    label: "Subject Routing (Site Wide)"\n    method: PUT\n    contentType: json\n    url: /data/config/dicom/subjectRules\n    contents:\n        enableSitewideSubjectRouting:\n            kind: panel.input.switchbox\n            label: "Enable Custom Site-wide <br>Subject Routing"\n            name: status\n            id: enableSitewideSubjectRouting\n            onValue: enabled\n            values: enabled|disabled\n            onText: Enabled\n            offText: Disabled\n        sitewideSubjectRouting:\n            kind: panel.textarea\n            label: "Edit Subject Routing Rules"\n            name: contents\n            id: sitewideSubjectRouting\n            code: text\n            description: >\n                Reference: <a href="https://wiki.xnat.org/documentation/xnat-administration/xnat-custom-dicom-routing-rules-in-the-admin-ui" target="_blank">Custom DICOM Routing Formatting Guide</a>.\n\n
152	2025-11-10 06:58:29.965	1970-01-01 00:00:00	t	2025-11-10 06:58:29.965	Reference: <a href="https://wiki.xnat.org/documentation/xnat-administration/xnat-custom-dicom-routing-rules-in-the-admin-ui" target="_blank">Custom DICOM Routing Formatting Guide</a>.\n	sessionRouting	Session Routing (Site Wide)	siteAdmin	\N	sessionRouting:\n    kind: panel.form\n    name: sessionRouting\n    label: "Session Routing (Site Wide)"\n    method: PUT\n    contentType: json\n    url: /data/config/dicom/sessionRules\n    contents:\n        enableSitewideSessionRouting:\n            kind: panel.input.switchbox\n            label: "Enable Custom Site-wide <br>Session Routing"\n            name: status\n            id: enableSitewideSessionRouting\n            values: enabled|disabled\n            onValue: enabled\n            onText: Enabled\n            offText: Disabled\n        sitewideSessionRouting:\n            kind: panel.textarea\n            label: "Edit Session Routing Rules"\n            name: contents\n            id: sitewideSessionRouting\n            code: text\n            description: >\n                Reference: <a href="https://wiki.xnat.org/documentation/xnat-administration/xnat-custom-dicom-routing-rules-in-the-admin-ui" target="_blank">Custom DICOM Routing Formatting Guide</a>.\n\n
155	2025-11-10 06:58:29.975	1970-01-01 00:00:00	t	2025-11-10 06:58:29.975	Can be up to 16 characters long. Backslashes and control characters are not allowed.	dicomScpEditor	AE Title	siteAdmin	\N	dicomScpEditor:\n    kind: panel.form\n    name: dicomScpEditor\n    header: false\n    footer: false\n    load: false\n    action: "#!"\n    method: null\n    class: json\n    element:\n        style:\n            border: none\n            marginBottom: 0\n    contents:\n        validation:\n            tag: script|src="~/scripts/xnat/validate.js"\n        scpId:\n            kind: panel.input.hidden\n            id: scp-id\n            name: id\n            className: hidden\n        aeTitle:\n            kind: panel.input.text\n            id: scp-title\n            name: aeTitle\n            label: AE Title\n            validation: not-empty\n            description: Can be up to 16 characters long. Backslashes and control characters are not allowed.\n        port:\n            kind: panel.input.number\n            id: scp-port\n            name: port\n            label: Port\n            validation: integer gte:1 lte:65535\n        enabled:\n            kind: input.hidden\n            id: scp-enabled\n            name: enabled\n            className: hidden\n        customProcessing:\n            kind: panel.input.switchbox\n            name: customProcessing\n            label: Custom Processing\n            onText: "Custom Processing: <b>Enabled</b>"\n            offText: "Custom Processing <b>Disabled</b>"\n            description: Enable or Disable Custom Processing for DICOM Receiver\n        directArchive:\n            kind: panel.input.switchbox\n            name: directArchive\n            label: Direct Archive\n            onText: "Direct to archive: <b>Enabled</b>"\n            offText: "Direct to archive: <b>Disabled</b> (use prearchive)"\n            description: Enable or Disable Direct Archive for DICOM Receiver (if disabled, data comes through the prearchive)\n        identifier:\n            kind: panel.select.single\n            id: scp-identifier\n            name: identifier\n            label: Identifier\n            className: hidden\n            element:\n                title: Select DICOM Object Identifier\n                disabled: disabled\n            description: >\n                Select the DICOM object identifier to associate with this AE. If none is selected, the default identifier is applied.\n        anonymizationEnabled:\n            kind: panel.input.switchbox\n            label: Anonymization\n            id: anonymization-enabled\n            name: anonymizationEnabled\n            onText:  "Anonymization: <b>Enabled</b>"\n            offText: "Anonymization: <b>Disabled</b>"\n            description: Enable or disable all site-wide and project-level anonymization for this DICOM Receiver.\n        whitelistEnabled:\n            kind: panel.input.switchbox\n            label: Enable Whitelist\n            id: whitelist-enabled\n            name: whitelistEnabled\n            onText: "Whitelist: <b>Enabled</b>"\n            offText: "Whitelist: <b>Disabled</b>"\n            description: Enable or disable the whitelist for this DICOM Receiver.\n        whitelistText:\n            kind: panel.textarea\n            name: whitelistText\n            class: ignore\n            label: Whitelist\n            description: Enter a list of AE-titles and/or IP addresses that this DICOM receiver can interact with.  Any association requested by an AE-title or IP address not in this list will be rejected.  Entries can be AE-titles, IP addresses with an optional CIDR subnet mask, or both (e.g. ae_title@ip_address/mask). Entries should be separated by a new line.\n        routingExpressionsEnabled:\n            kind: panel.input.switchbox\n            label: Enable Receiver-Specific Routing Expressions\n            id: routingExpressions-enabled\n            name: routingExpressionsEnabled\n            onText: "Routing Expressions: <b>Enabled</b>"\n            offText: "Routing Expressions: <b>Disabled</b>"\n            description: Enable or disable custom routing expressions for this DICOM Receiver.\n        projectRoutingExpression:\n            kind: panel.textarea\n            class: ignore\n            name: projectRoutingExpression\n            label: Project Routing Expression\n            description: >\n                Routing expression to extract Project label.\n                Reference: <a href="https://wiki.xnat.org/documentation/xnat-administration/xnat-custom-dicom-routing-rules-in-the-admin-ui" target="_blank">Custom DICOM Routing Formatting Guide</a>.\n        subjectRoutingExpression:\n            kind: panel.textarea\n            class: ignore\n            name: subjectRoutingExpression\n            label: Subject Routing Expression\n            description: >\n                Routing expression to extract Subject label.\n                Reference: <a href="https://wiki.xnat.org/documentation/xnat-administration/xnat-custom-dicom-routing-rules-in-the-admin-ui" target="_blank">Custom DICOM Routing Formatting Guide</a>.\n        sessionRoutingExpression:\n            kind: panel.textarea\n            class: ignore\n            name: sessionRoutingExpression\n            label: Session Routing Expression\n            description: >\n                Routing expression to extract Session label.\n                Reference: <a href="https://wiki.xnat.org/documentation/xnat-administration/xnat-custom-dicom-routing-rules-in-the-admin-ui" target="_blank">Custom DICOM Routing Formatting Guide</a>.\n\n
156	2025-11-10 06:58:29.98	1970-01-01 00:00:00	t	2025-11-10 06:58:29.98	Globally Allow or Disallow DICOM Receivers	dicomScpReceiversGlobal	Manage DICOM SCP Receivers Globally	siteAdmin	\N	dicomScpReceiversGlobal:\n    kind: panel.form\n    method: POST\n    contentType: json\n    url: /xapi/siteConfig\n    name: dicomScpReceiversGlobal\n    label: Manage DICOM SCP Receivers Globally\n    contents:\n        enableDicomReceiver:\n            kind: panel.input.switchbox\n            name: enableDicomReceiver\n            label: Global Permission\n            onText: "DICOM Receivers: <b>Allowed</b>"\n            offText: "DICOM Receivers: <b>Not Allowed</b>"\n            description: Globally Allow or Disallow DICOM Receivers\n\n
157	2025-11-10 06:58:29.982	1970-01-01 00:00:00	t	2025-11-10 06:58:29.982		dicomScpReceivers	Manage DICOM SCP Receivers	siteAdmin	\N	dicomScpReceivers:\n    kind: panel\n    name: dicomScpReceivers\n    label: Manage DICOM SCP Receivers\n    footer: false\n    contents:\n        cautionMessage:\n            tag: div.warning.bold\n            element:\n                style:\n                    marginBottom: 24px\n                html: >\n                    Caution: Changes to these settings take effect immediately.\n                    Note that any changes, including defining a new receiver and\n                    editing or deleting an existing receiver, require restarting\n                    <i>all other receivers</i> on the same port. Before performing\n                    any operations like this, verify that there are no transmissions\n                    currently in progress to any of the receivers on that port.\n        dicomScpManager:\n            tag: "div#dicom-scp-manager"\n        dicomScpManagerScript:\n            tag: script|src="~/scripts/xnat/admin/dicomScpManager.js"\n\n
158	2025-11-10 06:58:29.986	1970-01-01 00:00:00	t	2025-11-10 06:58:29.986		loggingConfigurationPanel	Manage Logging Configuration	siteAdmin	\N	loggingConfigurationPanel:\n    kind: panel\n    name: loggingConfigurationPanel\n    label: Manage Logging Configuration\n    footer: false\n    contents:\n        loggingConfigurationMessage:\n            tag: div.message\n            element:\n                style:\n                    marginBottom: 24px\n                html: >\n                    All installed logfile appenders and loggers are listed in the table below. Site admins can change the log levels in real time by using the "Set Level" selector. <strong>Please note: These log level settings will be reset to their defaults on Tomcat restart.</strong><br><br>\n                    Click on any filename to download the most recent instance of that file, or download a zip archive of all current log files:\n                    <a href="~/xapi/logs/download" download="xnat-logs.zip">Download All Logs</a>.\n        loggingConfiguration:\n            tag: "div#logging-configuration"\n        loggingConfigurationScript:\n            tag: script|src="~/scripts/xnat/admin/loggingConfiguration.js"\n\n\n
159	2025-11-10 06:58:29.989	1970-01-01 00:00:00	t	2025-11-10 06:58:29.989		fileSystemSettingsWarning	fileSystemSettingsWarning	siteAdmin	\N	fileSystemSettingsWarning:\n    tag: div.message\n    element:\n        html: >\n            These settings must be defined during initial application configuration,\n            and are seldom, if ever, changed.\n        style:\n            fontWeight: bold\n            marginBottom: 24px\n
160	2025-11-10 06:58:29.992	1970-01-01 00:00:00	t	2025-11-10 06:58:29.992		archivePath	Archive Path	siteAdmin	\N	archivePath:\n    kind: panel.input.text\n    name: archivePath\n    label: Archive Path\n    validation: required onblur\n    description: ""\n    element:\n        disabled: true\n
161	2025-11-10 06:58:29.994	1970-01-01 00:00:00	t	2025-11-10 06:58:29.994		cachePath	Cache Path	siteAdmin	\N	cachePath:\n    kind: panel.input.text\n    name: cachePath\n    label: Cache Path\n    validation: required onblur\n    description: ""\n
162	2025-11-10 06:58:29.995	1970-01-01 00:00:00	t	2025-11-10 06:58:29.995		prearchivePath	Prearchive Path	siteAdmin	\N	prearchivePath:\n    kind: panel.input.text\n    name: prearchivePath\n    label: Prearchive Path\n    validation: required onblur\n    description: ""\n
163	2025-11-10 06:58:29.998	1970-01-01 00:00:00	t	2025-11-10 06:58:29.998		buildPath	Build Path	siteAdmin	\N	buildPath:\n    kind: panel.input.text\n    name: buildPath\n    label: Build Path\n    validation: required onblur\n    description: ""\n
164	2025-11-10 06:58:30.005	1970-01-01 00:00:00	t	2025-11-10 06:58:30.005		pipelinePath	Pipeline Path	siteAdmin	\N	pipelinePath:\n    kind: panel.input.text\n    name: pipelinePath\n    label: Pipeline Path\n    validation: required onblur\n    description: ""\n
165	2025-11-10 06:58:30.006	1970-01-01 00:00:00	t	2025-11-10 06:58:30.006		triagePath	Resource Quarantine Path	siteAdmin	\N	triagePath:\n    kind: panel.element\n    label: Resource Quarantine Path\n    info: >\n        <p>The Resource Quarantine, or Triage, can be enabled for custom resource uploads. See <a target="_blank" href="https://wiki.xnat.org/documentation/how-to-use-xnat/managing-resource-files-in-xnat/using-the-resource-file-quarantine">Resource Quarantine Documentation</a></p>\n    contents:\n        triagePathInput:\n            kind: input.text\n            name: triagePath\n            after: >\n                <p class="description">Location of XNAT Quarantine for uploaded resources.</p>\n
166	2025-11-10 06:58:30.01	1970-01-01 00:00:00	t	2025-11-10 06:58:30.01		inboxPath	Inbox Path	siteAdmin	\N	inboxPath:\n    kind: panel.input.text\n    name: inboxPath\n    label: Inbox Path\n    validation: required onblur\n    description: ""\n
176	2025-11-10 06:58:30.042	1970-01-01 00:00:00	t	2025-11-10 06:58:30.042		asyncOperationsSettingsWarning	asyncOperationsSettingsWarning	siteAdmin	\N	asyncOperationsSettingsWarning:\n    someInfo:\n        tag: div.message\n        element:\n            html: >\n                These settings can only be applied during application start-up. That means that any\n                changes to the values here require a restart of the application server.\n            style:\n                fontWeight: bold\n
167	2025-11-10 06:58:30.012	1970-01-01 00:00:00	t	2025-11-10 06:58:30.012	The type of operation used to create a new directory in the case that a job is run on a project (Ex- container jobs, Jupyter Notebooks). Only used when project has shared data. For distributed file systems copy must be used. In other cases, we recommend using hard links as it will reduce the size of data requirements.\n	maxNumberOfSessionsForJobsWithSharedData	Operation Used For Shared Data Jobs	siteAdmin	\N	maxNumberOfSessionsForJobsWithSharedData:\n    tag: div\n    contents:\n        fileOperationUsedForJobsWithSharedData:\n            kind: panel.select.single\n            name: fileOperationUsedForJobsWithSharedData\n            label: Operation Used For Shared Data Jobs\n            validation: required onblur\n            options:\n                hard_link: "Hard Link"\n                copy: "Copy"\n            description: >\n                The type of operation used to create a new directory in the case that a job is run on a project (Ex- container jobs, Jupyter Notebooks).\n                Only used when project has shared data. For distributed file systems copy must be used. In other cases, we recommend using hard links as it will reduce the size of data requirements.\n        maxNumberOfSessionsForJobsWithSharedData:\n            kind: panel.input.number\n            name: maxNumberOfSessionsForJobsWithSharedData\n            label: Maximum Number Of Sessions When Running Project Jobs\n            validation: required onblur\n            description: "The maximum number of sessions that can be processed by a job running on a project. Ex: container jobs, Jupyter Notebooks. This maximum is only used in cases where shared data is present within the project."\n
168	2025-11-10 06:58:30.018	1970-01-01 00:00:00	t	2025-11-10 06:58:30.018	Determines which filetypes should be handled by the ZipUtils class. (.tar and .gz are handled separately)\n	zipExtensions	Zip Extensions	siteAdmin	\N	zipExtensions:\n    kind: panel.input.text\n    name: zipExtensions\n    label: Zip Extensions\n    description: >\n        Determines which filetypes should be handled by the ZipUtils class.\n        (.tar and .gz are handled separately)\n
169	2025-11-10 06:58:30.019	1970-01-01 00:00:00	t	2025-11-10 06:58:30.019	Default zip compression method used for XNAT Restlet API calls and turbine actions. <br/> Uncompressed - Files are written to the zip with no compression (STORED).<br/> Compressed - Files in the zip are compressed using the DEFLATE algorithm (DEFLATED).<br/>\n	zipCompressionMethod	Zip Compression Method	siteAdmin	\N	zipCompressionMethod:\n    kind: panel.select.single\n    name: zipCompressionMethod\n    label: Zip Compression Method\n    options:\n        0: "Uncompressed"\n        8: "Compressed"\n    description: >\n        Default zip compression method used for XNAT Restlet API calls and turbine actions. <br/>\n        Uncompressed - Files are written to the zip with no compression (STORED).<br/>\n        Compressed - Files in the zip are compressed using the DEFLATE algorithm (DEFLATED).<br/>\n
170	2025-11-10 06:58:30.023	1970-01-01 00:00:00	t	2025-11-10 06:58:30.024	Determines whether checksums will be calculated for each image file as it is archived. Enabling checksums provides greater assurance of data integrity, but may add significant overhead to the archive process. Changes to this setting require a tomcat restart to take effect.\n	checksums	Checksums	siteAdmin	\N	checksums:\n    kind: panel.input.switchbox\n    name: checksums\n    label: Checksums\n    onText: Enabled\n    offText: Disabled\n    description: >\n        Determines whether checksums will be calculated for each image file as it is archived.\n        Enabling checksums provides greater assurance of data integrity, but may add significant\n        overhead to the archive process. Changes to this setting require a tomcat restart to take effect.\n
171	2025-11-10 06:58:30.025	1970-01-01 00:00:00	t	2025-11-10 06:58:30.025	Determines whether XNAT should move files from deleted entities (projects, subjects, sessions, etc.) into a DELETED subdirectory of the cache space (a.k.a., a "recycle bin") or just remove them completely. Enabling the recycle bin offers some protection against accidental data loss, but may incur an IO penalty, especially if the archive and cache directories are not on the same filesystem.\n	backupDeletedToCache	Backup to-be-deleted data to cache "recycle bin"	siteAdmin	\N	backupDeletedToCache:\n    kind: panel.input.switchbox\n    name: backupDeletedToCache\n    label: Backup to-be-deleted data to cache "recycle bin"\n    onText: Enabled\n    offText: Disabled\n    description: >\n        Determines whether XNAT should move files from deleted entities (projects, subjects, sessions, etc.)\n        into a DELETED subdirectory of the cache space (a.k.a., a "recycle bin") or just remove them completely.\n        Enabling the recycle bin offers some protection against accidental data loss, but may incur an IO penalty,\n        especially if the archive and cache directories are not on the same filesystem.\n
172	2025-11-10 06:58:30.029	1970-01-01 00:00:00	t	2025-11-10 06:58:30.029	Determines whether XNAT should retain copies of deleted files in a .history subdirectory of the cache space for version control. Only files corresponding to existing entities (projects, subjects, sessions, etc.) can be tracked. Deleting an entire entity cannot be version controlled, though you can enable the cache "recycle bin" for some added deletion protection. Changes to this setting require a tomcat restart to take effect.\n	maintainFileHistory	Track file history	siteAdmin	\N	maintainFileHistory:\n    kind: panel.input.switchbox\n    name: maintainFileHistory\n    label: Track file history\n    onText: Enabled\n    offText: Disabled\n    description: >\n        Determines whether XNAT should retain copies of deleted files in a .history subdirectory of the cache space for\n        version control. Only files corresponding to existing entities (projects, subjects, sessions, etc.) can be tracked.\n        Deleting an entire entity cannot be version controlled, though you can enable the cache "recycle bin" for some\n        added deletion protection. Changes to this setting require a tomcat restart to take effect.\n
173	2025-11-10 06:58:30.033	1970-01-01 00:00:00	t	2025-11-10 06:58:30.033	Enables the File Actions dropdown in the scan section of the Prearchive.\n	uiShowPrearchiveFileActions	Show preachive file actions	siteAdmin	\N	uiShowPrearchiveFileActions:\n    kind: panel.input.switchbox\n    name: uiShowPrearchiveFileActions\n    label: Show preachive file actions\n    onText: Enabled\n    offText: Disabled\n    description: >\n        Enables the File Actions dropdown in the scan section of the Prearchive.\n\n\n
174	2025-11-10 06:58:30.036	1970-01-01 00:00:00	t	2025-11-10 06:58:30.036		fileSystem	File System	siteAdmin	\N	fileSystem:\n    kind: panel.form\n    name: fileSystem\n    label: File System\n    method: POST\n    contentType: json\n    url: /xapi/siteConfig\n    contents:\n        ${archivePath}\n        ${cachePath}\n        ${prearchivePath}\n        ${buildPath}\n        ${pipelinePath}\n        ${triagePath}\n        ${inboxPath}\n        ${maxNumberOfSessionsForJobsWithSharedData}\n\n
175	2025-11-10 06:58:30.037	1970-01-01 00:00:00	t	2025-11-10 06:58:30.037		fileSystemBehaviors	File System Behaviors	siteAdmin	\N	fileSystemBehaviors:\n    kind: panel.form\n    label: File System Behaviors\n    method: POST\n    contentType: json\n    url: /xapi/siteConfig\n    contents:\n        ${zipExtensions}\n        ${zipCompressionMethod}\n        ${checksums}\n        ${backupDeletedToCache}\n        ${maintainFileHistory}\n        ${uiShowPrearchiveFileActions}\n\n\n\n
177	2025-11-10 06:58:30.045	1970-01-01 00:00:00	t	2025-11-10 06:58:30.045		defaultTimeout	Default Timeout	siteAdmin	\N	defaultTimeout:\n    kind: panel.element\n    label: Default Timeout\n    info: >\n        <p>This sets the timeout for asynchronous request handling and defines the maximum lifespan of an asynchronous process.\n        Generally speaking, this should stay set to -1.</p>\n    contents:\n        defaultTimeoutInput:\n            kind: input.text\n            name: defaultTimeout\n            validation: required onblur\n            after: > \n                <p class="description">Sets the timeout for asynchronous request handling.</p>\n\n
178	2025-11-10 06:58:30.051	1970-01-01 00:00:00	t	2025-11-10 06:58:30.051	Sets the minimum number of threads available to the asynchronous task executor.	corePoolSize	Core Pool Size	siteAdmin	\N	corePoolSize:\n    kind: panel.input.text\n    name: corePoolSize\n    label: Core Pool Size\n    validation: required onblur\n    description: "Sets the minimum number of threads available to the asynchronous task executor."\n
179	2025-11-10 06:58:30.055	1970-01-01 00:00:00	t	2025-11-10 06:58:30.055	Sets the maximum number of threads available to the asynchronous task executor.	maxPoolSize	Max Pool Size	siteAdmin	\N	maxPoolSize:\n    kind: panel.input.text\n    name: maxPoolSize\n    label: Max Pool Size\n    validation: required onblur\n    description: "Sets the maximum number of threads available to the asynchronous task executor."\n
180	2025-11-10 06:58:30.061	1970-01-01 00:00:00	t	2025-11-10 06:58:30.061	Sets the time (as a number of seconds) that idle threads above the core pool size should be kept alive before disposal.	keepAliveSeconds	Keep-Alive Time	siteAdmin	\N	keepAliveSeconds:\n    kind: panel.input.text\n    name: keepAliveSeconds\n    label: Keep-Alive Time\n    validation: required onblur\n    description: "Sets the time (as a number of seconds) that idle threads above the core pool size should be kept alive before disposal."\n
181	2025-11-10 06:58:30.064	1970-01-01 00:00:00	t	2025-11-10 06:58:30.064		allowCoreThreadTimeOut	Allow Core Thread Time Out	siteAdmin	\N	allowCoreThreadTimeOut:\n    kind: panel.element\n    label: Allow Core Thread Time Out\n    info: >\n        Allowing core threads to time out enables dynamic growing and shrinking even in combination with a non-zero queue\n        (since the max pool size will only grow once the queue is full).\n    contents:\n        defaultallowCoreThreadTimeOutInput:\n            kind: input.switchbox\n            name: allowCoreThreadTimeOut\n            onText: Allow core thread time out\n            offText: Disallow core thread time out\n\n
182	2025-11-10 06:58:30.066	1970-01-01 00:00:00	t	2025-11-10 06:58:30.066		reactorWorkQueueDispatcherPoolSize	Event Thread Pool Size	siteAdmin	\N	reactorWorkQueueDispatcherPoolSize:\n    kind: panel.element\n    label: Event Thread Pool Size\n    info: >\n        This controls the size of the Reactor Dispatcher thread pool. If you are seeing issues with event throughput, \n        you might increase this value. You would likely want to do so in concert with increasing the event buffer size, \n        and with consideration for the resources available on your system.\n    contents:\n        reactorWorkQueueDispatcherPoolSizeInput:\n            kind: input.text\n            name: reactorWorkQueueDispatcherPoolSize\n            validation: required onblur integer gte:5\n            after: >\n                <p class="description">Sets the number of threads dedicated to consuming and processing events.</p>\n
183	2025-11-10 06:58:30.069	1970-01-01 00:00:00	t	2025-11-10 06:58:30.069		reactorWorkQueueDispatcherRingBufferSizePower	Event Buffer Size	siteAdmin	\N	reactorWorkQueueDispatcherRingBufferSizePower:\n    kind: panel.element\n    label: Event Buffer Size\n    info: >\n        This controls the size of the Reactor Dispatcher RingBuffer, which will be 2 raised to the power of this value \n        (i.e., if you set the event buffer size to 13, the Reactor Dispatcher RingBuffer's bufferSize will be \n        2^13 = 8192). If you are seeing CPU pressure during high bursts of events (e.g., large-scale bulk ingestion, \n        container launch, etc.), you might increase this value.\n    contents:\n        reactorWorkQueueDispatcherRingBufferSizePowerInput:\n            kind: input.text\n            name: reactorWorkQueueDispatcherRingBufferSizePower\n            validation: required onblur integer gte:10 lte:31\n            after: >\n                <p class="description">Sets the size of the event buffer.</p>\n\n
184	2025-11-10 06:58:30.072	1970-01-01 00:00:00	t	2025-11-10 06:58:30.072	This controls how often the system runs the event-tracking clean-up process. This value should be  specified in hours and defaults to 24 hours (i.e. once a day). Note that a system restart is required  for this value to take effect.\n	eventTrackingDataCleanup	Event Tracking Cleanup	siteAdmin	\N	eventTrackingDataCleanup:\n    kind: panel.form\n    name: eventTrackingDataCleanup\n    label: Event Tracking Cleanup\n    method: POST\n    contentType: json\n    url: /xapi/asyncOps\n    contents:\n        eventTrackingDataCleanupDescription:\n            tag: div.message\n            element:\n                style:\n                    marginBottom: 24px\n                html: >\n                    These entries control how often the system runs the event-tracking clean-up process as well as the threshold for\n                    how long an event-tracking entry should be kept before being deleted. The default is to run the clean-up process\n                    every 24 hours (i.e. once a day) and keep entries for 30 days.\n                    <br><br>\n                    <strong>Updating the frequency in this panel requires a Tomcat restart to be applied.</strong>\n        eventTrackingDataCleanupFrequency:\n            kind: panel.input.number\n            label: Frequency (in hours)\n            validation: integer onblur\n            placeholder: Frequency in hours\n            afterElement: <span class="after">hours</span>\n            description: >\n                This controls how often the system runs the event-tracking clean-up process. This value should be \n                specified in hours and defaults to 24 hours (i.e. once a day). Note that a system restart is required \n                for this value to take effect.\n        eventTrackingDataCleanupTtl:\n            kind: panel.input.number\n            label: Time to live\n            validation: integer onblur\n            placeholder: Time to live in days\n            afterElement: <span class="after">days</span>\n            description: >\n                This controls the threshold for how long an event-tracking entry should be kept before being deleted. \n                The default is to keep entries for 30 days.\n\n\n
185	2025-11-10 06:58:30.074	1970-01-01 00:00:00	t	2025-11-10 06:58:30.074	<p>If enabled, Event Service will detect events and trigger actions linked by subscription. If disabled, event detection, action triggers, and subscription creation will be disabled.</p>\n	eventServiceConfig	Event Service Configuration	siteAdmin	\N	eventServiceConfig:\n    kind: panel.form\n    name: eventServiceConfig\n    label: Event Service Configuration\n    method: PUT\n    contentType: json\n    url: /xapi/events/prefs\n    contents:\n        enabled:\n            kind: panel.input.switchbox\n            name: enabled\n            label: Enable Event Service\n            onText: Enabled\n            offText: Disabled\n            description: >\n                <p>If enabled, Event Service will detect events and trigger actions linked by subscription.\n                If disabled, event detection, action triggers, and subscription creation will be disabled.</p>\n\n\n
186	2025-11-10 06:58:30.076	1970-01-01 00:00:00	t	2025-11-10 06:58:30.076		authenticationMethods	User Authentication Methods	siteAdmin	\N	authenticationMethods:\n    kind: panel.form\n    name: authenticationMethods\n    label: User Authentication Methods\n    method: POST\n    url: /xapi/siteConfig\n    contentType: json\n    contents:\n        xnatInternal:\n            kind: panel.input.switchbox\n            name: ":provider.providers.xnatInternal"\n            label: XNAT (Internal)\n            onText: Enabled\n            offText: Disabled\n        ldapProvider:\n            kind: panel.input.switchbox\n            name: ":provider.providers.ldap"\n            label: LDAP\n            onText: Enabled\n            offText: Disabled\n
187	2025-11-10 06:58:30.078	1970-01-01 00:00:00	t	2025-11-10 06:58:30.078		genericAuthenticationProvider	Generic Authentication Provider	siteAdmin	\N	genericAuthenticationProvider:\n    kind: panel.form\n    name: genericAuthenticationProvider\n    label: Generic Authentication Provider\n    method: POST\n    url: /xapi/siteConfig\n    contentType: json\n    contents:\n        providerDbName:\n            kind: panel.input.text\n            name: providerDbName\n            label: "Provider DB Name"\n        providerDbId:\n            kind: panel.input.text\n            name: providerDbId\n            label: "Provider DB ID"\n        providerDbType:\n            kind: panel.input.text\n            name: providerDbType\n            label: "Provider DB Type"\n\n
188	2025-11-10 06:58:30.08	1970-01-01 00:00:00	t	2025-11-10 06:58:30.08		ldapAuthentication	LDAP Authentication Provider	siteAdmin	\N	ldapAuthentication:\n    kind: panel.form\n    name: ldapAuthenticationProvider\n    label: LDAP Authentication Provider\n    method: POST\n    url: /xapi/siteConfig\n    contentType: json\n    contents:\n        ldapName:\n            kind: panel.input.text\n            name: ldapName\n            label: "LDAP Name"\n        ldapId:\n            kind: panel.input.text\n            name: ldapId\n            label: "LDAP ID"\n        ldapType:\n            kind: panel.input.text\n            name: ldapType\n            label: "LDAP Type"\n        ldapAddress:\n            kind: panel.input.text\n            name: ldapAddress\n            label: "LDAP Address"\n        ldapUserDomain:\n            kind: panel.input.text\n            name: ldapUserDomain\n            label: "LDAP User Domain"\n        ldapPassword:\n            kind: panel.input.text\n            name: ldapPassword\n            label: "LDAP Password"\n        ldapSearchBase:\n            kind: panel.input.text\n            name: ldapSearchBase\n            label: "LDAP Search Base"\n        ldapSearchFilter:\n            kind: panel.input.text\n            name: ldapSearchFilter\n            label: "LDAP Search Filter"\n\n
189	2025-11-10 06:58:30.083	1970-01-01 00:00:00	t	2025-11-10 06:58:30.083		users	Users	siteAdmin	\N	users:\n    kind: panel\n    name: users\n    label: Users\n\n
190	2025-11-10 06:58:30.084	1970-01-01 00:00:00	t	2025-11-10 06:58:30.084		userRoles	User Roles	siteAdmin	\N	userRoles:\n    kind: panel\n    name: userRoles\n    label: User Roles\n\n\n
191	2025-11-10 06:58:30.086	1970-01-01 00:00:00	t	2025-11-10 06:58:30.086		manageDataTypes	Manage Data Types	siteAdmin	\N	manageDataTypes:\n    kind: panel.form\n    name: manageDataTypes\n    label: Manage Data Types\n    method: POST\n    contentType: json\n    url: /xapi/siteConfig\n    contents:\n        displayNameForGenericImageSessionSingular:\n            kind: panel.input.text\n            name: imageSessionDisplayNameSingular\n            label: "Singular Display Name For Generic Image Session Singular"\n        displayNameForGenericImageSessionPlural:\n            kind: panel.input.text\n            name: imageSessionDisplayNamePlural\n            label: "Plural Display Name For Generic Image Session Singular"\n\n
192	2025-11-10 06:58:30.088	1970-01-01 00:00:00	t	2025-11-10 06:58:30.088		asyncOperations	Async Operations	siteAdmin	\N	asyncOperations:\n    kind: panel.form\n    name: asyncOperations\n    label: Async Operations\n    method: POST\n    contentType: json\n    url: /xapi/asyncOps\n    contents:\n        ${asyncOperationsSettingsWarning}\n        ${defaultTimeout}\n        ${corePoolSize}\n        ${allowCoreThreadTimeOut}\n        ${maxPoolSize}\n        ${keepAliveSeconds}\n        ${reactorWorkQueueDispatcherPoolSize}\n        ${reactorWorkQueueDispatcherRingBufferSizePower}\n\n\n
193	2025-11-10 06:58:30.091	1970-01-01 00:00:00	t	2025-11-10 06:58:30.091		investigators	List of Investigators	siteAdmin	\N	investigators:\n    kind: panel\n    name: investigators\n    label: List of Investigators\n    footer: false\n    contents:\n        investigatorsContainer:\n            tag: div#investigators-list-container\n        newInvestigatorButton:\n            tag: button#create-new-investigator.btn1|style=margin-top:15px\n            content: Create New Investigator\n        investigatorsjs:\n            tag: script|src=/scripts/xnat/app/investigators.js\n        renderInvestigatorsTable:\n            tag: script\n            content: >\n                XNAT.app.investigators.dataTable('#investigators-list-container')\n\n
194	2025-11-10 06:58:30.093	1970-01-01 00:00:00	t	2025-11-10 06:58:30.093		setScanTypeMapping	Scan Type Mapping	siteAdmin	\N	setScanTypeMapping:\n    kind: panel.form\n    label: Scan Type Mapping\n    method: POST\n    contentType: json\n    url: /xapi/siteConfig\n    contents:\n        scanTypeMapping:\n            kind: panel.input.switchbox\n            label: Scan Type Mapping\n            onText: Enabled\n            offText: Disabled\n\n
195	2025-11-10 06:58:30.095	1970-01-01 00:00:00	t	2025-11-10 06:58:30.095	Display the series description in the image session scan table	scanTableSettings	Scan Table Settings	siteAdmin	\N	scanTableSettings:\n    kind: panel.form\n    label: Scan Table Settings\n    method: POST\n    contentType: json\n    url: /xapi/siteConfig\n    contents:\n        uiDisplaySeriesDescription:\n            kind: panel.input.switchbox\n            label: Display Series Description\n            description: Display the series description in the image session scan table\n            onText: Enabled\n            offText: Disabled\n        uiDisplaySeriesClass:\n            kind: panel.input.switchbox\n            label: Display Series Class\n            description: Display the series class in the image session scan table\n            onText: Enabled\n            offText: Disabled\n\n
196	2025-11-10 06:58:30.097	1970-01-01 00:00:00	t	2025-11-10 06:58:30.097	Display the scanner name in the recent data activity table	recentExptListSettings	Recent Data Activity Table Settings	siteAdmin	\N	recentExptListSettings:\n    kind: panel.form\n    label: Recent Data Activity Table Settings\n    method: POST\n    contentType: json\n    url: /xapi/siteConfig\n    contents:\n        uiShowRecentExptListScannerName:\n            kind: panel.input.switchbox\n            label: Display Scanner Name\n            description: Display the scanner name in the recent data activity table\n            onText: Enabled\n            offText: Disabled\n        uiShowRecentExptListDate:\n            kind: panel.input.switchbox\n            label: Display Experiment Date\n            description: Display the experiment date in the recent data activity table\n            onText: Enabled\n            offText: Disabled\n\n
197	2025-11-10 06:58:30.098	1970-01-01 00:00:00	t	2025-11-10 06:58:30.098		setPreventCrossModalityMerge	Prevent Cross-modality Session Merger	siteAdmin	\N	setPreventCrossModalityMerge:\n    kind: panel.form\n    label: Prevent Cross-modality Session Merger\n    method: POST\n    contentType: json\n    url: /xapi/siteConfig\n    contents:\n        crossModalityMessage:\n            tag: div.message\n            element:\n                style:\n                    marginBottom: 24px\n                html: >\n                    Session merging happens when incoming data has a matching Study Instance UID to data already in the XNAT archive.\n                    However, if incoming data has scans of a different modality (i.e. PET) than the archived session (i.e. CT), how\n                    should XNAT react?\n        preventCrossModalityMerge:\n            kind: panel.input.switchbox\n            label: Prevent cross-modality post-archive session merger\n            onText: Cross-modality Merger Prevented\n            offText: Cross-modality Merger Allowed\n\n
198	2025-11-10 06:58:30.099	1970-01-01 00:00:00	t	2025-11-10 06:58:30.099	If Enabled, an "Add QC Entry" action will be added to the actions menu for all image session report pages	manualQC	Manual QC	siteAdmin	\N	manualQC:\n    kind: panel.form\n    label: Manual QC\n    method: POST\n    contentType: json\n    url: /xapi/siteConfig\n    contents:\n        uiShowAddManualQCAction:\n            kind: panel.input.switchbox\n            label: Manual QC Actions Menu Item\n            description: If Enabled, an "Add QC Entry" action will be added to the actions menu for all image session report pages\n            onText: Enabled\n            offText: Disabled\n\n
199	2025-11-10 06:58:30.102	1970-01-01 00:00:00	t	2025-11-10 06:58:30.102		developmentUtilities	Development Utilities	siteAdmin	\N	developmentUtilities:\n    kind: panel\n    label: Development Utilities\n    footer: false\n    contents:\n        spawner:\n            kind: panel.element\n            label: Spawner\n            contents:\n                link:\n                    tag: a.link|target=_blank|href=/page/#/admin/spawner/\n                    content: Manage Spawner Elements\n        swagger:\n            kind: panel.element\n            label: Swagger\n            contents:\n                link:\n                    tag: a.link|target=_blank|href=/xapi/swagger-ui.html\n                    content: View the Swagger page\n        monitoring:\n            kind: panel.element\n            label: Monitoring\n            contents:\n                link:\n                    tag: a.link|target=_blank|href=/monitoring\n                    content: View the JavaMelody application monitoring page\n\n\n
200	2025-11-10 06:58:30.104	1970-01-01 00:00:00	t	2025-11-10 06:58:30.104		root	Administer XNAT	siteAdmin	\N	root:\n    kind: tabs\n    name: adminPage\n    label: Administer XNAT\n    meta:\n        ${tabGroups}\n    contains: tabs\n    tabs:  # this property name is the same as 'contains', so it will be treated like 'contents'\n        siteSetup:\n            kind: tab\n            name: siteSetup\n            label: Site Setup\n            group: xnatSetup\n            active: true\n            contents:\n                ${siteInfo}\n                ${adminInfo}\n        security:\n            kind: tab\n            name: security\n            label: Security\n            group: xnatSetup\n            contents:\n                ${generalSecuritySettings}\n                ${userAuthenticationSettings}\n                ${userLoginsSessionControls}\n                ${passwords}\n                ${csrf}\n        emailServer:\n            kind: tab\n            name: emailServer\n            label: Email Server\n            group: manageNotifications\n            contents:\n                ${emailServerSettings}\n        notifications:\n            kind: tab\n            name: notifications\n            label: Notification Options\n            group: manageNotifications\n            contents:\n                ${notifications}\n        notificationEmailsTab:\n            kind: tab\n            name: notificationEmailsTab\n            label: Notification Emails\n            group: manageNotifications\n            contents:\n                ${notificationEmails}\n        siteWideAlertsTab:\n            kind: tab\n            name: siteWideAlertsTab\n            label: Site-wide Alerts\n            group: manageNotifications\n            contents:\n                ${siteWideAlerts}\n        manageAppearance:\n            kind: tab\n            name: manageAppearance\n            label: Appearance\n            group: xnatSetup\n            contents:\n                ${dateFormatting}\n                ${themeManagement}\n                ${searchTabsHomePage}\n                ${adminControls}\n                ${displayedUserIdentifier}\n        managePerformance:\n            kind: tab\n            name: managePerformance\n            label: Performance\n            group: xnatSetup\n            contents:\n                ${searchPerformance}\n        plugins:\n            kind: tab\n            name: plugins\n            label: Installed Plugins\n            group: xnatSetup\n            contents:\n                ${pluginList}\n                ${pluginOpenUrlsConfig}\n\n\n\n        registrationOptions:\n            kind: tab\n            name: registrationOptions\n            label: Registration Options\n            group: manageAccess\n            contents:\n                ${registrationOptionsPanel}\n                ${captchaOptionsPanel}\n        sessionUploadImportAnonymization:\n            kind: tab\n            name: sessionUploadImportAnonymization\n            label: "Session Upload, Import & Anonymization"\n            group: manageData\n            contents:\n                ${uploadChannels}\n                ${sessionBuilder}\n                ${anonymization}\n                ${seriesImportFilter}\n                ${petTracers}\n                ${petMr}\n                ${rerunProjectAnon}\n        customRoutingRules:\n            kind: tab\n            name: customRoutingRules\n            label: "Custom DICOM Routing"\n            group: manageData\n            contents:\n                ${projectRouting}\n                ${subjectRouting}\n                ${sessionRouting}\n        dicomFileNaming:\n            kind: tab\n            name: dicomFileNaming\n            label: "DICOM File Naming"\n            group: manageData\n            contents:\n                ${dicomNaming}\n        pipelinesTab:\n            kind: tab\n            label: Pipeline Settings\n            group: advanced\n            contents:\n                ${pipelineSettings}\n        dicomScpReceiversTab:\n            kind: tab\n            label: DICOM SCP Receivers\n            group: advanced\n            contents:\n                ${dicomScpReceiversGlobal}\n                ${dicomScpReceivers}\n        loggingConfigurationTab:\n            kind: tab\n            label: Logging Configuration\n            group: advanced\n            contents:\n                ${loggingConfigurationPanel}\n        fileSystemTab:\n            kind: tab\n            label: File System\n            group: advanced\n            contents:\n                ${fileSystem}\n        fileSystemBehaviorsTab:\n            kind: tab\n            label: File System Behavior\n            group: advanced\n            contents:\n                ${fileSystemBehaviors}\n        asyncOperationsTab:\n            kind: tab\n            label: Async Operations\n            group: advanced\n            contents:\n                ${asyncOperations}\n                ${eventTrackingDataCleanup}\n\n        manageInvestigators:\n            kind: tab\n            label: Manage Investigators\n            group: other\n            contents:\n                ${investigators}\n        misc:\n            kind: tab\n            label: Miscellaneous\n            contents:\n                ${setScanTypeMapping}\n                ${scanTableSettings}\n                ${recentExptListSettings}\n                ${setPreventCrossModalityMerge}\n                ${manualQC}\n                ${developmentUtilities}\n\n\n
201	2025-11-10 06:58:30.106	1970-01-01 00:00:00	t	2025-11-10 06:58:30.106		setupMessage	setupMessage	siteAdmin	\N	setupMessage:\n    tag: div.message\n    element:\n        style:\n            marginBottom: 24px\n        html: >\n            The settings below need to be configured before this XNAT system\n            can be used. Please set the properties below and submit the form to continue.\n\n
202	2025-11-10 06:58:30.108	1970-01-01 00:00:00	t	2025-11-10 06:58:30.108		siteSetupSiteInfo	Site Information	siteAdmin	\N	siteSetupSiteInfo:\n    kind: panel.form\n    name: siteSetupSiteInfo\n    label: Site Information\n    footer: false\n    method: POST\n    url: /xapi/siteConfig\n    contentType: json\n    contents:\n        ${siteId}\n        ${siteUrl}\n        ${adminEmail}\n\n
203	2025-11-10 06:58:30.109	1970-01-01 00:00:00	t	2025-11-10 06:58:30.109		dataStorage	File System	siteAdmin	\N	dataStorage:\n    kind: panel.form\n    name: dataStorage\n    label: File System\n    footer: false\n    method: POST\n    contentType: json\n    url: /xapi/siteConfig\n    contents:\n        ${archivePath}\n        ${prearchivePath}\n        ${buildPath}\n        ${pipelinePath}\n        ${cachePath}\n\n\n
204	2025-11-10 06:58:30.111	1970-01-01 00:00:00	t	2025-11-10 06:58:30.111		initialSetup	XNAT Initial Setup	siteAdmin	\N	initialSetup:\n    kind: app.siteSetup.form\n    name: initialSetup\n    label: XNAT Initial Setup\n    contents:\n        ${setupMessage}\n        ${setupSiteInfo}\n        ${fileSystem}\n        ${emailServerSettings}\n
\.


--
-- Data for Name: xhbm_study_routing; Type: TABLE DATA; Schema: public; Owner: xnat
--

COPY public.xhbm_study_routing (id, created, disabled, enabled, "timestamp", label, project_id, study_instance_uid, subject_id, user_id) FROM stdin;
\.


--
-- Data for Name: xhbm_subscriber; Type: TABLE DATA; Schema: public; Owner: xnat
--

COPY public.xhbm_subscriber (id, created, disabled, enabled, "timestamp", emails, name) FROM stdin;
\.


--
-- Data for Name: xhbm_subscription; Type: TABLE DATA; Schema: public; Owner: xnat
--

COPY public.xhbm_subscription (id, created, disabled, enabled, "timestamp", subscriber_type, definition, subscriber) FROM stdin;
\.


--
-- Data for Name: xhbm_subscription_channels; Type: TABLE DATA; Schema: public; Owner: xnat
--

COPY public.xhbm_subscription_channels (subscription, channels) FROM stdin;
\.


--
-- Data for Name: xhbm_subscription_delivery_entity; Type: TABLE DATA; Schema: public; Owner: xnat
--

COPY public.xhbm_subscription_delivery_entity (id, created, disabled, enabled, "timestamp", action_inputs, action_user_login, description, error_state, event_type, eventuuid, project_id, status, status_message, status_timestamp, subscription_id, subscription, triggering_event_entity) FROM stdin;
\.


--
-- Data for Name: xhbm_subscription_delivery_payload; Type: TABLE DATA; Schema: public; Owner: xnat
--

COPY public.xhbm_subscription_delivery_payload (payload_id, delivery_id) FROM stdin;
\.


--
-- Data for Name: xhbm_subscription_entity; Type: TABLE DATA; Schema: public; Owner: xnat
--

COPY public.xhbm_subscription_entity (id, created, disabled, enabled, "timestamp", act_as_event_user, action_key, action_provider, active, custom_listener_id, name, subscription_owner, event_service_filter_entity) FROM stdin;
\.


--
-- Data for Name: xhbm_subscription_entity_attributes; Type: TABLE DATA; Schema: public; Owner: xnat
--

COPY public.xhbm_subscription_entity_attributes (subscription_entity, attributes, attributes_key) FROM stdin;
\.


--
-- Data for Name: xhbm_timed_event_status_entity; Type: TABLE DATA; Schema: public; Owner: xnat
--

COPY public.xhbm_timed_event_status_entity (id, message, status, status_timestamp, subscription_delivery_entity) FROM stdin;
\.


--
-- Data for Name: xhbm_tool; Type: TABLE DATA; Schema: public; Owner: xnat
--

COPY public.xhbm_tool (id, created, disabled, enabled, "timestamp", resolver, strict, tool_description, tool_id, tool_name) FROM stdin;
1	2025-11-10 06:42:35.446	1970-01-01 00:00:00	t	2025-11-10 06:42:35.446	\N	t	Manages preferences and settings for XNAT asynchronous services and workers.	asyncOps	XNAT Async Operations Preferences
2	2025-11-10 06:42:37.105	1970-01-01 00:00:00	t	2025-11-10 06:42:37.105	\N	f	Manages site configurations and settings for the XNAT system.	siteConfig	XNAT Site Preferences
3	2025-11-10 06:42:40.592	1970-01-01 00:00:00	t	2025-11-10 06:42:40.592	\N	t	Manages plugin open URL authorization	pluginOpenUrls	Plugin Open URL Preferences
4	2025-11-10 06:42:41.281	1970-01-01 00:00:00	t	2025-11-10 06:42:41.281	\N	t	Manages security configurations and settings for the XNAT system.	security	XNAT Security Preferences
5	2025-11-10 06:42:46.794	1970-01-01 00:00:00	t	2025-11-10 06:42:46.794	\N	f	Manages notifications and email settings for the XNAT system.	notifications	XNAT Site Notifications Preferences
6	2025-11-10 06:42:52.082	1970-01-01 00:00:00	t	2025-11-10 06:42:52.082	\N	t	Manages preferences for the Spawner configuration.	spawner	XNAT Spawner Preferences
7	2025-11-10 06:42:52.465	1970-01-01 00:00:00	t	2025-11-10 06:42:52.465	\N	f	Manages preferences and settings for the XNAT automation services.	automation	XNAT Automation Preferences
8	2025-11-10 06:42:52.507	1970-01-01 00:00:00	t	2025-11-10 06:42:52.507	\N	t	Manages preferences and settings for the XNAT file-store service.	fileStore	XNAT File Store Service Preferences
9	2025-11-10 06:42:52.548	1970-01-01 00:00:00	t	2025-11-10 06:42:52.548	\N	t	Manages preferences and settings for the XNAT traditional pipeline engine integration.	pipelines	XNAT Traditional Pipeline Preferences
10	2025-11-10 06:42:52.606	1970-01-01 00:00:00	t	2025-11-10 06:42:52.606	\N	t	Manages preferences that should not be surfaced to users.	system	XNAT System Preferences
11	2025-11-10 06:42:52.738	1970-01-01 00:00:00	t	2025-11-10 06:42:52.738	\N	t	Non-user-facing flags to disable in-development features related to Custom Forms	custom-forms-features	Custom Forms Feature Flags
12	2025-11-10 06:42:54.326	1970-01-01 00:00:00	t	2025-11-10 06:42:54.326	\N	t	Preferences to enable/disable Event Service functionality	eventService	Event Service Prefs
\.


--
-- Data for Name: xhbm_triggering_event_entity; Type: TABLE DATA; Schema: public; Owner: xnat
--

COPY public.xhbm_triggering_event_entity (id, event_name, object_label, status, xnat_type, is_xsi_type, xsi_uri) FROM stdin;
\.


--
-- Data for Name: xhbm_user_change_request; Type: TABLE DATA; Schema: public; Owner: xnat
--

COPY public.xhbm_user_change_request (id, created, disabled, enabled, "timestamp", change_id, field_to_change, guid, new_value, username) FROM stdin;
\.


--
-- Data for Name: xhbm_user_registration_data; Type: TABLE DATA; Schema: public; Owner: xnat
--

COPY public.xhbm_user_registration_data (id, created, disabled, enabled, "timestamp", comments, login, organization, phone) FROM stdin;
\.


--
-- Data for Name: xhbm_user_role; Type: TABLE DATA; Schema: public; Owner: xnat
--

COPY public.xhbm_user_role (id, created, disabled, enabled, "timestamp", role, username) FROM stdin;
\.


--
-- Data for Name: xhbm_xdat_user_auth; Type: TABLE DATA; Schema: public; Owner: xnat
--

COPY public.xhbm_xdat_user_auth (id, created, disabled, enabled, "timestamp", auth_method, auth_method_id, auth_user, failed_login_attempts, last_login_attempt, last_successful_login, lockout_time, password_updated, xdat_username) FROM stdin;
\.


--
-- Data for Name: xhbm_xft_field_exclusion; Type: TABLE DATA; Schema: public; Owner: xnat
--

COPY public.xhbm_xft_field_exclusion (id, created, disabled, enabled, "timestamp", pattern, scope, target_id) FROM stdin;
\.


--
-- Data for Name: xhbm_xnat_node_info; Type: TABLE DATA; Schema: public; Owner: xnat
--

COPY public.xhbm_xnat_node_info (id, created, disabled, enabled, "timestamp", host_name, is_active, last_check_in, last_initialized, last_ip_address, node_id) FROM stdin;
\.


--
-- Data for Name: xhbm_xnat_task_info; Type: TABLE DATA; Schema: public; Owner: xnat
--

COPY public.xhbm_xnat_task_info (id, created, disabled, enabled, "timestamp", last_run, task_id, xnat_node_info_id) FROM stdin;
\.


--
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: public; Owner: xnat
--

SELECT pg_catalog.setval('public.hibernate_sequence', 2, true);


--
-- Name: xhbm_alias_token_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xnat
--

SELECT pg_catalog.setval('public.xhbm_alias_token_id_seq', 1, false);


--
-- Name: xhbm_archive_processor_instance_aud_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xnat
--

SELECT pg_catalog.setval('public.xhbm_archive_processor_instance_aud_id_seq', 3, true);


--
-- Name: xhbm_archive_processor_instance_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xnat
--

SELECT pg_catalog.setval('public.xhbm_archive_processor_instance_id_seq', 2, true);


--
-- Name: xhbm_automation_event_ids_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xnat
--

SELECT pg_catalog.setval('public.xhbm_automation_event_ids_id_seq', 1, false);


--
-- Name: xhbm_automation_event_ids_ids_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xnat
--

SELECT pg_catalog.setval('public.xhbm_automation_event_ids_ids_id_seq', 1, false);


--
-- Name: xhbm_automation_filters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xnat
--

SELECT pg_catalog.setval('public.xhbm_automation_filters_id_seq', 1, false);


--
-- Name: xhbm_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xnat
--

SELECT pg_catalog.setval('public.xhbm_category_id_seq', 1, false);


--
-- Name: xhbm_channel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xnat
--

SELECT pg_catalog.setval('public.xhbm_channel_id_seq', 1, false);


--
-- Name: xhbm_compute_environment_config_entity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xnat
--

SELECT pg_catalog.setval('public.xhbm_compute_environment_config_entity_id_seq', 1, false);


--
-- Name: xhbm_compute_environment_entity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xnat
--

SELECT pg_catalog.setval('public.xhbm_compute_environment_entity_id_seq', 1, false);


--
-- Name: xhbm_compute_environment_scope_entity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xnat
--

SELECT pg_catalog.setval('public.xhbm_compute_environment_scope_entity_id_seq', 1, true);


--
-- Name: xhbm_conditional_initialization_task_status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xnat
--

SELECT pg_catalog.setval('public.xhbm_conditional_initialization_task_status_id_seq', 1, false);


--
-- Name: xhbm_configuration_data_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xnat
--

SELECT pg_catalog.setval('public.xhbm_configuration_data_id_seq', 2, true);


--
-- Name: xhbm_configuration_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xnat
--

SELECT pg_catalog.setval('public.xhbm_configuration_id_seq', 4, true);


--
-- Name: xhbm_constraint_config_entity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xnat
--

SELECT pg_catalog.setval('public.xhbm_constraint_config_entity_id_seq', 1, false);


--
-- Name: xhbm_constraint_scope_entity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xnat
--

SELECT pg_catalog.setval('public.xhbm_constraint_scope_entity_id_seq', 1, true);


--
-- Name: xhbm_custom_variable_applies_to_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xnat
--

SELECT pg_catalog.setval('public.xhbm_custom_variable_applies_to_id_seq', 1, false);


--
-- Name: xhbm_custom_variable_form_applies_to_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xnat
--

SELECT pg_catalog.setval('public.xhbm_custom_variable_form_applies_to_id_seq', 1, true);


--
-- Name: xhbm_custom_variable_form_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xnat
--

SELECT pg_catalog.setval('public.xhbm_custom_variable_form_id_seq', 1, false);


--
-- Name: xhbm_data_cache_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xnat
--

SELECT pg_catalog.setval('public.xhbm_data_cache_item_id_seq', 1, false);


--
-- Name: xhbm_definition_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xnat
--

SELECT pg_catalog.setval('public.xhbm_definition_id_seq', 1, false);


--
-- Name: xhbm_dicom_inbox_import_request_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xnat
--

SELECT pg_catalog.setval('public.xhbm_dicom_inbox_import_request_id_seq', 1, false);


--
-- Name: xhbm_dicom_mapping_entity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xnat
--

SELECT pg_catalog.setval('public.xhbm_dicom_mapping_entity_id_seq', 1, false);


--
-- Name: xhbm_dicomscpinstance_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xnat
--

SELECT pg_catalog.setval('public.xhbm_dicomscpinstance_id_seq', 1, true);


--
-- Name: xhbm_direct_archive_session_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xnat
--

SELECT pg_catalog.setval('public.xhbm_direct_archive_session_id_seq', 1, false);


--
-- Name: xhbm_event_filters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xnat
--

SELECT pg_catalog.setval('public.xhbm_event_filters_id_seq', 1, false);


--
-- Name: xhbm_event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xnat
--

SELECT pg_catalog.setval('public.xhbm_event_id_seq', 1, false);


--
-- Name: xhbm_event_service_filter_entity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xnat
--

SELECT pg_catalog.setval('public.xhbm_event_service_filter_entity_id_seq', 1, false);


--
-- Name: xhbm_event_service_payload_entity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xnat
--

SELECT pg_catalog.setval('public.xhbm_event_service_payload_entity_id_seq', 1, true);


--
-- Name: xhbm_event_specific_fields_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xnat
--

SELECT pg_catalog.setval('public.xhbm_event_specific_fields_id_seq', 1, false);


--
-- Name: xhbm_event_tracking_data_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xnat
--

SELECT pg_catalog.setval('public.xhbm_event_tracking_data_id_seq', 1, false);


--
-- Name: xhbm_feature_definition_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xnat
--

SELECT pg_catalog.setval('public.xhbm_feature_definition_id_seq', 8, true);


--
-- Name: xhbm_file_store_info_aud_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xnat
--

SELECT pg_catalog.setval('public.xhbm_file_store_info_aud_id_seq', 1, true);


--
-- Name: xhbm_file_store_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xnat
--

SELECT pg_catalog.setval('public.xhbm_file_store_info_id_seq', 1, false);


--
-- Name: xhbm_group_feature_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xnat
--

SELECT pg_catalog.setval('public.xhbm_group_feature_id_seq', 1, false);


--
-- Name: xhbm_hardware_config_entity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xnat
--

SELECT pg_catalog.setval('public.xhbm_hardware_config_entity_id_seq', 1, false);


--
-- Name: xhbm_hardware_constraint_entity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xnat
--

SELECT pg_catalog.setval('public.xhbm_hardware_constraint_entity_id_seq', 1, false);


--
-- Name: xhbm_hardware_entity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xnat
--

SELECT pg_catalog.setval('public.xhbm_hardware_entity_id_seq', 1, false);


--
-- Name: xhbm_hardware_scope_entity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xnat
--

SELECT pg_catalog.setval('public.xhbm_hardware_scope_entity_id_seq', 1, true);


--
-- Name: xhbm_host_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xnat
--

SELECT pg_catalog.setval('public.xhbm_host_info_id_seq', 1, false);


--
-- Name: xhbm_notification_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xnat
--

SELECT pg_catalog.setval('public.xhbm_notification_id_seq', 1, false);


--
-- Name: xhbm_persistent_event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xnat
--

SELECT pg_catalog.setval('public.xhbm_persistent_event_id_seq', 1, false);


--
-- Name: xhbm_preference_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xnat
--

SELECT pg_catalog.setval('public.xhbm_preference_id_seq', 224, true);


--
-- Name: xhbm_resource_survey_request_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xnat
--

SELECT pg_catalog.setval('public.xhbm_resource_survey_request_id_seq', 1, false);


--
-- Name: xhbm_script_aud_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xnat
--

SELECT pg_catalog.setval('public.xhbm_script_aud_id_seq', 1, true);


--
-- Name: xhbm_script_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xnat
--

SELECT pg_catalog.setval('public.xhbm_script_id_seq', 1, false);


--
-- Name: xhbm_script_launch_request_event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xnat
--

SELECT pg_catalog.setval('public.xhbm_script_launch_request_event_id_seq', 1, true);


--
-- Name: xhbm_script_trigger_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xnat
--

SELECT pg_catalog.setval('public.xhbm_script_trigger_id_seq', 1, false);


--
-- Name: xhbm_script_trigger_template_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xnat
--

SELECT pg_catalog.setval('public.xhbm_script_trigger_template_id_seq', 1, false);


--
-- Name: xhbm_spawner_element_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xnat
--

SELECT pg_catalog.setval('public.xhbm_spawner_element_id_seq', 204, true);


--
-- Name: xhbm_study_routing_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xnat
--

SELECT pg_catalog.setval('public.xhbm_study_routing_id_seq', 1, false);


--
-- Name: xhbm_subscriber_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xnat
--

SELECT pg_catalog.setval('public.xhbm_subscriber_id_seq', 1, false);


--
-- Name: xhbm_subscription_delivery_entity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xnat
--

SELECT pg_catalog.setval('public.xhbm_subscription_delivery_entity_id_seq', 1, false);


--
-- Name: xhbm_subscription_entity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xnat
--

SELECT pg_catalog.setval('public.xhbm_subscription_entity_id_seq', 1, false);


--
-- Name: xhbm_subscription_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xnat
--

SELECT pg_catalog.setval('public.xhbm_subscription_id_seq', 1, false);


--
-- Name: xhbm_timed_event_status_entity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xnat
--

SELECT pg_catalog.setval('public.xhbm_timed_event_status_entity_id_seq', 1, false);


--
-- Name: xhbm_tool_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xnat
--

SELECT pg_catalog.setval('public.xhbm_tool_id_seq', 12, true);


--
-- Name: xhbm_triggering_event_entity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xnat
--

SELECT pg_catalog.setval('public.xhbm_triggering_event_entity_id_seq', 1, false);


--
-- Name: xhbm_user_change_request_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xnat
--

SELECT pg_catalog.setval('public.xhbm_user_change_request_id_seq', 1, false);


--
-- Name: xhbm_user_registration_data_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xnat
--

SELECT pg_catalog.setval('public.xhbm_user_registration_data_id_seq', 1, false);


--
-- Name: xhbm_user_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xnat
--

SELECT pg_catalog.setval('public.xhbm_user_role_id_seq', 1, false);


--
-- Name: xhbm_xdat_user_auth_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xnat
--

SELECT pg_catalog.setval('public.xhbm_xdat_user_auth_id_seq', 1, false);


--
-- Name: xhbm_xft_field_exclusion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xnat
--

SELECT pg_catalog.setval('public.xhbm_xft_field_exclusion_id_seq', 1, false);


--
-- Name: xhbm_xnat_node_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xnat
--

SELECT pg_catalog.setval('public.xhbm_xnat_node_info_id_seq', 1, false);


--
-- Name: xhbm_xnat_task_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xnat
--

SELECT pg_catalog.setval('public.xhbm_xnat_task_info_id_seq', 1, false);


--
-- Name: xhbm_hardware_entity uk1urpjb25d3tumkhdowda9vixd; Type: CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_hardware_entity
    ADD CONSTRAINT uk1urpjb25d3tumkhdowda9vixd UNIQUE (name);


--
-- Name: xhbm_compute_environment_entity uk4fs3rk938sxe84u6ai9dg6wgc; Type: CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_compute_environment_entity
    ADD CONSTRAINT uk4fs3rk938sxe84u6ai9dg6wgc UNIQUE (name);


--
-- Name: xhbm_automation_event_ids uk64wsblbbf0f6w7p8pnpwhr88y; Type: CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_automation_event_ids
    ADD CONSTRAINT uk64wsblbbf0f6w7p8pnpwhr88y UNIQUE (external_id, src_event_class);


--
-- Name: xhbm_subscriber uk7drdbssc4h6cabj3p2919f5pf; Type: CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_subscriber
    ADD CONSTRAINT uk7drdbssc4h6cabj3p2919f5pf UNIQUE (name);


--
-- Name: xhbm_direct_archive_session uk8ti8h9rvkoqrms8wybo9s84gj; Type: CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_direct_archive_session
    ADD CONSTRAINT uk8ti8h9rvkoqrms8wybo9s84gj UNIQUE (project, name, tag);


--
-- Name: xhbm_xnat_node_info uk93rrijqhb53c3yc4v3p4o4lrf; Type: CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_xnat_node_info
    ADD CONSTRAINT uk93rrijqhb53c3yc4v3p4o4lrf UNIQUE (node_id, host_name);


--
-- Name: xhbm_tool uk_5p77s7ss9l8pbqdy16pj0i3i7; Type: CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_tool
    ADD CONSTRAINT uk_5p77s7ss9l8pbqdy16pj0i3i7 UNIQUE (tool_name);


--
-- Name: xhbm_study_routing uk_8rr09esmjf07k35giqojchxib; Type: CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_study_routing
    ADD CONSTRAINT uk_8rr09esmjf07k35giqojchxib UNIQUE (study_instance_uid);


--
-- Name: xhbm_data_cache_item uk_acf04xuaofxr1yd05g1jc5fy3; Type: CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_data_cache_item
    ADD CONSTRAINT uk_acf04xuaofxr1yd05g1jc5fy3 UNIQUE (key);


--
-- Name: xhbm_alias_token uk_cww07clrguh0stjda3naaq0ho; Type: CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_alias_token
    ADD CONSTRAINT uk_cww07clrguh0stjda3naaq0ho UNIQUE (alias);


--
-- Name: xhbm_channel uk_gu7ds1lqdysgjr92ko6smsr0w; Type: CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_channel
    ADD CONSTRAINT uk_gu7ds1lqdysgjr92ko6smsr0w UNIQUE (name);


--
-- Name: xhbm_script_trigger uk_kv6hfqitrp86x5w04dptyh9be; Type: CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_script_trigger
    ADD CONSTRAINT uk_kv6hfqitrp86x5w04dptyh9be UNIQUE (trigger_id);


--
-- Name: xhbm_event uk_l2gwckfnfwnhguheqn4ta42vk; Type: CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_event
    ADD CONSTRAINT uk_l2gwckfnfwnhguheqn4ta42vk UNIQUE (event_label);


--
-- Name: xhbm_configuration_data_configurations uk_mdcxpup676rj7pi4lp8w44msb; Type: CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_configuration_data_configurations
    ADD CONSTRAINT uk_mdcxpup676rj7pi4lp8w44msb UNIQUE (configurations);


--
-- Name: xhbm_user_registration_data uk_n14anl9ur4cv97rfkeqsoo77c; Type: CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_user_registration_data
    ADD CONSTRAINT uk_n14anl9ur4cv97rfkeqsoo77c UNIQUE (login);


--
-- Name: xhbm_tool uk_r7xqcamvdk7cha6gxqplc2iog; Type: CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_tool
    ADD CONSTRAINT uk_r7xqcamvdk7cha6gxqplc2iog UNIQUE (tool_id);


--
-- Name: xhbm_event uk_tc4p7ls7ph5r4cecb2e3uxej8; Type: CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_event
    ADD CONSTRAINT uk_tc4p7ls7ph5r4cecb2e3uxej8 UNIQUE (event_id);


--
-- Name: xhbm_conditional_initialization_task_status ukacbs4cu013xxf96rqhwvj95qy; Type: CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_conditional_initialization_task_status
    ADD CONSTRAINT ukacbs4cu013xxf96rqhwvj95qy UNIQUE (task_name);


--
-- Name: xhbm_group_feature ukb645qeaw6k1nhhwugnmwufxtd; Type: CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_group_feature
    ADD CONSTRAINT ukb645qeaw6k1nhhwugnmwufxtd UNIQUE (feature, group_id, disabled);


--
-- Name: xhbm_automation_filters ukd3byjbmrx47euj3k7wjlnfde6; Type: CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_automation_filters
    ADD CONSTRAINT ukd3byjbmrx47euj3k7wjlnfde6 UNIQUE (external_id, src_event_class, field);


--
-- Name: xhbm_category ukerqeifrqno8mbctp99vepwnc9; Type: CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_category
    ADD CONSTRAINT ukerqeifrqno8mbctp99vepwnc9 UNIQUE (scope, event, enabled, disabled);


--
-- Name: xhbm_dicom_mapping_entity ukgbbyjq1em97urmubvxyxaw6nx; Type: CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_dicom_mapping_entity
    ADD CONSTRAINT ukgbbyjq1em97urmubvxyxaw6nx UNIQUE (schema_element, dicom_tag, scope, scope_object_id);


--
-- Name: xhbm_xnat_task_info ukhi9isws9mh4q83rd6vfq7sk90; Type: CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_xnat_task_info
    ADD CONSTRAINT ukhi9isws9mh4q83rd6vfq7sk90 UNIQUE (task_id, xnat_node_info_id);


--
-- Name: xhbm_spawner_element uki4o9fc1a16sml7hj9sw8th60; Type: CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_spawner_element
    ADD CONSTRAINT uki4o9fc1a16sml7hj9sw8th60 UNIQUE (namespace, element_id);


--
-- Name: xhbm_event_tracking_data ukicce20erf8x79j6fh1105wtnl; Type: CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_event_tracking_data
    ADD CONSTRAINT ukicce20erf8x79j6fh1105wtnl UNIQUE (key, user_id);


--
-- Name: xhbm_host_info ukirf6f461i3phxm2v0otp4qtqh; Type: CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_host_info
    ADD CONSTRAINT ukirf6f461i3phxm2v0otp4qtqh UNIQUE (host_name);


--
-- Name: xhbm_xdat_user_auth ukjwk1uojhiie77hcctp7loqqd4; Type: CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_xdat_user_auth
    ADD CONSTRAINT ukjwk1uojhiie77hcctp7loqqd4 UNIQUE (auth_user, auth_method, auth_method_id);


--
-- Name: xhbm_resource_survey_request uklhb9abbp3a5sn8io0t9cqogwp; Type: CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_resource_survey_request
    ADD CONSTRAINT uklhb9abbp3a5sn8io0t9cqogwp UNIQUE (project_id, subject_id, experiment_id, scan_id, resource_label, closing_date);


--
-- Name: xhbm_feature_definition ukm6lkg5cvyrpvsqrsvwnf8scob; Type: CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_feature_definition
    ADD CONSTRAINT ukm6lkg5cvyrpvsqrsvwnf8scob UNIQUE (key, disabled);


--
-- Name: xhbm_script_trigger_template ukmlfmyuvmu8iprdwgdqcsqt5et; Type: CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_script_trigger_template
    ADD CONSTRAINT ukmlfmyuvmu8iprdwgdqcsqt5et UNIQUE (template_id, disabled);


--
-- Name: xhbm_custom_variable_form uko328qsntos9od8lgxoera91wf; Type: CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_custom_variable_form
    ADD CONSTRAINT uko328qsntos9od8lgxoera91wf UNIQUE (form_uuid);


--
-- Name: xhbm_xft_field_exclusion uko7bwrk83kf5n9fe2j530532xe; Type: CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_xft_field_exclusion
    ADD CONSTRAINT uko7bwrk83kf5n9fe2j530532xe UNIQUE (scope, target_id, pattern);


--
-- Name: xhbm_custom_variable_applies_to ukoncs66onqi40iab383lbf6wxv; Type: CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_custom_variable_applies_to
    ADD CONSTRAINT ukoncs66onqi40iab383lbf6wxv UNIQUE (scope, data_type, entity_id, visit, protocol, sub_type);


--
-- Name: xhbm_user_change_request ukour04ss3nnlvhdkajhp1ql9l8; Type: CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_user_change_request
    ADD CONSTRAINT ukour04ss3nnlvhdkajhp1ql9l8 UNIQUE (username, field_to_change, disabled);


--
-- Name: xhbm_file_store_info ukr5bbjjl4h3yh96uv4f7jhvi16; Type: CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_file_store_info
    ADD CONSTRAINT ukr5bbjjl4h3yh96uv4f7jhvi16 UNIQUE (coordinates);


--
-- Name: xhbm_preference uksmkr1p5n13nyhvjf8242cll7x; Type: CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_preference
    ADD CONSTRAINT uksmkr1p5n13nyhvjf8242cll7x UNIQUE (tool, name, scope, entity_id);


--
-- Name: xhbm_user_role ukto5ye3nudu8aspnnonelx83sn; Type: CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_user_role
    ADD CONSTRAINT ukto5ye3nudu8aspnnonelx83sn UNIQUE (role, username, disabled);


--
-- Name: xhbm_script uktq14v8aai82fy2xcppvd7yrym; Type: CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_script
    ADD CONSTRAINT uktq14v8aai82fy2xcppvd7yrym UNIQUE (script_id, disabled);


--
-- Name: xhbm_alias_token xhbm_alias_token_pkey; Type: CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_alias_token
    ADD CONSTRAINT xhbm_alias_token_pkey PRIMARY KEY (id);


--
-- Name: xhbm_archive_processor_instance_aud xhbm_archive_processor_instance_aud_pkey; Type: CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_archive_processor_instance_aud
    ADD CONSTRAINT xhbm_archive_processor_instance_aud_pkey PRIMARY KEY (id, rev);


--
-- Name: xhbm_archive_processor_instance_parameters_aud xhbm_archive_processor_instance_parameters_aud_pkey; Type: CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_archive_processor_instance_parameters_aud
    ADD CONSTRAINT xhbm_archive_processor_instance_parameters_aud_pkey PRIMARY KEY (rev, archive_processor_instance, value, parameter_name);


--
-- Name: xhbm_archive_processor_instance_parameters xhbm_archive_processor_instance_parameters_pkey; Type: CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_archive_processor_instance_parameters
    ADD CONSTRAINT xhbm_archive_processor_instance_parameters_pkey PRIMARY KEY (archive_processor_instance, parameter_name);


--
-- Name: xhbm_archive_processor_instance xhbm_archive_processor_instance_pkey; Type: CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_archive_processor_instance
    ADD CONSTRAINT xhbm_archive_processor_instance_pkey PRIMARY KEY (id);


--
-- Name: xhbm_archive_processor_instance_project_ids_list_aud xhbm_archive_processor_instance_project_ids_list_aud_pkey; Type: CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_archive_processor_instance_project_ids_list_aud
    ADD CONSTRAINT xhbm_archive_processor_instance_project_ids_list_aud_pkey PRIMARY KEY (rev, archive_processor_instance, project_ids_list);


--
-- Name: xhbm_archive_processor_instance_scp_blacklist_aud xhbm_archive_processor_instance_scp_blacklist_aud_pkey; Type: CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_archive_processor_instance_scp_blacklist_aud
    ADD CONSTRAINT xhbm_archive_processor_instance_scp_blacklist_aud_pkey PRIMARY KEY (rev, archive_processor_instance, scp_blacklist);


--
-- Name: xhbm_archive_processor_instance_scp_whitelist_aud xhbm_archive_processor_instance_scp_whitelist_aud_pkey; Type: CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_archive_processor_instance_scp_whitelist_aud
    ADD CONSTRAINT xhbm_archive_processor_instance_scp_whitelist_aud_pkey PRIMARY KEY (rev, archive_processor_instance, scp_whitelist);


--
-- Name: xhbm_automation_event_ids_ids xhbm_automation_event_ids_ids_pkey; Type: CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_automation_event_ids_ids
    ADD CONSTRAINT xhbm_automation_event_ids_ids_pkey PRIMARY KEY (id);


--
-- Name: xhbm_automation_event_ids xhbm_automation_event_ids_pkey; Type: CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_automation_event_ids
    ADD CONSTRAINT xhbm_automation_event_ids_pkey PRIMARY KEY (id);


--
-- Name: xhbm_automation_filters xhbm_automation_filters_pkey; Type: CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_automation_filters
    ADD CONSTRAINT xhbm_automation_filters_pkey PRIMARY KEY (id);


--
-- Name: xhbm_category xhbm_category_pkey; Type: CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_category
    ADD CONSTRAINT xhbm_category_pkey PRIMARY KEY (id);


--
-- Name: xhbm_channel xhbm_channel_pkey; Type: CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_channel
    ADD CONSTRAINT xhbm_channel_pkey PRIMARY KEY (id);


--
-- Name: xhbm_compute_environment_config_entity xhbm_compute_environment_config_entity_pkey; Type: CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_compute_environment_config_entity
    ADD CONSTRAINT xhbm_compute_environment_config_entity_pkey PRIMARY KEY (id);


--
-- Name: xhbm_compute_environment_entity xhbm_compute_environment_entity_pkey; Type: CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_compute_environment_entity
    ADD CONSTRAINT xhbm_compute_environment_entity_pkey PRIMARY KEY (id);


--
-- Name: xhbm_compute_environment_hardware_options_entity xhbm_compute_environment_hardware_options_entity_pkey; Type: CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_compute_environment_hardware_options_entity
    ADD CONSTRAINT xhbm_compute_environment_hardware_options_entity_pkey PRIMARY KEY (compute_environment_config);


--
-- Name: xhbm_compute_environment_hardware_options_hardware_config xhbm_compute_environment_hardware_options_hardware_config_pkey; Type: CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_compute_environment_hardware_options_hardware_config
    ADD CONSTRAINT xhbm_compute_environment_hardware_options_hardware_config_pkey PRIMARY KEY (compute_environment_hardware_options_id, hardware_config_id);


--
-- Name: xhbm_compute_environment_scope_entity xhbm_compute_environment_scope_entity_pkey; Type: CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_compute_environment_scope_entity
    ADD CONSTRAINT xhbm_compute_environment_scope_entity_pkey PRIMARY KEY (id);


--
-- Name: xhbm_conditional_initialization_task_status xhbm_conditional_initialization_task_status_pkey; Type: CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_conditional_initialization_task_status
    ADD CONSTRAINT xhbm_conditional_initialization_task_status_pkey PRIMARY KEY (id);


--
-- Name: xhbm_configuration_data_configurations xhbm_configuration_data_configurations_pkey; Type: CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_configuration_data_configurations
    ADD CONSTRAINT xhbm_configuration_data_configurations_pkey PRIMARY KEY (configuration_data, configurations);


--
-- Name: xhbm_configuration_data xhbm_configuration_data_pkey; Type: CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_configuration_data
    ADD CONSTRAINT xhbm_configuration_data_pkey PRIMARY KEY (id);


--
-- Name: xhbm_configuration xhbm_configuration_pkey; Type: CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_configuration
    ADD CONSTRAINT xhbm_configuration_pkey PRIMARY KEY (id);


--
-- Name: xhbm_constraint_config_entity xhbm_constraint_config_entity_pkey; Type: CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_constraint_config_entity
    ADD CONSTRAINT xhbm_constraint_config_entity_pkey PRIMARY KEY (id);


--
-- Name: xhbm_constraint_entity xhbm_constraint_entity_pkey; Type: CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_constraint_entity
    ADD CONSTRAINT xhbm_constraint_entity_pkey PRIMARY KEY (constraint_config);


--
-- Name: xhbm_constraint_scope_entity xhbm_constraint_scope_entity_pkey; Type: CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_constraint_scope_entity
    ADD CONSTRAINT xhbm_constraint_scope_entity_pkey PRIMARY KEY (id);


--
-- Name: xhbm_custom_variable_applies_to xhbm_custom_variable_applies_to_pkey; Type: CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_custom_variable_applies_to
    ADD CONSTRAINT xhbm_custom_variable_applies_to_pkey PRIMARY KEY (id);


--
-- Name: xhbm_custom_variable_form_applies_to xhbm_custom_variable_form_applies_to_pkey; Type: CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_custom_variable_form_applies_to
    ADD CONSTRAINT xhbm_custom_variable_form_applies_to_pkey PRIMARY KEY (custom_variable_applies_to, custom_variable_form);


--
-- Name: xhbm_custom_variable_form xhbm_custom_variable_form_pkey; Type: CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_custom_variable_form
    ADD CONSTRAINT xhbm_custom_variable_form_pkey PRIMARY KEY (id);


--
-- Name: xhbm_data_cache_item xhbm_data_cache_item_pkey; Type: CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_data_cache_item
    ADD CONSTRAINT xhbm_data_cache_item_pkey PRIMARY KEY (id);


--
-- Name: xhbm_definition xhbm_definition_pkey; Type: CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_definition
    ADD CONSTRAINT xhbm_definition_pkey PRIMARY KEY (id);


--
-- Name: xhbm_dicom_inbox_import_request_parameters xhbm_dicom_inbox_import_request_parameters_pkey; Type: CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_dicom_inbox_import_request_parameters
    ADD CONSTRAINT xhbm_dicom_inbox_import_request_parameters_pkey PRIMARY KEY (dicom_inbox_import_request, parameters_key);


--
-- Name: xhbm_dicom_inbox_import_request xhbm_dicom_inbox_import_request_pkey; Type: CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_dicom_inbox_import_request
    ADD CONSTRAINT xhbm_dicom_inbox_import_request_pkey PRIMARY KEY (id);


--
-- Name: xhbm_dicom_mapping_entity xhbm_dicom_mapping_entity_pkey; Type: CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_dicom_mapping_entity
    ADD CONSTRAINT xhbm_dicom_mapping_entity_pkey PRIMARY KEY (id);


--
-- Name: xhbm_dicomscpinstance xhbm_dicomscpinstance_pkey; Type: CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_dicomscpinstance
    ADD CONSTRAINT xhbm_dicomscpinstance_pkey PRIMARY KEY (id);


--
-- Name: xhbm_direct_archive_session xhbm_direct_archive_session_pkey; Type: CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_direct_archive_session
    ADD CONSTRAINT xhbm_direct_archive_session_pkey PRIMARY KEY (id);


--
-- Name: xhbm_event_filters xhbm_event_filters_pkey; Type: CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_event_filters
    ADD CONSTRAINT xhbm_event_filters_pkey PRIMARY KEY (id);


--
-- Name: xhbm_event xhbm_event_pkey; Type: CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_event
    ADD CONSTRAINT xhbm_event_pkey PRIMARY KEY (id);


--
-- Name: xhbm_event_service_filter_entity xhbm_event_service_filter_entity_pkey; Type: CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_event_service_filter_entity
    ADD CONSTRAINT xhbm_event_service_filter_entity_pkey PRIMARY KEY (id);


--
-- Name: xhbm_event_service_payload_entity xhbm_event_service_payload_entity_pkey; Type: CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_event_service_payload_entity
    ADD CONSTRAINT xhbm_event_service_payload_entity_pkey PRIMARY KEY (id);


--
-- Name: xhbm_event_specific_fields xhbm_event_specific_fields_pkey; Type: CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_event_specific_fields
    ADD CONSTRAINT xhbm_event_specific_fields_pkey PRIMARY KEY (id);


--
-- Name: xhbm_event_tracking_data xhbm_event_tracking_data_pkey; Type: CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_event_tracking_data
    ADD CONSTRAINT xhbm_event_tracking_data_pkey PRIMARY KEY (id);


--
-- Name: xhbm_feature_definition xhbm_feature_definition_pkey; Type: CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_feature_definition
    ADD CONSTRAINT xhbm_feature_definition_pkey PRIMARY KEY (id);


--
-- Name: xhbm_file_store_info_aud xhbm_file_store_info_aud_pkey; Type: CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_file_store_info_aud
    ADD CONSTRAINT xhbm_file_store_info_aud_pkey PRIMARY KEY (id, rev);


--
-- Name: xhbm_file_store_info xhbm_file_store_info_pkey; Type: CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_file_store_info
    ADD CONSTRAINT xhbm_file_store_info_pkey PRIMARY KEY (id);


--
-- Name: xhbm_group_feature xhbm_group_feature_pkey; Type: CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_group_feature
    ADD CONSTRAINT xhbm_group_feature_pkey PRIMARY KEY (id);


--
-- Name: xhbm_hardware_config_entity xhbm_hardware_config_entity_pkey; Type: CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_hardware_config_entity
    ADD CONSTRAINT xhbm_hardware_config_entity_pkey PRIMARY KEY (id);


--
-- Name: xhbm_hardware_constraint_entity xhbm_hardware_constraint_entity_pkey; Type: CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_hardware_constraint_entity
    ADD CONSTRAINT xhbm_hardware_constraint_entity_pkey PRIMARY KEY (id);


--
-- Name: xhbm_hardware_entity xhbm_hardware_entity_pkey; Type: CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_hardware_entity
    ADD CONSTRAINT xhbm_hardware_entity_pkey PRIMARY KEY (id);


--
-- Name: xhbm_hardware_scope_entity xhbm_hardware_scope_entity_pkey; Type: CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_hardware_scope_entity
    ADD CONSTRAINT xhbm_hardware_scope_entity_pkey PRIMARY KEY (id);


--
-- Name: xhbm_host_info xhbm_host_info_pkey; Type: CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_host_info
    ADD CONSTRAINT xhbm_host_info_pkey PRIMARY KEY (id);


--
-- Name: xhbm_notification xhbm_notification_pkey; Type: CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_notification
    ADD CONSTRAINT xhbm_notification_pkey PRIMARY KEY (id);


--
-- Name: xhbm_persistent_event xhbm_persistent_event_pkey; Type: CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_persistent_event
    ADD CONSTRAINT xhbm_persistent_event_pkey PRIMARY KEY (id);


--
-- Name: xhbm_preference xhbm_preference_pkey; Type: CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_preference
    ADD CONSTRAINT xhbm_preference_pkey PRIMARY KEY (id);


--
-- Name: xhbm_resource_survey_request xhbm_resource_survey_request_pkey; Type: CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_resource_survey_request
    ADD CONSTRAINT xhbm_resource_survey_request_pkey PRIMARY KEY (id);


--
-- Name: xhbm_revinfo xhbm_revinfo_pkey; Type: CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_revinfo
    ADD CONSTRAINT xhbm_revinfo_pkey PRIMARY KEY (rev);


--
-- Name: xhbm_script_aud xhbm_script_aud_pkey; Type: CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_script_aud
    ADD CONSTRAINT xhbm_script_aud_pkey PRIMARY KEY (id, rev);


--
-- Name: xhbm_script_launch_request_event xhbm_script_launch_request_event_pkey; Type: CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_script_launch_request_event
    ADD CONSTRAINT xhbm_script_launch_request_event_pkey PRIMARY KEY (id);


--
-- Name: xhbm_script xhbm_script_pkey; Type: CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_script
    ADD CONSTRAINT xhbm_script_pkey PRIMARY KEY (id);


--
-- Name: xhbm_script_trigger xhbm_script_trigger_pkey; Type: CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_script_trigger
    ADD CONSTRAINT xhbm_script_trigger_pkey PRIMARY KEY (id);


--
-- Name: xhbm_script_trigger_template xhbm_script_trigger_template_pkey; Type: CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_script_trigger_template
    ADD CONSTRAINT xhbm_script_trigger_template_pkey PRIMARY KEY (id);


--
-- Name: xhbm_script_trigger_template_triggers xhbm_script_trigger_template_triggers_pkey; Type: CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_script_trigger_template_triggers
    ADD CONSTRAINT xhbm_script_trigger_template_triggers_pkey PRIMARY KEY (script_trigger_template, triggers);


--
-- Name: xhbm_spawner_element xhbm_spawner_element_pkey; Type: CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_spawner_element
    ADD CONSTRAINT xhbm_spawner_element_pkey PRIMARY KEY (id);


--
-- Name: xhbm_study_routing xhbm_study_routing_pkey; Type: CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_study_routing
    ADD CONSTRAINT xhbm_study_routing_pkey PRIMARY KEY (id);


--
-- Name: xhbm_subscriber xhbm_subscriber_pkey; Type: CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_subscriber
    ADD CONSTRAINT xhbm_subscriber_pkey PRIMARY KEY (id);


--
-- Name: xhbm_subscription_delivery_entity xhbm_subscription_delivery_entity_pkey; Type: CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_subscription_delivery_entity
    ADD CONSTRAINT xhbm_subscription_delivery_entity_pkey PRIMARY KEY (id);


--
-- Name: xhbm_subscription_delivery_payload xhbm_subscription_delivery_payload_pkey; Type: CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_subscription_delivery_payload
    ADD CONSTRAINT xhbm_subscription_delivery_payload_pkey PRIMARY KEY (delivery_id);


--
-- Name: xhbm_subscription_entity_attributes xhbm_subscription_entity_attributes_pkey; Type: CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_subscription_entity_attributes
    ADD CONSTRAINT xhbm_subscription_entity_attributes_pkey PRIMARY KEY (subscription_entity, attributes_key);


--
-- Name: xhbm_subscription_entity xhbm_subscription_entity_pkey; Type: CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_subscription_entity
    ADD CONSTRAINT xhbm_subscription_entity_pkey PRIMARY KEY (id);


--
-- Name: xhbm_subscription xhbm_subscription_pkey; Type: CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_subscription
    ADD CONSTRAINT xhbm_subscription_pkey PRIMARY KEY (id);


--
-- Name: xhbm_timed_event_status_entity xhbm_timed_event_status_entity_pkey; Type: CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_timed_event_status_entity
    ADD CONSTRAINT xhbm_timed_event_status_entity_pkey PRIMARY KEY (id);


--
-- Name: xhbm_tool xhbm_tool_pkey; Type: CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_tool
    ADD CONSTRAINT xhbm_tool_pkey PRIMARY KEY (id);


--
-- Name: xhbm_triggering_event_entity xhbm_triggering_event_entity_pkey; Type: CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_triggering_event_entity
    ADD CONSTRAINT xhbm_triggering_event_entity_pkey PRIMARY KEY (id);


--
-- Name: xhbm_user_change_request xhbm_user_change_request_pkey; Type: CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_user_change_request
    ADD CONSTRAINT xhbm_user_change_request_pkey PRIMARY KEY (id);


--
-- Name: xhbm_user_registration_data xhbm_user_registration_data_pkey; Type: CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_user_registration_data
    ADD CONSTRAINT xhbm_user_registration_data_pkey PRIMARY KEY (id);


--
-- Name: xhbm_user_role xhbm_user_role_pkey; Type: CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_user_role
    ADD CONSTRAINT xhbm_user_role_pkey PRIMARY KEY (id);


--
-- Name: xhbm_xdat_user_auth xhbm_xdat_user_auth_pkey; Type: CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_xdat_user_auth
    ADD CONSTRAINT xhbm_xdat_user_auth_pkey PRIMARY KEY (id);


--
-- Name: xhbm_xft_field_exclusion xhbm_xft_field_exclusion_pkey; Type: CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_xft_field_exclusion
    ADD CONSTRAINT xhbm_xft_field_exclusion_pkey PRIMARY KEY (id);


--
-- Name: xhbm_xnat_node_info xhbm_xnat_node_info_pkey; Type: CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_xnat_node_info
    ADD CONSTRAINT xhbm_xnat_node_info_pkey PRIMARY KEY (id);


--
-- Name: xhbm_xnat_task_info xhbm_xnat_task_info_pkey; Type: CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_xnat_task_info
    ADD CONSTRAINT xhbm_xnat_task_info_pkey PRIMARY KEY (id);


--
-- Name: xhbm_compute_environment_hardware_options_hardware_config fk12w6tucksfl1grd0n7wxwpwox; Type: FK CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_compute_environment_hardware_options_hardware_config
    ADD CONSTRAINT fk12w6tucksfl1grd0n7wxwpwox FOREIGN KEY (compute_environment_hardware_options_id) REFERENCES public.xhbm_compute_environment_hardware_options_entity(compute_environment_config);


--
-- Name: xhbm_configuration fk1bwhv9w7q2j5dqm6h3o6lbsyy; Type: FK CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_configuration
    ADD CONSTRAINT fk1bwhv9w7q2j5dqm6h3o6lbsyy FOREIGN KEY (config_data) REFERENCES public.xhbm_configuration_data(id);


--
-- Name: xhbm_script_trigger_template_triggers fk1yehueecprtwelm3enchkr1f0; Type: FK CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_script_trigger_template_triggers
    ADD CONSTRAINT fk1yehueecprtwelm3enchkr1f0 FOREIGN KEY (script_trigger_template) REFERENCES public.xhbm_script_trigger_template(id);


--
-- Name: xhbm_definition fk1yn2g8t5qq27wk58vrbngsf0n; Type: FK CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_definition
    ADD CONSTRAINT fk1yn2g8t5qq27wk58vrbngsf0n FOREIGN KEY (category) REFERENCES public.xhbm_category(id);


--
-- Name: xhbm_script_trigger_template_triggers fk26pfigd7krf1sfr0lr1cpm72j; Type: FK CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_script_trigger_template_triggers
    ADD CONSTRAINT fk26pfigd7krf1sfr0lr1cpm72j FOREIGN KEY (triggers) REFERENCES public.xhbm_script_trigger(id);


--
-- Name: xhbm_archive_processor_instance_scp_blacklist fk35keg967ar0fe7ipckyf04dod; Type: FK CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_archive_processor_instance_scp_blacklist
    ADD CONSTRAINT fk35keg967ar0fe7ipckyf04dod FOREIGN KEY (archive_processor_instance) REFERENCES public.xhbm_archive_processor_instance(id);


--
-- Name: xhbm_compute_environment_config_entity_config_types fk3b4bq7qhg6n5btcqud1l7llc2; Type: FK CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_compute_environment_config_entity_config_types
    ADD CONSTRAINT fk3b4bq7qhg6n5btcqud1l7llc2 FOREIGN KEY (compute_environment_config_entity) REFERENCES public.xhbm_compute_environment_config_entity(id);


--
-- Name: xhbm_subscription_delivery_payload fk3o9oh7935vf319tu53670mtrx; Type: FK CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_subscription_delivery_payload
    ADD CONSTRAINT fk3o9oh7935vf319tu53670mtrx FOREIGN KEY (delivery_id) REFERENCES public.xhbm_subscription_delivery_entity(id);


--
-- Name: xhbm_preference fk53s8k5x3gy7dap5a6a66h4q6m; Type: FK CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_preference
    ADD CONSTRAINT fk53s8k5x3gy7dap5a6a66h4q6m FOREIGN KEY (tool) REFERENCES public.xhbm_tool(id);


--
-- Name: xhbm_constraint_entity fk54v0psthl1mwobu6opnc2yexs; Type: FK CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_constraint_entity
    ADD CONSTRAINT fk54v0psthl1mwobu6opnc2yexs FOREIGN KEY (constraint_config) REFERENCES public.xhbm_constraint_config_entity(id);


--
-- Name: xhbm_hardware_entity_generic_resources fk5m2ebii0p5wwm9ghgd07bvf37; Type: FK CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_hardware_entity_generic_resources
    ADD CONSTRAINT fk5m2ebii0p5wwm9ghgd07bvf37 FOREIGN KEY (hardware_entity) REFERENCES public.xhbm_hardware_entity(id);


--
-- Name: xhbm_subscription_entity_attributes fk5r5cmh09sye66wutxjcd1liqq; Type: FK CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_subscription_entity_attributes
    ADD CONSTRAINT fk5r5cmh09sye66wutxjcd1liqq FOREIGN KEY (subscription_entity) REFERENCES public.xhbm_subscription_entity(id);


--
-- Name: xhbm_event_filters_filter_vals fk6b4sginjqpn71krx9em0p8gr5; Type: FK CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_event_filters_filter_vals
    ADD CONSTRAINT fk6b4sginjqpn71krx9em0p8gr5 FOREIGN KEY (event_filters) REFERENCES public.xhbm_event_filters(id);


--
-- Name: xhbm_compute_environment_entity_environment_variables fk6evdnv17ts2sfgdcsjoij6hre; Type: FK CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_compute_environment_entity_environment_variables
    ADD CONSTRAINT fk6evdnv17ts2sfgdcsjoij6hre FOREIGN KEY (compute_environment_entity) REFERENCES public.xhbm_compute_environment_entity(id);


--
-- Name: xhbm_constraint_scope_entity_ids fk70bjq2ggwi1aiwkdr616dgm85; Type: FK CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_constraint_scope_entity_ids
    ADD CONSTRAINT fk70bjq2ggwi1aiwkdr616dgm85 FOREIGN KEY (constraint_scope_entity) REFERENCES public.xhbm_constraint_scope_entity(id);


--
-- Name: xhbm_subscription fk7r4axieeehog0qkhphue475dt; Type: FK CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_subscription
    ADD CONSTRAINT fk7r4axieeehog0qkhphue475dt FOREIGN KEY (subscriber) REFERENCES public.xhbm_subscriber(id);


--
-- Name: xhbm_subscription_channels fk8piambd34bmv5tdg9jy87sarh; Type: FK CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_subscription_channels
    ADD CONSTRAINT fk8piambd34bmv5tdg9jy87sarh FOREIGN KEY (channels) REFERENCES public.xhbm_channel(id);


--
-- Name: xhbm_event_specific_fields fk8v481iwuwfcyups61dmnlkgdo; Type: FK CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_event_specific_fields
    ADD CONSTRAINT fk8v481iwuwfcyups61dmnlkgdo FOREIGN KEY (event_specific_fields) REFERENCES public.xhbm_persistent_event(id);


--
-- Name: xhbm_compute_environment_hardware_options_hardware_config fk95yt22yo3qwnq9rqamweti205; Type: FK CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_compute_environment_hardware_options_hardware_config
    ADD CONSTRAINT fk95yt22yo3qwnq9rqamweti205 FOREIGN KEY (hardware_config_id) REFERENCES public.xhbm_hardware_config_entity(id);


--
-- Name: xhbm_constraint_scope_entity fk9ciuvuj88gh3odfh3d31oglo5; Type: FK CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_constraint_scope_entity
    ADD CONSTRAINT fk9ciuvuj88gh3odfh3d31oglo5 FOREIGN KEY (constraint_config) REFERENCES public.xhbm_constraint_config_entity(id);


--
-- Name: xhbm_automation_filters_values fk9ele9spsrmbu0trj7odviwkrl; Type: FK CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_automation_filters_values
    ADD CONSTRAINT fk9ele9spsrmbu0trj7odviwkrl FOREIGN KEY (automation_filters) REFERENCES public.xhbm_automation_filters(id);


--
-- Name: xhbm_notification fk9s8ofg5jcvkg412v2esbfitib; Type: FK CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_notification
    ADD CONSTRAINT fk9s8ofg5jcvkg412v2esbfitib FOREIGN KEY (definition) REFERENCES public.xhbm_definition(id);


--
-- Name: xhbm_subscription_delivery_payload fkadr6tk022ipx657ay9lcxrstr; Type: FK CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_subscription_delivery_payload
    ADD CONSTRAINT fkadr6tk022ipx657ay9lcxrstr FOREIGN KEY (payload_id) REFERENCES public.xhbm_event_service_payload_entity(id);


--
-- Name: xhbm_script_launch_request_event fkajhgjesh0x63kve1rw3t2d0ec; Type: FK CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_script_launch_request_event
    ADD CONSTRAINT fkajhgjesh0x63kve1rw3t2d0ec FOREIGN KEY (id) REFERENCES public.xhbm_persistent_event(id);


--
-- Name: xhbm_archive_processor_instance_project_ids_list fkapfppygwfbg65fvghe3yi3e6e; Type: FK CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_archive_processor_instance_project_ids_list
    ADD CONSTRAINT fkapfppygwfbg65fvghe3yi3e6e FOREIGN KEY (archive_processor_instance) REFERENCES public.xhbm_archive_processor_instance(id);


--
-- Name: xhbm_configuration_data_configurations fkasnavy7i8qi9j4hx5tdmnvjx6; Type: FK CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_configuration_data_configurations
    ADD CONSTRAINT fkasnavy7i8qi9j4hx5tdmnvjx6 FOREIGN KEY (configuration_data) REFERENCES public.xhbm_configuration_data(id);


--
-- Name: xhbm_compute_environment_scope_entity fkbehblvog4h340usxhylv8xe7q; Type: FK CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_compute_environment_scope_entity
    ADD CONSTRAINT fkbehblvog4h340usxhylv8xe7q FOREIGN KEY (compute_environment_config) REFERENCES public.xhbm_compute_environment_config_entity(id);


--
-- Name: xhbm_script_aud fkbshgv3fawvynse335h1srgb8p; Type: FK CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_script_aud
    ADD CONSTRAINT fkbshgv3fawvynse335h1srgb8p FOREIGN KEY (rev) REFERENCES public.xhbm_revinfo(rev);


--
-- Name: xhbm_alias_token_validipaddresses fkca31n8ebfh2o11d27h0ps0b2l; Type: FK CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_alias_token_validipaddresses
    ADD CONSTRAINT fkca31n8ebfh2o11d27h0ps0b2l FOREIGN KEY (alias_token) REFERENCES public.xhbm_alias_token(id);


--
-- Name: xhbm_subscription_delivery_entity fkch086v1544910hjussti8scbn; Type: FK CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_subscription_delivery_entity
    ADD CONSTRAINT fkch086v1544910hjussti8scbn FOREIGN KEY (subscription) REFERENCES public.xhbm_subscription_entity(id);


--
-- Name: xhbm_subscription_channels fkcqn0o8gk7j740a4stlbhth17c; Type: FK CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_subscription_channels
    ADD CONSTRAINT fkcqn0o8gk7j740a4stlbhth17c FOREIGN KEY (subscription) REFERENCES public.xhbm_subscription(id);


--
-- Name: xhbm_custom_variable_form_applies_to fkdfivnaq73mlmdk9r64dlqeqgh; Type: FK CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_custom_variable_form_applies_to
    ADD CONSTRAINT fkdfivnaq73mlmdk9r64dlqeqgh FOREIGN KEY (custom_variable_applies_to) REFERENCES public.xhbm_custom_variable_applies_to(id);


--
-- Name: xhbm_dicom_inbox_import_request_parameters fkdlxq0e1ajrac7mds9p5vet0hp; Type: FK CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_dicom_inbox_import_request_parameters
    ADD CONSTRAINT fkdlxq0e1ajrac7mds9p5vet0hp FOREIGN KEY (dicom_inbox_import_request) REFERENCES public.xhbm_dicom_inbox_import_request(id);


--
-- Name: xhbm_event_service_filter_entity_project_ids fkdui81f9sui1cqpfdw0fn1hvab; Type: FK CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_event_service_filter_entity_project_ids
    ADD CONSTRAINT fkdui81f9sui1cqpfdw0fn1hvab FOREIGN KEY (event_service_filter_entity) REFERENCES public.xhbm_event_service_filter_entity(id);


--
-- Name: xhbm_script_trigger_template_associated_entities fkepdq7x38ibdq6of91jeag6ra1; Type: FK CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_script_trigger_template_associated_entities
    ADD CONSTRAINT fkepdq7x38ibdq6of91jeag6ra1 FOREIGN KEY (script_trigger_template) REFERENCES public.xhbm_script_trigger_template(id);


--
-- Name: xhbm_constraint_entity_constraint_values fkepxlp3dvlqi1deaumf1uf92oq; Type: FK CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_constraint_entity_constraint_values
    ADD CONSTRAINT fkepxlp3dvlqi1deaumf1uf92oq FOREIGN KEY (constraint_entity_constraint_config) REFERENCES public.xhbm_constraint_entity(constraint_config);


--
-- Name: xhbm_subscription fkfeg1rup8uhsm0pw0bwt1gx55h; Type: FK CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_subscription
    ADD CONSTRAINT fkfeg1rup8uhsm0pw0bwt1gx55h FOREIGN KEY (definition) REFERENCES public.xhbm_definition(id);


--
-- Name: xhbm_compute_environment_entity fkfr4fdq2v5fwexymeqagydkkgv; Type: FK CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_compute_environment_entity
    ADD CONSTRAINT fkfr4fdq2v5fwexymeqagydkkgv FOREIGN KEY (compute_environment_config) REFERENCES public.xhbm_compute_environment_config_entity(id);


--
-- Name: xhbm_custom_variable_form_applies_to fkfrjke3i86apt8ir3hl0n3qfo7; Type: FK CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_custom_variable_form_applies_to
    ADD CONSTRAINT fkfrjke3i86apt8ir3hl0n3qfo7 FOREIGN KEY (custom_variable_form) REFERENCES public.xhbm_custom_variable_form(id);


--
-- Name: xhbm_automation_event_ids_ids fkg9o7ms6psk6wigneel33d9s4s; Type: FK CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_automation_event_ids_ids
    ADD CONSTRAINT fkg9o7ms6psk6wigneel33d9s4s FOREIGN KEY (parent_automation_event_ids) REFERENCES public.xhbm_automation_event_ids(id);


--
-- Name: xhbm_event_filters fkghs3jqov66ko56vh41hd8cm9w; Type: FK CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_event_filters
    ADD CONSTRAINT fkghs3jqov66ko56vh41hd8cm9w FOREIGN KEY (event_filters) REFERENCES public.xhbm_script_trigger(id);


--
-- Name: xhbm_hardware_entity fkgkkbt5aa66jyojfro0i7gu9bp; Type: FK CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_hardware_entity
    ADD CONSTRAINT fkgkkbt5aa66jyojfro0i7gu9bp FOREIGN KEY (hardware_config) REFERENCES public.xhbm_hardware_config_entity(id);


--
-- Name: xhbm_file_store_info_aud fkgv38v1bvpktvt10npd1j50nii; Type: FK CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_file_store_info_aud
    ADD CONSTRAINT fkgv38v1bvpktvt10npd1j50nii FOREIGN KEY (rev) REFERENCES public.xhbm_revinfo(rev);


--
-- Name: xhbm_subscription_entity fkh3dae5djjp10qsb30me2n0e69; Type: FK CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_subscription_entity
    ADD CONSTRAINT fkh3dae5djjp10qsb30me2n0e69 FOREIGN KEY (event_service_filter_entity) REFERENCES public.xhbm_event_service_filter_entity(id);


--
-- Name: xhbm_archive_processor_instance_project_ids_list_aud fkixpcw5sblop6v7a8p80edspfc; Type: FK CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_archive_processor_instance_project_ids_list_aud
    ADD CONSTRAINT fkixpcw5sblop6v7a8p80edspfc FOREIGN KEY (rev) REFERENCES public.xhbm_revinfo(rev);


--
-- Name: xhbm_hardware_entity_environment_variables fkjsskh4cohnnxgwahepd4x267i; Type: FK CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_hardware_entity_environment_variables
    ADD CONSTRAINT fkjsskh4cohnnxgwahepd4x267i FOREIGN KEY (hardware_entity) REFERENCES public.xhbm_hardware_entity(id);


--
-- Name: xhbm_timed_event_status_entity fkjv61io3blnbxqfw6q2aocbme1; Type: FK CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_timed_event_status_entity
    ADD CONSTRAINT fkjv61io3blnbxqfw6q2aocbme1 FOREIGN KEY (subscription_delivery_entity) REFERENCES public.xhbm_subscription_delivery_entity(id);


--
-- Name: xhbm_archive_processor_instance_scp_blacklist_aud fkjwyspwpgh8yln7lldn8xf9mwv; Type: FK CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_archive_processor_instance_scp_blacklist_aud
    ADD CONSTRAINT fkjwyspwpgh8yln7lldn8xf9mwv FOREIGN KEY (rev) REFERENCES public.xhbm_revinfo(rev);


--
-- Name: xhbm_dicomscpinstance_whitelist fkkr7uvhhv7lltmxlfee7nw3rnp; Type: FK CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_dicomscpinstance_whitelist
    ADD CONSTRAINT fkkr7uvhhv7lltmxlfee7nw3rnp FOREIGN KEY (scp_id) REFERENCES public.xhbm_dicomscpinstance(id);


--
-- Name: xhbm_compute_environment_hardware_options_entity fkmetbrw7s59mpljsm8ejaq4iw7; Type: FK CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_compute_environment_hardware_options_entity
    ADD CONSTRAINT fkmetbrw7s59mpljsm8ejaq4iw7 FOREIGN KEY (compute_environment_config) REFERENCES public.xhbm_compute_environment_config_entity(id);


--
-- Name: xhbm_archive_processor_instance_aud fkmr7yn629f7nfhrtreh0uvdrtt; Type: FK CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_archive_processor_instance_aud
    ADD CONSTRAINT fkmr7yn629f7nfhrtreh0uvdrtt FOREIGN KEY (rev) REFERENCES public.xhbm_revinfo(rev);


--
-- Name: xhbm_archive_processor_instance_scp_whitelist fkmro1klrw8c16li39sq08ej63l; Type: FK CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_archive_processor_instance_scp_whitelist
    ADD CONSTRAINT fkmro1klrw8c16li39sq08ej63l FOREIGN KEY (archive_processor_instance) REFERENCES public.xhbm_archive_processor_instance(id);


--
-- Name: xhbm_hardware_constraint_entity fkn1ra0472gbg5bbbhbkmlbkgtx; Type: FK CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_hardware_constraint_entity
    ADD CONSTRAINT fkn1ra0472gbg5bbbhbkmlbkgtx FOREIGN KEY (hardware_entity_id) REFERENCES public.xhbm_hardware_entity(id);


--
-- Name: xhbm_subscription_delivery_entity fknfq2kdvima78ljqoyapmuaubq; Type: FK CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_subscription_delivery_entity
    ADD CONSTRAINT fknfq2kdvima78ljqoyapmuaubq FOREIGN KEY (triggering_event_entity) REFERENCES public.xhbm_triggering_event_entity(id);


--
-- Name: xhbm_hardware_constraint_entity_constraint_values fkpggng4p5n0y7hfv1556eyatq0; Type: FK CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_hardware_constraint_entity_constraint_values
    ADD CONSTRAINT fkpggng4p5n0y7hfv1556eyatq0 FOREIGN KEY (hardware_constraint_entity) REFERENCES public.xhbm_hardware_constraint_entity(id);


--
-- Name: xhbm_hardware_scope_entity_ids fkpo67thilhxc7xpdpgtihhxpm0; Type: FK CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_hardware_scope_entity_ids
    ADD CONSTRAINT fkpo67thilhxc7xpdpgtihhxpm0 FOREIGN KEY (hardware_scope_entity) REFERENCES public.xhbm_hardware_scope_entity(id);


--
-- Name: xhbm_compute_environment_scope_entity_ids fkppv8dfc5rqcvk56i6o79re0rd; Type: FK CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_compute_environment_scope_entity_ids
    ADD CONSTRAINT fkppv8dfc5rqcvk56i6o79re0rd FOREIGN KEY (compute_environment_scope_entity) REFERENCES public.xhbm_compute_environment_scope_entity(id);


--
-- Name: xhbm_archive_processor_instance_scp_whitelist_aud fkqnm51g5my89l5y33s67epn7p2; Type: FK CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_archive_processor_instance_scp_whitelist_aud
    ADD CONSTRAINT fkqnm51g5my89l5y33s67epn7p2 FOREIGN KEY (rev) REFERENCES public.xhbm_revinfo(rev);


--
-- Name: xhbm_xnat_task_info fkr3dlexqne2ginjibukmk1jjoi; Type: FK CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_xnat_task_info
    ADD CONSTRAINT fkr3dlexqne2ginjibukmk1jjoi FOREIGN KEY (xnat_node_info_id) REFERENCES public.xhbm_xnat_node_info(id);


--
-- Name: xhbm_compute_environment_entity_mounts fks6jorsodok2t2g07bybd4b5lw; Type: FK CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_compute_environment_entity_mounts
    ADD CONSTRAINT fks6jorsodok2t2g07bybd4b5lw FOREIGN KEY (compute_environment_entity) REFERENCES public.xhbm_compute_environment_entity(id);


--
-- Name: xhbm_archive_processor_instance_parameters_aud fksgslt869bmpn7di5mxr12bdsu; Type: FK CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_archive_processor_instance_parameters_aud
    ADD CONSTRAINT fksgslt869bmpn7di5mxr12bdsu FOREIGN KEY (rev) REFERENCES public.xhbm_revinfo(rev);


--
-- Name: xhbm_configuration_data_configurations fksrpi18v45ciptmckja1n9k0ea; Type: FK CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_configuration_data_configurations
    ADD CONSTRAINT fksrpi18v45ciptmckja1n9k0ea FOREIGN KEY (configurations) REFERENCES public.xhbm_configuration(id);


--
-- Name: xhbm_hardware_scope_entity fktjn2e6eey3fmux0w7ikhqlsqr; Type: FK CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_hardware_scope_entity
    ADD CONSTRAINT fktjn2e6eey3fmux0w7ikhqlsqr FOREIGN KEY (hardware_config) REFERENCES public.xhbm_hardware_config_entity(id);


--
-- Name: xhbm_archive_processor_instance_parameters fktnqj95i767ci9lkf29or79ity; Type: FK CONSTRAINT; Schema: public; Owner: xnat
--

ALTER TABLE ONLY public.xhbm_archive_processor_instance_parameters
    ADD CONSTRAINT fktnqj95i767ci9lkf29or79ity FOREIGN KEY (archive_processor_instance) REFERENCES public.xhbm_archive_processor_instance(id);


--
-- PostgreSQL database dump complete
--
