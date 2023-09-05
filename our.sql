--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:dwntvCikhcgm+sVYhrf+LQ==$WgjNi/XGYPnR2s5c9WA1U1S+zNWP5p3Fd6mVkjyPQt8=:oPEE0hBGZWL2VRB8M11bGYCmOESelT6lHbkfNsjJ2lg=';






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

-- Dumped from database version 14.8 (Ubuntu 14.8-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.8 (Ubuntu 14.8-0ubuntu0.22.04.1)

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
-- PostgreSQL database dump complete
--

--
-- Database "aalbot" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 14.8 (Ubuntu 14.8-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.8 (Ubuntu 14.8-0ubuntu0.22.04.1)

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
-- Name: aalbot; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE aalbot WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'C.UTF-8';


ALTER DATABASE aalbot OWNER TO postgres;

\connect aalbot

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
-- Name: post; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.post (
    id integer NOT NULL,
    name character varying(777) NOT NULL,
    email character varying(777) NOT NULL,
    course character varying(777) NOT NULL,
    phone character varying(777) NOT NULL,
    message character varying(777) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.post OWNER TO postgres;

--
-- Name: post_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.post_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.post_id_seq OWNER TO postgres;

--
-- Name: post_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.post_id_seq OWNED BY public.post.id;


--
-- Name: post id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post ALTER COLUMN id SET DEFAULT nextval('public.post_id_seq'::regclass);


--
-- Data for Name: post; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.post (id, name, email, course, phone, message, created_at) FROM stdin;
1	acas	nidheeshchandran551@gmail.com	ac	Application And Web Development	aca	2023-08-05 15:01:43.649231+00
\.


--
-- Name: post_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.post_id_seq', 4, true);


--
-- Name: post post_course_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post
    ADD CONSTRAINT post_course_key UNIQUE (course);


--
-- Name: post post_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post
    ADD CONSTRAINT post_email_key UNIQUE (email);


--
-- Name: post post_message_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post
    ADD CONSTRAINT post_message_key UNIQUE (message);


--
-- Name: post post_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post
    ADD CONSTRAINT post_name_key UNIQUE (name);


--
-- Name: post post_phone_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post
    ADD CONSTRAINT post_phone_key UNIQUE (phone);


--
-- Name: post post_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post
    ADD CONSTRAINT post_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

--
-- Database "library" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 14.8 (Ubuntu 14.8-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.8 (Ubuntu 14.8-0ubuntu0.22.04.1)

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
-- Name: library; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE library WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'C.UTF-8';


ALTER DATABASE library OWNER TO postgres;

\connect library

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
-- Name: books; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.books (
    id integer NOT NULL,
    title character varying(255),
    isbn character varying(255),
    author character varying(255),
    descrption character varying(9955),
    publisher character varying(255),
    amount character varying(255),
    bisac character varying(255),
    quantity character varying(255),
    category character varying(255),
    language character varying(255),
    publish_year character varying(255),
    image_path character varying(255),
    image_path2 character varying(255),
    created_by character varying(255),
    app_id character varying(255),
    is_deleted character varying(255) DEFAULT '0'::character varying,
    user_perm character varying(255) DEFAULT '0'::character varying,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    book_language character varying(255)
);


ALTER TABLE public.books OWNER TO postgres;

--
-- Name: books_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.books_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.books_id_seq OWNER TO postgres;

--
-- Name: books_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.books_id_seq OWNED BY public.books.id;


--
-- Name: cart; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cart (
    id integer NOT NULL,
    date character varying(255),
    user_fkey integer,
    book_fkey integer,
    created_by character varying(255),
    app_id character varying(255),
    is_deleted character varying(255) DEFAULT '0'::character varying,
    user_perm character varying(255) DEFAULT '0'::character varying,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.cart OWNER TO postgres;

--
-- Name: cart_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cart_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cart_id_seq OWNER TO postgres;

--
-- Name: cart_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cart_id_seq OWNED BY public.cart.id;


--
-- Name: update; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.update (
    id integer NOT NULL,
    topicname character varying(777) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.update OWNER TO postgres;

--
-- Name: update_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.update_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.update_id_seq OWNER TO postgres;

--
-- Name: update_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.update_id_seq OWNED BY public.update.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    email character varying(128) NOT NULL,
    password character varying(128) NOT NULL,
    flag character varying(255),
    key character varying(255),
    json character varying(999999),
    created_date timestamp without time zone,
    modified_date timestamp without time zone,
    username character varying(255),
    phone character varying(255),
    is_deleted character varying(255) DEFAULT '0'::character varying
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: books id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.books ALTER COLUMN id SET DEFAULT nextval('public.books_id_seq'::regclass);


--
-- Name: cart id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart ALTER COLUMN id SET DEFAULT nextval('public.cart_id_seq'::regclass);


--
-- Name: update id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.update ALTER COLUMN id SET DEFAULT nextval('public.update_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: books; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.books (id, title, isbn, author, descrption, publisher, amount, bisac, quantity, category, language, publish_year, image_path, image_path2, created_by, app_id, is_deleted, user_perm, created_at, updated_at, book_language) FROM stdin;
1	Casinova	\N	Adithyan U	good book for learners empoverment	Owner club	\N	\N	\N	horror	\N	\N	https://img.freepik.com/free-vector/abstract-elegant-winter-book-cover_23-2148798745.jpg?w=2000	https://i.pinimg.com/originals/b0/f5/32/b0f532a1ac0e95549f57869199b73647.jpg	100315714	\N	0	0	2023-08-05 11:50:12.883527+00	2023-08-05 11:50:12.883527+00	\N
3	dzvzc	xcxc	xxcx 	\N	fgfdg	123132	xcx	2	Fiction	\N	1213	https://img.freepik.com/free-vector/abstract-elegant-winter-book-cover_23-2148798745.jpg?w=2000	https://i.pinimg.com/originals/b0/f5/32/b0f532a1ac0e95549f57869199b73647.jpg	\N	\N	0	0	2023-08-08 10:51:10.499414+00	2023-08-08 10:51:10.499414+00	dsfgfg
4	fss	sgf	fhf	\N	gchg	2	rgfsg	2	Crime	\N	122	https://img.freepik.com/free-vector/abstract-elegant-winter-book-cover_23-2148798745.jpg?w=2000	https://i.pinimg.com/originals/b0/f5/32/b0f532a1ac0e95549f57869199b73647.jpg	100191415	\N	0	0	2023-08-08 10:52:16.850632+00	2023-08-08 10:52:16.850632+00	ghgf
2	dzvzc	xcxc	xxcx 	\N	fgfdg	123132	xcx	2	Fiction	\N	1213	https://img.freepik.com/free-vector/abstract-elegant-winter-book-cover_23-2148798745.jpg?w=2000	https://i.pinimg.com/originals/b0/f5/32/b0f532a1ac0e95549f57869199b73647.jpg	\N	\N	1	0	2023-08-08 10:51:01.116885+00	2023-08-08 10:51:01.116885+00	dsfgfg
5	balyakalsakhi	123111	vaikom muhammed basheer	\N	kk books	1200	22w2	2	Crime	\N	1978	http://16.171.136.30:3000/t1-front.jpg.jpg	http://16.171.136.30:3000/t1-back.jpg.jpg	100444063	\N	0	0	2023-08-09 07:32:45.199232+00	2023-08-09 07:32:45.199232+00	malayalam
\.


--
-- Data for Name: cart; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cart (id, date, user_fkey, book_fkey, created_by, app_id, is_deleted, user_perm, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: update; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.update (id, topicname, created_at) FROM stdin;
1	/SELECT/-BLU-/FROM/BOOKS	2023-08-05 11:19:20.725319+00
26	/SELECT/title,author,publisher,isbn,bisac,amount,category,quantity/FROM/books/ORDER/BY/books-BLUBLUBLU-id/where/is_deleted=§0§;	2023-08-08 10:58:38.918668+00
9	/SELECT/title,author,publisher,isbn,bisac,amount,category,quantity/FROM/book/ORDER/BY/book-BLUBLUBLU-id;	2023-08-08 10:08:41+00
10	/SELECT/title,author,publisher,isbn,bisac,amount,category,quantity/FROM/books/ORDER/BY/book-BLUBLUBLU-id;	2023-08-08 10:10:39.876104+00
35	/SELECT/title,author,publisher,image_path,image_path2,amount,category,quantity/FROM/books/where/is_deleted=§0§/ORDER/BY/books-BLUBLUBLU-id/;	2023-08-09 07:30:48+00
27	/SELECT/title,author,publisher,isbn,bisac,amount,category,quantity/FROM/books/where/is_deleted=§0§/ORDER/BY/books-BLUBLUBLU-id/;	2023-08-08 12:54:43+00
8	/select/user_name,phone_no,privilege,address/from/users/where/is_deleted/=/§0§/order/by/id;	2023-08-09 07:42:16+00
2	/SELECT/-BLU-/FROM/BOOKS/;	2023-08-09 07:42:43+00
14	/SELECT/title,author,publisher,isbn,bisac,amount,category,quantity/FROM/books/ORDER/BY/books-BLUBLUBLU-id;	2023-08-08 11:02:17+00
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, email, password, flag, key, json, created_date, modified_date, username, phone, is_deleted) FROM stdin;
\.


--
-- Name: books_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.books_id_seq', 5, true);


--
-- Name: cart_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cart_id_seq', 1, false);


--
-- Name: update_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.update_id_seq', 46, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 1, false);


--
-- Name: books books_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_pkey PRIMARY KEY (id);


--
-- Name: cart cart_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT cart_pkey PRIMARY KEY (id);


--
-- Name: update update_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.update
    ADD CONSTRAINT update_pkey PRIMARY KEY (id);


--
-- Name: update update_topicname_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.update
    ADD CONSTRAINT update_topicname_key UNIQUE (topicname);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: cart cart_book_fkey_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT cart_book_fkey_fkey FOREIGN KEY (book_fkey) REFERENCES public.books(id);


--
-- Name: cart cart_user_fkey_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT cart_user_fkey_fkey FOREIGN KEY (user_fkey) REFERENCES public.users(id);


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

-- Dumped from database version 14.8 (Ubuntu 14.8-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.8 (Ubuntu 14.8-0ubuntu0.22.04.1)

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
-- Name: keymeta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.keymeta (
    id integer NOT NULL,
    instance character varying(255),
    db character varying(255),
    key character varying(255),
    user_f_key character varying(255),
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.keymeta OWNER TO postgres;

--
-- Name: keymeta_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.keymeta_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.keymeta_id_seq OWNER TO postgres;

--
-- Name: keymeta_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.keymeta_id_seq OWNED BY public.keymeta.id;


--
-- Name: t_e; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_e (
    docs text
);


ALTER TABLE public.t_e OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id uuid NOT NULL,
    email character varying(128) NOT NULL,
    password character varying(128) NOT NULL,
    created_date timestamp without time zone,
    modified_date timestamp without time zone
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: keymeta id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.keymeta ALTER COLUMN id SET DEFAULT nextval('public.keymeta_id_seq'::regclass);


--
-- Data for Name: keymeta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.keymeta (id, instance, db, key, user_f_key, created_at, updated_at) FROM stdin;
1	31	medi	8967\n	4f68604c-79bc-4946-9eba-6afb23bdf4bc	2023-07-24 11:13:52.978345+00	2023-07-24 11:13:52.978345+00
2	313	library	8955\n	27395bef-6051-4ea0-968f-0f18b98fec72	2023-07-24 12:52:29.642505+00	2023-07-24 12:52:29.642505+00
3	13	beta	22337	b44a16b0-e6ee-4c3c-b44a-c832109247e7	2023-07-24 12:54:40.319084+00	2023-07-24 12:54:40.319084+00
\.


--
-- Data for Name: t_e; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_e (docs) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, email, password, created_date, modified_date) FROM stdin;
4f68604c-79bc-4946-9eba-6afb23bdf4bc	medi@gmail.com	$2b$08$.oxG76rUpsFx5fMJ6wbixu1RqvKQq/M09OGf32I6ZWytV8uQd.cBe	2023-07-24 11:18:57.844	2023-07-24 11:18:57.845
27395bef-6051-4ea0-968f-0f18b98fec72	lib@gmail.com	$2b$08$JGYqvhM84Efpimpj7Nm5v.HVZ2VNrVKvFAVVFAjqzPT81rvk2dHjG	2023-07-24 11:28:11.083	2023-07-24 11:28:11.084
b44a16b0-e6ee-4c3c-b44a-c832109247e7	poweta@gmail.com	$2b$08$yWjy3jA1s5K/2GyHeXs0e.1hT1zn6wl6MFrXtK8TE1344FbWKbIyW	2023-07-24 12:59:41.378	2023-07-24 12:59:41.379
\.


--
-- Name: keymeta_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.keymeta_id_seq', 3, true);


--
-- Name: keymeta keymeta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.keymeta
    ADD CONSTRAINT keymeta_pkey PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

--
-- Database "readme_to_recover" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 14.8 (Ubuntu 14.8-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.8 (Ubuntu 14.8-0ubuntu0.22.04.1)

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
-- Name: readme_to_recover; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE readme_to_recover WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'C.UTF-8';


ALTER DATABASE readme_to_recover OWNER TO postgres;

\connect readme_to_recover

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
-- Name: readme; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.readme (
    text_field character varying(255)
);


ALTER TABLE public.readme OWNER TO postgres;

--
-- Data for Name: readme; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.readme (text_field) FROM stdin;
All your data is backed up. You must pay 0.01 BTC to 1GZvxFQ2emCxtUD8eBc3v1wzbUSPAm5d3T In 48 hours, your data will be publicly disclosed and deleted. (more information: go to https://cutt.ly/ewa61Iyf)
After paying send mail to us: rdatabase2319@onionmail.org and we will provide a link for you to download your data. Your DBCODE is: 6138446
\.


--
-- PostgreSQL database dump complete
--

--
-- Database "your_database_name" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 14.8 (Ubuntu 14.8-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.8 (Ubuntu 14.8-0ubuntu0.22.04.1)

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
-- Name: your_database_name; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE your_database_name WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'C.UTF-8';


ALTER DATABASE your_database_name OWNER TO postgres;

\connect your_database_name

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
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

