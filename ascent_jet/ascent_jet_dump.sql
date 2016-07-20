--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: airplanes_airplane; Type: TABLE; Schema: public; Owner: ascent_jet; Tablespace: 
--

CREATE TABLE airplanes_airplane (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    passenger_seating character varying(255),
    luggage_capacity character varying(255),
    max_speed character varying(255),
    max_range character varying(255),
    takeoff_distance character varying(255),
    max_altitude character varying(255),
    category_id integer,
    inner_image_id integer,
    layout_image_id integer,
    outer_image_id integer NOT NULL,
    "order" smallint NOT NULL,
    CONSTRAINT airplanes_airplane_order_check CHECK (("order" >= 0))
);


ALTER TABLE public.airplanes_airplane OWNER TO ascent_jet;

--
-- Name: airplanes_airplane_id_seq; Type: SEQUENCE; Schema: public; Owner: ascent_jet
--

CREATE SEQUENCE airplanes_airplane_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.airplanes_airplane_id_seq OWNER TO ascent_jet;

--
-- Name: airplanes_airplane_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ascent_jet
--

ALTER SEQUENCE airplanes_airplane_id_seq OWNED BY airplanes_airplane.id;


--
-- Name: airplanes_airplanecategory; Type: TABLE; Schema: public; Owner: ascent_jet; Tablespace: 
--

CREATE TABLE airplanes_airplanecategory (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    lead text NOT NULL,
    image_id integer NOT NULL,
    hidden boolean NOT NULL,
    "order" smallint NOT NULL,
    CONSTRAINT airplanes_airplanecategory_order_check CHECK (("order" >= 0))
);


ALTER TABLE public.airplanes_airplanecategory OWNER TO ascent_jet;

--
-- Name: airplanes_airplanecategory_id_seq; Type: SEQUENCE; Schema: public; Owner: ascent_jet
--

CREATE SEQUENCE airplanes_airplanecategory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.airplanes_airplanecategory_id_seq OWNER TO ascent_jet;

--
-- Name: airplanes_airplanecategory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ascent_jet
--

ALTER SEQUENCE airplanes_airplanecategory_id_seq OWNED BY airplanes_airplanecategory.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: ascent_jet; Tablespace: 
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO ascent_jet;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: ascent_jet
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO ascent_jet;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ascent_jet
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: ascent_jet; Tablespace: 
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO ascent_jet;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: ascent_jet
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO ascent_jet;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ascent_jet
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: ascent_jet; Tablespace: 
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO ascent_jet;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: ascent_jet
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO ascent_jet;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ascent_jet
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: ascent_jet; Tablespace: 
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone NOT NULL,
    is_superuser boolean NOT NULL,
    username character varying(30) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(75) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO ascent_jet;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: ascent_jet; Tablespace: 
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO ascent_jet;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: ascent_jet
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO ascent_jet;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ascent_jet
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: ascent_jet
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO ascent_jet;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ascent_jet
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: ascent_jet; Tablespace: 
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO ascent_jet;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: ascent_jet
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO ascent_jet;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ascent_jet
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- Name: common_homepageimage; Type: TABLE; Schema: public; Owner: ascent_jet; Tablespace: 
--

CREATE TABLE common_homepageimage (
    image_ptr_id integer NOT NULL,
    body boolean NOT NULL,
    header boolean NOT NULL
);


ALTER TABLE public.common_homepageimage OWNER TO ascent_jet;

--
-- Name: common_image; Type: TABLE; Schema: public; Owner: ascent_jet; Tablespace: 
--

CREATE TABLE common_image (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    resource character varying(255) NOT NULL,
    caption text
);


ALTER TABLE public.common_image OWNER TO ascent_jet;

--
-- Name: common_image_id_seq; Type: SEQUENCE; Schema: public; Owner: ascent_jet
--

CREATE SEQUENCE common_image_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.common_image_id_seq OWNER TO ascent_jet;

--
-- Name: common_image_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ascent_jet
--

ALTER SEQUENCE common_image_id_seq OWNED BY common_image.id;


--
-- Name: common_snippet; Type: TABLE; Schema: public; Owner: ascent_jet; Tablespace: 
--

CREATE TABLE common_snippet (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    body text NOT NULL,
    link character varying(255) NOT NULL,
    link_title character varying(255) NOT NULL,
    image_id integer,
    icon character varying(255) NOT NULL
);


ALTER TABLE public.common_snippet OWNER TO ascent_jet;

--
-- Name: common_snippet_id_seq; Type: SEQUENCE; Schema: public; Owner: ascent_jet
--

CREATE SEQUENCE common_snippet_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.common_snippet_id_seq OWNER TO ascent_jet;

--
-- Name: common_snippet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ascent_jet
--

ALTER SEQUENCE common_snippet_id_seq OWNED BY common_snippet.id;


--
-- Name: contact_contact; Type: TABLE; Schema: public; Owner: ascent_jet; Tablespace: 
--

CREATE TABLE contact_contact (
    id integer NOT NULL,
    first_name character varying(64) NOT NULL,
    email character varying(75) NOT NULL,
    message character varying(2000) NOT NULL,
    date_created timestamp with time zone NOT NULL
);


ALTER TABLE public.contact_contact OWNER TO ascent_jet;

--
-- Name: contact_contact_id_seq; Type: SEQUENCE; Schema: public; Owner: ascent_jet
--

CREATE SEQUENCE contact_contact_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contact_contact_id_seq OWNER TO ascent_jet;

--
-- Name: contact_contact_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ascent_jet
--

ALTER SEQUENCE contact_contact_id_seq OWNED BY contact_contact.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: ascent_jet; Tablespace: 
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO ascent_jet;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: ascent_jet
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO ascent_jet;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ascent_jet
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: ascent_jet; Tablespace: 
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO ascent_jet;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: ascent_jet
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO ascent_jet;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ascent_jet
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: ascent_jet; Tablespace: 
--

CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO ascent_jet;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: ascent_jet
--

CREATE SEQUENCE django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO ascent_jet;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ascent_jet
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: ascent_jet; Tablespace: 
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO ascent_jet;

--
-- Name: structure_article; Type: TABLE; Schema: public; Owner: ascent_jet; Tablespace: 
--

CREATE TABLE structure_article (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    lead text NOT NULL,
    body text NOT NULL,
    node_id integer,
    conclusion text NOT NULL,
    image_id integer,
    "order" smallint NOT NULL,
    CONSTRAINT structure_article_order_check CHECK (("order" >= 0))
);


ALTER TABLE public.structure_article OWNER TO ascent_jet;

--
-- Name: structure_article_id_seq; Type: SEQUENCE; Schema: public; Owner: ascent_jet
--

CREATE SEQUENCE structure_article_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.structure_article_id_seq OWNER TO ascent_jet;

--
-- Name: structure_article_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ascent_jet
--

ALTER SEQUENCE structure_article_id_seq OWNED BY structure_article.id;


--
-- Name: structure_footergroup; Type: TABLE; Schema: public; Owner: ascent_jet; Tablespace: 
--

CREATE TABLE structure_footergroup (
    id integer NOT NULL,
    title character varying(255) NOT NULL
);


ALTER TABLE public.structure_footergroup OWNER TO ascent_jet;

--
-- Name: structure_footergroup_id_seq; Type: SEQUENCE; Schema: public; Owner: ascent_jet
--

CREATE SEQUENCE structure_footergroup_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.structure_footergroup_id_seq OWNER TO ascent_jet;

--
-- Name: structure_footergroup_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ascent_jet
--

ALTER SEQUENCE structure_footergroup_id_seq OWNED BY structure_footergroup.id;


--
-- Name: structure_node; Type: TABLE; Schema: public; Owner: ascent_jet; Tablespace: 
--

CREATE TABLE structure_node (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    slug character varying(255) NOT NULL,
    visible boolean NOT NULL,
    "order" smallint NOT NULL,
    lft integer NOT NULL,
    rght integer NOT NULL,
    tree_id integer NOT NULL,
    level integer NOT NULL,
    parent_id integer,
    footer_group_id integer,
    footer_group_order smallint NOT NULL,
    image_id integer,
    include_airplanes boolean NOT NULL,
    CONSTRAINT structure_node_footer_group_order_check CHECK ((footer_group_order >= 0)),
    CONSTRAINT structure_node_level_check CHECK ((level >= 0)),
    CONSTRAINT structure_node_lft_check CHECK ((lft >= 0)),
    CONSTRAINT structure_node_order_check CHECK (("order" >= 0)),
    CONSTRAINT structure_node_rght_check CHECK ((rght >= 0)),
    CONSTRAINT structure_node_tree_id_check CHECK ((tree_id >= 0))
);


ALTER TABLE public.structure_node OWNER TO ascent_jet;

--
-- Name: structure_node_id_seq; Type: SEQUENCE; Schema: public; Owner: ascent_jet
--

CREATE SEQUENCE structure_node_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.structure_node_id_seq OWNER TO ascent_jet;

--
-- Name: structure_node_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ascent_jet
--

ALTER SEQUENCE structure_node_id_seq OWNED BY structure_node.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ascent_jet
--

ALTER TABLE ONLY airplanes_airplane ALTER COLUMN id SET DEFAULT nextval('airplanes_airplane_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ascent_jet
--

ALTER TABLE ONLY airplanes_airplanecategory ALTER COLUMN id SET DEFAULT nextval('airplanes_airplanecategory_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ascent_jet
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ascent_jet
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ascent_jet
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ascent_jet
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ascent_jet
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ascent_jet
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ascent_jet
--

ALTER TABLE ONLY common_image ALTER COLUMN id SET DEFAULT nextval('common_image_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ascent_jet
--

ALTER TABLE ONLY common_snippet ALTER COLUMN id SET DEFAULT nextval('common_snippet_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ascent_jet
--

ALTER TABLE ONLY contact_contact ALTER COLUMN id SET DEFAULT nextval('contact_contact_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ascent_jet
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ascent_jet
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ascent_jet
--

ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ascent_jet
--

ALTER TABLE ONLY structure_article ALTER COLUMN id SET DEFAULT nextval('structure_article_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ascent_jet
--

ALTER TABLE ONLY structure_footergroup ALTER COLUMN id SET DEFAULT nextval('structure_footergroup_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ascent_jet
--

ALTER TABLE ONLY structure_node ALTER COLUMN id SET DEFAULT nextval('structure_node_id_seq'::regclass);


--
-- Data for Name: airplanes_airplane; Type: TABLE DATA; Schema: public; Owner: ascent_jet
--

COPY airplanes_airplane (id, title, passenger_seating, luggage_capacity, max_speed, max_range, takeoff_distance, max_altitude, category_id, inner_image_id, layout_image_id, outer_image_id, "order") FROM stdin;
4	King Air 200							3	5	9	5	1
3	King Air 350	123	456	678	999	675	765	3	8	9	7	1
11	Cessna Citation Mustang	up to 4 	1.61m3 (57 cubic feet)	340 kts.	1,150 nm (2,130 km)	3,110 feet (948 m)	41,000 feet	2	26	31	25	1
9	Cessna Citation Excel/XLS	up to 10	2.55m3 (90 cubic feet)	441 kts.	1,858 nm (3,441 km)	3,560 feet	45,000 feet	4	21	33	20	1
16	Bombardier Challenger 605	up to 12 	3.26m3 (115 cubic feet)	470 kts.	4,000 nm (7,408 km)	5,840 feet (1,780m)	41,000 feet	6	47	48	46	1
20	Cessna Citation CJ2	up to 7	1.84m3 (65 cubic feet)	418 kts.	1,613 nm (2,987 km)	3,360 feet (1,024 m)	45,000 feet	1	63	64	62	1
12	Embraer Phenom 100	up to 4 	1.5m3 (53 cubic feet)	390 knots	1,178 nm (2,182 km)	3,400 feet (1,063 m)	41,000 feet	2	28	30	27	2
21	Cessna Citation CJ3	up to 8	1,84 m3 (65 cubic feet)	416 kts.	1,875 nm (3,473 km)	3,180 feet (969 m)	45,000 feet	1	66	67	65	2
23	Bombardier Learjet 40 XR	 Passenger seating: up to 6 Luggage capacity: 1.42m3 (50 cubic feet) Max. cruise speed: 465 kts. Range: 1,991 nm (3,687 km) Takeoff distance: 4,680 feet (1,426 m) Max. operating altitude: 51,000 feet	1.42m3 (50 cubic feet)	465 kts.	1,991 nm (3,687 km)	4,680 feet (1,426 m)	51,000 feet	1	72	73	71	3
22	Beechcraft IA Premier	up to 5	2.2m3 (76.9 cubic feet)	454 kts.	1,460 nm (2,704 km)	3,792 feet (1,156 m)	41,000 feet	1	69	70	68	4
10	Cessna Citation Sovereign	up to 10	3.8m3 (135 cubic feet)	458 kts.	2,837 nm (5,273 km)	3,640 feet (1,109 m)	47,000 feet	4	23	32	22	2
7	Hawker 900 XP	up to 9 	1.4m3 (49.5 cubic feet)	465 kts.	2,600 nm (4,815 km)	4,965 feet (1,513 m)	41,000 feet	4	17	35	16	3
8	Bmbardier Learjet 60 XR	 up to 8	1.67m3 (59 cubic feet)	466 kts.	2,405 nm (4,454 km)	5,450 feet (1,661 m)	51,000 feet	4	19	34	18	4
17	Dassault Falcon 900LX	up to 12	3.6m3 (127 cubic feet)	515 kts.	4,750 nm (8,800 km)	5,505 feet (1,678 m)	51,000 feet	6	53	54	52	2
18	Dassault Falcon 7X	up to 12 	3.6m3 (127 cubic feet)	515 kts.	5,950 nm (11,019 km)	5,505 feet (1,678 m)	51,000 feet	6	56	57	55	3
19	Gulfstream G550	up to 19	6.4m3 (226 cubic feet)	500 kts.	6,750 nm (12,501 km)	5,910 feet (1,801 m)	51,000 feet	6	59	60	58	4
5	Bombardier Global 5000	up to 19	5.24m3 (185 cubic feet)	517 kts.	7,300 nm (13,520 km)	5,950 feet (1,814 m)	51,000 feet	6	11	49	10	5
13	Cessna Citation X	up to 10	2.9m3 (103 cubic feet)	525 kts.	3,070 nm (5,685 km)	5,140 feet (1,566 m)	51,000 feet	5	38	39	37	2
6	Bombardier Challenger 300	up to 10	3.3m3 (115 cubic feet)	470 kts.	3,065 nm (5,676 km)	4,810 feet (1,466 m)	45,000 feet	5	14	36	13	1
14	Embraer Legacy 600	up to 13	6.8m3 (240 cubic feet)	487 kts.	3,400 nm (6,297 km)	5,614 feet (1,711 m)	41,000 feet	5	41	42	40	3
15	Gulfstream G280	up to 10	4.4m3 (154 cubic feet)	 488 kts.	3,600 nm (6,667 km)	4,750 feet (1,448 m)	45,000 feet	5	44	45	43	4
\.


--
-- Name: airplanes_airplane_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ascent_jet
--

SELECT pg_catalog.setval('airplanes_airplane_id_seq', 23, true);


--
-- Data for Name: airplanes_airplanecategory; Type: TABLE DATA; Schema: public; Owner: ascent_jet
--

COPY airplanes_airplanecategory (id, title, lead, image_id, hidden, "order") FROM stdin;
2	Very Light Jets	Most light jets and even very light jets will get you from one point in Europe to another.  These aircraft typically have a full payload range of between 1000nm and 1400 nm.  Very light jets are by far the most cost effective way to fly privately (we’re not including turboprops here) but are limited to four seats and have restricted baggage space.  The most popular very light jet today is the Cessna Citation Mustang.  This is followed by the Embraer Phenom 100. 	24	f	1
1	Light Jets	<p>A light jet would be the right choice for intra European flights if your party includes more than four and up to seven travelers. Their range is greater and aircraft in this category are more spacious with more luggage room. Popular choices today include the Cessna Citation CJ range as well as the Beechcraft Premier 1A and Learjet 40.</p>	61	f	2
4	Mid Jets	<p>For longer flights or for those who favor more head room and a wider cabin, there are a number of mid-sized jets to choose from. The typical range of a mid-sized jet is 1900nm. They can seat up to 10 passengers. Popular choices in the mid jet category include the Cessna Citation Excel, the Cessna Citation Sovereign, the Learjet 60 and the Hawker 900.</p>	15	f	3
5	Super Mid Jets	<p>There are several aircraft that fall in the super mid category. These will get you across the Atlantic at a lower price than a heavy jet, but you would probably have to stop en route (typically Iceland) to refuel. You would still be seated in a luxurious cabin with ample head room. Super mid jets will usually seat up to eight travelers comfortably and have a typical range of 3100nm. Popular choices include the Cessna Citation X (the world&rsquo;s fastest commercial jet), the Bombardier Challenger 300 and the Gulfstream G200 and the Embrear Legacy 600. These aircraft are ideal for the medium to longer range flights.</p>	13	f	4
6	Heavy Jets	<p>For the long range intercontinental flights, you would undoubtedly consider a heavy jet. These have the largest variations of ranges and cabin sizes within a given category. A very popular choice for intermediate long range flights is the Bombardier Challenger 600 series. Another is the Dassault Falcon 900EX. Variants of both aircraft have ranges respectively of 4010nm and 4000nm. Both aircraft have large and luxurious cabins and are usually configured to seat up to 12 or even more passengers. Next we come to the ultra long range heavy jets. These include the Gulfstream G 550, the Dassault Falcon 7X and the Bombardier Global Express. All have a range of between 5950nm and 6750nm. Ultra long range business jets are usually configured to seat 12 to 14 travelers. Their seats can typically be converted into beds (berthable), and all will get you from Western Europe to Rio de Janeiro or the west coast of the USA non-stop.</p>	12	f	5
3	Turbo Props	<p>For the long range intercontinental flights, you would undoubtedly consider a heavy jet. These have the largest variations of ranges and cabin sizes within a given category. A very popular choice for intermediate long range flights is the Bombardier Challenger 600 series. Another is the Dassault Falcon 900EX. Variants of both aircraft have ranges respectively of 4010nm and 4000nm. Both aircraft have large and luxurious cabins and are usually configured to seat up to 12 or even more passengers.</p>	6	t	1
\.


--
-- Name: airplanes_airplanecategory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ascent_jet
--

SELECT pg_catalog.setval('airplanes_airplanecategory_id_seq', 6, true);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: ascent_jet
--

COPY auth_group (id, name) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ascent_jet
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: ascent_jet
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ascent_jet
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: ascent_jet
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add Snippet	1	add_snippet
2	Can change Snippet	1	change_snippet
3	Can delete Snippet	1	delete_snippet
4	Can add Image	2	add_image
5	Can change Image	2	change_image
6	Can delete Image	2	delete_image
7	Can add log entry	3	add_logentry
8	Can change log entry	3	change_logentry
9	Can delete log entry	3	delete_logentry
10	Can add permission	4	add_permission
11	Can change permission	4	change_permission
12	Can delete permission	4	delete_permission
13	Can add group	5	add_group
14	Can change group	5	change_group
15	Can delete group	5	delete_group
16	Can add user	6	add_user
17	Can change user	6	change_user
18	Can delete user	6	delete_user
19	Can add content type	7	add_contenttype
20	Can change content type	7	change_contenttype
21	Can delete content type	7	delete_contenttype
22	Can add session	8	add_session
23	Can change session	8	change_session
24	Can delete session	8	delete_session
25	Can add article	9	add_article
26	Can change article	9	change_article
27	Can delete article	9	delete_article
28	Can add Node	10	add_node
29	Can change Node	10	change_node
30	Can delete Node	10	delete_node
31	Can add footer group	11	add_footergroup
32	Can change footer group	11	change_footergroup
33	Can delete footer group	11	delete_footergroup
34	Can add airplane category	12	add_airplanecategory
35	Can change airplane category	12	change_airplanecategory
36	Can delete airplane category	12	delete_airplanecategory
37	Can add airplane	13	add_airplane
38	Can change airplane	13	change_airplane
39	Can delete airplane	13	delete_airplane
40	Can add contact	14	add_contact
41	Can change contact	14	change_contact
42	Can delete contact	14	delete_contact
43	Can add home page image	15	add_homepageimage
44	Can change home page image	15	change_homepageimage
45	Can delete home page image	15	delete_homepageimage
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ascent_jet
--

SELECT pg_catalog.setval('auth_permission_id_seq', 45, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: ascent_jet
--

COPY auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
3	pbkdf2_sha256$12000$PYu2GLLHbDf7$voJ+N9C6NOCMkCzpqvBL42673ehjzi50rFKdSH/m/Ls=	2015-03-14 17:41:19.658813+00	t	davor				t	t	2014-12-02 11:03:56+00
4	pbkdf2_sha256$12000$arA72SoPL7Wb$7jb3cIGvDwaBJg6k7JOxTXfRefiEBfgUqon0QDtLiRw=	2014-12-02 11:08:22+00	t	ozren				t	t	2014-12-02 11:08:22+00
5	pbkdf2_sha256$12000$TirtG8tcihvN$3Hly9NrdLz9MJ8+Dn4wQ1U4umCIJa80/KaQ8f25+eJQ=	2014-12-02 12:01:07.742737+00	t	damir				t	t	2014-12-02 11:08:33+00
7	pbkdf2_sha256$12000$lOwMbFuh6b1M$YPwuZoTGcAMJvfBuxLl5F5VfAznNJlbAWHatBqsiLmE=	2015-08-19 17:12:42.412585+00	t	carl				t	t	2015-03-09 10:25:14+00
1	pbkdf2_sha256$12000$Vb9LlFbvIwCi$84phnauOrrzeFqPzGjoWrjuoNQvCNDsJdm45eEY04RE=	2015-12-15 16:07:35.037334+00	t	ozren1983				t	t	2014-12-02 09:30:05.776896+00
6	pbkdf2_sha256$12000$YqDDaVeg6A17$0Ml6tNQ++IzabLAYcbuXR0SJJd6JTgwIqSTb9yDJdAo=	2015-12-16 10:12:07.159668+00	t	alen				t	t	2014-12-02 16:04:15+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: ascent_jet
--

COPY auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ascent_jet
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ascent_jet
--

SELECT pg_catalog.setval('auth_user_id_seq', 7, true);


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: ascent_jet
--

COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ascent_jet
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- Data for Name: common_homepageimage; Type: TABLE DATA; Schema: public; Owner: ascent_jet
--

COPY common_homepageimage (image_ptr_id, body, header) FROM stdin;
99	f	t
98	f	t
100	f	t
101	t	f
\.


--
-- Data for Name: common_image; Type: TABLE DATA; Schema: public; Owner: ascent_jet
--

COPY common_image (id, title, resource, caption) FROM stdin;
1	Homepage Feature Icon	images/homepage_icon.png	\N
2	Red airplane	images/biplan-rent-airplane_crT3bSo.jpg	\N
3	Airplane sunset	images/Airplane-sunset_Rde3Fkb.jpg	\N
4	Guy	images/guy.jpg	\N
5	Turbo Prop Jet	images/turbo_prop.jpg	Very nice turbo prop jet.
6	Very Light Jet	images/very_light.jpg	Very Light Jet cruising...
7	Citation Ultra Outer	images/citation_ultra_outer.jpg	
8	Citation Ultra Inner	images/citation_ultra_inner.jpg	
9	Citation Ultra Layout	images/citation_ultra_layout.jpg	
10	Bombardier Global 5000	images/Global_ext.jpg	This is a Global 5000
11	Global 5000 interior	images/Global_int.jpg	Global 5000 interior
12	Dassault Falcon 7X	images/Dassault_Falcon_7X_ext.jpg	Dassault Falcon 7X ultra long range jet
13	Bombardier Challenger 300	images/Challenger_300_exterior.jpg	Bombardier Challenger 300
14	Bombardier Challenger 300 interior	images/Challenger_300_interior.jpg	Bombardier Challenger 300 interior
15	Cessna Citation Excel/XLS	images/Cessna_Citation_XLS_exterior.jpg	Cessna Citation Excel/XLS
16	Hawker 900 XP exterior	images/Low_Res_Hawker_900XP_exterior_aerial_3.jpg	Hawker 900 XP exterior
17	Hawker 900 XP interior	images/Low_Res_Hawker_900XP_interior_2.jpg	Hawker 900 XP interior
18	Bombardier Learjet 60 XR exterior	images/Learjet_60_exterior.jpg	Bombardier Learjet 60 XR exterior
19	Bombardier Learjet 60 XR interior	images/Learjet_60_interior.jpg	Bombardier Learjet 60 XR interior
20	Cessna Citation Excel/XLS	images/Cessna_Citation_XLS_exterior_F9XEMqF.jpg	Cessna Citation Excel/XLS
21	Cessna Citation Excel/XLS interior	images/Cessna_Citation_XLS_int.jpg	Cessna Citation Excel/XLS interior
22	Cessna Citation Sovereign	images/Cessna_Citation_Sovereign_exterior.jpg	Cessna Citation Sovereign
23	Cessna Citation Sovereign interior	images/Citation_Sovereign_interior.jpg	Cessna Citation Sovereign interior
24	Cessna Citation Mustang	images/Cessna_Citation_Mustang_ext.jpg	Cessna Citation Mustang
25	Cessna Citation Mustang exterior	images/Cessna_Citation_Mustang_ext_pxoVkY8.jpg	Cessna Citation Mustang exterior
26	Cessna Citation Mustang interior	images/Citation_Citation_Mustang_interior.jpg	Cessna Citation Mustang interior
27	Embraer Phenom 100 exterior	images/Embrear_Phenom_100_ext.jpg	Embraer Phenom 100 exterior
28	Embraer Phenom 100 interior	images/Embrear_Phenom_100_int.jpg	Embraer Phenom 100 interior
29	Phenom 100 floor plan	images/Phenom-100.png	Phenom 100 floor plan
30	Phenom 100 floor plan	images/Phenom-100_2RUhxAt.png	Phenom 100 floor plan
31	Cessna Citation Mustang floor plan	images/Citation-Mustang.png	Cessna Citation Mustang floor plan
32	Cessna Citation sovereign floor plan	images/Citation-Sovereign.png	Cessna Citation sovereign floor plan
33	Cessna Citation Excel/XLS floor plan	images/Citation-XLS.png	
34	Bombardier Learjet 60 XR floor plan	images/Learjet-60.png	Bombardier Learjet 60 XR floor plan
35	Hawker 900 XP floor plan	images/Hawker-900XP.png	Hawker 900 XP floor plan
36	Bombardier Challenger 300 floor plan	images/Challenger-300.png	Bombardier Challenger 300 floor plan
37	Cessna Citation X exterior	images/Cessna_Citation_X_Ext..jpg	Cessna Citation X exterior
38	Cessna Citation X interior	images/Cessna_Citation_X_interior.jpg	Cessna Citation X interior
39	Cessna Citation X floor plan	images/Citation-X.png	Cessna Citation X floor plan
40	Embraer Legacy 600 exterior	images/Embrear_Legacy_600_ext.jpg	Embraer Legacy 600 exterior
41	Embaer Legacy 600 interior	images/Embrear_Legacy_600_int.jpg	Embaer Legacy 600 interior
42	Embraer Legacy 600 floor plan	images/Legacy-600.png	Embraer Legacy floor plan
43	Gulfstream G280 exterior	images/Gulfstream_G280_exterior.jpg	Gulfstream G280 exterior
44	Gulfstream G280 interior	images/Gulfstream_G2801_interior.jpg	Gulfstream G280 interior
45	Gulfstream G280 floor plan	images/Gulfstream-G200.png	Gulfstream G280 floor plan
46	Bombardier Challenger 605 exterior	images/Challenger_605_exterior.jpg	Bombardier Challenger 605 exterior
47	Bombardier Challenger 605 interior	images/Challenger_605_interior.jpg	Bombardier Challenger 605 interior
48	Bombardier Challenger 605 floor plan	images/Challenger-605.png	Bombardier Challenger 605 floor plan
49	Bombardier Global 5000 floor plan	images/Global-Express-XRS.png	Bombardier Global 5000 floor plan
50	Dassault Falcon 7X	images/Dassault_Falcon_7X_ext_d0Wbczp.jpg	Dassault Falcon 7X
51	Dassault Falcon 7X exterior	images/Dassault_Falcon_7X_ext_iI3CG29.jpg	Dassault Falcon 7X exterior
52	Dassault Falcon 900LX exterior	images/Falcon900LX_exterior.jpg	Dassault Falcon 900LX exterior
53	Dassault Falcon 900LX interior	images/Falcon900LX_interior.jpg	Dassault Falcon 900LX interior
54	Dassault Falcon 900LX floor plan	images/Falcon-7X.png	Dassault Falcon 900LX floor plan
55	Dassault Falcon 7X exterior	images/Dassault_Falcon_7X_ext_pwZENvU.jpg	Dassault Falcon 7X exterior 
56	Dassault Falcon 7X interior	images/Falcon7X_interior.jpg	Dassault Falcon 7X interior
57	Dassault Falcon 7X floor plan	images/Falcon-7X_s7yfcKB.png	Dassault Falcon 7X floor plan
58	Gulfstream G550 exterior	images/Gulfstream_G550_exterior.jpg	Gulfstream G550 exterior
59	Gulfsream G550 interior	images/Gulfstream_G550_interior.jpg	Gulfstream G550 interior
60	Gulfstream G500 floor plan	images/Gulfstream-G550.png	Gulfstream G550 floor plan
61	Cessna Citation CJ2	images/Citation_CJ2_exterior.jpg	Cessna Citation CJ2
62	Cessna Citation CJ2 exterior	images/Citation_CJ2_exterior_oK8dcPj.jpg	Cessna Citation CJ2 exterior
63	Cessna Citation CJ2 interior	images/Cessna_Citation_CJ2_interior.jpg	Cessna Citation CJ2 interior
64	Cessna Citation CJ2 floor plan	images/Citation-CJ2.png	
65	Cessna Citation CJ3 exterior	images/Citation_CJ3_exterior.jpg	Cessna Citation CJ3 exterior
66	Cessna Citation CJ3 interior	images/Citation_CJ3_interior.jpg	Cessna Citation CJ3 interior
67	Cessna Citation CJ3 floor plan	images/Citation-CJ3.png	Cessna Citation CJ3 floor plan
68	Beechcraft IA Premier exterior	images/Beechcraft_Premier_IA_ext.jpg	Beechcraft IA Premier exterior
69	Beechcraft IA Premier interior	images/Beechcraft_Premier_IA_interior.jpg	Beechcraft IA Premier interior
70	Beechcraft  IA Premier floor plan	images/Premier-I.png	Beechcraft  IA Premier floor plan
71	Bombardier Learjet 40 XR exterior	images/Lear_40_ext.jpg	Bombardier Learjet 40 XR exterior
72	Bombardier Learjet 40 XR interior	images/Lear_40_int.jpg	Bombardier Learjet 40 XR interior
73	Bombardier Learjet 40 XR floor plan	images/Learjet-45.png	Bombardier Learjet 40 XR floor plan
74	Unique booking platform	images/Unique_booking_platform.png	
75	Unique booking platform	images/Unique_booking_platform_IGMSuMG.png	Unique booking platform
76	Personalized service	images/Personalized_Service.png	Personalized service
77	Director pricing	images/Direct_pricing.png	Director pricing
78	Low booking fees	images/Low_booking_fees.png	Low booking fees
79	Information at your fingertips	images/Information_at_your_fingertips.png	Information at your fingertips
80	Empty leg market-place	images/Empty_leg_market-place.png	Empty leg market-place
81	Maintenance aero engine	images/dreamstime_s1_6758908.jpg	
82	front_page_benefits_photo	images/woman.jpg	
83	Flying Privately A1	images/iStock_000016041408XLarge_q.jpg	
84	Flying Privately A2	images/iStock_000016041408XLarge_q2.jpg	
85	Flying Privately A3	images/iStock_000016041408XLarge_q3.jpg	
86	Flying Privately A4	images/iStock_000016041408XLarge_q4.jpg	
87	Flying Privately A5	images/iStock_000016041408XLarge_q5.jpg	
88	Why AJ A1	images/why_ascent_A1.jpg	
89	Why AJ A2	images/why_ascent_A2.jpg	
90	Why AJ A3	images/why_ascent_A3.jpg	
91	About_A1	images/about_us_A1.jpg	
92	About_A2	images/about_us_A2.jpg	
93	About_A3	images/about_us_A3.jpg	
94	About_A4	images/about_us_A4.jpg	
95	About_B1	images/About_B1.jpg	
96	Main_B1	images/main_b.jpg	
99	Hpme šage woman	images/home_b.jpg	\N
98	Homepage Airplane Image	images/home.jpg	\N
100	Home page man	images/home_c.jpg	\N
101	Home body image	images/main_b4.jpg	\N
\.


--
-- Name: common_image_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ascent_jet
--

SELECT pg_catalog.setval('common_image_id_seq', 101, true);


--
-- Data for Name: common_snippet; Type: TABLE DATA; Schema: public; Owner: ascent_jet
--

COPY common_snippet (id, title, body, link, link_title, image_id, icon) FROM stdin;
1	Be where you want it and when you want it	Be where you want it and when you want it body...	/why-ascent-jet	Learn More	\N	
10	Need help?	For immediate personal assistance or questions relating to your request for quote, please contact us on:			\N	
11	+41 22 366 42 05	+41 22 366 42 05 for outside of Switzerland			\N	
3	Unique booking platform	Operators send their offers directly to you login area.  You can then select and book on-line.			75	icon-booking
4	Personalized service	We select the operators and aircraft to be offered based on your trip profile and requirements.			76	icon-service
5	Direct pricing	Pricing is completely transparent since it comes to you directly from solicited operators			77	icon-pricing
7	Low booking fees	Thanks to the combination of new technologies combined with personalized service, we offer the most competitive booking fees.			78	icon-fees
8	Information at your fingertips	The Ascent Jet site provides a wealth of information on aircraft selection as well as airport locations.			79	icon-fingertips
9	Empty leg market-place	 Find one way flights among the many hundreds that are advertised on our site.			80	icon-marketplace
6	Key benefit goes here	Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. 	/flying-privately	Learn More	96	
\.


--
-- Name: common_snippet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ascent_jet
--

SELECT pg_catalog.setval('common_snippet_id_seq', 11, true);


--
-- Data for Name: contact_contact; Type: TABLE DATA; Schema: public; Owner: ascent_jet
--

COPY contact_contact (id, first_name, email, message, date_created) FROM stdin;
4	Ozren Lapcevic	ozren.lapcevic@revolucija.hr	Hello,\r\n\r\ndid this email get through to info@ascentjet.com?\r\n\r\nCheers\r\nOzren	2015-09-29 11:14:24.454591+00
5	Ozren	ozren.lapcevic@revolucija.hr	Hi Carl,\r\n\r\nthis is test from contact form. Have you received this email? \r\n\r\nCheers\r\nOzren\r\n	2015-09-29 14:06:00.641256+00
6	Ozren Lapcevic	ozren.lapcevic@revolucija.hr	Testing...\r\n\r\nEtiam vitae augue urna. Mauris nunc augue, fermentum in suscipit id, sollicitudin et enim. Maecenas sit amet sollicitudin ligula. Praesent id aliquet ipsum. Sed efficitur nisl felis, ac suscipit nunc posuere ac. Quisque libero dui, tempor a pretium gravida, vestibulum facilisis massa. Fusce porta, velit eget bibendum sagittis, lorem dui imperdiet justo, a condimentum urna tellus vitae enim. Donec feugiat consequat nunc eget sagittis. Sed a tortor euismod, eleifend est vitae, pellentesque erat. Proin scelerisque et nisl et sodales.\r\n\r\nEtiam vitae augue urna. Mauris nunc augue, fermentum in suscipit id, sollicitudin et enim. Maecenas sit amet sollicitudin ligula. Praesent id aliquet ipsum. Sed efficitur nisl felis, ac suscipit nunc posuere ac. Quisque libero dui, tempor a pretium gravida, vestibulum facilisis massa. Fusce porta, velit eget bibendum sagittis, lorem dui imperdiet justo, a condimentum urna tellus vitae enim. Donec feugiat consequat nunc eget sagittis. Sed a tortor euismod, eleifend est vitae, pellentesque erat. Proin scelerisque et nisl et sodales.	2015-12-11 12:28:26.730499+00
\.


--
-- Name: contact_contact_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ascent_jet
--

SELECT pg_catalog.setval('contact_contact_id_seq', 6, true);


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: ascent_jet
--

COPY django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2014-12-02 09:32:14.743671+00	1	GET A QUOTE	1		10	1
2	2014-12-02 09:32:23.090214+00	2	FLYING PRIVATELY	1		10	1
3	2014-12-02 09:32:50.859031+00	3	WHY ASCENT JET	1		10	1
4	2014-12-02 09:32:59.723208+00	4	ABOUT US	1		10	1
5	2014-12-02 09:33:43.92726+00	1	Flying Privately	1		11	1
6	2014-12-02 09:33:50.872972+00	2	Why Ascent Jet	1		11	1
7	2014-12-02 09:34:24.250786+00	5	Charting Flights	1		10	1
8	2014-12-02 09:34:47.583375+00	6	Charting Legs	1		10	1
9	2014-12-02 09:36:20.206164+00	7	Quoting System	1		10	1
10	2014-12-02 09:36:38.923469+00	8	Customer Service	1		10	1
11	2014-12-02 09:37:03.675285+00	9	Team	1		10	1
12	2014-12-02 09:37:20.196432+00	10	Press	1		10	1
13	2014-12-02 09:37:37.711475+00	11	Contact	1		10	1
14	2014-12-02 09:37:52.455247+00	12	Pricing	1		10	1
15	2014-12-02 09:38:04.067637+00	11	Contact	2	Changed order and parent.	10	1
16	2014-12-02 09:44:16.704733+00	1	Homepage Feature Icon	1		2	1
17	2014-12-02 09:46:38.72654+00	1	Be where you want it and when you want it	1		1	1
18	2014-12-02 09:47:39.683446+00	2	Personalized Service	1		1	1
19	2014-12-02 09:49:19.507569+00	2	Personalized Service	3		1	1
20	2014-12-02 09:51:15.495065+00	3	Personalized Service	1		1	1
21	2014-12-02 09:51:39.151356+00	3	Personalized Service	2	Changed link and link_title.	1	1
22	2014-12-02 09:51:49.839743+00	4	Selected Operators	1		1	1
23	2014-12-02 09:52:01.26979+00	5	Cost Effective Solutions	1		1	1
24	2014-12-02 09:52:41.472496+00	6	Key benefit goes here	1		1	1
25	2014-12-02 09:53:10.270222+00	7	Personalized Service #2	1		1	1
26	2014-12-02 09:53:18.562621+00	8	Selected Operators	1		1	1
27	2014-12-02 09:53:32.305699+00	8	Selected Operators #2	2	Changed title.	1	1
28	2014-12-02 09:53:41.710377+00	9	Cost Effective Solutions #2	1		1	1
29	2014-12-02 09:54:29.99959+00	10	Need help?	1		1	1
30	2014-12-02 09:54:55.184968+00	11	+41 22 366 42 05	1		1	1
31	2014-12-02 09:56:12.889176+00	11	Contact	3		10	1
32	2014-12-02 09:56:46.498962+00	13	Contact	1		10	1
33	2014-12-02 09:56:56.773138+00	13	Contact	2	Changed footer_group_order.	10	1
34	2014-12-02 10:00:19.332033+00	2	Red airplane	1		2	1
35	2014-12-02 10:01:51.267769+00	3	Airplane sunset	1		2	1
36	2014-12-02 10:04:35.205022+00	1	Chartering Flight	1		9	1
37	2014-12-02 10:05:03.263912+00	1	Chartering Flight	2	Changed conclusion.	9	1
38	2014-12-02 10:05:08.759247+00	1	Chartering Flight	2	No fields changed.	9	1
39	2014-12-02 10:09:37.224081+00	1	Chartering Flight	2	No fields changed.	9	1
40	2014-12-02 10:09:45.359464+00	1	Chartering Flight	2	No fields changed.	9	1
41	2014-12-02 10:17:31.095204+00	1	Chartering Flight	2	No fields changed.	9	1
42	2014-12-02 10:17:35.035115+00	1	Chartering Flight	2	No fields changed.	9	1
43	2014-12-02 10:19:41.589819+00	1	Chartering Flight	2	Changed image and conclusion.	9	1
44	2014-12-02 10:22:50.60867+00	2	About us	1		9	1
45	2014-12-02 10:36:55.800239+00	3	About us Second Article	1		9	1
46	2014-12-02 11:01:12.54809+00	2	davor	3		6	1
47	2014-12-02 11:01:39.554461+00	1	ozren1983	2	Changed password.	6	1
48	2014-12-02 11:03:56.335397+00	3	davor	1		6	1
49	2014-12-02 11:04:12.001333+00	3	davor	2	Changed is_staff and is_superuser.	6	1
50	2014-12-02 11:08:22.277647+00	4	ozren	1		6	1
51	2014-12-02 11:08:33.973847+00	5	damir	1		6	1
52	2014-12-02 11:08:49.106536+00	4	ozren	2	Changed is_staff and is_superuser.	6	1
53	2014-12-02 11:08:56.090116+00	5	damir	2	Changed is_staff and is_superuser.	6	1
54	2014-12-02 16:04:15.762256+00	6	alen	1		6	5
55	2014-12-02 16:04:21.910334+00	6	alen	2	Changed is_staff and is_superuser.	6	5
56	2014-12-10 14:45:18.874073+00	4	Guy	1		2	3
57	2014-12-10 14:45:27.136455+00	1	Chartering Flight	2	Changed image.	9	3
58	2014-12-10 14:47:26.378294+00	2	FLYING PRIVATELY	2	Changed image.	10	3
59	2014-12-10 14:47:37.805312+00	2	FLYING PRIVATELY	2	Changed image.	10	3
60	2014-12-10 14:47:51.918184+00	2	FLYING PRIVATELY	2	Changed image.	10	3
61	2015-01-15 15:48:31.304369+00	5	Turbo Prop Jet	1		2	1
62	2015-01-15 15:49:10.597253+00	6	Very Light Jet	1		2	1
63	2015-01-15 15:49:25.200609+00	7	Citation Ultra Outer	1		2	1
64	2015-01-15 15:49:42.992981+00	8	Citation Ultra Inner	1		2	1
65	2015-01-15 15:50:10.131393+00	9	Citation Ultra Layout	1		2	1
66	2015-01-15 15:50:36.995087+00	1	Very Light Jets	1		12	1
67	2015-01-15 15:50:55.046778+00	2	Turbo Prop Jets	1		12	1
68	2015-01-15 15:51:20.616445+00	1	Embraer Phenom 100	1		13	1
69	2015-01-15 15:52:11.655121+00	2	Citation Mustang	1		13	1
70	2015-01-15 15:52:30.94142+00	3	King Air 350	1		13	1
71	2015-01-15 15:52:47.058426+00	4	King Air 200	1		13	1
72	2015-01-15 15:53:01.097827+00	5	King Air 90	1		13	1
73	2015-01-15 15:53:47.966608+00	5	Charting Flights	2	Changed include_airplanes.	10	1
74	2015-01-15 15:54:54.970933+00	3	King Air 350	2	Changed passenger_seating, luggage_capacity, max_speed, max_range, takeoff_distance and max_altitude.	13	1
75	2015-01-16 12:30:11.86614+00	1	Chartering Flight	2	Changed node.	9	1
76	2015-01-16 12:30:46.400634+00	1	Chartering Flight	2	Changed node.	9	1
77	2015-01-16 12:31:58.323474+00	4	Chartering Flights	1		9	1
78	2015-01-16 12:32:19.051744+00	1	Flying privately	2	Changed title.	9	1
79	2015-03-09 10:18:52.917556+00	1	Flying privately	2	Changed body.	9	1
80	2015-03-09 10:25:14.628475+00	7	carl	1		6	1
81	2015-03-09 10:25:27.747958+00	7	carl	2	Changed is_staff.	6	1
82	2015-03-09 10:26:29.18871+00	7	carl	2	Changed is_superuser.	6	1
83	2015-03-09 10:42:13.041466+00	14	Legal	1		10	1
84	2015-03-09 10:45:19.233822+00	5	Legal	1		9	1
85	2015-03-09 10:46:52.037964+00	14	Legal	2	Changed visible.	10	1
86	2015-03-10 16:26:27.443157+00	2	Turbo Props	2	Changed title.	12	7
87	2015-03-10 16:26:39.066505+00	2	Turbo Props	2	No fields changed.	12	7
88	2015-03-10 16:27:59.870127+00	3	Heavy Jets	1		12	7
89	2015-03-10 16:29:24.194094+00	3	Turbo Props	2	Changed title.	12	7
90	2015-03-10 16:29:35.429603+00	2	Very Light Jets	2	Changed title.	12	7
91	2015-03-10 16:29:44.137395+00	1	Light Jets	2	Changed title.	12	7
92	2015-03-10 16:31:09.703838+00	4	Mid Jets	1		12	7
93	2015-03-10 16:33:03.937333+00	5	Super Mid Jets	1		12	7
94	2015-03-10 16:34:34.205659+00	5	Super Mid Jets	2	No fields changed.	12	7
95	2015-03-11 06:53:13.504669+00	6	Heavy Jets	1		12	7
96	2015-03-11 06:54:09.927028+00	5	Bombardier Global 5000	2	Changed category and title.	13	7
97	2015-03-11 09:16:22.735496+00	6	Heavy Jets	2	Changed lead.	12	7
98	2015-03-11 09:22:21.338781+00	10	Bombardier Global 5000	1		2	7
99	2015-03-11 09:22:26.858781+00	5	Bombardier Global 5000	2	Changed outer_image.	13	7
100	2015-03-11 09:23:45.142795+00	11	Global 5000 interior	1		2	7
101	2015-03-11 09:23:58.375709+00	5	Bombardier Global 5000	2	Changed inner_image and layout_image.	13	7
102	2015-03-11 09:30:42.684469+00	12	Dassault Falcon 7X	1		2	7
103	2015-03-11 09:33:26.707981+00	6	Heavy Jets	2	Changed image.	12	7
104	2015-03-11 09:39:57.997185+00	13	Bombardier Challenger 300	1		2	7
105	2015-03-11 09:40:01.296649+00	5	Super Mid Jets	2	Changed image.	12	7
106	2015-03-11 09:40:38.408593+00	5	Super Mid Jets	2	No fields changed.	12	7
107	2015-03-11 09:43:20.021743+00	14	Bombardier Challenger 300 interior	1		2	7
108	2015-03-11 09:43:30.627246+00	6	Bombardier Challenger 300	1		13	7
109	2015-03-11 09:52:12.723463+00	15	Cessna Citation Excel/XLS	1		2	7
110	2015-03-11 09:52:16.82853+00	4	Mid Jets	2	Changed image.	12	7
111	2015-03-11 10:57:02.918993+00	16	Hawker 900 XP exterior	1		2	7
112	2015-03-11 10:57:25.219113+00	6	Bombardier Challenger 300	2	No fields changed.	13	7
113	2015-03-11 10:59:16.949266+00	17	Hawker 900 XP interior	1		2	7
114	2015-03-11 10:59:23.741401+00	7	Hawker 900 XP	1		13	7
115	2015-03-11 11:01:04.544646+00	7	Hawker 900 XP	2	Changed category.	13	7
116	2015-03-11 11:02:34.254253+00	7	Hawker 900 XP	2	No fields changed.	13	7
117	2015-03-11 11:03:44.949053+00	18	Bombardier Learjet 60 XR exterior	1		2	7
118	2015-03-11 11:04:36.397526+00	19	Bombardier Learjet 60 XR interior	1		2	7
119	2015-03-11 11:04:56.568657+00	8	Bmbardier Learjet 60 XR	1		13	7
120	2015-03-11 11:07:55.48546+00	20	Cessna Citation Excel/XLS	1		2	7
121	2015-03-11 11:08:42.190234+00	21	Cessna Citation Excel/XLS interior	1		2	7
122	2015-03-11 11:08:50.817764+00	9	Cessna Citation Excel/XLS	1		13	7
123	2015-03-11 11:10:04.143399+00	22	Cessna Citation Sovereign	1		2	7
124	2015-03-11 11:11:21.175638+00	23	Cessna Citation Sovereign interior	1		2	7
125	2015-03-11 11:11:30.986194+00	10	Cessna Citation Sovereign	1		13	7
126	2015-03-11 11:13:35.241949+00	4	Mid Jets	2	Changed lead.	12	7
127	2015-03-11 11:18:21.798166+00	24	Cessna Citation Mustang	1		2	7
128	2015-03-11 11:18:58.565109+00	2	Very Light Jets	2	Changed lead and image.	12	7
129	2015-03-11 11:39:22.902886+00	25	Cessna Citation Mustang exterior	1		2	7
130	2015-03-11 11:40:20.665751+00	26	Cessna Citation Mustang interior	1		2	7
131	2015-03-11 11:40:27.080128+00	11	Cessna Citation Mustang	1		13	7
132	2015-03-11 11:41:35.608309+00	27	Embraer Phenom 100 exterior	1		2	7
133	2015-03-11 11:42:14.340617+00	28	Embraer Phenom 100 interior	1		2	7
134	2015-03-11 11:42:22.476971+00	12	Embraer Phenom 100	1		13	7
135	2015-03-11 11:44:27.855933+00	4	King Air 200	2	Changed category, outer_image and inner_image.	13	7
136	2015-03-11 11:44:51.37507+00	3	Turbo Props	2	No fields changed.	12	7
137	2015-03-11 11:46:17.948271+00	3	King Air 350	2	Changed category.	13	7
138	2015-03-11 11:52:49.423794+00	29	Phenom 100 floor plan	1		2	7
139	2015-03-11 11:58:42.893944+00	30	Phenom 100 floor plan	1		2	7
140	2015-03-11 11:59:46.090662+00	12	Embraer Phenom 100	2	Changed layout_image.	13	7
141	2015-03-11 12:01:36.833515+00	31	Cessna Citation Mustang floor plan	1		2	7
142	2015-03-11 12:01:37.735194+00	11	Cessna Citation Mustang	2	Changed layout_image.	13	7
143	2015-03-11 12:07:42.464865+00	12	Embraer Phenom 100	2	Changed passenger_seating, luggage_capacity, max_speed, max_range, takeoff_distance and max_altitude.	13	7
144	2015-03-11 12:08:41.332326+00	12	Embraer Phenom 100	2	Changed passenger_seating.	13	7
145	2015-03-11 13:00:55.820748+00	11	Cessna Citation Mustang	2	Changed passenger_seating, luggage_capacity, max_speed, max_range, takeoff_distance and max_altitude.	13	7
146	2015-03-11 13:02:27.254508+00	1	Embraer Phenom 100	3		13	7
147	2015-03-11 13:04:17.609111+00	12	Embraer Phenom 100	2	Changed passenger_seating, luggage_capacity, max_speed, max_range and takeoff_distance.	13	7
148	2015-03-11 13:09:20.79293+00	4	A guide to flying privately	2	Changed title, lead and body.	9	7
149	2015-03-11 13:12:04.999909+00	4	A guide to flying privately	2	Changed body.	9	7
150	2015-03-11 13:14:16.412691+00	5	A Guide to Flying Privately	2	Changed name.	10	7
151	2015-03-11 13:17:12.784954+00	5	A GUIDE TO FLYING PRIVATELY	2	Changed name.	10	7
152	2015-03-11 13:28:32.728539+00	32	Cessna Citation sovereign floor plan	1		2	7
153	2015-03-11 13:28:33.893127+00	10	Cessna Citation Sovereign	2	Changed layout_image.	13	7
154	2015-03-11 13:31:54.903235+00	10	Cessna Citation Sovereign	2	Changed passenger_seating, luggage_capacity, max_speed, max_range, takeoff_distance and max_altitude.	13	7
155	2015-03-11 13:35:47.207852+00	33	Cessna Citation Excel/XLS floor plan	1		2	7
156	2015-03-11 13:35:48.242385+00	9	Cessna Citation Excel/XLS	2	Changed layout_image, passenger_seating, luggage_capacity, max_speed, max_range, takeoff_distance and max_altitude.	13	7
157	2015-03-11 13:37:48.62229+00	34	Bombardier Learjet 60 XR floor plan	1		2	7
158	2015-03-11 13:37:49.536299+00	8	Bmbardier Learjet 60 XR	2	Changed layout_image.	13	7
159	2015-03-11 13:39:56.117953+00	8	Bmbardier Learjet 60 XR	2	Changed passenger_seating, luggage_capacity, max_speed, max_range, takeoff_distance and max_altitude.	13	7
160	2015-03-11 13:40:50.313778+00	8	Bmbardier Learjet 60 XR	2	Changed passenger_seating.	13	7
161	2015-03-11 13:42:19.056821+00	35	Hawker 900 XP floor plan	1		2	7
162	2015-03-11 13:42:21.556065+00	7	Hawker 900 XP	2	Changed layout_image and passenger_seating.	13	7
163	2015-03-11 13:44:04.317381+00	7	Hawker 900 XP	2	Changed luggage_capacity, max_speed, max_range, takeoff_distance and max_altitude.	13	7
164	2015-03-11 13:45:16.367949+00	7	Hawker 900 XP	2	Changed passenger_seating.	13	7
165	2015-03-11 13:48:57.951755+00	36	Bombardier Challenger 300 floor plan	1		2	7
166	2015-03-11 13:49:22.694978+00	6	Bombardier Challenger 300	2	Changed layout_image, passenger_seating, luggage_capacity, max_speed, max_range, takeoff_distance and max_altitude.	13	7
167	2015-03-11 13:50:34.435527+00	37	Cessna Citation X exterior	1		2	7
168	2015-03-11 13:51:04.712143+00	38	Cessna Citation X interior	1		2	7
169	2015-03-11 13:51:57.302938+00	39	Cessna Citation X floor plan	1		2	7
170	2015-03-11 13:53:43.951738+00	13	Cessna Citation X	1		13	7
171	2015-03-11 13:55:46.240958+00	40	Embraer Legacy 600 exterior	1		2	7
172	2015-03-11 13:56:30.077688+00	41	Embaer Legacy 600 interior	1		2	7
173	2015-03-11 13:57:17.629801+00	42	Embraer Legacy 600 floor plan	1		2	7
174	2015-03-11 13:58:58.231618+00	14	Embraer Legacy 600	1		13	7
175	2015-03-11 14:01:46.483957+00	43	Gulfstream G280 exterior	1		2	7
176	2015-03-11 14:02:28.419784+00	44	Gulfstream G280 interior	1		2	7
177	2015-03-11 14:03:13.98004+00	45	Gulfstream G280 floor plan	1		2	7
178	2015-03-11 14:17:24.64261+00	15	Gulfstream G280	1		13	7
179	2015-03-11 14:18:14.405082+00	15	Gulfstream G280	2	No fields changed.	13	7
180	2015-03-11 14:23:38.931574+00	46	Bombardier Challenger 605 exterior	1		2	7
181	2015-03-11 14:24:13.671059+00	47	Bombardier Challenger 605 interior	1		2	7
182	2015-03-11 14:25:14.850321+00	48	Bombardier Challenger 605 floor plan	1		2	7
183	2015-03-11 14:26:50.344708+00	16	Bombardier Challenger 605	1		13	7
184	2015-03-11 14:29:43.489471+00	49	Bombardier Global 5000 floor plan	1		2	7
185	2015-03-11 14:31:16.983299+00	5	Bombardier Global 5000	2	Changed layout_image, passenger_seating, luggage_capacity, max_speed, max_range, takeoff_distance and max_altitude.	13	7
186	2015-03-11 14:32:55.501742+00	16	Bombardier Challenger 605	2	No fields changed.	13	7
187	2015-03-11 14:35:01.616631+00	50	Dassault Falcon 7X	1		2	7
188	2015-03-11 14:36:18.496327+00	51	Dassault Falcon 7X exterior	1		2	7
189	2015-03-11 14:37:30.441659+00	52	Dassault Falcon 900LX exterior	1		2	7
190	2015-03-11 14:40:08.458638+00	53	Dassault Falcon 900LX interior	1		2	7
191	2015-03-11 14:43:11.20454+00	54	Dassault Falcon 900LX floor plan	1		2	7
192	2015-03-11 14:43:16.993189+00	17	Dassault Falcon 900LX	1		13	7
193	2015-03-11 14:56:41.82659+00	17	Dassault Falcon 900LX	2	Changed passenger_seating, luggage_capacity, max_speed, max_range, takeoff_distance and max_altitude.	13	7
194	2015-03-11 15:03:18.846467+00	55	Dassault Falcon 7X exterior	1		2	7
195	2015-03-11 15:04:01.201881+00	56	Dassault Falcon 7X interior	1		2	7
196	2015-03-11 15:05:12.151953+00	57	Dassault Falcon 7X floor plan	1		2	7
197	2015-03-11 15:06:48.543118+00	18	Dassault Falcon 7X	1		13	7
198	2015-03-11 15:08:41.30961+00	58	Gulfstream G550 exterior	1		2	7
199	2015-03-11 15:09:15.541455+00	59	Gulfsream G550 interior	1		2	7
200	2015-03-11 15:10:03.957252+00	60	Gulfstream G500 floor plan	1		2	7
201	2015-03-11 15:11:38.856175+00	19	Gulfstream G550	1		13	7
202	2015-03-11 15:13:04.137666+00	6	Heavy Jets	2	Changed lead.	12	7
203	2015-03-11 15:15:26.958011+00	61	Cessna Citation CJ1	1		2	7
204	2015-03-11 15:15:46.219458+00	1	Light Jets	2	Changed lead and image.	12	7
205	2015-03-11 15:18:35.810241+00	61	Cessna Citation CJ1	2	Changed caption.	2	7
206	2015-03-11 15:18:41.543164+00	61	Cessna Citation CJ1	2	No fields changed.	2	7
207	2015-03-11 15:18:52.449815+00	61	Cessna Citation CJ2	2	Changed title.	2	7
208	2015-03-11 15:21:03.020521+00	62	Cessna Citation CJ2 exterior	1		2	7
209	2015-03-11 15:21:44.233709+00	63	Cessna Citation CJ2 interior	1		2	7
210	2015-03-11 15:22:21.988509+00	64	Cessna Citation CJ2 floor plan	1		2	7
211	2015-03-11 15:23:47.325946+00	20	Cessna Citation CJ2	1		13	7
212	2015-03-11 15:24:29.35117+00	20	Cessna Citation CJ2	2	Changed passenger_seating.	13	7
213	2015-03-11 15:25:24.235537+00	2	Citation Mustang	3		13	7
214	2015-03-11 15:26:53.862725+00	65	Cessna Citation CJ3 exterior	1		2	7
215	2015-03-11 15:27:42.243784+00	66	Cessna Citation CJ3 interior	1		2	7
216	2015-03-11 15:28:32.111125+00	67	Cessna Citation CJ3 floor plan	1		2	7
217	2015-03-11 15:29:54.944881+00	21	Cessna Citation CJ3	1		13	7
218	2015-03-11 15:32:16.556572+00	21	Cessna Citation CJ3	2	Changed passenger_seating.	13	7
219	2015-03-11 15:34:39.295017+00	68	Beechcraft IA Premier exterior	1		2	7
220	2015-03-11 15:35:07.539446+00	69	Beechcraft IA Premier interior	1		2	7
221	2015-03-11 15:36:58.951604+00	70	Beechcraft  IA Premier floor plan	1		2	7
222	2015-03-11 15:38:30.433981+00	22	Beechcraft IA Premier	1		13	7
223	2015-03-11 15:42:57.40799+00	71	Bombardier Learjet 40 XR exterior	1		2	7
224	2015-03-11 15:48:09.187069+00	72	Bombardier Learjet 40 XR interior	1		2	7
225	2015-03-11 15:49:25.859602+00	73	Bombardier Learjet 40 XR floor plan	1		2	7
226	2015-03-11 15:52:40.04397+00	23	Bombardier Learjet 40 XR	1		13	7
227	2015-03-11 16:34:00.525022+00	74	Unique booking platform	1		2	7
228	2015-03-11 16:34:33.566998+00	3	Unique booking platform	2	Changed title, body and image.	1	7
229	2015-03-11 16:36:35.008267+00	75	Unique booking platform	1		2	7
230	2015-03-11 16:36:36.382631+00	3	Unique booking platform	2	Changed image.	1	7
231	2015-03-11 16:37:21.16512+00	3	Unique booking platform	2	No fields changed.	1	7
232	2015-03-11 16:39:19.782525+00	4	Selected Operators	2	No fields changed.	1	7
233	2015-03-11 16:41:09.215814+00	76	Personalized service	1		2	7
234	2015-03-11 16:41:10.646995+00	4	Personalized service	2	Changed title, body and image.	1	7
235	2015-03-11 16:43:17.177654+00	77	Director pricing	1		2	7
236	2015-03-11 16:43:18.705744+00	5	Direct pricing	2	Changed title, body and image.	1	7
237	2015-03-11 16:47:12.129528+00	78	Low booking fees	1		2	7
238	2015-03-11 16:47:21.250156+00	7	Low booking fees	2	Changed title, body and image.	1	7
239	2015-03-11 16:49:10.763493+00	79	Information at your fingertips	1		2	7
240	2015-03-11 16:49:29.459259+00	8	Information at your fingertips	2	Changed title, body and image.	1	7
241	2015-03-11 16:52:02.855577+00	80	Empty leg market-place	1		2	7
242	2015-03-11 16:52:08.955075+00	9	Empty leg market-place	2	Changed title, body and image.	1	7
243	2015-03-11 16:53:34.040463+00	9	Empty leg market-place	2	No fields changed.	1	7
244	2015-03-11 16:58:02.941727+00	3	Unique booking platform	2	No fields changed.	1	7
245	2015-03-11 16:58:09.401468+00	3	Unique booking platform	2	No fields changed.	1	7
246	2015-03-11 16:58:28.779192+00	8	Information at your fingertips	2	No fields changed.	1	7
247	2015-03-12 08:44:48.677365+00	5	A guide to flying privately	2	Changed name.	10	7
248	2015-03-12 08:56:26.689173+00	7	Quoting System	2	Changed include_airplanes.	10	7
249	2015-03-12 08:57:05.52871+00	7	Quoting System	2	Changed visible and include_airplanes.	10	7
250	2015-03-12 08:57:30.642141+00	7	Quoting System	2	Changed visible.	10	7
251	2015-03-12 08:59:57.242593+00	7	Quoting System	2	No fields changed.	10	7
252	2015-03-12 09:04:34.805891+00	7	A Quoting System	2	Changed name.	10	7
253	2015-03-12 09:06:47.956567+00	7	A unique quoting sysem	2	Changed name.	10	7
254	2015-03-12 09:10:17.595903+00	8	A background of quality service	2	Changed name.	10	7
255	2015-03-12 09:11:26.857492+00	15	Quoting	1		10	7
256	2015-03-12 09:14:20.449604+00	15	Our pricing 	2	Changed name.	10	7
257	2015-03-12 09:16:04.433827+00	6	Empty legs	2	Changed name.	10	7
258	2015-03-12 09:16:40.932487+00	16	Safety	1		10	7
259	2015-03-12 09:21:40.204748+00	12	Pricing	3		10	7
260	2015-03-12 09:21:58.584174+00	9	The Ascent Jet team	2	Changed name.	10	7
261	2015-03-12 09:23:30.175514+00	9	The Ascent Jet team	2	No fields changed.	10	7
262	2015-03-12 09:24:03.723365+00	14	Legal	2	Changed parent.	10	7
263	2015-03-12 09:25:24.699303+00	14	Legal	2	Changed parent.	10	7
264	2015-03-12 09:27:35.321633+00	3	About us	1		11	7
265	2015-03-12 09:27:41.855756+00	6	Empty legs	2	No fields changed.	10	7
266	2015-03-12 09:29:06.077372+00	8	A background of quality service	2	Changed footer_group and footer_group_order.	10	7
267	2015-03-12 09:29:16.215421+00	15	Our pricing 	2	Changed footer_group.	10	7
268	2015-03-12 09:29:23.455606+00	16	Safety	2	Changed footer_group.	10	7
269	2015-03-12 09:32:35.870616+00	14	Legal	2	Changed parent.	10	7
270	2015-03-12 09:33:28.600095+00	14	Legal	2	Changed parent.	10	7
271	2015-03-12 09:35:37.463766+00	9	The Ascent Jet team	2	Changed footer_group.	10	7
272	2015-03-12 09:36:48.57491+00	10	Press	2	Changed order, footer_group and footer_group_order.	10	7
273	2015-03-12 09:37:33.47698+00	10	News	2	Changed name.	10	7
274	2015-03-12 09:38:14.650268+00	13	Contact	2	Changed order, footer_group and footer_group_order.	10	7
275	2015-03-12 09:39:18.172976+00	14	Legal	2	No fields changed.	10	7
276	2015-03-12 09:56:59.040728+00	4	Mid Jets	2	Changed order.	12	1
277	2015-03-12 09:57:11.176199+00	4	Mid Jets	2	Changed hidden.	12	1
278	2015-03-12 09:57:13.765297+00	4	Mid Jets	2	No fields changed.	12	1
279	2015-03-12 09:57:27.98389+00	4	Mid Jets	2	Changed order and hidden.	12	1
280	2015-03-12 10:26:23.178694+00	6	Heavy Jets	2	Changed lead.	12	1
281	2015-03-12 10:28:42.520979+00	6	Heavy Jets	2	Changed lead.	12	1
282	2015-03-12 12:15:40.983702+00	6	Empty legs	1		9	7
283	2015-03-12 12:21:36.356012+00	6	Empty legs	2	Changed lead and body.	9	7
284	2015-03-12 12:24:19.923993+00	1	Flying privately	2	Changed lead.	9	7
285	2015-03-12 12:27:01.942195+00	1	Flying privately	2	Changed body.	9	7
286	2015-03-12 12:29:21.661631+00	1	Flying privately	2	Changed body.	9	7
287	2015-03-12 13:54:39.792432+00	4	A guide to flying privately	2	Changed body.	9	7
288	2015-03-12 14:01:59.091569+00	4	A guide to flying privately	2	Changed lead and body.	9	7
289	2015-03-12 14:03:21.274015+00	4	A guide to flying privately	2	Changed lead and body.	9	7
290	2015-03-12 14:04:29.15322+00	4	A guide to flying privately	2	Changed lead.	9	7
291	2015-03-12 14:07:05.946666+00	1	Flying privately	2	Changed lead and body.	9	7
292	2015-03-12 14:08:14.818501+00	1	Flying privately	2	Changed body.	9	7
293	2015-03-12 14:12:59.065445+00	4	A guide to flying privately	2	Changed lead.	9	7
294	2015-03-12 14:17:40.116255+00	6	Empty legs	2	Changed lead and body.	9	7
295	2015-03-12 14:28:36.086635+00	1	Flying privately	2	Changed conclusion.	9	7
296	2015-03-12 14:42:40.161852+00	3	About us Second Article	3		9	7
297	2015-03-12 14:47:26.825499+00	2	About us	2	Changed lead and body.	9	7
298	2015-03-12 14:49:16.567427+00	2	About us	2	Changed image and conclusion.	9	7
299	2015-03-12 14:52:48.3265+00	4	A guide to flying privately	2	Changed body.	9	7
300	2015-03-12 15:00:47.676653+00	2	About us	2	Changed conclusion.	9	7
301	2015-03-12 15:01:30.651903+00	1	Flying privately	2	Changed conclusion.	9	7
302	2015-03-12 15:04:05.19305+00	1	Flying privately	2	Changed conclusion.	9	7
303	2015-03-12 15:06:27.983+00	2	About us	2	Changed conclusion.	9	7
304	2015-03-12 15:09:10.9876+00	6	Empty legs	2	Changed body.	9	7
305	2015-03-12 15:14:37.954615+00	4	A guide to flying privately	2	Changed lead.	9	7
306	2015-03-12 15:15:50.300918+00	4	A guide to flying privately	2	Changed lead.	9	7
307	2015-03-12 15:56:56.194315+00	3	Turbo Props	2	Changed lead and hidden.	12	7
308	2015-03-12 15:57:07.779359+00	1	Light Jets	2	Changed lead and order.	12	7
309	2015-03-12 15:57:16.050469+00	4	Mid Jets	2	Changed lead and order.	12	7
310	2015-03-12 15:57:26.861287+00	5	Super Mid Jets	2	Changed lead and order.	12	7
311	2015-03-12 15:57:39.415709+00	6	Heavy Jets	2	Changed order.	12	7
312	2015-03-12 17:12:08.035042+00	7	Why Ascent Jet	1		9	7
313	2015-03-12 17:33:21.034169+00	7	Why Ascent Jet	2	Changed body.	9	7
314	2015-03-12 17:35:21.193684+00	8	A background of quality	2	Changed name.	10	7
315	2015-03-12 17:36:27.170708+00	7	Our unique quoting sysem	2	Changed name.	10	7
316	2015-03-12 17:36:39.429246+00	8	A background of quality	3		10	7
317	2015-03-12 20:29:17.238034+00	7	Why Ascent Jet	2	Changed body, image and conclusion.	9	7
318	2015-03-12 20:31:34.188303+00	7	Why Ascent Jet	2	Changed image.	9	7
319	2015-03-12 20:33:03.623397+00	7	Why Ascent Jet	2	Changed image.	9	7
320	2015-03-13 09:10:34.664583+00	7	Why Ascent Jet	2	Changed conclusion.	9	7
321	2015-03-13 09:14:52.8006+00	8	Our unique quoting system	1		9	7
322	2015-03-13 09:19:02.033823+00	8	Our unique quoting system	2	Changed node.	9	7
323	2015-03-13 09:19:44.928916+00	9	Our pricing	1		9	7
324	2015-03-13 09:20:35.686796+00	10	Safety	1		9	7
325	2015-03-13 14:59:32.537381+00	10	Safety	2	Changed lead, body and conclusion.	9	7
326	2015-03-13 15:01:26.079449+00	10	Safety	2	Changed body and conclusion.	9	7
327	2015-03-13 15:02:11.385224+00	10	Safety	2	Changed body.	9	7
328	2015-03-13 15:06:58.664611+00	15	Pricing and payment	2	Changed name.	10	7
329	2015-03-13 15:21:29.584387+00	8	Our unique quoting system	2	No fields changed.	9	7
330	2015-03-13 15:42:50.953409+00	8	Our unique quoting system	2	Changed lead.	9	7
331	2015-03-13 15:50:23.147949+00	8	Our unique quoting system	2	Changed body.	9	7
332	2015-03-13 17:33:29.805967+00	81	Maintenance aero engine	1		2	7
333	2015-03-13 17:33:44.302651+00	10	Safety	2	Changed image.	9	7
334	2015-03-13 17:35:02.981346+00	10	Safety	2	Changed body and conclusion.	9	7
335	2015-03-13 17:42:42.614303+00	10	Safety	2	Changed body, image and conclusion.	9	7
336	2015-03-14 09:23:09.870769+00	7	Our unique booking sysem	2	Changed name.	10	7
337	2015-03-14 09:25:52.574305+00	8	Our unique booking g system	2	Changed title.	9	7
338	2015-03-14 09:26:04.488976+00	8	Our unique booking system	2	Changed title.	9	7
339	2015-03-14 09:54:09.109119+00	8	Our unique booking system	2	Changed body.	9	7
340	2015-03-14 09:55:40.164031+00	8	Our unique booking system	2	Changed body.	9	7
341	2015-03-14 10:00:31.741365+00	8	Our unique booking system	2	Changed body.	9	7
342	2015-03-14 10:07:04.067875+00	8	Our unique booking system	2	Changed body.	9	7
343	2015-03-14 10:07:57.16187+00	7	Our unique booking system	2	Changed name.	10	7
344	2015-03-14 10:09:09.47149+00	8	Our unique booking system	2	Changed body.	9	7
345	2015-03-14 14:53:45.89084+00	9	Our pricing and payment	2	Changed title.	9	7
346	2015-03-14 14:54:13.738188+00	9	Pricng and payment	2	Changed title.	9	7
347	2015-03-14 15:02:57.175369+00	9	Pricing and payment	2	Changed title.	9	7
348	2015-03-14 15:09:59.52949+00	11	The Ascent Jet Team	1		9	7
349	2015-03-14 15:12:51.924148+00	12	News	1		9	7
350	2015-03-14 15:18:10.404894+00	13	Contact	1		9	7
351	2015-03-14 15:24:23.55696+00	13	Contact	2	Changed body.	9	7
352	2015-03-14 15:29:37.731505+00	13	Contact	2	Changed body.	9	7
353	2015-03-14 15:40:07.307611+00	13	Contact	2	Changed body.	9	7
354	2015-03-14 15:41:59.602029+00	13	Contact	2	Changed body.	9	7
355	2015-03-14 15:42:57.030787+00	13	Contact	2	Changed body.	9	7
356	2015-03-14 15:44:58.047692+00	13	Contact	2	Changed body.	9	7
357	2015-03-14 15:45:44.095076+00	13	Contact	2	Changed body.	9	7
358	2015-03-14 15:48:59.44074+00	13	Contact	2	Changed lead and body.	9	7
359	2015-03-14 15:49:43.144942+00	13	Contact	2	Changed body.	9	7
360	2015-03-14 15:50:30.489775+00	13	Contact	2	Changed lead.	9	7
361	2015-03-14 16:17:36.516686+00	14	Legal	2	Changed parent.	10	7
362	2015-03-14 16:17:46.523818+00	14	LEGAL	2	Changed name.	10	7
363	2015-03-14 16:18:49.164379+00	14	General Terms and Conditions	1		9	7
364	2015-03-14 16:19:44.431443+00	15	Privacy Policy	1		9	7
365	2015-03-14 16:20:18.886404+00	16	Cookies policy	1		9	7
366	2015-03-14 16:21:55.143774+00	5	Legal	3		9	7
367	2015-03-14 16:22:00.820705+00	1	GET A QUOTE	2	No fields changed.	10	7
368	2015-03-14 16:25:11.016991+00	17	General Terms and conditions	1		10	7
369	2015-03-14 16:25:34.232462+00	14	General Terms and Conditions	2	Changed node.	9	7
370	2015-03-14 16:30:36.588802+00	18	Privacy policy	1		10	7
371	2015-03-14 16:30:41.797427+00	18	Privacy policy	2	No fields changed.	10	7
372	2015-03-14 16:31:26.258378+00	19	Cookies policy	1		10	7
373	2015-03-14 16:32:49.51107+00	17	General Terms and conditions	2	No fields changed.	10	7
374	2015-03-14 16:32:59.145032+00	18	Privacy policy	2	Changed order.	10	7
375	2015-03-14 16:33:05.106868+00	18	Privacy policy	2	Changed order.	10	7
376	2015-03-14 16:34:20.794011+00	19	Cookies policy	2	Changed order.	10	7
377	2015-03-14 16:35:20.330926+00	14	LEGAL	2	No fields changed.	10	7
378	2015-03-14 16:36:00.344381+00	14	General Terms and Conditions	2	Changed node.	9	7
379	2015-03-14 16:37:45.669734+00	17	General Terms and conditions	2	No fields changed.	10	7
380	2015-03-14 17:48:26.831662+00	3	Unique booking platform	2	Changed icon.	1	3
381	2015-03-14 17:48:37.614354+00	4	Personalized service	2	Changed icon.	1	3
382	2015-03-14 17:48:47.742905+00	5	Direct pricing	2	Changed icon.	1	3
383	2015-03-14 17:48:59.325132+00	7	Low booking fees	2	Changed icon.	1	3
384	2015-03-14 17:49:11.510883+00	8	Information at your fingertips	2	Changed icon.	1	3
385	2015-03-14 17:49:21.436634+00	9	Empty leg market-place	2	Changed icon.	1	3
386	2015-03-16 08:39:28.627407+00	14	LEGAL	2	Changed visible.	10	1
387	2015-03-16 08:39:56.199152+00	14	General Terms and Conditions	2	Changed lead and body.	9	7
388	2015-03-16 08:41:09.676023+00	14	General Terms and Conditions	2	No fields changed.	9	7
389	2015-03-16 08:43:15.575645+00	14	General Terms and Conditions	2	No fields changed.	9	7
390	2015-03-16 08:44:18.419565+00	14	General Terms and Conditions	2	Changed body.	9	7
391	2015-03-16 08:45:14.812191+00	14	General Terms and Conditions	2	Changed body.	9	7
392	2015-03-16 08:45:57.498769+00	14	General Terms and Conditions	2	Changed body.	9	7
393	2015-03-16 08:50:20.783368+00	14	General Terms and Conditions	2	Changed body.	9	7
394	2015-03-16 08:57:09.184281+00	5	damir	2	Changed password.	6	1
395	2015-03-16 09:05:59.057036+00	16	Cookies policy	2	Changed lead and body.	9	7
396	2015-03-16 09:19:47.736063+00	15	Privacy Policy	2	Changed lead and body.	9	7
397	2015-03-16 09:31:00.697141+00	15	Privacy Policy	2	Changed body.	9	7
398	2015-03-16 09:31:46.733416+00	16	Cookies policy	2	Changed lead.	9	7
399	2015-03-16 09:32:20.995696+00	15	Privacy Policy	2	Changed lead.	9	7
400	2015-03-16 09:34:01.715487+00	9	Pricing and payment	2	Changed lead and body.	9	7
401	2015-03-16 09:35:30.356365+00	16	Cookies policy	2	Changed node.	9	7
402	2015-03-16 09:35:39.168535+00	15	Privacy Policy	2	Changed node.	9	7
403	2015-03-16 09:35:50.16998+00	14	General Terms and Conditions	2	Changed node.	9	7
404	2015-03-16 09:37:48.202213+00	7	Why Ascent Jet	2	Changed conclusion.	9	7
405	2015-03-16 09:48:52.526715+00	17	Ascent Jet SA terms of use and consumer protection	1		9	7
406	2015-03-16 10:02:43.604519+00	17	Ascent Jet SA General Terms or Use 	2	Changed title, lead and body.	9	7
407	2015-03-16 10:05:07.687903+00	17	Ascent Jet SA General Terms or Use 	2	Changed lead.	9	7
408	2015-03-16 10:11:21.283215+00	82	front_page_benefits_photo	1		2	6
409	2015-03-16 10:11:25.156375+00	7	Why Ascent Jet	2	Changed image.	9	6
410	2015-03-16 11:47:56.238013+00	16	Cookies policy	2	No fields changed.	9	7
411	2015-03-16 14:25:30.128158+00	14	LEGAL	2	Changed visible.	10	1
412	2015-03-16 14:26:27.446332+00	17	General Terms and conditions	2	No fields changed.	10	1
413	2015-03-16 14:26:37.396125+00	19	Cookies policy	2	No fields changed.	10	1
414	2015-03-16 14:26:43.146463+00	18	Privacy policy	2	No fields changed.	10	1
415	2015-03-16 14:47:23.774526+00	7	Why Ascent Jet	2	Changed node.	9	7
416	2015-03-16 15:00:48.840391+00	15	Privacy Policy	2	Changed body.	9	7
417	2015-03-16 15:20:17.332958+00	14	Terms and Conditions	2	Changed title.	9	7
418	2015-03-16 15:25:30.244408+00	17	Introduction	2	Changed title and lead.	9	7
419	2015-03-16 15:25:58.331139+00	14	Terms and Conditions	2	No fields changed.	9	7
420	2015-03-16 15:26:55.196711+00	14	General Terms and Conditions	2	Changed title.	9	7
421	2015-03-16 15:27:08.973339+00	17	Terms and conditions	2	Changed name.	10	7
422	2015-03-16 15:28:18.74028+00	20	Introduction	1		10	7
423	2015-03-16 15:28:35.421897+00	17	Terms and conditions	2	Changed order.	10	7
424	2015-03-16 15:28:44.638562+00	17	Terms and conditions	2	Changed order.	10	7
425	2015-03-16 15:28:51.481975+00	17	Terms and conditions	2	Changed order.	10	7
426	2015-03-16 15:30:39.640953+00	17	Introduction	2	Changed node.	9	7
427	2015-03-16 15:33:46.922616+00	7	Why Ascent Jet	2	Changed node.	9	7
428	2015-03-16 15:34:25.53426+00	7	The Ascent Jet Difference	2	Changed title.	9	7
429	2015-03-16 15:34:51.018984+00	21	The Ascent Jet Difference	1		10	7
430	2015-03-16 15:38:17.628491+00	7	The Ascent Jet Difference	2	No fields changed.	9	7
431	2015-03-16 15:38:41.765125+00	8	Our unique booking system	2	Changed order.	9	7
432	2015-03-16 15:39:04.882585+00	7	The Ascent Jet Difference	2	Changed node.	9	7
433	2015-03-16 15:40:03.056992+00	21	The Ascent Jet Difference	2	No fields changed.	10	7
434	2015-03-16 15:40:11.689616+00	21	The Ascent Jet Difference	2	Changed order.	10	7
435	2015-03-16 15:41:20.530391+00	7	Our unique booking system	2	Changed order.	10	7
436	2015-03-16 15:41:28.948981+00	21	The Ascent Jet Difference	2	Changed order.	10	7
437	2015-03-16 15:42:45.236418+00	7	The Ascent Jet Difference	2	Changed node.	9	7
438	2015-03-16 15:45:34.764157+00	7	The Ascent Jet Difference	2	Changed node.	9	7
439	2015-03-16 15:51:07.779309+00	22	Company Information	1		10	7
440	2015-03-16 15:51:16.783199+00	9	The Ascent Jet team	2	Changed order.	10	7
441	2015-03-16 15:51:24.334998+00	10	News	2	Changed order.	10	7
442	2015-03-16 15:51:29.518072+00	13	Contact	2	No fields changed.	10	7
443	2015-03-16 15:52:32.536783+00	2	Ascent Jet SA - The Company	2	Changed title, image and node.	9	7
444	2015-03-16 15:58:05.691962+00	1	The basics	2	Changed title.	9	7
445	2015-03-16 15:58:43.577033+00	23	The basics	1		10	7
446	2015-03-16 15:58:55.312228+00	5	A guide to flying privately	2	Changed order.	10	7
447	2015-03-16 15:59:06.819752+00	6	Empty legs	2	Changed order.	10	7
448	2015-03-16 15:59:17.680652+00	2	FLYING PRIVATELY	2	No fields changed.	10	7
449	2015-03-16 16:00:55.423943+00	23	The basics	2	No fields changed.	10	7
450	2015-03-16 16:02:01.732724+00	23	The basics	3		10	7
451	2015-03-16 16:03:42.521694+00	4	A guide to flying privately	2	Changed lead and body.	9	7
452	2015-03-16 16:05:10.859882+00	4	A guide to flying privately	2	Changed lead and body.	9	7
453	2015-03-16 16:05:27.121117+00	1	The basics	3		9	7
454	2015-03-16 16:09:10.833796+00	5	A guide to flying privately	2	Changed order.	10	7
455	2015-03-16 16:09:29.475095+00	6	Empty legs	2	Changed order.	10	7
456	2015-03-16 16:09:57.570199+00	6	Empty legs	2	No fields changed.	10	7
457	2015-03-16 16:12:03.630486+00	17	Terms and conditions	2	Changed order and footer_group_order.	10	7
458	2015-03-16 16:12:15.001086+00	19	Cookies policy	2	Changed order and footer_group_order.	10	7
459	2015-03-16 16:12:25.77556+00	19	Cookies policy	2	Changed order and footer_group_order.	10	7
460	2015-03-16 16:13:29.294227+00	18	Privacy policy	2	Changed footer_group_order.	10	7
461	2015-03-16 16:13:55.690003+00	2	FLYING PRIVATELY	2	Changed footer_group_order.	10	7
462	2015-03-16 16:14:14.166538+00	3	WHY ASCENT JET	2	Changed footer_group_order.	10	7
463	2015-03-16 16:14:25.59346+00	4	ABOUT US	2	Changed footer_group_order.	10	7
464	2015-03-16 16:14:51.308062+00	9	The Ascent Jet team	2	Changed footer_group_order.	10	7
465	2015-03-16 16:14:59.532933+00	10	News	2	Changed footer_group_order.	10	7
466	2015-03-16 16:15:05.485318+00	13	Contact	2	No fields changed.	10	7
467	2015-03-16 16:15:22.016769+00	7	Our unique booking system	2	Changed footer_group_order.	10	7
468	2015-03-16 16:33:14.502306+00	2	Ascent Jet SA - The Company	2	Changed image.	9	7
469	2015-03-16 18:51:32.854425+00	2	Ascent Jet SA - Company Information	2	Changed title.	9	7
470	2015-03-17 09:08:02.742116+00	9	Pricing and payment	2	Changed lead and body.	9	7
471	2015-03-17 09:12:43.125234+00	9	Pricing and payment	2	Changed body.	9	7
472	2015-03-17 09:40:56.888019+00	9	Pricing and payment	2	Changed body.	9	7
473	2015-03-17 09:44:17.150541+00	9	Pricing and payment	2	Changed body.	9	7
474	2015-03-17 09:44:43.97234+00	9	Pricing and payment	2	Changed body.	9	7
475	2015-03-17 09:51:02.440154+00	9	Pricing and payment	2	Changed body.	9	7
476	2015-03-17 09:54:19.639378+00	9	Pricing and payment	2	Changed body.	9	7
477	2015-03-17 09:57:23.522643+00	9	Pricing and payment	2	Changed body.	9	7
478	2015-03-17 14:43:09.283023+00	9	Pricing and payment	2	Changed body.	9	7
479	2015-03-17 14:47:35.606164+00	9	Pricing and payment	2	No fields changed.	9	7
480	2015-03-17 14:52:27.456876+00	9	Pricing and payment	2	Changed body.	9	7
481	2015-03-17 17:14:59.884013+00	12	Embraer Phenom 100	2	Changed order.	13	7
482	2015-03-17 17:15:29.911363+00	21	Cessna Citation CJ3	2	Changed order.	13	7
483	2015-03-17 17:15:59.637039+00	23	Bombardier Learjet 40 XR	2	Changed order.	13	7
484	2015-03-17 17:16:07.502312+00	22	Beechcraft IA Premier	2	Changed order.	13	7
485	2015-03-17 17:16:52.951128+00	10	Cessna Citation Sovereign	2	Changed order.	13	7
486	2015-03-17 17:17:12.082078+00	7	Hawker 900 XP	2	Changed order.	13	7
487	2015-03-17 17:17:19.009643+00	8	Bmbardier Learjet 60 XR	2	Changed order.	13	7
488	2015-03-17 17:18:04.949659+00	17	Dassault Falcon 900LX	2	Changed order.	13	7
489	2015-03-17 17:18:16.808212+00	18	Dassault Falcon 7X	2	Changed order.	13	7
490	2015-03-17 17:18:46.070531+00	19	Gulfstream G550	2	Changed order.	13	7
491	2015-03-17 17:19:00.477492+00	5	Bombardier Global 5000	2	Changed order.	13	7
492	2015-03-17 17:20:12.574968+00	15	Gulfstream G280	2	Changed order.	13	7
493	2015-03-17 17:20:18.64967+00	6	Bombardier Challenger 300	2	Changed order.	13	7
494	2015-03-17 17:20:31.069271+00	13	Cessna Citation X	2	Changed order.	13	7
495	2015-03-17 17:20:52.359686+00	6	Bombardier Challenger 300	2	Changed order.	13	7
496	2015-03-17 17:21:25.349528+00	14	Embraer Legacy 600	2	Changed order.	13	7
497	2015-03-17 17:21:35.158427+00	15	Gulfstream G280	2	No fields changed.	13	7
498	2015-03-17 17:56:54.618765+00	17	Introduction	2	Changed body.	9	7
499	2015-03-17 17:58:12.686555+00	17	Introduction	2	Changed body.	9	7
500	2015-03-21 11:00:13.69501+00	7	Our unique booking system	2	No fields changed.	10	7
501	2015-03-21 11:00:54.891681+00	21	The Ascent Jet Difference	2	Changed footer_group.	10	7
502	2015-03-21 11:01:29.683121+00	22	Company Information	2	Changed footer_group.	10	7
503	2015-07-07 12:17:41.530482+00	6	alen	2	Changed password.	6	1
504	2015-07-07 12:49:57.915412+00	83	Flying Privately A1	1		2	1
505	2015-07-07 12:50:02.164669+00	5	A guide to flying privately	2	Changed image.	10	1
506	2015-07-07 12:57:35.621001+00	84	Flying Privately A2	1		2	1
507	2015-07-07 12:57:38.744594+00	5	A guide to flying privately	2	Changed image.	10	1
508	2015-07-07 13:00:46.47312+00	85	Flying Privately A3	1		2	1
509	2015-07-07 13:00:48.886463+00	5	A guide to flying privately	2	Changed image.	10	1
510	2015-07-07 13:02:55.794574+00	86	Flying Privately A4	1		2	1
511	2015-07-07 13:03:00.809122+00	5	A guide to flying privately	2	Changed image.	10	1
512	2015-07-07 13:03:36.980084+00	6	Empty legs	2	Changed image.	10	1
513	2015-07-07 13:05:19.352364+00	87	Flying Privately A5	1		2	1
514	2015-07-07 13:05:21.11332+00	5	A guide to flying privately	2	Changed image.	10	1
515	2015-07-07 13:05:28.578327+00	6	Empty legs	2	Changed image.	10	1
516	2015-07-07 13:11:08.574161+00	88	Why AJ A1	1		2	1
517	2015-07-07 13:11:11.178234+00	21	The Ascent Jet Difference	2	Changed image.	10	1
518	2015-07-07 13:19:49.719243+00	89	Why AJ A2	1		2	1
519	2015-07-07 13:19:51.715338+00	21	The Ascent Jet Difference	2	Changed image.	10	1
520	2015-07-07 13:22:09.237768+00	90	Why AJ A3	1		2	1
521	2015-07-07 13:22:11.104014+00	21	The Ascent Jet Difference	2	Changed image.	10	1
522	2015-07-07 13:22:38.099903+00	7	Our unique booking system	2	Changed image.	10	1
523	2015-07-07 13:22:46.657452+00	15	Pricing and payment	2	Changed image.	10	1
524	2015-07-07 13:22:54.869603+00	16	Safety	2	Changed image.	10	1
525	2015-07-07 13:27:05.769868+00	91	About_A1	1		2	1
526	2015-07-07 13:27:07.462935+00	22	Company Information	2	Changed image.	10	1
527	2015-07-07 13:28:47.023274+00	92	About_A2	1		2	1
528	2015-07-07 13:28:49.547794+00	22	Company Information	2	Changed image.	10	1
529	2015-07-07 13:31:27.638782+00	93	About_A3	1		2	1
530	2015-07-07 13:31:29.169064+00	22	Company Information	2	Changed image.	10	1
531	2015-07-07 13:32:59.608197+00	94	About_A4	1		2	1
532	2015-07-07 13:34:13.834199+00	22	Company Information	2	Changed image.	10	1
533	2015-07-07 13:34:44.881421+00	9	The Ascent Jet team	2	Changed image.	10	1
534	2015-07-07 13:34:53.858756+00	10	News	2	Changed image.	10	1
535	2015-07-07 13:35:03.174215+00	13	Contact	2	Changed image.	10	1
536	2015-07-07 13:35:41.938314+00	5	A guide to flying privately	2	No fields changed.	10	1
537	2015-07-07 13:45:19.321586+00	95	About_B1	1		2	1
538	2015-07-07 13:45:22.908857+00	7	The Ascent Jet Difference	2	Changed image.	9	1
539	2015-07-07 13:47:09.833964+00	7	The Ascent Jet Difference	2	Changed image.	9	1
540	2015-07-07 13:47:34.853027+00	2	Ascent Jet SA - Company Information	2	Changed image.	9	1
541	2015-09-16 09:21:44.651218+00	96	Main_B1	1		2	6
542	2015-09-16 09:21:57.586296+00	6	Key benefit goes here	2	Changed image.	1	6
543	2015-09-16 09:22:39.955476+00	6	Key benefit	2	Changed title.	1	6
544	2015-09-16 09:22:55.982699+00	6	Key benefit goes here	2	Changed title.	1	6
545	2015-09-29 09:58:13.376975+00	97	Home page Guy image	1		15	1
546	2015-09-29 09:58:28.825491+00	98	Homepage Airplane Image	1		15	1
547	2015-09-29 11:12:49.421258+00	3	test (info@ascentjet.com)	3		14	1
548	2015-09-29 11:12:49.424669+00	2	Ozren (ozren.lapcevic@gmail.com)	3		14	1
549	2015-09-29 11:12:49.42599+00	1	Ozren Lap (ozren.lapcevic@gmail.com)	3		14	1
550	2015-09-29 11:13:04.731814+00	13	Contact	2	Changed body.	9	1
551	2015-12-01 09:45:35.182904+00	97	Home page Guy image	3		15	6
552	2015-12-01 09:45:57.056786+00	99	Hpme šage woman	1		15	6
553	2015-12-01 10:20:21.646047+00	100	Home page man	1		15	6
554	2015-12-15 16:07:46.785385+00	100	Home page man	2	Changed header.	15	1
555	2015-12-15 16:07:51.539372+00	99	Hpme šage woman	2	Changed header.	15	1
556	2015-12-15 16:07:58.081046+00	98	Homepage Airplane Image	2	Changed header.	15	1
557	2015-12-15 16:08:06.096055+00	100	Home page man	2	Changed body.	15	1
558	2015-12-15 16:09:08.308065+00	100	Home page man	2	Changed body.	15	1
559	2015-12-16 09:42:11.035222+00	101	Home body image	1		15	1
560	2015-12-16 10:12:15.590894+00	101	Home body image	2	Changed resource.	15	6
561	2015-12-16 10:25:35.207985+00	101	Home body image	2	Changed resource.	15	6
562	2015-12-16 10:30:40.089647+00	101	Home body image	2	Changed resource.	15	6
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ascent_jet
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 562, true);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: ascent_jet
--

COPY django_content_type (id, name, app_label, model) FROM stdin;
1	Snippet	common	snippet
2	Image	common	image
3	log entry	admin	logentry
4	permission	auth	permission
5	group	auth	group
6	user	auth	user
7	content type	contenttypes	contenttype
8	session	sessions	session
9	article	structure	article
10	Node	structure	node
11	footer group	structure	footergroup
12	airplane category	airplanes	airplanecategory
13	airplane	airplanes	airplane
14	contact	contact	contact
15	home page image	common	homepageimage
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ascent_jet
--

SELECT pg_catalog.setval('django_content_type_id_seq', 15, true);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: ascent_jet
--

COPY django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2014-12-02 09:25:06.15899+00
2	auth	0001_initial	2014-12-02 09:25:07.378377+00
3	admin	0001_initial	2014-12-02 09:25:07.578987+00
4	common	0001_initial	2014-12-02 09:25:07.797694+00
5	sessions	0001_initial	2014-12-02 09:25:07.931169+00
6	structure	0001_initial	2014-12-02 09:25:08.373034+00
7	structure	0002_auto_20141128_1629	2014-12-02 09:25:08.865457+00
8	structure	0003_auto_20141201_0851	2014-12-02 09:25:09.099194+00
9	structure	0004_auto_20141201_0936	2014-12-02 09:25:09.32729+00
10	structure	0005_auto_20141201_1208	2014-12-02 09:25:09.50106+00
11	structure	0006_auto_20141201_1223	2014-12-02 09:25:09.617465+00
12	structure	0007_auto_20141201_1320	2014-12-02 09:25:09.686666+00
13	structure	0008_auto_20141201_1558	2014-12-02 09:25:09.775656+00
14	structure	0009_auto_20141202_0922	2014-12-02 09:25:09.887325+00
15	common	0002_auto_20141202_0950	2014-12-02 09:50:14.408576+00
16	structure	0010_auto_20141202_0950	2014-12-02 09:50:14.501061+00
17	structure	0011_auto_20141202_1058	2014-12-02 10:59:29.878013+00
18	common	0003_snippet_icon	2014-12-08 14:04:44.123691+00
19	structure	0012_auto_20141208_1004	2014-12-08 14:04:44.241318+00
20	common	0004_image_caption	2015-01-15 15:44:56.956986+00
21	airplanes	0001_initial	2015-01-15 15:44:57.374144+00
22	structure	0013_auto_20150109_1511	2015-01-15 15:44:57.50134+00
23	structure	0014_auto_20150109_1542	2015-01-15 15:44:57.868828+00
24	airplanes	0002_auto_20150312_0943	2015-03-12 09:53:55.359277+00
25	structure	0015_auto_20150312_0943	2015-03-12 09:53:55.515757+00
26	airplanes	0003_auto_20150316_1437	2015-03-16 14:56:00.905003+00
27	structure	0016_auto_20150316_1437	2015-03-16 14:56:01.064495+00
28	contact	0001_initial	2015-09-28 12:30:58.62326+00
29	structure	0017_auto_20150928_0850	2015-09-28 12:30:58.79237+00
30	structure	0018_auto_20150928_0850	2015-09-28 12:30:58.960146+00
31	contact	0002_auto_20150929_0845	2015-09-29 08:52:36.828537+00
32	structure	0019_auto_20150929_0845	2015-09-29 08:52:37.016235+00
33	common	0005_homepageimage	2015-09-29 09:57:46.383854+00
34	structure	0020_auto_20150929_0914	2015-09-29 09:57:46.569506+00
35	contact	0003_auto_20151210_1113	2015-12-10 11:19:48.653144+00
36	structure	0021_auto_20151210_1113	2015-12-10 11:19:48.884413+00
37	common	0006_auto_20151215_1556	2015-12-15 16:02:07.996495+00
38	structure	0022_auto_20151215_1556	2015-12-15 16:02:08.213195+00
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ascent_jet
--

SELECT pg_catalog.setval('django_migrations_id_seq', 38, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: ascent_jet
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
xx5lvnhn7tf6rht464rn6rx6af2rgjtz	Y2IxMGYxNjVlNjVjMDg4M2E4MTVhNGFkZGVlNTIwZWQ3NDQyNGUyZDp7Il9hdXRoX3VzZXJfaGFzaCI6Ijg5ZjZhMDAwM2M1ZTA3MTMwMjdhYTk2MjYxMDAwMGMzZmI3YjRhZmMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9	2014-12-16 09:31:11.747341+00
lt8t539b5clo4fz7g33zrqecxs9wd2jm	MGFmZmY5MTNkNWNjN2UwOGRhN2FmOGZhMDM3Yzg4NDBiMjIyNGNmZTp7fQ==	2014-12-16 09:39:53.183649+00
rhcy6281lnm9wbl5r7gqs123iysd79bt	MjViMWRmODg5ZWQ5YWI3MzliZTJmNTkwY2UwNjExYThkNjdjOTBjODp7Il9hdXRoX3VzZXJfaGFzaCI6IjVjYTBhYTk4NDA0NzFiMTVmMTFhYzUwNzFkM2E4YmYyMjhlMGNkM2EiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9	2014-12-16 16:17:12.222952+00
m4e9cou09zcv86j1r3xpm0pw63n1q2cj	MjM1ZGVjZTE1ZDVhNTYwMTIxZTE1YTY5NzExNDc4NmM0YWUzMDVmZDp7Il9hdXRoX3VzZXJfaGFzaCI6IjVjYzQ3MzJlOGExZjNkMGRlMGY0ZWJhYjdhNDAxZmJmOTRkZjVhNWYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjN9	2014-12-24 14:44:21.090345+00
5dycbhqv8ggrnqe4a4vnevixab09jefx	MjViMWRmODg5ZWQ5YWI3MzliZTJmNTkwY2UwNjExYThkNjdjOTBjODp7Il9hdXRoX3VzZXJfaGFzaCI6IjVjYTBhYTk4NDA0NzFiMTVmMTFhYzUwNzFkM2E4YmYyMjhlMGNkM2EiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9	2015-01-02 11:35:58.35464+00
dusaf5yevctxhgnsnb6ssou8chmbze7v	MjViMWRmODg5ZWQ5YWI3MzliZTJmNTkwY2UwNjExYThkNjdjOTBjODp7Il9hdXRoX3VzZXJfaGFzaCI6IjVjYTBhYTk4NDA0NzFiMTVmMTFhYzUwNzFkM2E4YmYyMjhlMGNkM2EiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9	2015-01-29 15:46:01.143347+00
q1d0ic7fv1qz2p111m2iwg0eku9r9ynk	MjViMWRmODg5ZWQ5YWI3MzliZTJmNTkwY2UwNjExYThkNjdjOTBjODp7Il9hdXRoX3VzZXJfaGFzaCI6IjVjYTBhYTk4NDA0NzFiMTVmMTFhYzUwNzFkM2E4YmYyMjhlMGNkM2EiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9	2015-03-05 11:25:50.903593+00
vr04idyuaa3fvr8q0rp95p2zdj5cjs9w	MjViMWRmODg5ZWQ5YWI3MzliZTJmNTkwY2UwNjExYThkNjdjOTBjODp7Il9hdXRoX3VzZXJfaGFzaCI6IjVjYTBhYTk4NDA0NzFiMTVmMTFhYzUwNzFkM2E4YmYyMjhlMGNkM2EiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9	2015-03-23 10:18:43.772672+00
7p7g4zl2djegdckxkcze08aidko6fhlm	OWRhNDNhNTJjNmI1OTQ2ZTVhMjA2NmI1YWJmNGM1ZGViZjEzM2YwOTp7Il9hdXRoX3VzZXJfaGFzaCI6Ijk0MjYzMWJmOTc1MzNjZDAyMDM1YmQ0OTQ5NTg2MzIwNzVkZDE5NWIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjd9	2015-03-23 10:25:59.784382+00
zzn151rl84mhbuz5id9ozqvx5gvdwo66	OWRhNDNhNTJjNmI1OTQ2ZTVhMjA2NmI1YWJmNGM1ZGViZjEzM2YwOTp7Il9hdXRoX3VzZXJfaGFzaCI6Ijk0MjYzMWJmOTc1MzNjZDAyMDM1YmQ0OTQ5NTg2MzIwNzVkZDE5NWIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjd9	2015-03-24 14:53:53.37169+00
7ekxr94gfpffdjpoc1g4cugk6xi37odp	OWRhNDNhNTJjNmI1OTQ2ZTVhMjA2NmI1YWJmNGM1ZGViZjEzM2YwOTp7Il9hdXRoX3VzZXJfaGFzaCI6Ijk0MjYzMWJmOTc1MzNjZDAyMDM1YmQ0OTQ5NTg2MzIwNzVkZDE5NWIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjd9	2015-03-24 16:24:42.348621+00
c1gzil6dnf0h86t0gptth2xgixmsp1n4	OWRhNDNhNTJjNmI1OTQ2ZTVhMjA2NmI1YWJmNGM1ZGViZjEzM2YwOTp7Il9hdXRoX3VzZXJfaGFzaCI6Ijk0MjYzMWJmOTc1MzNjZDAyMDM1YmQ0OTQ5NTg2MzIwNzVkZDE5NWIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjd9	2015-03-25 06:50:58.740821+00
rc20zlxjvnvc9lnf0yvslpcmcuqbpy3i	OTM3N2U5ZTZhMTA1NTk4NWJkOTRhOGMwMmJiZWU3NGRjM2ZhOGM3NDp7Il9hdXRoX3VzZXJfaGFzaCI6Ijk3ZjM5OTMxNjMxMTM5NzYwOTc0MDc0NWFlOGNlYjlmMjYwYTExYWUiLCJfYXV0aF91c2VyX2lkIjo3LCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCJ9	2015-03-25 09:07:34.904344+00
4ea2uauzzms64l0ntbtjap4bq7lenhx3	M2I5NGFjZDljZDJiNjU2ZDRlN2VlYWU3ZDUyMTAwMjA5OWUxM2FmMDp7Il9hdXRoX3VzZXJfaGFzaCI6Ijk3ZjM5OTMxNjMxMTM5NzYwOTc0MDc0NWFlOGNlYjlmMjYwYTExYWUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjd9	2015-03-25 09:36:01.558493+00
186qx9k35ma7az03udqi6nrnbw3d0uwi	M2I5NGFjZDljZDJiNjU2ZDRlN2VlYWU3ZDUyMTAwMjA5OWUxM2FmMDp7Il9hdXRoX3VzZXJfaGFzaCI6Ijk3ZjM5OTMxNjMxMTM5NzYwOTc0MDc0NWFlOGNlYjlmMjYwYTExYWUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjd9	2015-03-25 09:50:01.519467+00
9ef24rov0cdpvmnaicv0bt0ggdcrjrh6	M2I5NGFjZDljZDJiNjU2ZDRlN2VlYWU3ZDUyMTAwMjA5OWUxM2FmMDp7Il9hdXRoX3VzZXJfaGFzaCI6Ijk3ZjM5OTMxNjMxMTM5NzYwOTc0MDc0NWFlOGNlYjlmMjYwYTExYWUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjd9	2015-03-25 11:51:17.113485+00
9khcagl2qg9o0d72deeum79p46zyleua	M2I5NGFjZDljZDJiNjU2ZDRlN2VlYWU3ZDUyMTAwMjA5OWUxM2FmMDp7Il9hdXRoX3VzZXJfaGFzaCI6Ijk3ZjM5OTMxNjMxMTM5NzYwOTc0MDc0NWFlOGNlYjlmMjYwYTExYWUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjd9	2015-03-25 12:57:34.652598+00
2dpm7sm7svwo1x7hl2vbnciy7ivvd17p	M2I5NGFjZDljZDJiNjU2ZDRlN2VlYWU3ZDUyMTAwMjA5OWUxM2FmMDp7Il9hdXRoX3VzZXJfaGFzaCI6Ijk3ZjM5OTMxNjMxMTM5NzYwOTc0MDc0NWFlOGNlYjlmMjYwYTExYWUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjd9	2015-03-25 16:22:11.840543+00
5r190vszkh2yzrbgjgkqbjqk7l1todaa	M2I5NGFjZDljZDJiNjU2ZDRlN2VlYWU3ZDUyMTAwMjA5OWUxM2FmMDp7Il9hdXRoX3VzZXJfaGFzaCI6Ijk3ZjM5OTMxNjMxMTM5NzYwOTc0MDc0NWFlOGNlYjlmMjYwYTExYWUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjd9	2015-03-25 16:30:41.447296+00
pd6hv6b3csjuu83kqcnhjdip7y5t0s5e	M2I5NGFjZDljZDJiNjU2ZDRlN2VlYWU3ZDUyMTAwMjA5OWUxM2FmMDp7Il9hdXRoX3VzZXJfaGFzaCI6Ijk3ZjM5OTMxNjMxMTM5NzYwOTc0MDc0NWFlOGNlYjlmMjYwYTExYWUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjd9	2015-03-25 17:11:18.080008+00
e47lrsw2a9qa46qaji5fw0cn33v44dc5	M2I5NGFjZDljZDJiNjU2ZDRlN2VlYWU3ZDUyMTAwMjA5OWUxM2FmMDp7Il9hdXRoX3VzZXJfaGFzaCI6Ijk3ZjM5OTMxNjMxMTM5NzYwOTc0MDc0NWFlOGNlYjlmMjYwYTExYWUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjd9	2015-03-26 08:22:13.625812+00
2miun4701750ctuww0ri3oinppmorvyb	M2I5NGFjZDljZDJiNjU2ZDRlN2VlYWU3ZDUyMTAwMjA5OWUxM2FmMDp7Il9hdXRoX3VzZXJfaGFzaCI6Ijk3ZjM5OTMxNjMxMTM5NzYwOTc0MDc0NWFlOGNlYjlmMjYwYTExYWUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjd9	2015-03-26 12:10:37.480136+00
pnlips5vz6p2fgcprualffn8h140c4tc	M2I5NGFjZDljZDJiNjU2ZDRlN2VlYWU3ZDUyMTAwMjA5OWUxM2FmMDp7Il9hdXRoX3VzZXJfaGFzaCI6Ijk3ZjM5OTMxNjMxMTM5NzYwOTc0MDc0NWFlOGNlYjlmMjYwYTExYWUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjd9	2015-03-26 13:52:44.318068+00
ege5heogzoqjz5jnf5o0ng7dp9apoo1o	M2I5NGFjZDljZDJiNjU2ZDRlN2VlYWU3ZDUyMTAwMjA5OWUxM2FmMDp7Il9hdXRoX3VzZXJfaGFzaCI6Ijk3ZjM5OTMxNjMxMTM5NzYwOTc0MDc0NWFlOGNlYjlmMjYwYTExYWUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjd9	2015-03-26 15:52:05.179669+00
vfbwpbtrpddjx7rzbqc4ar5tzpd0fzyp	M2I5NGFjZDljZDJiNjU2ZDRlN2VlYWU3ZDUyMTAwMjA5OWUxM2FmMDp7Il9hdXRoX3VzZXJfaGFzaCI6Ijk3ZjM5OTMxNjMxMTM5NzYwOTc0MDc0NWFlOGNlYjlmMjYwYTExYWUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjd9	2015-03-26 20:27:48.198602+00
z25ctzxur6brtatsfqh16ux314mgu2u5	M2I5NGFjZDljZDJiNjU2ZDRlN2VlYWU3ZDUyMTAwMjA5OWUxM2FmMDp7Il9hdXRoX3VzZXJfaGFzaCI6Ijk3ZjM5OTMxNjMxMTM5NzYwOTc0MDc0NWFlOGNlYjlmMjYwYTExYWUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjd9	2015-03-27 09:04:19.611695+00
4n3vnpy1qugwzgsotjb6uznut5zei2vi	M2I5NGFjZDljZDJiNjU2ZDRlN2VlYWU3ZDUyMTAwMjA5OWUxM2FmMDp7Il9hdXRoX3VzZXJfaGFzaCI6Ijk3ZjM5OTMxNjMxMTM5NzYwOTc0MDc0NWFlOGNlYjlmMjYwYTExYWUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjd9	2015-03-30 15:19:57.057612+00
1idhasc5urows7mjrd5z3k5522wwro7v	M2I5NGFjZDljZDJiNjU2ZDRlN2VlYWU3ZDUyMTAwMjA5OWUxM2FmMDp7Il9hdXRoX3VzZXJfaGFzaCI6Ijk3ZjM5OTMxNjMxMTM5NzYwOTc0MDc0NWFlOGNlYjlmMjYwYTExYWUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjd9	2015-03-27 13:14:22.50148+00
7xzuidcb0012ymy6qkq41hohpqcs0d32	M2I5NGFjZDljZDJiNjU2ZDRlN2VlYWU3ZDUyMTAwMjA5OWUxM2FmMDp7Il9hdXRoX3VzZXJfaGFzaCI6Ijk3ZjM5OTMxNjMxMTM5NzYwOTc0MDc0NWFlOGNlYjlmMjYwYTExYWUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjd9	2015-03-27 13:22:44.039206+00
koqn7bzfcq0icjuxd631ulsemeeurrni	M2I5NGFjZDljZDJiNjU2ZDRlN2VlYWU3ZDUyMTAwMjA5OWUxM2FmMDp7Il9hdXRoX3VzZXJfaGFzaCI6Ijk3ZjM5OTMxNjMxMTM5NzYwOTc0MDc0NWFlOGNlYjlmMjYwYTExYWUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjd9	2015-03-30 16:31:42.58308+00
8cpa2uk8q77h7qelso5y7s4c58di35hu	M2I5NGFjZDljZDJiNjU2ZDRlN2VlYWU3ZDUyMTAwMjA5OWUxM2FmMDp7Il9hdXRoX3VzZXJfaGFzaCI6Ijk3ZjM5OTMxNjMxMTM5NzYwOTc0MDc0NWFlOGNlYjlmMjYwYTExYWUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjd9	2015-03-27 14:30:34.644229+00
ljcex62iiznnlvklo7zgrv73jn7eie3a	M2I5NGFjZDljZDJiNjU2ZDRlN2VlYWU3ZDUyMTAwMjA5OWUxM2FmMDp7Il9hdXRoX3VzZXJfaGFzaCI6Ijk3ZjM5OTMxNjMxMTM5NzYwOTc0MDc0NWFlOGNlYjlmMjYwYTExYWUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjd9	2015-03-27 17:32:15.049442+00
4kakda6po2q04ucnb9s4zwrl36lwq6ly	M2I5NGFjZDljZDJiNjU2ZDRlN2VlYWU3ZDUyMTAwMjA5OWUxM2FmMDp7Il9hdXRoX3VzZXJfaGFzaCI6Ijk3ZjM5OTMxNjMxMTM5NzYwOTc0MDc0NWFlOGNlYjlmMjYwYTExYWUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjd9	2015-03-30 18:49:58.401181+00
ctjs5gk2h0147n3u4lwszzdv9vfzhe1w	M2I5NGFjZDljZDJiNjU2ZDRlN2VlYWU3ZDUyMTAwMjA5OWUxM2FmMDp7Il9hdXRoX3VzZXJfaGFzaCI6Ijk3ZjM5OTMxNjMxMTM5NzYwOTc0MDc0NWFlOGNlYjlmMjYwYTExYWUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjd9	2015-03-28 09:21:11.494204+00
i58me3bgxhscs5xb6d15wlzopc28675b	M2I5NGFjZDljZDJiNjU2ZDRlN2VlYWU3ZDUyMTAwMjA5OWUxM2FmMDp7Il9hdXRoX3VzZXJfaGFzaCI6Ijk3ZjM5OTMxNjMxMTM5NzYwOTc0MDc0NWFlOGNlYjlmMjYwYTExYWUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjd9	2015-03-28 14:52:30.838775+00
9qcfas8d46q1avh2g4ufmiiixx34smzn	M2I5NGFjZDljZDJiNjU2ZDRlN2VlYWU3ZDUyMTAwMjA5OWUxM2FmMDp7Il9hdXRoX3VzZXJfaGFzaCI6Ijk3ZjM5OTMxNjMxMTM5NzYwOTc0MDc0NWFlOGNlYjlmMjYwYTExYWUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjd9	2015-03-31 08:16:35.673935+00
2ls7fma30p5eosbmqlizyhekrpnnkszn	M2I5NGFjZDljZDJiNjU2ZDRlN2VlYWU3ZDUyMTAwMjA5OWUxM2FmMDp7Il9hdXRoX3VzZXJfaGFzaCI6Ijk3ZjM5OTMxNjMxMTM5NzYwOTc0MDc0NWFlOGNlYjlmMjYwYTExYWUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjd9	2015-03-28 15:02:31.222758+00
4ktfgtcxcmyg1sus4steq0g6qdecuamc	M2I5NGFjZDljZDJiNjU2ZDRlN2VlYWU3ZDUyMTAwMjA5OWUxM2FmMDp7Il9hdXRoX3VzZXJfaGFzaCI6Ijk3ZjM5OTMxNjMxMTM5NzYwOTc0MDc0NWFlOGNlYjlmMjYwYTExYWUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjd9	2015-03-28 15:36:21.555901+00
t3upmycvqakofh0t0d47qhwy1o5e78i8	M2I5NGFjZDljZDJiNjU2ZDRlN2VlYWU3ZDUyMTAwMjA5OWUxM2FmMDp7Il9hdXRoX3VzZXJfaGFzaCI6Ijk3ZjM5OTMxNjMxMTM5NzYwOTc0MDc0NWFlOGNlYjlmMjYwYTExYWUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjd9	2015-03-31 08:30:45.411374+00
09ogqbi7n2spa4lvsq18d9plv11901wu	M2I5NGFjZDljZDJiNjU2ZDRlN2VlYWU3ZDUyMTAwMjA5OWUxM2FmMDp7Il9hdXRoX3VzZXJfaGFzaCI6Ijk3ZjM5OTMxNjMxMTM5NzYwOTc0MDc0NWFlOGNlYjlmMjYwYTExYWUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjd9	2015-03-28 17:09:32.814657+00
2gp97exre54jjf0s220inyxpbgq6ve7e	MjM1ZGVjZTE1ZDVhNTYwMTIxZTE1YTY5NzExNDc4NmM0YWUzMDVmZDp7Il9hdXRoX3VzZXJfaGFzaCI6IjVjYzQ3MzJlOGExZjNkMGRlMGY0ZWJhYjdhNDAxZmJmOTRkZjVhNWYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjN9	2015-03-28 17:41:19.661203+00
1rzt0i3vdbkgd24131jljlqmzrqsf4ai	M2I5NGFjZDljZDJiNjU2ZDRlN2VlYWU3ZDUyMTAwMjA5OWUxM2FmMDp7Il9hdXRoX3VzZXJfaGFzaCI6Ijk3ZjM5OTMxNjMxMTM5NzYwOTc0MDc0NWFlOGNlYjlmMjYwYTExYWUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjd9	2015-03-31 16:18:04.265263+00
9nnb6cvesvpptm1eghsjadxy59w7405j	M2I5NGFjZDljZDJiNjU2ZDRlN2VlYWU3ZDUyMTAwMjA5OWUxM2FmMDp7Il9hdXRoX3VzZXJfaGFzaCI6Ijk3ZjM5OTMxNjMxMTM5NzYwOTc0MDc0NWFlOGNlYjlmMjYwYTExYWUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjd9	2015-03-28 21:05:07.615629+00
imtdzvue69kdjczm8pr8kah8hnlol5ip	M2I5NGFjZDljZDJiNjU2ZDRlN2VlYWU3ZDUyMTAwMjA5OWUxM2FmMDp7Il9hdXRoX3VzZXJfaGFzaCI6Ijk3ZjM5OTMxNjMxMTM5NzYwOTc0MDc0NWFlOGNlYjlmMjYwYTExYWUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjd9	2015-03-29 18:43:36.358261+00
wow5jv77o2j1rfm3ialdfk9b1r3xlxxc	M2I5NGFjZDljZDJiNjU2ZDRlN2VlYWU3ZDUyMTAwMjA5OWUxM2FmMDp7Il9hdXRoX3VzZXJfaGFzaCI6Ijk3ZjM5OTMxNjMxMTM5NzYwOTc0MDc0NWFlOGNlYjlmMjYwYTExYWUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjd9	2015-03-31 17:04:29.904589+00
07pckulip6q60yi69bo32gmts9jwry9t	M2I5NGFjZDljZDJiNjU2ZDRlN2VlYWU3ZDUyMTAwMjA5OWUxM2FmMDp7Il9hdXRoX3VzZXJfaGFzaCI6Ijk3ZjM5OTMxNjMxMTM5NzYwOTc0MDc0NWFlOGNlYjlmMjYwYTExYWUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjd9	2015-03-30 08:38:30.194258+00
s6s8xky7ddbkudg1mousx2mqos540okk	M2I5NGFjZDljZDJiNjU2ZDRlN2VlYWU3ZDUyMTAwMjA5OWUxM2FmMDp7Il9hdXRoX3VzZXJfaGFzaCI6Ijk3ZjM5OTMxNjMxMTM5NzYwOTc0MDc0NWFlOGNlYjlmMjYwYTExYWUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjd9	2015-03-30 09:03:10.900925+00
2crymeehvm7z783cs2626h1lbt8bqjat	MDRkOWI0MGUzOWNkYTAwYzVmNzlhM2JiZTY4ZmYwOGQwYjhjNDJiYTp7Il9hdXRoX3VzZXJfaGFzaCI6IjViZTk0ZDg1NzkxOWYxYzQxNTBmMTgyNzhkNTAyOTQ4M2Q3Y2I3MzIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjZ9	2015-03-30 09:37:46.197602+00
niait540p45k5fwyokhwl577zjofb6o6	M2I5NGFjZDljZDJiNjU2ZDRlN2VlYWU3ZDUyMTAwMjA5OWUxM2FmMDp7Il9hdXRoX3VzZXJfaGFzaCI6Ijk3ZjM5OTMxNjMxMTM5NzYwOTc0MDc0NWFlOGNlYjlmMjYwYTExYWUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjd9	2015-03-30 11:47:23.120008+00
81yt1bjeguq1sawnvhpz3btjsh11j940	M2I5NGFjZDljZDJiNjU2ZDRlN2VlYWU3ZDUyMTAwMjA5OWUxM2FmMDp7Il9hdXRoX3VzZXJfaGFzaCI6Ijk3ZjM5OTMxNjMxMTM5NzYwOTc0MDc0NWFlOGNlYjlmMjYwYTExYWUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjd9	2015-03-30 14:45:40.045464+00
3pkws6gd15q24p1d1ylzsz6hj4lpdap2	M2I5NGFjZDljZDJiNjU2ZDRlN2VlYWU3ZDUyMTAwMjA5OWUxM2FmMDp7Il9hdXRoX3VzZXJfaGFzaCI6Ijk3ZjM5OTMxNjMxMTM5NzYwOTc0MDc0NWFlOGNlYjlmMjYwYTExYWUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjd9	2015-03-31 17:33:49.275322+00
qobu30o4ujhdp2dtkiwqrz66grftet6x	M2I5NGFjZDljZDJiNjU2ZDRlN2VlYWU3ZDUyMTAwMjA5OWUxM2FmMDp7Il9hdXRoX3VzZXJfaGFzaCI6Ijk3ZjM5OTMxNjMxMTM5NzYwOTc0MDc0NWFlOGNlYjlmMjYwYTExYWUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjd9	2015-04-04 10:57:56.071915+00
a2rwn6ya2e0i8mxnue12xe29if9xb9kq	MjViMWRmODg5ZWQ5YWI3MzliZTJmNTkwY2UwNjExYThkNjdjOTBjODp7Il9hdXRoX3VzZXJfaGFzaCI6IjVjYTBhYTk4NDA0NzFiMTVmMTFhYzUwNzFkM2E4YmYyMjhlMGNkM2EiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9	2015-04-13 11:52:26.97659+00
17l2jiyg7p4psghp5fk14lzot2x53b8v	MjViMWRmODg5ZWQ5YWI3MzliZTJmNTkwY2UwNjExYThkNjdjOTBjODp7Il9hdXRoX3VzZXJfaGFzaCI6IjVjYTBhYTk4NDA0NzFiMTVmMTFhYzUwNzFkM2E4YmYyMjhlMGNkM2EiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9	2015-05-04 14:21:07.383038+00
izp84v2haylhm5eu6zu2hqbs0jru0dfj	MjViMWRmODg5ZWQ5YWI3MzliZTJmNTkwY2UwNjExYThkNjdjOTBjODp7Il9hdXRoX3VzZXJfaGFzaCI6IjVjYTBhYTk4NDA0NzFiMTVmMTFhYzUwNzFkM2E4YmYyMjhlMGNkM2EiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9	2015-07-21 12:17:13.741118+00
5z5kbhq4vmc5cx8qn82lxbzxukyy4wxt	MjViMWRmODg5ZWQ5YWI3MzliZTJmNTkwY2UwNjExYThkNjdjOTBjODp7Il9hdXRoX3VzZXJfaGFzaCI6IjVjYTBhYTk4NDA0NzFiMTVmMTFhYzUwNzFkM2E4YmYyMjhlMGNkM2EiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9	2015-07-21 12:41:45.566762+00
ha8ccmajhn7o0lb2s4n5snz5hymhvpj7	MjViMWRmODg5ZWQ5YWI3MzliZTJmNTkwY2UwNjExYThkNjdjOTBjODp7Il9hdXRoX3VzZXJfaGFzaCI6IjVjYTBhYTk4NDA0NzFiMTVmMTFhYzUwNzFkM2E4YmYyMjhlMGNkM2EiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9	2015-07-21 12:56:49.846595+00
vww56vkt8n23x0n730a4y9dtmd246bsx	M2I5NGFjZDljZDJiNjU2ZDRlN2VlYWU3ZDUyMTAwMjA5OWUxM2FmMDp7Il9hdXRoX3VzZXJfaGFzaCI6Ijk3ZjM5OTMxNjMxMTM5NzYwOTc0MDc0NWFlOGNlYjlmMjYwYTExYWUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjd9	2015-09-02 16:54:39.410418+00
0g35ym8togt7exc0qvubyankoic1tifx	M2I5NGFjZDljZDJiNjU2ZDRlN2VlYWU3ZDUyMTAwMjA5OWUxM2FmMDp7Il9hdXRoX3VzZXJfaGFzaCI6Ijk3ZjM5OTMxNjMxMTM5NzYwOTc0MDc0NWFlOGNlYjlmMjYwYTExYWUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjd9	2015-09-02 16:59:15.417925+00
2ul1fgop4khx29y38jb8cagg9br8j2y9	M2I5NGFjZDljZDJiNjU2ZDRlN2VlYWU3ZDUyMTAwMjA5OWUxM2FmMDp7Il9hdXRoX3VzZXJfaGFzaCI6Ijk3ZjM5OTMxNjMxMTM5NzYwOTc0MDc0NWFlOGNlYjlmMjYwYTExYWUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjd9	2015-09-02 17:12:42.414916+00
0vjpxqparsg5mbjy4uco0hi6tktay84n	NDE4OTBmYzVkYzNkZGFmMGI0MDRiNWY0YTUzNmIxMjA3ODBiMjU5YTp7Il9hdXRoX3VzZXJfaGFzaCI6IjY5YTg4NjdiN2FlNjA5MTNmOGVjM2Y2ZjhkNTZlZTkxYmNlOGNjNDMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjZ9	2015-09-30 09:20:36.540429+00
h2bqwjoa9sil5v0wfl1ysknjzei2fpwg	MjViMWRmODg5ZWQ5YWI3MzliZTJmNTkwY2UwNjExYThkNjdjOTBjODp7Il9hdXRoX3VzZXJfaGFzaCI6IjVjYTBhYTk4NDA0NzFiMTVmMTFhYzUwNzFkM2E4YmYyMjhlMGNkM2EiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9	2015-10-12 08:27:38.034118+00
8r4wg9w64uvdnnfgetm7eg85v3pw7ka3	NDE4OTBmYzVkYzNkZGFmMGI0MDRiNWY0YTUzNmIxMjA3ODBiMjU5YTp7Il9hdXRoX3VzZXJfaGFzaCI6IjY5YTg4NjdiN2FlNjA5MTNmOGVjM2Y2ZjhkNTZlZTkxYmNlOGNjNDMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjZ9	2015-12-15 09:45:04.432817+00
wkl60ywazkycs3bitwztqs31rfxvcw8j	MjViMWRmODg5ZWQ5YWI3MzliZTJmNTkwY2UwNjExYThkNjdjOTBjODp7Il9hdXRoX3VzZXJfaGFzaCI6IjVjYTBhYTk4NDA0NzFiMTVmMTFhYzUwNzFkM2E4YmYyMjhlMGNkM2EiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9	2015-12-15 10:16:00.938922+00
thyx557gu7rzvt9cddlph0542muta0vl	MjViMWRmODg5ZWQ5YWI3MzliZTJmNTkwY2UwNjExYThkNjdjOTBjODp7Il9hdXRoX3VzZXJfaGFzaCI6IjVjYTBhYTk4NDA0NzFiMTVmMTFhYzUwNzFkM2E4YmYyMjhlMGNkM2EiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9	2015-12-29 16:07:35.039984+00
ooc12bbh0zvo0bbykn3e8u9rhzuuu522	NDE4OTBmYzVkYzNkZGFmMGI0MDRiNWY0YTUzNmIxMjA3ODBiMjU5YTp7Il9hdXRoX3VzZXJfaGFzaCI6IjY5YTg4NjdiN2FlNjA5MTNmOGVjM2Y2ZjhkNTZlZTkxYmNlOGNjNDMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjZ9	2015-12-30 10:12:07.1781+00
\.


--
-- Data for Name: structure_article; Type: TABLE DATA; Schema: public; Owner: ascent_jet
--

COPY structure_article (id, title, lead, body, node_id, conclusion, image_id, "order") FROM stdin;
9	Pricing and payment	Pricing is communicated directly to you by participating operators. The Ascent Jet platform serves as a facilitator between client and operator. This is your assurance of total transparency.   	<div class="basepagecontainer">\r\n<div class="basetextcontainer">&nbsp;</div>\r\n<div class="basetextcontainer"><span>Pricing</span></div>\r\n<div class="basetextcontainer">&nbsp;</div>\r\n<div class="basetextcontainer"><span>On demand charter flights are priced directly by participating operators. These will include the flight, fuel surcharge, landing and handling fees, any taxes due, and standard catering. Offers can either be submitted with an expiry date for validity or without. Early booking particularly for very light and light jets is strongly encouraged as there is often high demand for these ctegories.</span></div>\r\n<div class="basetextcontainer">&nbsp;</div>\r\n<div class="basetextcontainer">When making your booking on-line, the operator's terms and conditions are accepted electronically.</div>\r\n<div class="basetextcontainer">&nbsp;</div>\r\n<div class="basetextcontainer">Ascent Jet adds a booking fee of 4% to the total price of on demand flights inclusive of above mentioned ancillary services.</div>\r\n<div class="basetextcontainer">&nbsp;</div>\r\n<div class="basetextcontainer">Empty legs are priced at a substantial discount from on demand flghts. It is estimated that 30% of private flights are empty of passengers due either to aircraft repositioning or returning to base empty after a one way flight. You can search through the many empty legs that are available here (add browse all flights link here). The list of emplty legs is constantly updated.</div>\r\n<div class="basetextcontainer">&nbsp;</div>\r\n<div class="basetextcontainer">Ascent Jet adds a booking fee of 10% to the price of emply legs.</div>\r\n<div class="basetextcontainer">&nbsp;</div>\r\n<div class="basetextcontainer">Payment</div>\r\n<div class="basetextcontainer"><br />\r\n<p><span>When booking directly on-line, payment is made using one of the major credit cards (VISA, Mastercard and American Express). <span>Credit card payment is subject to an additional surcharge. which is added to the cost of your flght booking (2.6% for VISA and Mastercard and 3.95% for American Express). <span>You may also make payment by bank transfer if this is preferred. </span></span>In this case, you can make your booking by telephone once you have received and have accepted an offer from one of our participating operators.&nbsp; </span></p>\r\n<p><span>Funds are received by Ascent Jet and held on an account with the UBS bank in Switzerland prior to forwarding payment to the operators. Payment or proof of payment must be received prior to any flight taking off. <br /></span></p>\r\n</div>\r\n</div>	15		\N	1
7	The Ascent Jet Difference	Ascent Jet offers a unique platform that puts buyer and seller together - in this case, our clients with the many aircraft operators throughout Europe and eventually further afield, who use our platform to quote charter prices.  	<p>By offering a full on-line platform for requests for offer, quotations, bookings and payment, Ascent Jet has taken private aviation charter to a new level. We are at the forefont of technology as applied to private aviation while still retaining customer care as the core of our business approach.</p>\r\n<p>Ascent Jet is the only European based on-line booking platform through which clients receive offers directly from our participating operators. To ensure the best possible quotes, we select operators based on the availability of their aircraft at the time offers are solicited. We do this with the use of technlolgy. Ascent Jet is increasingly building links to the respective schedulers of aircraft operators where availablity can be shown directly, but pricing we leave to the operators for total transparency. &nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>	21	<p>Ascent Jet was founded in Geneva, Switzerland in 2006. With numerous clients in all industries and from all walks of life, our focus has always been on providing timely and quality customer service.</p>	82	1
2	Ascent Jet SA - Company Information	Incorporated in Geneva, Switzerland and founded in 2006, Ascent Jet SA began as a charter brokerage company with a strong emphasis on the new technologies  to facilitate requests for offer and selection of aircraft for our clients giving them the best possible travel options by private aircraft at the most competitive prices.	<p>Ascent Jet today offers a technically advanced and easy to use platform for soliciting multiple offers for flights worldwide.&nbsp; We combine a large amount of automation in the request for offer proces combined with personalized service. There is no geographical limit to the itineraries we cater to, and no compromise in our selection of operators we work with based on safety, reputation and competitive pricing.</p>	22	<p>Swiss based Ascent Jet has a pan-European reach with an ever increasing list of quality operators on file. This translates into our assurance to you that wou will always receive the most competitive quotes for any flght whether a single leg, return or multi-leg worldwide.</p>	95	1
4	A guide to flying privately	There is a plethora of private jets available in the marketplace today. So selecting the right aircraft at the right price for you can sometimes be a daunting challenge especially if you’re flying privately for the first time. \r\n\r\n	<p>You only need a few basics to start you on your journey! You begin by looking at your planned itinerary, the number of passengers flying with you, your luggage requirements and, of course, your budget. These criteria will give you an indication of the aircraft types that would best suit your flight profile.</p>\r\n<p>Ascent Jet does this for you too!&nbsp; We select the most appropriate aircraft category and type for any given flight profile and then solicit offers from operators nearest your departure airport.&nbsp; When entering your itinerary and requesting an offer, you can also add as much information as you like including a desired aircraft type, even a specific operator or aircraft you&rsquo;ve flown in previously, and we&rsquo;ll see what&rsquo;s available for you.</p>\r\n<p>Here you will find an overview of some of the most popular aircraft that are typically offered for charter.&nbsp; Each aircraft type belongs to a category starting from turbo props and moving up to heavy and ultra long range jets.&nbsp; A description of each category and facilities typically offered in each one are shown in the guide below.</p>	5		\N	1
13	Contact	Ascent Jet SA is a limited liability company registered in Geneva, Switzerland	<div>4, rue du Tir-au-Canon, 1227 Carouge, Geneva</div>\r\n<div>Tel: +42 22 366 42 05</div>\r\n<div>Fax: +41 22 366 42&nbsp; 01</div>\r\n<div>email: info@ascentjet.com</div>\r\n<div>www.ascentjet.com</div>	13		\N	1
6	Empty legs	It is estimated that 30% of private flights are empty of passengers due either to aircraft repositioning or returning to base empty after a one way flight.  Ascent Jet can offer these empty legs on behalf of our participating operators at substantial discounts - often up to 75%!	<p>Ascent Jet is a growing market place for empty legs. We can download literally hundreds of empty legs on offer from participating operators automatically.</p>\r\n<p>Similar to on demand quotations, participating operators can either quote their empty legs directly in your log in area, or prices can be displayed in advance on this website.&nbsp; In all cases, you will be invited to to make your booking in the same way as you would for on demand flights.</p>	6		\N	1
10	Safety	Safety is our highest priority at Ascent Jet.  We will only include operators on our file that have and maintain a valid AOC (Air Operator Certificate). The AOC is our assurance of the highest level of safety for those soliciting offers and flying on aircraft operated by our participating operators.\r\n\r\n 	<p>All aircraft on file on the Ascent Jet platform that can be solicited for charter are audited on a regular basis. All aircraft are piloted by two qualified pilots with current class ratings on the aircraft they fly.</p>\r\n<p><span>The AOC requires operators to fulfil the following criteria:</span></p>\r\n<p style="padding-left: 30px;"><span>Sufficient personnel with the required experience for the type of operations requested</span></p>\r\n<p style="padding-left: 30px;"><span>Aircraft with safety features that are continuously audited and suitable for the type of operatons requested</span></p>\r\n<p style="padding-left: 30px;"><span>Systems for the training of crew and the operator of the aircraft</span></p>\r\n<p style="padding-left: 30px;"><span>A quality system to ensure that all applicable regulations are followed</span></p>\r\n<p style="padding-left: 30px;"><span>The appointment of key accountabe staff who are responsible for specific safety critical functions such as training, maintenance and operations</span></p>\r\n<p style="padding-left: 30px;"><span>Carriers Liability Insurance. Operators are to have sufficient insurance to cover any liability towards any passenger carried</span></p>\r\n<p style="padding-left: 30px;"><span>The operator has sufficient ground infrastructure, or arrangements for the supply of sufficient infrastructure to support its operations into the ports requested</span></p>\r\n<p><span>Operators are continuously audited on the basis on these criteria.</span></p>\r\n<p><span><span>Ascent Jet also pays close attention to the financial solvability and strength of participating operators. Not least of all, we search for operators with a reputation for high quality of service - a key indicator of their and our concern for safety.</span></span></p>	16	<p><span>&nbsp;</span></p>	\N	1
14	General Terms and Conditions	Ascent Jet SA General terms and Conditions	<p><strong>1. Terms of Sale and Conditions governing Use of the Site</strong></p>\r\n<p>Please read these Terms and Conditions governing the use of the web site <a title="www.ascent-jet.com" href="http://www.ascent-jet.com">www.ascentjet.com</a> (the "Site") carefully.</p>\r\n<p>These Terms and Conditions are supplemented by the specific terms applicable to the individual services offered on the Site.</p>\r\n<p><strong>2. The Site and Ascent Jet SA</strong></p>\r\n<p>The Site contains all of the services offered by Ascent Jet SA, a company governed by Swiss law with its head office at 4, rue du Tir-au-Canon, Geneva, Switzerland, registered in the Geneva Company Registrar (No CH-660-2056006-1)..</p>\r\n<p><strong>3. Acceptance of the Terms and Conditions</strong></p>\r\n<p>Orders for services on the Site may only be placed by users who have first read and accepted, without reservation, all of the General Terms and Conditions and the specific terms of the order notified during the booking and purchase procedure. Acceptance of these terms in full is demonstrated by the electronic signature of the user, which consists of ticking a box and giving his or her personal and/or bank particulars. By express agreement, this electronic signature is valid as a manuscript signature between the parties. Without the user's electronic signature, the order cannot be fulfilled.</p>\r\n<p><strong>4. Ascent Jet SA is an intermediary</strong></p>\r\n<p>Ascent Jet SA acts as an intermediary for travel providers such as aircraft operators, hotels, insurance companies and others (the "Travel Providers").</p>\r\n<p>By accepting these Terms and Conditions, you recognise that Ascent Jet SA acts only as an agent for all Travel Providers.</p>\r\n<p>Ascent Jet SA is not an air carrier and does not operate flights. You therefore agree that the contract for delivering flight services will be between you and the aircraft operator. You further agree to assume all liability for and shall release, indemnify and keep harmless Ascent Jet SA and its successors, legal representatives, employees, officers and directors, from and against any and all liabilities, obligations, losses, damages, penalities of any nature whatsoever which may be imposed on Ascent Jet SA relating to or arising from the manufacture, ownership, possession, use, operation or condition of any aircraft or component thereof. The indemnities contained in this paragraph shall survive the termination of the present agreement.</p>\r\n<p>Unless otherwise provided by law, Ascent Jet SA may not be held responsible for any failure by Travel Providers to meet their obligations under the contracts they have entered into with you.</p>\r\n<p><strong>5. Information available on the Site</strong></p>\r\n<p>The information that Ascent Jet SA places at your disposal on the Site is intended as a guide to help you during searches.</p>\r\n<p><strong>Formalities</strong></p>\r\n<p>Ascent Jet SA draws your attention to the fact that in general, before you can use services ordered on the Site, you must first comply with certain administrative and health formalities. For example, a valid passport is essential for most foreign destinations and some countries require passports to be valid for at least 6 months after the return date, or compliance with other mandatory formalities.</p>\r\n<p>Ascent Jet SA recommends that you check with the consulates, embassies or tourist information offices of the countries you intend to visit or pass through to ensure that this information is indeed applicable to your situation.</p>\r\n<p>For all other services ordered on the Site, it is your responsibility to find out what formalities are required for your journey and to comply with them by contacting the consulates or embassies of the countries you intend to visit or pass through.</p>\r\n<p>You are responsible for paying all expenses related with these procedures. Ascent Jet SA will not refund fares if you are penalised or prevented from going on a journey because you have failed to comply with these formalities.</p>\r\n<p><strong>Photographs</strong></p>\r\n<p>Ascent Jet SA makes every effort to provide photographs that illustrate or describe the services on the Site. Illustrative photographs are solely intended to evoke the chosen destination or type of aircraft and have no indicative value. Descriptive photographs are intended to give a general idea of the category or standard of a service.</p>\r\n<p><strong>Exchange rates</strong></p>\r\n<p>The exchange rates given on the Site are taken from various sources and may not be up to date. You are advised to check the exact rates on the date on which you book, as the rates provided by Ascent Jet SA are given merely as an indication.</p>\r\n<p><strong>6. Cancellation / Amendment</strong></p>\r\n<p>Ascent Jet SA reminds you that the right to cancel or withdraw is not applicable to accommodation, transport and leisure services provided on a fixed date or with a fixed frequency.</p>\r\n<p><strong>7. Expenses incurred in cancellation / amendment</strong></p>\r\n<p>If you have to make a change to your booking, and provided that such changes are allowed by the relevant travel provider(s), (including but not limited to: cancellations, refunds, booking changes or changes in the names of travellers / drivers / residents), Ascent Jet SA reserves the right to charge a fee to cover the administrative costs incurred. These costs are applicable to each booking and are cumulative in the case of multiple bookings. These costs do not include the costs charged by aircraft operators directly, which are notified to you during the booking or purchase procedure.</p>\r\n<p><strong>8. Prices / Payment</strong></p>\r\n<p>Unless stated otherwise on the Site, the prices are shown in CHF, including VAT. Additional taxes payable locally may be charged by local authorities and are payable by you.</p>\r\n<p>Ascent Jet SA is not obliged to issue any air transport contract, confirmation, booking form or other travel document until it receives payment in full. However, in all cases you will remain liable to pay all amounts you have agreed to pay for travel or other services ordered.</p>\r\n<p>Where appropriate, Ascent Jet SA may transmit your credit card information to the Travel Providers, who will receive your payment in accordance with the terms of sale applicable to the service.</p>\r\n<p>Unless explicitly provided otherwise, credit card payments are made on the Site through a secure payment system by means of the following credit cards: Visa, Eurocard/Mastercard, American Express.</p>\r\n<p>If your bookings are cancelled or amended at your request, Ascent Jet SA reserves the right to charge all expenses related to the refund of your payment. If your booking is paid for with someone else's credit card, Ascent Jet SA may require you to provide written authorisation from the cardholder. Ascent Jet SA reserves the right to deliver transportation contracts, confirmations, booking forms and all other travel documents only to the billing address of your credit card if the card issuer so requires.</p>\r\n<p>It is essential that the billing address you give when you book is the same as the address for the card used to pay for it. If these two addresses are not the same, there may be an additional delay until such time as Ascent Jet SA is informed by you either of the new billing address, or of the new address for the payment card, such that these two addresses are the same. Furthermore, in an effort to minimise the effects of credit card fraud, we reserve the right to carry out random checks, including checks of the electoral roll, and may request you to either fax or post to us proof of your address and a copy of the credit card together with details of your bank account confirming the cardholder's first name and surname, as well as particulars of the bank issuing the card, before we issue a transportation contract.</p>\r\n<p>Taxes vary depending on exchange rates.</p>\r\n<p><strong>9. Use of the Site</strong></p>\r\n<p>The Site is provided on an "as is" and "as available" basis.</p>\r\n<p>Ascent Jet SA is in no event responsible if, due to Site maintenance operations or for reasons beyond its control, you cannot access the Site, or if such access is interrupted, at any time whatsoever, or if any fault beyond its control prevents an operation from being carried out. Ascent Jet SA makes no warranty that the Site is free from computer viruses or other anomalies beyond its control.</p>\r\n<p>&gt;<strong>10. Obligations of the User</strong></p>\r\n<p>You agree to be bound by the following obligations:</p>\r\n<p>a) You must be at least 18 years old and have the legal capacity to enter into contracts.</p>\r\n<p>b) You accept responsibility for all transactions carried out in your name or on your behalf, unless the transaction has been fraudulent, has resulted from computer fraud or from a technical fault for which Ascent Jet SA Limited is to blame.</p>\r\n<p>c) You guarantee that all information you provide about yourself or a member of your family is true and accurate.</p>\r\n<p>d) The Site must not be used for speculative, false or fraudulent bookings.</p>\r\n<p>e) The transmission of threatening, defamatory, pornographic, political or racist material or, in general, any material that is unlawful is expressly prohibited.</p>\r\n<p>f) You may not modify, copy, transmit, distribute, sell, display, license or reproduce, in any manner whatsoever, the Site or any content thereof, although you can make a copy of the information contained on the Site for your own personnel and private use.</p>\r\n<p><strong>11. Denial of access</strong></p>\r\n<p>Ascent Jet SA reserves the right to deny access to the Site in the event of fraudulent use or use contrary to the Terms and Conditions, at any time without prior notice.</p>\r\n<p><strong>12. Links to other web sites</strong></p>\r\n<p>The Site may contain links to other web sites operated and administered by third parties. Ascent Jet SA cannot guarantee the legality, accuracy, exhaustiveness or quality of the information contained on them. However, Ascent Jet SA undertakes to remove any link to such other third party sites immediately if it learns that they are manifestly illegal, inaccurate or inadequate.</p>\r\n<p><strong>13. Responsibility of Ascent Jet SA</strong></p>\r\n<p>Unless provided otherwise by mandatory legal requirements, Ascent Jet SA may not be held responsible for any error attributable to a Travel Provider, or failure to provide a service due to an error by you.</p>\r\n<p>Ascent Jet SA may in no event be held responsible for any non-fulfilment attributable to the buyer, to a third party not involved in providing the services or to an event of force majeure.</p>\r\n<p><strong>14. Force Majeure</strong></p>\r\n<p>Ascent Jet SA will not be responsible for the non-fulfilment of any obligation under these Terms and Conditions if such non-fulfilment results from an event of force majeure. An event of force majeure is any unforeseen and insurmountable event beyond the control of Ascent Jet SA making it impossible to execute the obligations of the contract. In particular, orders by government authorities, wars, demonstrations, floods, accidents, storms and adverse weather conditions, strikes, closures of establishments, terrorist attacks, industrial action, mechanical failure affecting Ascent Jet SA, its suppliers or service providers will be considered as events of force majeure.</p>\r\n<p>If you choose to contract for a charter flight through this Site, the flight will be conducted by a licensed charter operator. Ascent Jet SA will have no role in, responsibility for, or liability for the operation, regulation or safety of the flight, all of which shall reside with the charter operator. The charter operator will be in complete charge and operational control of the aircraft at all times.</p>\r\n<p>If in the charter operator's view, or that of the Pilot In Command, flight safety may be at risk, the charter operator may terminate a flight or refuse to commence it without any consequential or incidental liability (which you hereby expressly waive) to charter operator or Ascent Jet SA for loss, injury, damage or delay occasioned by such termination or refusal. Ascent Jet SA nor the Charter Operator shall be liable for delay, cancellation or failure to furnish any transportation pursuant to this Agreement when caused by events of force majeure, or any cause beyond their respective reasonable control.</p>\r\n<p><strong>15. Intellectual property</strong></p>\r\n<p>The entire Site content and all intellectual property rights related therewith belong to Ascent Jet SA, its affiliated companies or partners. The name Ascent Jet SA and all other trade marks, logos and representations of Ascent Jet SA displayed on the Site are registered trade marks of Ascent Jet SA or its affiliated companies.</p>\r\n<p>You are not granted any right to the content or the intellectual property rights of the Site, which remain the exclusive property of Ascent Jet SA, its affiliated companies or partners.</p>\r\n<p>All insertions of hypertext links to the Site must be approved beforehand in writing by Ascent Jet SA.</p>\r\n<p>Legal proceedings may be brought against anyone making unauthorised use of all or part of the contents of the Site and of the intellectual property rights related therewith.</p>\r\n<p><strong>16. Confidentiality Agreement</strong></p>\r\n<p>Your personal details are used by Ascent Jet SA and its affiliated companies in accordance with the terms of the Confidentiality Agreement accessible at all times on the Site.</p>\r\n<p>Ascent Jet SA undertakes to treat the data on its Customers with care and to comply with the data protection regulations.&nbsp; Ascent Jet SA only acquires, records and processes the data as required to fulfill its contractual obligations, provide customer services and ensure a high quality service.</p>\r\n<p>The customer authorizes Ascent Jet SA to process and use such data internally, in order to enable it to provide an optimum service and to infrom the Customer of current Ascent Jet SA offers.</p>\r\n<p>Under the Swiss Federal Data Protection Act of 24 March 2006, Customers are entitled to access, correct and remove data concerning them.&nbsp; If they wish to do this, Customers must contact Ascent Jet SA in writing be e-mail at: <a href="mailto:info@ascent-jet.com">info@ascentjet.com</a>, or by letter addressed to: Ascent Jet SA, 4, rue du Tir-au-Canon, 1227 Geneva, Switzerland, mentioning surname, first name, full address and customer number. &nbsp;&nbsp;&nbsp;&nbsp;</p>\r\n<p><strong>17. Security Agreement for secure payment</strong></p>\r\n<p>Ascent Jet SA uses secure technology to protect personal data and financial transactions. Ascent Jet SA complies with the security procedures and standards as stipulated in the Security Agreement.</p>\r\n<p>On-line payment by credit card is totally secure. The entire transaction is sent encrypted to a bank validation server in SSl (Secure Socket Layer) mode.</p>\r\n<p><strong>18. Amendments of the Terms and Conditions</strong></p>\r\n<p>Ascent Jet SA reserves the right to amend or update the present Terms and Conditions at any time without prior notice. The latest version of these Terms and Conditions is posted on the Site from the date on which an amendment takes effect. By continuing to use the Site after the Terms and Conditions have been amended, you accept such amendment, provided that the version of the Terms and Conditions applicable to your booking or purchase of a travel product or service through the Site is the version in force on the date of such booking or purchase.</p>\r\n<p><strong>19. Claims</strong></p>\r\n<p>All claims must be sent to Ascent Jet SA by recorded delivery letter within 30 days after the end of the journey in regard to which the claim is made, to the following addresses:</p>\r\n<p><strong>20. Legal information</strong></p>\r\n<p><strong>Ascent Jet SA</strong></p>\r\n<p>Entered in the Company Register of Geneva, Switzerland (No CH-660-2056006-1).</p>\r\n<p>e-mail: <a href="mailto:info@ascent-jet.com">info@ascentjet.com</a> (not to be used for claims)</p>\r\n<p>&nbsp;</p>	17		\N	1
8	Our unique booking system	Ascent Jet enables operators to make charter quotes directly to your log in area. You enter your itinerary, required aircraft category and any special requirements. You request for offer is then monitored by Ascent Jet and sent to those operators most likely to satisfy your request at the most competitive prices.   	<p>Unlike other on-line sites, there is no intermediate step in the quoting process for on.demand flights where a myriad of aircraft are displayed with prices indicated in advance of the actual quote and confirmation of availablity from the operators themselves. We display a starting price estimate at the time your request for offers is made, Then we leave it to the operators to make their definitive quotes which are sent directly to your log in area. You then select the offer you prefer and you can book your flight directly on-line.</p>\r\n<p>&nbsp;</p>	7		\N	2
11	The Ascent Jet Team	To be continued..	<p>To be continued...</p>	9		\N	1
12	News	To be continued...	<p>To be continued...</p>	10		\N	1
16	Cookies policy	Ascent Jet SA Cookies Policy	<p>We use cookies and similar tools across our websites to improve their performance and enhance your user experience. This policy explains how we do that.</p>\r\n<p><strong>What are cookies?</strong></p>\r\n<p>Cookies are small text files which a website may put on your computer or mobile device when you first visit a site or page. The cookie will help the website, or another website, to recognise your device the next time you visit. Web beacons or other similar files can also do the same thing. We use the term &ldquo;cookies&rdquo; in this policy to refer to all files that collect information in this way.<br />There are many functions cookies serve. For example, they can help us to remember your username and preferences,&nbsp; analyse how well our website is performing, or even allow us to recommend content we believe will be most relevant to you.<br />Certain cookies contain personal information &ndash; for example, if you click to &ldquo;remember me&rdquo; when logging in, a cookie will store your username. Most cookies won&rsquo;t collect information that identifies you, and will instead collect more general information such as how users arrive at and use our websites, or a user&rsquo;s general location.<br />What sort of cookies does the Ascent Jet Exchange use?<br />Generally, our cookies perform up to four different functions:</p>\r\n<p><strong>1. Essential cookies</strong></p>\r\n<p>Some cookies are essential for the operation of our website. For example, some cookies allow us to identify subscribers and ensure they can access the subscription only pages. If a subscriber opts to disable these cookies, the user will not be able to access all of the content that a subscription entitles them to.</p>\r\n<p><strong>2. Performance Cookies</strong></p>\r\n<p>We utilise other cookies to analyse how our visitors use our websites and to monitor website performance. This allows us to provide a high quality experience by customising our offering and quickly identifying and fixing any issues that arise. For example, we might use performance cookies to keep track of which pages are most popular, which method of linking between pages is most effective, and to determine why some pages are receiving error messages. We might also use these cookies to highlight articles or site services that we think will be of interest to you based on your usage of the website.</p>\r\n<p><strong>3. Functionality Cookies</strong></p>\r\n<p>We use functionality cookies to allow us to remember your preferences. For example, cookies save you the trouble of typing in your username every time you access the site, and recall your customisation preferences, such as which regional edition of the website you want to see when you log in. <br />We also use or allow third parties to serve cookies that fall into the four categories above. For example, like many companies, we use Google Analytics to help us monitor our website traffic. We may also use third party cookies to help us with market research, revenue tracking, improving site functionality and monitoring compliance with our terms and conditions and copyright policy.</p>\r\n<p><strong>Can a website user block cookies?</strong></p>\r\n<p>As we&rsquo;ve explained above, cookies help you to get the most out of our websites. <br />The first time you accessed our website after 18th February 2013, you should have seen an overlay which explained that by continuing to access our site, you are consenting to our use of cookies.<br />Please remember that if you do choose to disable cookies, you may find that certain sections of our website do not work properly</p>\r\n<p><strong>More Information</strong></p>\r\n<p>More detail on how businesses use cookies is available at www.allaboutcookies.org.<br />If you have any queries regarding this Cookie Policy please contact us by e-mail at info@ascentjet.com</p>\r\n<p>&nbsp;</p>	19		\N	3
15	Privacy Policy	Ascent Jet SA privacy policy	<p>Ascent Jet takes the privacy of its users seriously. We are committed to safeguarding the privacy of our users while providing a personalised and valuable service. This Privacy Policy statement explains the data processing practices of Ascent Jet. If you have any requests concerning your personal information or any queries with regard to these practices please contact us by e-mail at info@ascentjet.com.</p>\r\n<p>Our sites contain links to third party sites which are not subject to this privacy policy. We recommend that you read the privacy policy of any such sites that you visit.</p>\r\n<p><strong>Information Collected&nbsp;</strong>&nbsp; &nbsp;</p>\r\n<p>We collect personally identifiable information about you (your "Data") through:</p>\r\n<p>The use of enquiry and registration forms.<br />Your purchase by the chartered flight operator of any products or services.<br />The provision of your details to us either online or offline.<br />We may also collect information that we request from you regarding your use of our service or that we collect automatically about your visit to our sites. Please see our Cookies Policy for more details.</p>\r\n<p><strong>Use and Disclosure of Personal Information</strong></p>\r\n<p>We use your Data for purposes which may include:</p>\r\n<p>Providing our users with a personalised service.<br />Processing orders, registrations and enquiries.<br />Conducting market research surveys.<br />Allowing users to participate in interactive features of our service, where they choose to do so.<br />Providing you with information about products and services we offer (if you agree to receive such information)<br />Sharing your Data with third party organisations who offer products or services which we feel may be of interest to you (if you agree to receive such information) <br />Sonitoring compliance with our Terms and Conditions</p>\r\n<p>See our Cookies Policy for more details.</p>\r\n<p><strong>Use of Cookies and Other Tracking Devices</strong></p>\r\n<p>Please refer to our Cookies Policy.</p>\r\n<p><strong>Security Policy</strong></p>\r\n<p>Ascent Jet businesses have appropriate measures in place to ensure that our users&rsquo; Data is protected against unauthorised access or use, alteration, unlawful or accidental destruction and accidental loss. User Data may be transferred outside Ascent Jet to data processors such as fulfillment houses but they will act only on our instructions to provide the services required.</p>\r\n<p><strong>Transfer of Data</strong></p>\r\n<p>The Internet is a global environment. Using the Internet to collect and process personal data necessarily involves the transmission of data on an international basis. Therefore, by browsing Ascent Jet site and communicating electronically with us you acknowledge and agree to our processing of personal data in this way. By agreeing to our transfer of your Data to third party organisations for them to send you details of products and services offered (as detailed above) you are deemed to provide your consent to any transfer of your Data to organisations based outside the European Economic Area.</p>\r\n<p><strong>User Access and Control of Data</strong></p>\r\n<p>If you wish to amend any of the Data which we hold about you, or update your datas, please contact info@ascentjet.com or visit the &ldquo;Contact&rdquo; or &ldquo;Your personal details &ldquo;section of our website<br /><br /><strong>Changes to this Policy</strong></p>\r\n<p>This policy is effective from 1st march 2012. From time to time we may make changes to this privacy policy statement to reflect any changes to our privacy practices in accordance with changes to legislation, best practice or website enhancements.<br /><br /></p>	18		\N	2
17	Introduction	The Ascent Jet General Terms of Use covers a wide range of conditions and policies designed to protect you as a consumer and those operators that are included on file and who may be solicited by you to offer their services. They also serve to clarify the role of Ascent Jet where this platform is used as an intermediary to solicit services from our participating operators.  \r\n	<p>The Ascent Jet terms and conditions, cookies and privacy policies are included in this section.</p>\r\n<p>Ascent Jet does not, through the use of this platform, act as a dealer or merchant whereby a sales contract is concluded directly between Ascent Jet and the end client. This platform serves to facilitate the solicitation of offers for charter flights and ancillary services from qualified operators.</p>\r\n<p>To this end, Ascent Jet enables operators to make offers directly to users of this platform directly in their log in areas icluding out booking fee and credit card surcharge if applicable.</p>\r\n<p>All operators accompany their terms and conditions with their offers, and must be accepted prior to making a flight booking. These are the terms and conditions that govern each transaction.<br />&nbsp;&nbsp;&nbsp; &nbsp;<br />Ascent Jet services as an intermediary to collect payment for flights and ancillary services purchased by users on behalf of operators and remits such funds to the operators prior to any flight taking off. Users funds are paid into a client account at the UBS bank in Switzerland. Where credit card payments are made, these are verified by Datatrans (the leading Swiss payment service provider) and funds are credited to the same UBS client account.&nbsp; &nbsp;</p>	20		\N	1
\.


--
-- Name: structure_article_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ascent_jet
--

SELECT pg_catalog.setval('structure_article_id_seq', 17, true);


--
-- Data for Name: structure_footergroup; Type: TABLE DATA; Schema: public; Owner: ascent_jet
--

COPY structure_footergroup (id, title) FROM stdin;
1	Flying Privately
2	Why Ascent Jet
3	About us
\.


--
-- Name: structure_footergroup_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ascent_jet
--

SELECT pg_catalog.setval('structure_footergroup_id_seq', 3, true);


--
-- Data for Name: structure_node; Type: TABLE DATA; Schema: public; Owner: ascent_jet
--

COPY structure_node (id, name, slug, visible, "order", lft, rght, tree_id, level, parent_id, footer_group_id, footer_group_order, image_id, include_airplanes) FROM stdin;
6	Empty legs	flying-privately/empty-legs	t	2	4	5	5	1	2	1	2	87	f
21	The Ascent Jet Difference	why-ascent-jet/the-ascent-jet-difference	t	1	2	3	6	1	3	2	1	90	f
7	Our unique booking system	why-ascent-jet/our-unique-booking-system	t	2	4	5	6	1	3	2	2	90	f
15	Pricing and payment	why-ascent-jet/pricing-and-payment	t	3	6	7	6	1	3	2	3	90	f
16	Safety	why-ascent-jet/safety	t	4	8	9	6	1	3	2	4	90	f
22	Company Information	about-us/company-information	t	1	2	3	7	1	4	3	1	94	f
9	The Ascent Jet team	about-us/the-ascent-jet-team	t	2	6	7	7	1	4	3	2	94	f
10	News	about-us/news	t	3	8	9	7	1	4	3	3	94	f
13	Contact	about-us/contact	t	4	10	11	7	1	4	3	4	94	f
5	A guide to flying privately	flying-privately/a-guide-to-flying-privately	t	1	2	3	5	1	2	1	1	87	t
1	GET A QUOTE	get-a-quote	t	1	1	2	1	0	\N	\N	1	\N	f
14	LEGAL	legal	f	1	1	10	4	0	\N	\N	1	\N	f
20	Introduction	legal/introduction	t	1	2	3	4	1	14	\N	1	\N	f
17	Terms and conditions	legal/terms-and-conditions	t	2	4	5	4	1	14	\N	2	\N	f
19	Cookies policy	legal/cookies-policy	t	4	8	9	4	1	14	\N	4	\N	f
18	Privacy policy	legal/privacy-policy	t	3	6	7	4	1	14	\N	3	\N	f
2	FLYING PRIVATELY	flying-privately	t	2	1	6	5	0	\N	\N	2	3	f
3	WHY ASCENT JET	why-ascent-jet	t	3	1	10	6	0	\N	\N	3	\N	f
4	ABOUT US	about-us	t	4	1	12	7	0	\N	\N	4	\N	f
\.


--
-- Name: structure_node_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ascent_jet
--

SELECT pg_catalog.setval('structure_node_id_seq', 23, true);


--
-- Name: airplanes_airplane_pkey; Type: CONSTRAINT; Schema: public; Owner: ascent_jet; Tablespace: 
--

ALTER TABLE ONLY airplanes_airplane
    ADD CONSTRAINT airplanes_airplane_pkey PRIMARY KEY (id);


--
-- Name: airplanes_airplanecategory_pkey; Type: CONSTRAINT; Schema: public; Owner: ascent_jet; Tablespace: 
--

ALTER TABLE ONLY airplanes_airplanecategory
    ADD CONSTRAINT airplanes_airplanecategory_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: ascent_jet; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: ascent_jet; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_key UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: ascent_jet; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: ascent_jet; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_codename_key; Type: CONSTRAINT; Schema: public; Owner: ascent_jet; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_key UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: ascent_jet; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: ascent_jet; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_user_id_group_id_key; Type: CONSTRAINT; Schema: public; Owner: ascent_jet; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_key UNIQUE (user_id, group_id);


--
-- Name: auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: ascent_jet; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: ascent_jet; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_user_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: ascent_jet; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_key UNIQUE (user_id, permission_id);


--
-- Name: auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: ascent_jet; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: common_homepageimage_pkey; Type: CONSTRAINT; Schema: public; Owner: ascent_jet; Tablespace: 
--

ALTER TABLE ONLY common_homepageimage
    ADD CONSTRAINT common_homepageimage_pkey PRIMARY KEY (image_ptr_id);


--
-- Name: common_image_pkey; Type: CONSTRAINT; Schema: public; Owner: ascent_jet; Tablespace: 
--

ALTER TABLE ONLY common_image
    ADD CONSTRAINT common_image_pkey PRIMARY KEY (id);


--
-- Name: common_snippet_pkey; Type: CONSTRAINT; Schema: public; Owner: ascent_jet; Tablespace: 
--

ALTER TABLE ONLY common_snippet
    ADD CONSTRAINT common_snippet_pkey PRIMARY KEY (id);


--
-- Name: contact_contact_pkey; Type: CONSTRAINT; Schema: public; Owner: ascent_jet; Tablespace: 
--

ALTER TABLE ONLY contact_contact
    ADD CONSTRAINT contact_contact_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: ascent_jet; Tablespace: 
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type_app_label_45f3b1d93ec8c61c_uniq; Type: CONSTRAINT; Schema: public; Owner: ascent_jet; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_45f3b1d93ec8c61c_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: ascent_jet; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: ascent_jet; Tablespace: 
--

ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: ascent_jet; Tablespace: 
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: structure_article_pkey; Type: CONSTRAINT; Schema: public; Owner: ascent_jet; Tablespace: 
--

ALTER TABLE ONLY structure_article
    ADD CONSTRAINT structure_article_pkey PRIMARY KEY (id);


--
-- Name: structure_footergroup_pkey; Type: CONSTRAINT; Schema: public; Owner: ascent_jet; Tablespace: 
--

ALTER TABLE ONLY structure_footergroup
    ADD CONSTRAINT structure_footergroup_pkey PRIMARY KEY (id);


--
-- Name: structure_node_pkey; Type: CONSTRAINT; Schema: public; Owner: ascent_jet; Tablespace: 
--

ALTER TABLE ONLY structure_node
    ADD CONSTRAINT structure_node_pkey PRIMARY KEY (id);


--
-- Name: structure_node_slug_key; Type: CONSTRAINT; Schema: public; Owner: ascent_jet; Tablespace: 
--

ALTER TABLE ONLY structure_node
    ADD CONSTRAINT structure_node_slug_key UNIQUE (slug);


--
-- Name: airplanes_airplane_111e82d6; Type: INDEX; Schema: public; Owner: ascent_jet; Tablespace: 
--

CREATE INDEX airplanes_airplane_111e82d6 ON airplanes_airplane USING btree (outer_image_id);


--
-- Name: airplanes_airplane_3d7ab501; Type: INDEX; Schema: public; Owner: ascent_jet; Tablespace: 
--

CREATE INDEX airplanes_airplane_3d7ab501 ON airplanes_airplane USING btree (layout_image_id);


--
-- Name: airplanes_airplane_76ac2d81; Type: INDEX; Schema: public; Owner: ascent_jet; Tablespace: 
--

CREATE INDEX airplanes_airplane_76ac2d81 ON airplanes_airplane USING btree (inner_image_id);


--
-- Name: airplanes_airplane_b583a629; Type: INDEX; Schema: public; Owner: ascent_jet; Tablespace: 
--

CREATE INDEX airplanes_airplane_b583a629 ON airplanes_airplane USING btree (category_id);


--
-- Name: airplanes_airplanecategory_f33175e6; Type: INDEX; Schema: public; Owner: ascent_jet; Tablespace: 
--

CREATE INDEX airplanes_airplanecategory_f33175e6 ON airplanes_airplanecategory USING btree (image_id);


--
-- Name: auth_group_permissions_0e939a4f; Type: INDEX; Schema: public; Owner: ascent_jet; Tablespace: 
--

CREATE INDEX auth_group_permissions_0e939a4f ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_8373b171; Type: INDEX; Schema: public; Owner: ascent_jet; Tablespace: 
--

CREATE INDEX auth_group_permissions_8373b171 ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_417f1b1c; Type: INDEX; Schema: public; Owner: ascent_jet; Tablespace: 
--

CREATE INDEX auth_permission_417f1b1c ON auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_0e939a4f; Type: INDEX; Schema: public; Owner: ascent_jet; Tablespace: 
--

CREATE INDEX auth_user_groups_0e939a4f ON auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_e8701ad4; Type: INDEX; Schema: public; Owner: ascent_jet; Tablespace: 
--

CREATE INDEX auth_user_groups_e8701ad4 ON auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_8373b171; Type: INDEX; Schema: public; Owner: ascent_jet; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_8373b171 ON auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_e8701ad4; Type: INDEX; Schema: public; Owner: ascent_jet; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_e8701ad4 ON auth_user_user_permissions USING btree (user_id);


--
-- Name: django_admin_log_417f1b1c; Type: INDEX; Schema: public; Owner: ascent_jet; Tablespace: 
--

CREATE INDEX django_admin_log_417f1b1c ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_e8701ad4; Type: INDEX; Schema: public; Owner: ascent_jet; Tablespace: 
--

CREATE INDEX django_admin_log_e8701ad4 ON django_admin_log USING btree (user_id);


--
-- Name: django_session_de54fa62; Type: INDEX; Schema: public; Owner: ascent_jet; Tablespace: 
--

CREATE INDEX django_session_de54fa62 ON django_session USING btree (expire_date);


--
-- Name: structure_article_c693ebc8; Type: INDEX; Schema: public; Owner: ascent_jet; Tablespace: 
--

CREATE INDEX structure_article_c693ebc8 ON structure_article USING btree (node_id);


--
-- Name: structure_article_f33175e6; Type: INDEX; Schema: public; Owner: ascent_jet; Tablespace: 
--

CREATE INDEX structure_article_f33175e6 ON structure_article USING btree (image_id);


--
-- Name: structure_node_3cfbd988; Type: INDEX; Schema: public; Owner: ascent_jet; Tablespace: 
--

CREATE INDEX structure_node_3cfbd988 ON structure_node USING btree (rght);


--
-- Name: structure_node_656442a0; Type: INDEX; Schema: public; Owner: ascent_jet; Tablespace: 
--

CREATE INDEX structure_node_656442a0 ON structure_node USING btree (tree_id);


--
-- Name: structure_node_6be37982; Type: INDEX; Schema: public; Owner: ascent_jet; Tablespace: 
--

CREATE INDEX structure_node_6be37982 ON structure_node USING btree (parent_id);


--
-- Name: structure_node_7c1e587f; Type: INDEX; Schema: public; Owner: ascent_jet; Tablespace: 
--

CREATE INDEX structure_node_7c1e587f ON structure_node USING btree (footer_group_id);


--
-- Name: structure_node_c9e9a848; Type: INDEX; Schema: public; Owner: ascent_jet; Tablespace: 
--

CREATE INDEX structure_node_c9e9a848 ON structure_node USING btree (level);


--
-- Name: structure_node_caf7cc51; Type: INDEX; Schema: public; Owner: ascent_jet; Tablespace: 
--

CREATE INDEX structure_node_caf7cc51 ON structure_node USING btree (lft);


--
-- Name: structure_node_f33175e6; Type: INDEX; Schema: public; Owner: ascent_jet; Tablespace: 
--

CREATE INDEX structure_node_f33175e6 ON structure_node USING btree (image_id);


--
-- Name: a_category_id_4683f0c07bc2730e_fk_airplanes_airplanecategory_id; Type: FK CONSTRAINT; Schema: public; Owner: ascent_jet
--

ALTER TABLE ONLY airplanes_airplane
    ADD CONSTRAINT a_category_id_4683f0c07bc2730e_fk_airplanes_airplanecategory_id FOREIGN KEY (category_id) REFERENCES airplanes_airplanecategory(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: airplanes_a_layout_image_id_40952a1f58fec1e2_fk_common_image_id; Type: FK CONSTRAINT; Schema: public; Owner: ascent_jet
--

ALTER TABLE ONLY airplanes_airplane
    ADD CONSTRAINT airplanes_a_layout_image_id_40952a1f58fec1e2_fk_common_image_id FOREIGN KEY (layout_image_id) REFERENCES common_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: airplanes_ai_inner_image_id_3f8591928e24ca4d_fk_common_image_id; Type: FK CONSTRAINT; Schema: public; Owner: ascent_jet
--

ALTER TABLE ONLY airplanes_airplane
    ADD CONSTRAINT airplanes_ai_inner_image_id_3f8591928e24ca4d_fk_common_image_id FOREIGN KEY (inner_image_id) REFERENCES common_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: airplanes_ai_outer_image_id_52854f55d5f0c28a_fk_common_image_id; Type: FK CONSTRAINT; Schema: public; Owner: ascent_jet
--

ALTER TABLE ONLY airplanes_airplane
    ADD CONSTRAINT airplanes_ai_outer_image_id_52854f55d5f0c28a_fk_common_image_id FOREIGN KEY (outer_image_id) REFERENCES common_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: airplanes_airplane_image_id_163095b3eb6a5500_fk_common_image_id; Type: FK CONSTRAINT; Schema: public; Owner: ascent_jet
--

ALTER TABLE ONLY airplanes_airplanecategory
    ADD CONSTRAINT airplanes_airplane_image_id_163095b3eb6a5500_fk_common_image_id FOREIGN KEY (image_id) REFERENCES common_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_content_type_id_508cf46651277a81_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: ascent_jet
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_content_type_id_508cf46651277a81_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissio_group_id_689710a9a73b7457_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: ascent_jet
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_group_id_689710a9a73b7457_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: ascent_jet
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user__permission_id_384b62483d7071f0_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: ascent_jet
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user__permission_id_384b62483d7071f0_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_group_id_33ac548dcf5f8e37_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: ascent_jet
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_33ac548dcf5f8e37_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_user_id_4b5ed4ffdb8fd9b0_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ascent_jet
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_4b5ed4ffdb8fd9b0_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permiss_user_id_7f0938558328534a_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ascent_jet
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permiss_user_id_7f0938558328534a_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: common_homepag_image_ptr_id_31b7f044e97f8d9e_fk_common_image_id; Type: FK CONSTRAINT; Schema: public; Owner: ascent_jet
--

ALTER TABLE ONLY common_homepageimage
    ADD CONSTRAINT common_homepag_image_ptr_id_31b7f044e97f8d9e_fk_common_image_id FOREIGN KEY (image_ptr_id) REFERENCES common_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: common_snippet_image_id_246aaa16a7404cd7_fk_common_image_id; Type: FK CONSTRAINT; Schema: public; Owner: ascent_jet
--

ALTER TABLE ONLY common_snippet
    ADD CONSTRAINT common_snippet_image_id_246aaa16a7404cd7_fk_common_image_id FOREIGN KEY (image_id) REFERENCES common_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: djan_content_type_id_697914295151027a_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: ascent_jet
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT djan_content_type_id_697914295151027a_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_user_id_52fdd58701c5f563_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ascent_jet
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_52fdd58701c5f563_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: st_footer_group_id_41309c2f9caea6f5_fk_structure_footergroup_id; Type: FK CONSTRAINT; Schema: public; Owner: ascent_jet
--

ALTER TABLE ONLY structure_node
    ADD CONSTRAINT st_footer_group_id_41309c2f9caea6f5_fk_structure_footergroup_id FOREIGN KEY (footer_group_id) REFERENCES structure_footergroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: structure_article_image_id_40e923d742dbe94f_fk_common_image_id; Type: FK CONSTRAINT; Schema: public; Owner: ascent_jet
--

ALTER TABLE ONLY structure_article
    ADD CONSTRAINT structure_article_image_id_40e923d742dbe94f_fk_common_image_id FOREIGN KEY (image_id) REFERENCES common_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: structure_article_node_id_44ff211519369589_fk_structure_node_id; Type: FK CONSTRAINT; Schema: public; Owner: ascent_jet
--

ALTER TABLE ONLY structure_article
    ADD CONSTRAINT structure_article_node_id_44ff211519369589_fk_structure_node_id FOREIGN KEY (node_id) REFERENCES structure_node(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: structure_node_image_id_73dbddfc6e01c380_fk_common_image_id; Type: FK CONSTRAINT; Schema: public; Owner: ascent_jet
--

ALTER TABLE ONLY structure_node
    ADD CONSTRAINT structure_node_image_id_73dbddfc6e01c380_fk_common_image_id FOREIGN KEY (image_id) REFERENCES common_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: structure_node_parent_id_46e01b2796a57120_fk_structure_node_id; Type: FK CONSTRAINT; Schema: public; Owner: ascent_jet
--

ALTER TABLE ONLY structure_node
    ADD CONSTRAINT structure_node_parent_id_46e01b2796a57120_fk_structure_node_id FOREIGN KEY (parent_id) REFERENCES structure_node(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

