--
-- PostgreSQL database dump
--

-- Dumped from database version 14.15 (Ubuntu 14.15-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.15 (Ubuntu 14.15-0ubuntu0.22.04.1)

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
-- Name: cache; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cache (
    key character varying(255) NOT NULL,
    value text NOT NULL,
    expiration integer NOT NULL
);


ALTER TABLE public.cache OWNER TO postgres;

--
-- Name: cache_locks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cache_locks (
    key character varying(255) NOT NULL,
    owner character varying(255) NOT NULL,
    expiration integer NOT NULL
);


ALTER TABLE public.cache_locks OWNER TO postgres;

--
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    is_active boolean DEFAULT true NOT NULL
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categories_id_seq OWNER TO postgres;

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- Name: comments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.comments (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    skin_id bigint NOT NULL,
    content text NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    is_active boolean DEFAULT true NOT NULL
);


ALTER TABLE public.comments OWNER TO postgres;

--
-- Name: comments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comments_id_seq OWNER TO postgres;

--
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.comments_id_seq OWNED BY public.comments.id;


--
-- Name: failed_jobs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.failed_jobs (
    id bigint NOT NULL,
    uuid character varying(255) NOT NULL,
    connection text NOT NULL,
    queue text NOT NULL,
    payload text NOT NULL,
    exception text NOT NULL,
    failed_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.failed_jobs OWNER TO postgres;

--
-- Name: failed_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.failed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.failed_jobs_id_seq OWNER TO postgres;

--
-- Name: failed_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.failed_jobs_id_seq OWNED BY public.failed_jobs.id;


--
-- Name: favorites; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.favorites (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    skin_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.favorites OWNER TO postgres;

--
-- Name: favorites_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.favorites_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.favorites_id_seq OWNER TO postgres;

--
-- Name: favorites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.favorites_id_seq OWNED BY public.favorites.id;


--
-- Name: job_batches; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.job_batches (
    id character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    total_jobs integer NOT NULL,
    pending_jobs integer NOT NULL,
    failed_jobs integer NOT NULL,
    failed_job_ids text NOT NULL,
    options text,
    cancelled_at integer,
    created_at integer NOT NULL,
    finished_at integer
);


ALTER TABLE public.job_batches OWNER TO postgres;

--
-- Name: jobs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.jobs (
    id bigint NOT NULL,
    queue character varying(255) NOT NULL,
    payload text NOT NULL,
    attempts smallint NOT NULL,
    reserved_at integer,
    available_at integer NOT NULL,
    created_at integer NOT NULL
);


ALTER TABLE public.jobs OWNER TO postgres;

--
-- Name: jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.jobs_id_seq OWNER TO postgres;

--
-- Name: jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.jobs_id_seq OWNED BY public.jobs.id;


--
-- Name: migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


ALTER TABLE public.migrations OWNER TO postgres;

--
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.migrations_id_seq OWNER TO postgres;

--
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- Name: permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.permissions (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.permissions OWNER TO postgres;

--
-- Name: permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.permissions_id_seq OWNER TO postgres;

--
-- Name: permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.permissions_id_seq OWNED BY public.permissions.id;


--
-- Name: personal_access_tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.personal_access_tokens (
    id bigint NOT NULL,
    tokenable_type character varying(255) NOT NULL,
    tokenable_id bigint NOT NULL,
    name character varying(255) NOT NULL,
    token character varying(64) NOT NULL,
    abilities text,
    last_used_at timestamp(0) without time zone,
    expires_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.personal_access_tokens OWNER TO postgres;

--
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.personal_access_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.personal_access_tokens_id_seq OWNER TO postgres;

--
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.personal_access_tokens_id_seq OWNED BY public.personal_access_tokens.id;


--
-- Name: role_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.role_permission (
    id bigint NOT NULL,
    role_id bigint NOT NULL,
    permission_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.role_permission OWNER TO postgres;

--
-- Name: role_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.role_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.role_permission_id_seq OWNER TO postgres;

--
-- Name: role_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.role_permission_id_seq OWNED BY public.role_permission.id;


--
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255),
    is_admin boolean DEFAULT false NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.roles_id_seq OWNER TO postgres;

--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- Name: sessions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sessions (
    id character varying(255) NOT NULL,
    user_id bigint,
    ip_address character varying(45),
    user_agent text,
    payload text NOT NULL,
    last_activity integer NOT NULL
);


ALTER TABLE public.sessions OWNER TO postgres;

--
-- Name: skin_reactions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.skin_reactions (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    skin_id bigint NOT NULL,
    type character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    CONSTRAINT skin_reactions_type_check CHECK (((type)::text = ANY ((ARRAY['like'::character varying, 'dislike'::character varying])::text[])))
);


ALTER TABLE public.skin_reactions OWNER TO postgres;

--
-- Name: skin_reactions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.skin_reactions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.skin_reactions_id_seq OWNER TO postgres;

--
-- Name: skin_reactions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.skin_reactions_id_seq OWNED BY public.skin_reactions.id;


--
-- Name: skin_tag; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.skin_tag (
    id bigint NOT NULL,
    skin_id bigint NOT NULL,
    tag_id bigint NOT NULL
);


ALTER TABLE public.skin_tag OWNER TO postgres;

--
-- Name: skin_tag_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.skin_tag_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.skin_tag_id_seq OWNER TO postgres;

--
-- Name: skin_tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.skin_tag_id_seq OWNED BY public.skin_tag.id;


--
-- Name: skins; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.skins (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    category_id bigint NOT NULL,
    name character varying(255) NOT NULL,
    image_path character varying(255) NOT NULL,
    likes integer DEFAULT 0 NOT NULL,
    dislikes integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    is_active boolean DEFAULT true NOT NULL
);


ALTER TABLE public.skins OWNER TO postgres;

--
-- Name: skins_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.skins_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.skins_id_seq OWNER TO postgres;

--
-- Name: skins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.skins_id_seq OWNED BY public.skins.id;


--
-- Name: tags; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tags (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.tags OWNER TO postgres;

--
-- Name: tags_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tags_id_seq OWNER TO postgres;

--
-- Name: tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tags_id_seq OWNED BY public.tags.id;


--
-- Name: usuarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuarios (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    email_verified_at timestamp(0) without time zone,
    password character varying(255) NOT NULL,
    remember_token character varying(100),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    user_active boolean DEFAULT true NOT NULL,
    role_id bigint
);


ALTER TABLE public.usuarios OWNER TO postgres;

--
-- Name: usuarios_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuarios_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.usuarios_id_seq OWNER TO postgres;

--
-- Name: usuarios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuarios_id_seq OWNED BY public.usuarios.id;


--
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- Name: comments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments ALTER COLUMN id SET DEFAULT nextval('public.comments_id_seq'::regclass);


--
-- Name: failed_jobs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs ALTER COLUMN id SET DEFAULT nextval('public.failed_jobs_id_seq'::regclass);


--
-- Name: favorites id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favorites ALTER COLUMN id SET DEFAULT nextval('public.favorites_id_seq'::regclass);


--
-- Name: jobs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jobs ALTER COLUMN id SET DEFAULT nextval('public.jobs_id_seq'::regclass);


--
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- Name: permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permissions ALTER COLUMN id SET DEFAULT nextval('public.permissions_id_seq'::regclass);


--
-- Name: personal_access_tokens id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_access_tokens ALTER COLUMN id SET DEFAULT nextval('public.personal_access_tokens_id_seq'::regclass);


--
-- Name: role_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_permission ALTER COLUMN id SET DEFAULT nextval('public.role_permission_id_seq'::regclass);


--
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- Name: skin_reactions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.skin_reactions ALTER COLUMN id SET DEFAULT nextval('public.skin_reactions_id_seq'::regclass);


--
-- Name: skin_tag id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.skin_tag ALTER COLUMN id SET DEFAULT nextval('public.skin_tag_id_seq'::regclass);


--
-- Name: skins id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.skins ALTER COLUMN id SET DEFAULT nextval('public.skins_id_seq'::regclass);


--
-- Name: tags id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tags ALTER COLUMN id SET DEFAULT nextval('public.tags_id_seq'::regclass);


--
-- Name: usuarios id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios ALTER COLUMN id SET DEFAULT nextval('public.usuarios_id_seq'::regclass);


--
-- Data for Name: cache; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cache (key, value, expiration) FROM stdin;
\.


--
-- Data for Name: cache_locks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cache_locks (key, owner, expiration) FROM stdin;
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categories (id, name, created_at, updated_at, is_active) FROM stdin;
2	PvP	2024-12-10 18:02:38	2024-12-10 18:02:38	t
3	Roleplay	2024-12-10 18:02:38	2024-12-10 18:02:38	t
5	pato	2024-12-11 04:20:15	2024-12-11 04:20:15	t
6	Uleam	2024-12-11 14:35:23	2024-12-11 14:35:23	t
1	General	2024-12-10 18:02:38	2024-12-11 14:35:27	f
4	Personalizado	2024-12-10 18:02:38	2024-12-11 14:35:29	f
\.


--
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.comments (id, user_id, skin_id, content, created_at, updated_at, is_active) FROM stdin;
2	3	1	zzz	2024-12-10 23:18:02	2024-12-10 23:18:02	t
4	5	11	me gusta uwuw	2024-12-10 23:50:37	2024-12-10 23:50:37	t
3	5	10	no me gusta zzz	2024-12-10 23:50:32	2024-12-10 23:52:52	t
5	7	11	Bellota	2024-12-11 02:28:52	2024-12-11 02:28:52	t
7	10	15	hola	2024-12-11 03:28:44	2024-12-11 03:28:44	t
6	10	16	hola	2024-12-11 03:28:25	2024-12-11 03:28:59	f
1	2	1	2.0	2024-12-10 23:17:01	2024-12-11 04:21:28	f
8	11	17	xd	2024-12-11 05:08:11	2024-12-11 05:08:11	t
9	11	10	black	2024-12-11 05:08:39	2024-12-11 05:08:39	t
10	11	16	elle	2024-12-11 05:09:32	2024-12-11 05:09:32	t
11	11	14	niño rata	2024-12-11 05:09:46	2024-12-11 14:37:02	t
12	10	18	fgg	2024-12-11 14:55:57	2024-12-11 14:55:57	t
13	10	18	jho	2024-12-11 14:56:12	2024-12-11 14:56:12	t
14	10	18	iuu	2024-12-11 14:56:17	2024-12-11 14:56:17	t
\.


--
-- Data for Name: failed_jobs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) FROM stdin;
\.


--
-- Data for Name: favorites; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.favorites (id, user_id, skin_id, created_at, updated_at) FROM stdin;
1	2	1	2024-12-10 23:16:47	2024-12-10 23:16:47
2	5	11	2024-12-10 23:50:42	2024-12-10 23:50:42
3	5	9	2024-12-10 23:50:44	2024-12-10 23:50:44
4	9	13	2024-12-11 02:42:16	2024-12-11 02:42:16
5	9	15	2024-12-11 02:42:18	2024-12-11 02:42:18
6	9	14	2024-12-11 02:42:20	2024-12-11 02:42:20
7	9	11	2024-12-11 02:42:23	2024-12-11 02:42:23
8	9	1	2024-12-11 02:42:26	2024-12-11 02:42:26
9	8	13	2024-12-11 02:57:31	2024-12-11 02:57:31
10	2	19	2024-12-11 14:31:23	2024-12-11 14:31:23
\.


--
-- Data for Name: job_batches; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.job_batches (id, name, total_jobs, pending_jobs, failed_jobs, failed_job_ids, options, cancelled_at, created_at, finished_at) FROM stdin;
\.


--
-- Data for Name: jobs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.jobs (id, queue, payload, attempts, reserved_at, available_at, created_at) FROM stdin;
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.migrations (id, migration, batch) FROM stdin;
1	0001_01_01_000002_create_jobs_table	1
2	2024_09_09_140042_create_categories_table	1
3	2024_09_09_140043_create_usuarios_table	1
4	2024_09_09_140045_create_skins_table	1
5	2024_09_09_140047_create_favorites_table	1
6	2024_09_09_140048_create_comments_table	1
7	2024_09_09_140049_create_tags_table	1
8	2024_10_09_031805_create_sessions_table	1
9	2024_10_09_050752_create_personal_access_tokens_table	1
10	2024_11_17_213430_create_cache_table	1
11	2024_12_01_162055_create_skin_reactions_table	1
12	2024_12_04_223844_add_is_active_to_comments_table	1
13	2024_12_08_125143_add_user_active_status_to_usuarios_table	1
14	2024_12_08_205640_add_is_active_to_categories_table	1
15	2024_12_08_211827_add_is_active_to_skins_table	1
16	2024_12_09_184147_create_roles_table	1
17	2024_12_09_184148_create_permissions_table	1
18	2024_12_09_184150_create_role_permission_table	1
19	2024_12_09_184710_remove_role_and_add_role_id_to_usuarios_table	1
\.


--
-- Data for Name: permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.permissions (id, name, description, created_at, updated_at) FROM stdin;
1	manage_roles	Gestionar roles y permisos	2024-12-10 18:10:32	2024-12-10 18:10:32
2	manage_tags	Gestionar etiquetas	2024-12-10 18:10:32	2024-12-10 18:10:32
3	manage_categories	Gestionar categorías	2024-12-10 18:10:32	2024-12-10 18:10:32
4	manage_comments	Gestionar comentarios	2024-12-10 18:10:32	2024-12-10 18:10:32
5	manage_skins	Gestionar skins	2024-12-10 18:10:32	2024-12-10 18:10:32
6	manage_users	Gestionar usuarios	2024-12-10 18:10:32	2024-12-10 18:10:32
\.


--
-- Data for Name: personal_access_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, expires_at, created_at, updated_at) FROM stdin;
35	App\\Models\\User	10	auth-token	9842eb357ca857ca893f05dd49d9f2e5e011b3c1d8cbaf2c2055c49eaef1b40a	["*"]	2024-12-11 19:02:07	\N	2024-12-11 14:40:18	2024-12-11 19:02:07
25	App\\Models\\User	12	auth-token	6f56cdb9add3344c65768e841d567cca53541befeaaf6b9d006311f4b901382a	["*"]	2024-12-11 09:18:44	\N	2024-12-11 08:56:57	2024-12-11 09:18:44
14	App\\Models\\User	9	auth-token	6dacf778ecb20036a09a3a9e37d3638f11e1e6ee2b8789c25cf746c494d120d8	["*"]	2024-12-11 02:43:10	\N	2024-12-11 02:39:54	2024-12-11 02:43:10
24	App\\Models\\User	11	auth-token	0165a8fec231df447e7c5f17bc8d189386e3bdb83ae047af6e3f9bc84173759d	["*"]	2024-12-11 05:17:30	\N	2024-12-11 04:30:46	2024-12-11 05:17:30
\.


--
-- Data for Name: role_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.role_permission (id, role_id, permission_id, created_at, updated_at) FROM stdin;
1	1	1	2024-12-10 18:10:53	2024-12-10 18:10:53
2	1	2	2024-12-10 18:10:53	2024-12-10 18:10:53
3	1	3	2024-12-10 18:10:53	2024-12-10 18:10:53
4	1	4	2024-12-10 18:10:53	2024-12-10 18:10:53
5	1	5	2024-12-10 18:10:53	2024-12-10 18:10:53
6	1	6	2024-12-10 18:10:53	2024-12-10 18:10:53
8	3	6	\N	\N
15	6	4	\N	\N
16	6	6	\N	\N
17	7	4	\N	\N
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roles (id, name, description, is_admin, is_active, created_at, updated_at) FROM stdin;
1	Administrador	Rol con todos los permisos del sistema	t	t	2024-12-10 18:10:43	2024-12-10 18:10:43
3	helper	helper	f	t	2024-12-11 04:07:42	2024-12-11 04:07:42
6	Moderador	moderar a todos los cojudos xd	f	t	2024-12-11 13:22:13	2024-12-11 13:22:13
7	Uleam	este rol permite manejar los comentarios	f	t	2024-12-11 14:34:22	2024-12-11 14:34:22
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sessions (id, user_id, ip_address, user_agent, payload, last_activity) FROM stdin;
\.


--
-- Data for Name: skin_reactions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.skin_reactions (id, user_id, skin_id, type, created_at, updated_at) FROM stdin;
1	3	2	dislike	2024-12-10 23:17:29	2024-12-10 23:17:29
2	3	1	like	2024-12-10 23:17:30	2024-12-10 23:17:30
3	5	11	like	2024-12-10 23:50:49	2024-12-10 23:50:49
4	5	10	like	2024-12-10 23:50:50	2024-12-10 23:50:50
6	7	11	like	2024-12-11 02:29:00	2024-12-11 02:29:00
7	7	12	dislike	2024-12-11 02:29:04	2024-12-11 02:29:04
8	7	2	dislike	2024-12-11 02:29:25	2024-12-11 02:29:25
9	9	1	like	2024-12-11 02:42:28	2024-12-11 02:42:28
10	9	2	like	2024-12-11 02:42:29	2024-12-11 02:42:29
11	9	3	dislike	2024-12-11 02:42:30	2024-12-11 02:42:32
12	9	4	dislike	2024-12-11 02:42:33	2024-12-11 02:42:33
13	9	5	dislike	2024-12-11 02:42:34	2024-12-11 02:42:34
14	9	6	dislike	2024-12-11 02:42:35	2024-12-11 02:42:35
15	9	7	dislike	2024-12-11 02:42:36	2024-12-11 02:42:36
16	9	8	dislike	2024-12-11 02:42:48	2024-12-11 02:42:48
17	9	9	dislike	2024-12-11 02:42:49	2024-12-11 02:42:49
18	9	10	dislike	2024-12-11 02:42:50	2024-12-11 02:42:50
19	9	11	like	2024-12-11 02:42:51	2024-12-11 02:42:51
20	9	12	like	2024-12-11 02:42:53	2024-12-11 02:42:53
21	9	13	like	2024-12-11 02:42:54	2024-12-11 02:42:54
22	9	14	like	2024-12-11 02:42:55	2024-12-11 02:42:55
23	9	15	like	2024-12-11 02:42:56	2024-12-11 02:42:56
24	8	15	like	2024-12-11 02:56:23	2024-12-11 02:56:23
25	8	13	like	2024-12-11 02:56:24	2024-12-11 02:56:24
26	8	14	like	2024-12-11 02:56:25	2024-12-11 02:56:25
27	8	12	dislike	2024-12-11 02:56:31	2024-12-11 02:56:31
28	8	8	dislike	2024-12-11 02:56:36	2024-12-11 02:56:36
29	8	9	dislike	2024-12-11 02:56:37	2024-12-11 02:56:37
30	8	10	dislike	2024-12-11 02:56:37	2024-12-11 02:56:40
31	8	11	like	2024-12-11 02:56:42	2024-12-11 02:56:42
32	2	19	like	2024-12-11 14:30:46	2024-12-11 14:30:46
33	2	18	dislike	2024-12-11 14:30:49	2024-12-11 14:30:49
34	2	17	dislike	2024-12-11 14:30:52	2024-12-11 14:30:52
\.


--
-- Data for Name: skin_tag; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.skin_tag (id, skin_id, tag_id) FROM stdin;
1	2	7
2	11	5
3	11	6
4	13	8
5	14	11
6	14	4
7	15	8
8	15	11
9	16	2
10	16	3
11	18	5
12	18	11
13	19	4
14	19	6
15	20	15
16	20	10
\.


--
-- Data for Name: skins; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.skins (id, user_id, category_id, name, image_path, likes, dislikes, created_at, updated_at, is_active) FROM stdin;
13	7	3	Warden	http://23.230.3.230/storage/skins/xVXyOUq1Qj3WwhDomfUBlQ3aJ2u3sZndJDrmbrYU.png	2	0	2024-12-11 02:28:15	2024-12-11 02:56:24	t
14	7	1	Pinguino Man	http://23.230.3.230/storage/skins/gladLoUg5LtQkzOXr5oEHjegr4JIscphLm35ub4F.png	2	0	2024-12-11 02:33:44	2024-12-11 02:56:25	t
12	6	1	F	http://23.230.3.230/storage/skins/vIu5dQthWNAFZspa4c3NhjljbkW2vGdBuuwJxfAj.png	1	2	2024-12-11 00:30:39	2024-12-11 02:56:31	t
8	4	2	x	http://23.230.3.230/storage/skins/p1cHF1sX3ool82nNxcaklja4p9Hd7wCsX2tQKpym.png	0	2	2024-12-10 23:28:02	2024-12-11 02:56:36	t
9	4	3	mom	http://23.230.3.230/storage/skins/cVtV11qB1AmbcQU31gIxXMgJPF13iuTyo9fNPLtc.png	0	2	2024-12-10 23:28:43	2024-12-11 02:56:37	t
10	4	4	y	http://23.230.3.230/storage/skins/zSGRaYhnsSoUXNuwaxevhFJwen3RtKZKnGbSvXwo.png	1	2	2024-12-10 23:29:47	2024-12-11 02:56:40	t
11	5	2	navidad	http://23.230.3.230/storage/skins/hCuSQrLjDIEh7QUyrbDbGEAAwwYdVSDQtFju20R6.png	4	0	2024-12-10 23:50:22	2024-12-11 02:56:42	t
1	2	4	random	http://23.230.3.230/storage/skins/NcMYSESys2gSvI6d3ckX1QzTUI27EKnoyvtjC1q6.png	2	0	2024-12-10 23:16:43	2024-12-11 02:42:28	t
2	3	4	test	http://23.230.3.230/storage/skins/bbTg0LxDpfhZ6mcZGubYxtRMYy4x5V73ri3svTnw.png	1	2	2024-12-10 23:17:21	2024-12-11 02:42:29	t
16	10	3	pato	http://23.230.3.230/storage/skins/yNVQGqqeCrkEta757c7k5MYXLrNyWoF6bd4a7Nkm.png	0	0	2024-12-11 03:28:10	2024-12-11 04:20:29	t
3	2	4	el macho	http://23.230.3.230/storage/skins/s70J8GNDWhgfhPAITvsbj5apIFPWi3rFnKZ4jsow.png	0	1	2024-12-10 23:18:32	2024-12-11 02:42:32	t
4	2	2	rrrraa	http://23.230.3.230/storage/skins/3lOsgkfCt0avaFVONR0iadBGO5GW4cVnoNneeeQE.png	0	1	2024-12-10 23:20:02	2024-12-11 02:42:33	t
5	2	3	ella	http://23.230.3.230/storage/skins/x7Ajc5fR8XgrEoG90G9NoABAWC2d308C69hx1GxD.png	0	1	2024-12-10 23:21:51	2024-12-11 02:42:34	t
7	4	1	ros	http://23.230.3.230/storage/skins/aRh4RcCEnwWMnqtBimPGisBPXsfdqLhQM9tUuYN1.png	0	1	2024-12-10 23:27:19	2024-12-11 02:42:36	t
6	2	1	pi	http://23.230.3.230/storage/skins/YMw12ymMLsnbnxI6mE4o4QqLLUdkXDuOYYyc4kI5.png	0	1	2024-12-10 23:22:58	2024-12-11 04:20:34	f
15	8	4	Hamster	http://23.230.3.230/storage/skins/rHXuDtcfluVxm5uT8HhOwN8OJRsdyGmbMdy8Epnh.png	2	0	2024-12-11 02:35:55	2024-12-11 02:56:23	t
18	13	4	AW2	http://23.230.3.230/storage/skins/chNA1Aunq3WAePrM9Hf4kzx0yd6MHnvi47aBbKMw.png	0	1	2024-12-11 14:15:16	2024-12-11 14:30:49	t
17	11	3	ne	http://23.230.3.230/storage/skins/fSQpUNF2BmHEkrPxC3xwW5dfo7g6T7OurNi8cp1h.png	0	1	2024-12-11 04:39:01	2024-12-11 14:30:52	t
19	13	4	ULEAM	http://23.230.3.230/storage/skins/q0mvio0xSbeCr6j7COcC0iFNawvm0YwAJYXvHbQu.png	1	0	2024-12-11 14:16:59	2024-12-11 14:36:13	f
20	10	3	Uleam	http://23.230.3.230/storage/skins/nIleAwaXHZC8CncUZqh3sESgVSERIXN0IVVQIv8c.png	0	0	2024-12-11 19:02:05	2024-12-11 19:02:05	t
\.


--
-- Data for Name: tags; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tags (id, name, is_active, created_at, updated_at) FROM stdin;
5	Anime	t	2024-12-10 18:02:40	2024-12-10 18:02:40
12	test	f	2024-12-11 04:05:36	2024-12-11 04:05:41
11	viral	t	2024-12-10 23:51:53	2024-12-11 04:05:43
1	PvP	t	2024-12-10 18:02:40	2024-12-11 04:05:43
4	Moderno	t	2024-12-10 18:02:40	2024-12-11 04:05:45
6	Minimalista	t	2024-12-10 18:02:40	2024-12-11 04:05:45
2	Medieval	t	2024-12-10 18:02:40	2024-12-11 04:05:46
7	Historico	t	2024-12-10 18:02:40	2024-12-11 04:05:47
9	HD	t	2024-12-10 18:02:40	2024-12-11 04:05:47
3	Fantasia	t	2024-12-10 18:02:40	2024-12-11 04:05:48
8	Custom	t	2024-12-10 18:02:40	2024-12-11 04:05:48
10	Clasico	t	2024-12-10 18:02:40	2024-12-11 04:05:49
13	anime	t	2024-12-11 04:20:00	2024-12-11 04:20:00
14	e.e	t	2024-12-11 04:20:05	2024-12-11 04:20:05
15	Uleam	t	2024-12-11 14:34:59	2024-12-11 14:34:59
\.


--
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuarios (id, name, email, email_verified_at, password, remember_token, created_at, updated_at, user_active, role_id) FROM stdin;
1	Gon	admin@admin.com	\N	$2y$12$JKqSr0LXH8UdsY0WsPxROe27Tk.9rlcUHE7JrjXzpsmqiTnXyC5wG	\N	2024-12-10 23:06:42	2024-12-10 23:06:42	t	1
2	tonny bailon	tonnypl405@gmail.com	\N	$2y$12$eKDI3Hf0fA33rBZHz2sRTeSxrDCC6YfzHxZ8VBauoLxN.My6fG08S	\N	2024-12-10 23:14:49	2024-12-10 23:14:49	t	\N
3	hola	gola@gmail.com	\N	$2y$12$zLM.e/gJFZsL3pNbNLC2pOMAlP2sTmkcHGMpyWx5/.nLxRAiuj9PG	\N	2024-12-10 23:17:04	2024-12-10 23:17:04	t	\N
4	edison delñgado	tonnypl405@hotmail.com	\N	$2y$12$ZoEULuoiDovnXAGxwptH3.StgiZqzoZGx0bmbxsQSLnCnMihaLECu	\N	2024-12-10 23:25:15	2024-12-10 23:25:15	t	\N
5	tanlke	john@gmail.com	\N	$2y$12$BSwT/I1lyai4WvAbh5vtYOwrOF8uHOyxryEizE3kdX73qZtdQW3j6	\N	2024-12-10 23:49:48	2024-12-10 23:54:22	t	\N
6	Geovanny	daniel@gmail.com	\N	$2y$12$5dstoTNUH8zke35Kzk7ZP.ec.mi8/bZy50cSS1O3t0I39RcldU8xC	\N	2024-12-11 00:30:24	2024-12-11 00:30:24	t	\N
7	Darly	darlybarreto100@gmail.com	\N	$2y$12$aJiBhD82Ymyffjs6UioRKuht.7UuhU4IqFISqKXOifPrDuaAuSwPS	\N	2024-12-11 02:26:09	2024-12-11 02:26:09	t	\N
9	Alcivar Briones Jeferson	albertoalcivar15@gmail.com	\N	$2y$12$5mdDEe9lYAx/1MwB/P1rj.MH6ey/UyPNgHjWSuyVn5TWHqRUc8s.6	\N	2024-12-11 02:39:54	2024-12-11 04:10:17	t	\N
8	Hamsterman	ezz2034@gmail.com	\N	$2y$12$eNUYW6Y0X2IFP7QtQGVlvuDw5waWm3n7.B585hpSxtDcHefFH3k92	\N	2024-12-11 02:34:42	2024-12-11 04:23:14	t	\N
11	tonny delgado	e0961813086@live.uleam.edu.ec	\N	$2y$12$zwo/jvFDhh7Kkwr3ikLhwu5axDVVTdMFhopHHC/nuq0knFyvhttMm	\N	2024-12-11 04:27:16	2024-12-11 04:27:16	t	\N
12	Angel	damakzs@kegana2.com	\N	$2y$12$4HACFlXKMA0A3ei9q6pOU.liiIvbI/PTOx7WKuhpHoBAAvpGz5AhS	\N	2024-12-11 08:56:57	2024-12-11 13:25:31	t	\N
13	Alcivar Briones Jeferson	albertoalcivar@gmail.com	\N	$2y$12$Mp0eXPwGffYwfweRuYaZ7OAcZlN68u2YhGvugFxLRha6Pl0waThle	\N	2024-12-11 14:13:32	2024-12-11 14:13:32	t	\N
10	test	test@example.com	\N	$2y$12$.VXEczOduexVOKVuLKfzwutnmYzK.i/wwsGDqJhGWo7R4fYIQX5bq	\N	2024-12-11 03:27:25	2024-12-11 14:34:40	t	7
\.


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categories_id_seq', 6, true);


--
-- Name: comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.comments_id_seq', 14, true);


--
-- Name: failed_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.failed_jobs_id_seq', 1, false);


--
-- Name: favorites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.favorites_id_seq', 10, true);


--
-- Name: jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.jobs_id_seq', 1, false);


--
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.migrations_id_seq', 19, true);


--
-- Name: permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.permissions_id_seq', 6, true);


--
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.personal_access_tokens_id_seq', 35, true);


--
-- Name: role_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.role_permission_id_seq', 17, true);


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.roles_id_seq', 7, true);


--
-- Name: skin_reactions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.skin_reactions_id_seq', 34, true);


--
-- Name: skin_tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.skin_tag_id_seq', 16, true);


--
-- Name: skins_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.skins_id_seq', 20, true);


--
-- Name: tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tags_id_seq', 15, true);


--
-- Name: usuarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuarios_id_seq', 13, true);


--
-- Name: cache_locks cache_locks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cache_locks
    ADD CONSTRAINT cache_locks_pkey PRIMARY KEY (key);


--
-- Name: cache cache_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cache
    ADD CONSTRAINT cache_pkey PRIMARY KEY (key);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: comments comments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- Name: failed_jobs failed_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_pkey PRIMARY KEY (id);


--
-- Name: failed_jobs failed_jobs_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_uuid_unique UNIQUE (uuid);


--
-- Name: favorites favorites_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favorites
    ADD CONSTRAINT favorites_pkey PRIMARY KEY (id);


--
-- Name: job_batches job_batches_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_batches
    ADD CONSTRAINT job_batches_pkey PRIMARY KEY (id);


--
-- Name: jobs jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (id);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- Name: permissions permissions_name_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_unique UNIQUE (name);


--
-- Name: permissions permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_pkey PRIMARY KEY (id);


--
-- Name: personal_access_tokens personal_access_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_pkey PRIMARY KEY (id);


--
-- Name: personal_access_tokens personal_access_tokens_token_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_token_unique UNIQUE (token);


--
-- Name: role_permission role_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_permission
    ADD CONSTRAINT role_permission_pkey PRIMARY KEY (id);


--
-- Name: role_permission role_permission_role_id_permission_id_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_permission
    ADD CONSTRAINT role_permission_role_id_permission_id_unique UNIQUE (role_id, permission_id);


--
-- Name: roles roles_name_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_unique UNIQUE (name);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: skin_reactions skin_reactions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.skin_reactions
    ADD CONSTRAINT skin_reactions_pkey PRIMARY KEY (id);


--
-- Name: skin_reactions skin_reactions_user_id_skin_id_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.skin_reactions
    ADD CONSTRAINT skin_reactions_user_id_skin_id_unique UNIQUE (user_id, skin_id);


--
-- Name: skin_tag skin_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.skin_tag
    ADD CONSTRAINT skin_tag_pkey PRIMARY KEY (id);


--
-- Name: skins skins_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.skins
    ADD CONSTRAINT skins_pkey PRIMARY KEY (id);


--
-- Name: tags tags_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (id);


--
-- Name: usuarios usuarios_email_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_unique UNIQUE (email);


--
-- Name: usuarios usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id);


--
-- Name: jobs_queue_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX jobs_queue_index ON public.jobs USING btree (queue);


--
-- Name: personal_access_tokens_tokenable_type_tokenable_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX personal_access_tokens_tokenable_type_tokenable_id_index ON public.personal_access_tokens USING btree (tokenable_type, tokenable_id);


--
-- Name: sessions_last_activity_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sessions_last_activity_index ON public.sessions USING btree (last_activity);


--
-- Name: sessions_user_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sessions_user_id_index ON public.sessions USING btree (user_id);


--
-- Name: comments comments_skin_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_skin_id_foreign FOREIGN KEY (skin_id) REFERENCES public.skins(id) ON DELETE CASCADE;


--
-- Name: comments comments_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.usuarios(id) ON DELETE CASCADE;


--
-- Name: favorites favorites_skin_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favorites
    ADD CONSTRAINT favorites_skin_id_foreign FOREIGN KEY (skin_id) REFERENCES public.skins(id) ON DELETE CASCADE;


--
-- Name: favorites favorites_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favorites
    ADD CONSTRAINT favorites_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.usuarios(id) ON DELETE CASCADE;


--
-- Name: role_permission role_permission_permission_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_permission
    ADD CONSTRAINT role_permission_permission_id_foreign FOREIGN KEY (permission_id) REFERENCES public.permissions(id) ON DELETE CASCADE;


--
-- Name: role_permission role_permission_role_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_permission
    ADD CONSTRAINT role_permission_role_id_foreign FOREIGN KEY (role_id) REFERENCES public.roles(id) ON DELETE CASCADE;


--
-- Name: skin_reactions skin_reactions_skin_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.skin_reactions
    ADD CONSTRAINT skin_reactions_skin_id_foreign FOREIGN KEY (skin_id) REFERENCES public.skins(id) ON DELETE CASCADE;


--
-- Name: skin_reactions skin_reactions_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.skin_reactions
    ADD CONSTRAINT skin_reactions_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.usuarios(id) ON DELETE CASCADE;


--
-- Name: skin_tag skin_tag_skin_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.skin_tag
    ADD CONSTRAINT skin_tag_skin_id_foreign FOREIGN KEY (skin_id) REFERENCES public.skins(id) ON DELETE CASCADE;


--
-- Name: skin_tag skin_tag_tag_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.skin_tag
    ADD CONSTRAINT skin_tag_tag_id_foreign FOREIGN KEY (tag_id) REFERENCES public.tags(id) ON DELETE CASCADE;


--
-- Name: skins skins_category_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.skins
    ADD CONSTRAINT skins_category_id_foreign FOREIGN KEY (category_id) REFERENCES public.categories(id) ON DELETE SET NULL;


--
-- Name: skins skins_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.skins
    ADD CONSTRAINT skins_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.usuarios(id) ON DELETE CASCADE;


--
-- Name: usuarios usuarios_role_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_role_id_foreign FOREIGN KEY (role_id) REFERENCES public.roles(id) ON DELETE SET NULL;


--
-- PostgreSQL database dump complete
--

