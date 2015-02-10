--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


--
-- Name: tematica_tematicas; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE tematica_tematicas (
    id integer NOT NULL,
    nombre character varying(255),
    seccion_publi character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    portada_path character varying(255),
    publicado boolean DEFAULT true
);


--
-- Name: tematica_tematicas_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tematica_tematicas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tematica_tematicas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tematica_tematicas_id_seq OWNED BY tematica_tematicas.id;


--
-- Name: tematica_tematizaciones; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE tematica_tematizaciones (
    id integer NOT NULL,
    tematizable_id integer NOT NULL,
    tematizable_type character varying(255) NOT NULL,
    tematizable_grupo character varying(255) DEFAULT ''::character varying NOT NULL,
    tematica_id integer NOT NULL,
    explicita boolean,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: tematica_tematizaciones_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tematica_tematizaciones_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tematica_tematizaciones_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tematica_tematizaciones_id_seq OWNED BY tematica_tematizaciones.id;


--
-- Name: usuarios; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE usuarios (
    id integer NOT NULL,
    nick character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: usuarios_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE usuarios_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: usuarios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE usuarios_id_seq OWNED BY usuarios.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY tematica_tematicas ALTER COLUMN id SET DEFAULT nextval('tematica_tematicas_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY tematica_tematizaciones ALTER COLUMN id SET DEFAULT nextval('tematica_tematizaciones_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY usuarios ALTER COLUMN id SET DEFAULT nextval('usuarios_id_seq'::regclass);


--
-- Name: tematica_tematicas_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY tematica_tematicas
    ADD CONSTRAINT tematica_tematicas_pkey PRIMARY KEY (id);


--
-- Name: tematica_tematizaciones_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY tematica_tematizaciones
    ADD CONSTRAINT tematica_tematizaciones_pkey PRIMARY KEY (id);


--
-- Name: usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id);


--
-- Name: ix_tematizaciones_by_tematica_and_type_grupo; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX ix_tematizaciones_by_tematica_and_type_grupo ON tematica_tematizaciones USING btree (tematica_id, tematizable_type, tematizable_grupo, tematizable_id);


--
-- Name: ix_tematizaciones_by_tematizable; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX ix_tematizaciones_by_tematizable ON tematica_tematizaciones USING btree (tematizable_type, tematizable_id);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user",public;

INSERT INTO schema_migrations (version) VALUES ('20140204093803');

INSERT INTO schema_migrations (version) VALUES ('20140204110954');

INSERT INTO schema_migrations (version) VALUES ('20140213085144');

INSERT INTO schema_migrations (version) VALUES ('20140213123349');

INSERT INTO schema_migrations (version) VALUES ('20140609095223');

