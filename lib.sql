--
-- PostgreSQL database dump
--

-- Dumped from database version 13.11 (Raspbian 13.11-0+deb11u1)
-- Dumped by pg_dump version 13.11 (Raspbian 13.11-0+deb11u1)

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
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    status character varying(255) DEFAULT 'pending'::character varying,
    remarks character varying(255),
    user_aproval character varying(255) DEFAULT '0'::character varying
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
    is_deleted character varying(255) DEFAULT '0'::character varying,
    created_by character varying(255),
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    privilage character varying(255) DEFAULT '0'::character varying
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
7	akashadeepam	121	vishaki		sf	222	341	450	Fiction	english	2022	http://16.171.136.30:3000/t1-front.jpg.jpg	http://16.171.136.30:3000/t1-back.jpg.jpg	100097527	\N	1	0	2023-08-10 21:55:34.203623+05:30	2023-08-10 21:55:34.203623+05:30	malyalam
9	sdd	12355	renum	\N	ddd	12212	45454	2	Crime	\N	2002	http://16.171.136.30:3000/t1-front.jpg.jpg	http://16.171.136.30:3000/t1-back.jpg.jpg	100638501	\N	1	0	2023-08-11 11:00:06.565326+05:30	2023-08-11 11:00:06.565326+05:30	malayalam
19	KSDVDS	SDVDSV	DVDV	\N	ZVZVZD	4545	DVDVD	56	Crime	\N	6564	http://16.171.136.30:3000/t1-front.jpg.jpg	http://16.171.136.30:3000/t1-back.jpg.jpg	100001594	\N	1	0	2023-08-11 20:03:09.23897+05:30	2023-08-11 20:03:09.23897+05:30	VDZV
11	kl	l;l;	kk	\N	kjkj	90090	klkl	09	Fiction	\N	889	http://16.171.136.30:3000/t1-front.jpg.jpg	http://16.171.136.30:3000/t1-back.jpg.jpg	100687471	\N	1	0	2023-08-11 17:12:36.835794+05:30	2023-08-11 17:12:36.835794+05:30	kllk
12	SFGSF	SDFFSDF	SFGF	\N	FGS	45453	SDFSFS	5453	Fiction	\N	5453	http://16.171.136.30:3000/t1-front.jpg.jpg	http://16.171.136.30:3000/t1-back.jpg.jpg	\N	\N	1	0	2023-08-11 18:44:12.606877+05:30	2023-08-11 18:44:12.606877+05:30	SFG
31	Indian Economy	9355324340	Ramesh Singh	Indian Economy by Ramesh Singh in its 15th edition has time and again proved to be instrumental in developing a fundamental and application-based understanding of economics	McGraw Hill	593		1	Fantasy	english	2023	http://16.171.136.30:3000/31-front.jpg.jpg	http://16.171.136.30:3000/31-back.jpg.jpg	100647925	\N	1	0	2023-08-24 22:39:15.967759+05:30	2023-08-24 22:39:15.967759+05:30	\N
4	fss	sgf	fhf	\N	gchg	2	rgfsg	2	Crime	\N	122	https://img.freepik.com/free-vector/abstract-elegant-winter-book-cover_23-2148798745.jpg?w=2000	https://i.pinimg.com/originals/b0/f5/32/b0f532a1ac0e95549f57869199b73647.jpg	100191415	\N	1	0	2023-08-08 16:22:16.850632+05:30	2023-08-08 16:22:16.850632+05:30	ghgf
14	KFK	ADFAFADSFASSA	XBFB		XCB	565	ASFASF57	56	Classic	mm	656	http://16.171.136.30:3000/t1-front.jpg.jpg	http://16.171.136.30:3000/t1-back.jpg.jpg	100059910	\N	1	0	2023-08-11 18:46:00.533389+05:30	2023-08-11 18:46:00.533389+05:30	XVBX
8	eecha	67t567	sfs	\N	kmlk	4242	23434	34	Fiction	\N	4343	http://16.171.136.30:3000/t1-front.jpg.jpg	http://16.171.136.30:3000/t1-back.jpg.jpg	100591884	\N	1	0	2023-08-10 22:02:38.633493+05:30	2023-08-10 22:02:38.633493+05:30	gel
20	THE ALCHEMIST	NBJNS	PAULO COELHO	BEAUTY	EDITORA	236	SWSNSWN	2	Fiction	ENGLISH	2016	http://16.171.136.30:3000/20-front.jpg.jpg	http://16.171.136.30:3000/20-back.jpg.jpg	100739607	\N	1	0	2023-08-12 12:46:55.048794+05:30	2023-08-12 12:46:55.048794+05:30	\N
22	AAdu jeevitham	4556	Benyamin	na	Sis	5220	8779	89	Fantasy	Malayalam	2012	http://16.171.136.30:3000/22-front.jpg.jpg	http://16.171.136.30:3000/22-back.jpg.jpg	100783087	\N	1	0	2023-08-14 11:39:51.034969+05:30	2023-08-14 11:39:51.034969+05:30	\N
26	the wolf	as1234	authent	mmmm	himede	2000	as1222	2	Comic	mm	2006	http://16.171.136.30:3000/26-front.jpg.jpg	http://16.171.136.30:3000/26-back.jpg.jpg	100625518	\N	1	0	2023-08-17 11:30:07.921382+05:30	2023-08-17 11:30:07.921382+05:30	\N
10	bhanasura	12233	binil	\N	sis	566	56892	255	Fantasy	\N	2008	http://16.171.136.30:3000/t1-front.jpg.jpg	http://16.171.136.30:3000/t1-back.jpg.jpg	100333679	\N	1	0	2023-08-11 11:12:35.753885+05:30	2023-08-11 11:12:35.753885+05:30	hindi
3	dzvzc	xcxc	xxcx 	\N	fgfdg	123132	xcx	2	Fiction	\N	1213	https://img.freepik.com/free-vector/abstract-elegant-winter-book-cover_23-2148798745.jpg?w=2000	https://i.pinimg.com/originals/b0/f5/32/b0f532a1ac0e95549f57869199b73647.jpg	\N	\N	1	0	2023-08-08 16:21:10.499414+05:30	2023-08-08 16:21:10.499414+05:30	dsfgfg
15	Alchemist	1299	Paulo coelho	Good book	dyt	1299	1299-1	5	Fantasy	English	1200	http://16.171.136.30:3000/15-front.jpg.jpg	http://16.171.136.30:3000/15-back.jpg.jpg	100238862	\N	0	0	2023-08-11 18:57:27.09576+05:30	2023-08-11 18:57:27.09576+05:30	\N
21	new book	as1234	asssslkkh	cndwdw dwdcbdwkjcb	dshjsxhj	1254	as1234	2	Crime	malayalam	2005	http://16.171.136.30:3000/21-front.jpg.jpg	http://16.171.136.30:3000/21-back.jpg.jpg	100825222	\N	1	0	2023-08-12 14:35:02.406358+05:30	2023-08-12 14:35:02.406358+05:30	\N
24	flash	ds2	arevhin	as you say	sasr	2500	cdc	1	Comic	malayalam	1986	http://16.171.136.30:3000/24-front.jpg.jpg	http://16.171.136.30:3000/24-back.jpg.jpg	100186558	\N	1	0	2023-08-17 11:25:19.233759+05:30	2023-08-17 11:25:19.233759+05:30	\N
2	dzvzc	xcxc	xxcx 	\N	fgfdg	123132	xcx	2	Fiction	\N	1213	https://img.freepik.com/free-vector/abstract-elegant-winter-book-cover_23-2148798745.jpg?w=2000	https://i.pinimg.com/originals/b0/f5/32/b0f532a1ac0e95549f57869199b73647.jpg	\N	\N	1	0	2023-08-08 16:21:01.116885+05:30	2023-08-08 16:21:01.116885+05:30	dsfgfg
16	JONDO	ASASFACASCA	DZVDCDFA	\N	ADFAFD	5454	CZcS	33	Crime	\N	4545	http://16.171.136.30:3000/t1-front.jpg.jpg	http://16.171.136.30:3000/t1-back.jpg.jpg	100308997	\N	1	0	2023-08-11 19:55:30.078308+05:30	2023-08-11 19:55:30.078308+05:30	DVDV
27	the mocking bird	gvhg	asan kook	good book	DC	1000	ghhch	23	Crime	English	1998	http://16.171.136.30:3000/27-front.jpg.jpg	http://16.171.136.30:3000/27-back.jpg.jpg	100467340	\N	0	0	2023-08-17 12:10:16.280615+05:30	2023-08-17 12:10:16.280615+05:30	\N
6	Meluha	100123	kuldeep	\N	sis	565	255896	56	Fiction	\N	2012	http://16.171.136.30:3000/t1-front.jpg.jpg	http://16.171.136.30:3000/t1-back.jpg.jpg	100009346	\N	1	0	2023-08-10 17:38:12.404376+05:30	2023-08-10 17:38:12.404376+05:30	malayalam
25	flash	ds2	arevhin	as you say	sasr	2500	cdc	1	Comic	malayalam	1986	http://16.171.136.30:3000/24-front.jpg.jpg	http://16.171.136.30:3000/24-back.jpg.jpg	\N	\N	1	0	2023-08-17 11:25:19.22111+05:30	2023-08-17 11:25:19.22111+05:30	\N
17	HJVHG	KHJHJ	YTFHGF	\N	HVHG	65656	JGJHGH	56	Crime	\N	7767	http://16.171.136.30:3000/t1-front.jpg.jpg	http://16.171.136.30:3000/t1-back.jpg.jpg	100721384	\N	1	0	2023-08-11 19:56:56.179246+05:30	2023-08-11 19:56:56.179246+05:30	JBMNM
18	NGCNC	AFDAFA	VDSVDS	\N	SFV	5453	FDAFADFDFDF	4343	Fiction	\N	44343	http://16.171.136.30:3000/t1-front.jpg.jpg	http://16.171.136.30:3000/t1-back.jpg.jpg	100744283	\N	1	0	2023-08-11 19:58:28.129152+05:30	2023-08-11 19:58:28.129152+05:30	SVSV
30	mon	kk	mkn	kkk	jj	2000	2121	2	Fantasy	jjjj	1988	http://16.171.136.30:3000/30-front.jpg.jpg	http://16.171.136.30:3000/30-back.jpg.jpg	100724849	\N	1	0	2023-08-17 13:42:18.830813+05:30	2023-08-17 13:42:18.830813+05:30	\N
1	Casinova	12333	Adithyan U	good book for learners empoverment	Owner club	200		100	Crime	english	2000	http://16.171.136.30:3000/1-front.jpg.jpg	http://16.171.136.30:3000/1-back.jpg.jpg	100315714	\N	1	0	2023-08-05 17:20:12.883527+05:30	2023-08-05 17:20:12.883527+05:30	\N
23	Tintin	2335	Herge	Adventures of tintin	Doc	1000	7443	2	Fantasy	English	1990	http://16.171.136.30:3000/23-front.jpg.jpg	http://16.171.136.30:3000/23-back.jpg.jpg	100374330	\N	1	0	2023-08-14 11:45:13.184984+05:30	2023-08-14 11:45:13.184984+05:30	\N
28	play book	1222	weree	bad book	qwe	20	12223	1	Fiction	hindi	1233	http://16.171.136.30:3000/28-front.jpg.jpg	http://16.171.136.30:3000/28-back.jpg.jpg	100735868	\N	1	0	2023-08-17 12:42:05.710295+05:30	2023-08-17 12:42:05.710295+05:30	\N
5	balyakalsakhi	123111	vaikom muhammed basheer		kk books	1200	22w2	1	Crime	malayalam	1978	http://16.171.136.30:3000/t1-front.jpg.jpg	http://16.171.136.30:3000/t1-back.jpg.jpg	100444063	\N	1	0	2023-08-09 13:02:45.199232+05:30	2023-08-09 13:02:45.199232+05:30	malayalam
33	aaaa	aa	ass	fndcn efewjnfj	addf	235	122	1	Crime	e	2015	http://16.171.136.30:3000/33-front.jpg.jpg	http://16.171.136.30:3000/33-back.jpg.jpg	100577815	\N	1	0	2023-08-25 11:08:20.161939+05:30	2023-08-25 11:08:20.161939+05:30	\N
13	SFGSF	SDFFSDF	SFGF	\N	FGS	45453	SDFSFS	5453	Fiction	\N	5453	http://16.171.136.30:3000/t1-front.jpg.jpg	http://16.171.136.30:3000/t1-back.jpg.jpg	100063963	\N	1	0	2023-08-11 18:44:12.622796+05:30	2023-08-11 18:44:12.622796+05:30	SFG
37	ytfjfhcy	541541	jhvhv	hgubkbjb	hgcv	3212	211	2	Classic	hgghv	1212-11-11	http://16.171.136.30:3000/37-front.jpg.jpg	http://16.171.136.30:3000/37-back.jpg.jpg	100292643	\N	1	0	2023-08-29 01:21:40.155614+05:30	2023-08-29 01:21:40.155614+05:30	\N
36	test	1234567890	Tesrrrr	rthghjbnmbnmbn	yhgfgfgh	120	123456789000	1	Crime	malayalam	1978-05-21	http://16.171.136.30:3000/36-front.jpg.jpg	http://16.171.136.30:3000/36-back.jpg.jpg	100808532	\N	1	0	2023-08-28 17:47:11.458355+05:30	2023-08-28 17:47:11.458355+05:30	\N
32	1947-57IndiaThe Birth of a Republic	ISBN-10 	Chandrachur Ghose	The story of a decade-1947 to 1957-that made and unmade India	Vintage Books	560	0670097101	1	Fiction	english	2023-08-17	http://16.171.136.30:3000/32-front.jpg.jpg	http://16.171.136.30:3000/32-back.jpg.jpg	100674161	\N	1	0	2023-08-24 22:44:32.381015+05:30	2023-08-24 22:44:32.381015+05:30	\N
34	why  i killed Gandhi	isbn-10	nathuram vinayak godse	Penned by brother of Nathuram Godse, Why I Killed Gandhi is narration of the events that lead to the historic day of assassination of Mahatma Gandhi till the execution of Godse.	prabhat prakashan pvt	123		1	Crime	english	2023-01-04	http://16.171.136.30:3000/34-front.jpg.jpg	http://16.171.136.30:3000/34-back.jpg.jpg	100132589	\N	1	0	2023-08-26 11:20:50.279302+05:30	2023-08-26 11:20:50.279302+05:30	\N
35	Test	12345678	Praveen	Test	DA	120		1	Classic	Malayalam	1978-05-21	http://16.171.136.30:3000/35-front.jpg.jpg	http://16.171.136.30:3000/35-back.jpg.jpg	100009342	\N	1	0	2023-08-28 17:43:55.001592+05:30	2023-08-28 17:43:55.001592+05:30	\N
38	the secret	pL	Rhond byrne	may the secret bring you love and joy for your entire existence	simon and schuster uK	1526	12231	1	Fiction	english	2006-11-01	http://16.171.136.30:3000/38-front.jpg.jpg	http://16.171.136.30:3000/38-back.jpg.jpg	100583594	\N	0	0	2023-08-29 01:31:30.293941+05:30	2023-08-29 01:31:30.293941+05:30	\N
42	30 days to better english	pl	norman lewis	learn to speak and write more effectively in just fifteen minutes every day	penguin books	150	12	1	Classic	english	2019-06-01	http://16.171.136.30:3000/39-front.jpg.jpg	http://16.171.136.30:3000/39-back.jpg.jpg	100888823	\N	0	0	2023-08-29 02:00:14.054917+05:30	2023-08-29 02:00:14.054917+05:30	\N
40	Samudra Sasthram	pL	A group of authors	ഭൗതിക സമുദ്ര വിജ്ഞാനത്തിന്റെ എല്ലാ മേഖലകളിലും ഗണ്യമായ പുരോഗതി കൈവരിക്കാൻ ഇരുപതാം നൂറ്റാണ്ടിന് 19 ആം നൂറ്റാണ്ടിന്റെ അന്ത്യത്തിൽ ചലഞ്ചർ പര്യവേഷണ പരമ്പരയാണ് ആധുനിക സമുദ്ര ശാസ്ത്ര പഠനങ്ങൾക്ക് തുടക്കം കുറിച്ചത്. രണ്ടാം ലോകമഹായുദ്ധകാലത്ത് അത്ഭുതകരമായ പുരോഗതിയാണ് സമുദ്ര വിജ്ഞാനത്തിൽ ഉണ്ടായത് അനന്തം അജ്ഞാതം എന്നൊക്കെ വിശേഷിപ്പിക്കപ്പെട്ടിരുന്ന ആഴക്കടലിനെ കുറിച്ചുള്ള അറിവുകൾ വികസിച്ചത് മഹായുദ്ധങ്ങൾക്ക് ശേഷമാണ് സമുദ്ര ശാസ്ത്രത്തിൽ കഴിഞ്ഞ നൂറ്റാണ്ടിൽ ഉണ്ടായ വളർച്ചയും അടുത്ത ഏതാനും വർഷങ്ങളിൽ ഉണ്ടായേക്കാവുന്ന പുതിയ സംരംഭങ്ങളുമാണ് ഈ ഗ്രന്ഥത്തിൽ വിഷയമാക്കിയിരിക്കുന്നത്.	kerala bhasha institute	70	9553	1	Classic	malayalam	2000-02-01	http://16.171.136.30:3000/39-front.jpg.jpg	http://16.171.136.30:3000/39-back.jpg.jpg	100888823	\N	0	0	2023-08-29 01:50:41.412192+05:30	2023-08-29 01:50:41.412192+05:30	\N
41	Yawanathinte Pusthakam	PL	Dr SHIJU KHAN	മലയാളിയുടെ ജീവിത ഭാവുകത്വത്തെ ആഴത്തിൽ സ്പർശിച്ച പ്രതിഭകൾ യൗവനത്തെ ഓർത്തെടുക്കുന്നു	democratic youth federation	300	121	1	Classic	malayalam	2022-03-01	http://16.171.136.30:3000/39-front.jpg.jpg	http://16.171.136.30:3000/39-back.jpg.jpg	100888823	\N	0	0	2023-08-29 01:55:38.712168+05:30	2023-08-29 01:55:38.712168+05:30	\N
43	aa	111	aaa	saas	aa	12	asss	1	Horror	ma	2023-08-23	http://16.171.136.30:3000/43-front.jpg.jpg	http://16.171.136.30:3000/43-back.jpg.jpg	\N	\N	1	0	2023-08-30 13:15:16.527775+05:30	2023-08-30 13:15:16.527775+05:30	\N
44	aa	111	aaa	saas	aa	12	asss	1	Horror	ma	2023-08-23	http://16.171.136.30:3000/43-front.jpg.jpg	http://16.171.136.30:3000/43-back.jpg.jpg	100182368	\N	1	0	2023-08-30 13:15:16.540454+05:30	2023-08-30 13:15:16.540454+05:30	\N
39	Pusthakangalude Pusthakam	pL	m swaraj	പൂക്കളുടെ നിറവും സുഗന്ധവും ആകർഷകത്വവും എല്ലാവരെയും ആനന്ദിപ്പിക്കുന്നതാണ്. ഓരോ പൂവിനു പിന്നിലും ഒരു കഥയുണ്ട്, ഒരു സ്വപ്നമുണ്ട്, ഒരു ചരിത്രമുണ്ട് അപ്രകാരം മാനവരാശിയെ സ്വാധീനിക്കുകയും മനുഷ്യഹൃദയങ്ങളിൽ ഇടം കണ്ടെത്തുകയും ചെയ്ത പൂക്കളെ അവതരിപ്പിക്കുന്ന പുസ്തകം..	dC books	160	14275	1	Classic	malayalam	2021-02-01	http://16.171.136.30:3000/39-front.jpg.jpg	http://16.171.136.30:3000/39-back.jpg.jpg	100888823	\N	0	0	2023-08-29 01:42:42.857407+05:30	2023-08-29 01:42:42.857407+05:30	\N
\.


--
-- Data for Name: cart; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cart (id, date, user_fkey, book_fkey, created_by, app_id, is_deleted, user_perm, created_at, updated_at, status, remarks, user_aproval) FROM stdin;
74	\N	64	7	\N	\N	0	0	2023-08-28 11:08:39.161417+05:30	2023-08-28 11:08:39.161417+05:30	pending	\N	0
83	\N	64	27	\N	\N	0	0	2023-08-30 03:30:43.353742+05:30	2023-08-30 03:30:43.353742+05:30	pending	\N	0
86	\N	45	27	\N	\N	0	0	2023-08-30 14:38:41.385881+05:30	2023-08-30 14:38:41.385881+05:30	hold	\N	0
87	\N	45	27	\N	\N	0	0	2023-08-30 14:38:41.413492+05:30	2023-08-30 14:38:41.413492+05:30	hold	\N	0
97	\N	45	41	\N	\N	0	0	2023-08-30 16:59:34.900144+05:30	2023-08-30 16:59:34.900144+05:30	hold	\N	0
84	\N	64	27	\N	\N	0	0	2023-08-30 11:09:06.790445+05:30	2023-08-30 11:09:06.790445+05:30	pending	\N	0
96	\N	45	41	\N	\N	0	0	2023-08-30 16:59:34.879929+05:30	2023-08-30 16:59:34.879929+05:30	hold	\N	0
114	\N	45	39	\N	\N	0	0	2023-08-31 07:51:03.917425+05:30	2023-08-31 07:51:03.917425+05:30	pending	\N	0
92	\N	45	15	\N	\N	0	0	2023-08-30 16:32:51.027939+05:30	2023-08-30 16:32:51.027939+05:30	hold	\N	0
100	\N	64	38	\N	\N	0	0	2023-08-30 19:07:58.892814+05:30	2023-08-30 19:07:58.892814+05:30	hold	\N	0
91	\N	45	27	\N	\N	0	0	2023-08-30 15:25:44.267491+05:30	2023-08-30 15:25:44.267491+05:30	hold	\N	0
115	\N	64	42	\N	\N	0	0	2023-08-31 09:39:17.298415+05:30	2023-08-31 09:39:17.298415+05:30	pending	\N	0
116	\N	64	15	\N	\N	0	0	2023-08-31 09:40:18.03578+05:30	2023-08-31 09:40:18.03578+05:30	pending	\N	0
93	\N	45	15	\N	\N	0	0	2023-08-30 16:32:51.038493+05:30	2023-08-30 16:32:51.038493+05:30	hold	\N	0
117	\N	64	15	\N	\N	0	0	2023-08-31 09:40:45.891804+05:30	2023-08-31 09:40:45.891804+05:30	pending	\N	0
94	\N	45	41	\N	\N	0	0	2023-08-30 16:59:30.619415+05:30	2023-08-30 16:59:30.619415+05:30	hold	\N	0
118	\N	64	27	\N	\N	0	0	2023-08-31 09:44:48.526493+05:30	2023-08-31 09:44:48.526493+05:30	pending	\N	0
76	\N	64	3	\N	\N	0	0	2023-08-28 12:34:42.933633+05:30	2023-08-28 12:34:42.933633+05:30	Approve	\N	0
95	\N	45	41	\N	\N	0	0	2023-08-30 16:59:30.627175+05:30	2023-08-30 16:59:30.627175+05:30	hold	\N	0
73	\N	64	7	\N	\N	0	0	2023-08-27 21:23:54.885939+05:30	2023-08-27 21:23:54.885939+05:30	reject	\N	0
104	\N	64	27	\N	\N	0	0	2023-08-30 19:28:32.01623+05:30	2023-08-30 19:28:32.01623+05:30	pending	\N	0
106	\N	64	27	\N	\N	0	0	2023-08-30 19:30:09.3292+05:30	2023-08-30 19:30:09.3292+05:30	pending	\N	0
107	\N	64	27	\N	\N	0	0	2023-08-30 19:30:09.335526+05:30	2023-08-30 19:30:09.335526+05:30	pending	\N	0
108	\N	64	15	\N	\N	0	0	2023-08-30 19:31:11.508297+05:30	2023-08-30 19:31:11.508297+05:30	pending	\N	0
109	\N	64	15	\N	\N	0	0	2023-08-30 19:31:11.516214+05:30	2023-08-30 19:31:11.516214+05:30	pending	\N	0
110	\N	64	41	\N	\N	0	0	2023-08-30 19:46:13.105261+05:30	2023-08-30 19:46:13.105261+05:30	pending	\N	0
111	\N	64	41	\N	\N	0	0	2023-08-30 19:46:13.135847+05:30	2023-08-30 19:46:13.135847+05:30	pending	\N	0
112	\N	64	41	\N	\N	0	0	2023-08-30 19:46:28.719924+05:30	2023-08-30 19:46:28.719924+05:30	pending	\N	0
113	\N	64	41	\N	\N	0	0	2023-08-30 19:46:28.727113+05:30	2023-08-30 19:46:28.727113+05:30	pending	\N	0
85	\N	64	15	\N	\N	0	0	2023-08-30 11:10:22.875611+05:30	2023-08-30 11:10:22.875611+05:30	hold	\N	0
79	\N	66	38	\N	\N	0	0	2023-08-29 02:18:24.839617+05:30	2023-08-29 02:18:24.839617+05:30	Approve	\N	0
78	\N	45	1	\N	\N	0	0	2023-08-28 20:55:46.685314+05:30	2023-08-28 20:55:46.685314+05:30	hold	\N	0
81	\N	64	38	\N	\N	0	0	2023-08-29 09:48:01.920689+05:30	2023-08-29 09:48:01.920689+05:30	Approve	\N	0
119	\N	45	38	\N	\N	0	0	2023-08-31 10:08:46.43801+05:30	2023-08-31 10:08:46.43801+05:30	pending	\N	0
120	\N	45	39	\N	\N	0	0	2023-08-31 10:11:34.909195+05:30	2023-08-31 10:11:34.909195+05:30	pending	\N	0
121	\N	45	38	\N	\N	0	0	2023-08-31 10:12:17.683956+05:30	2023-08-31 10:12:17.683956+05:30	pending	\N	0
122	\N	45	41	\N	\N	0	0	2023-08-31 10:13:12.037491+05:30	2023-08-31 10:13:12.037491+05:30	pending	\N	0
123	\N	45	42	\N	\N	0	0	2023-08-31 10:15:46.856942+05:30	2023-08-31 10:15:46.856942+05:30	pending	\N	0
101	\N	64	38	\N	\N	0	0	2023-08-30 19:07:58.901615+05:30	2023-08-30 19:07:58.901615+05:30	hold	\N	0
124	\N	45	42	\N	\N	0	0	2023-08-31 10:18:48.533464+05:30	2023-08-31 10:18:48.533464+05:30	pending	\N	0
125	\N	45	42	\N	\N	0	0	2023-08-31 10:20:19.91648+05:30	2023-08-31 10:20:19.91648+05:30	pending	\N	0
126	\N	76	38	\N	\N	0	0	2023-08-31 10:21:02.277356+05:30	2023-08-31 10:21:02.277356+05:30	pending	\N	0
98	\N	64	27	\N	\N	0	0	2023-08-30 19:07:28.319207+05:30	2023-08-30 19:07:28.319207+05:30	Approve	\N	0
127	\N	64	27	\N	\N	0	0	2023-08-31 10:25:18.418377+05:30	2023-08-31 10:25:18.418377+05:30	pending	\N	0
102	\N	64	27	\N	\N	0	0	2023-08-30 19:21:46.157228+05:30	2023-08-30 19:21:46.157228+05:30	hold	\N	0
103	\N	64	27	\N	\N	0	0	2023-08-30 19:21:46.180979+05:30	2023-08-30 19:21:46.180979+05:30	hold	\N	0
128	\N	77	38	\N	\N	0	0	2023-08-31 11:10:03.461004+05:30	2023-08-31 11:10:03.461004+05:30	Approve		0
129	\N	77	15	\N	\N	0	0	2023-08-31 11:14:46.753288+05:30	2023-08-31 11:14:46.753288+05:30	Approve		0
105	\N	64	27	\N	\N	0	0	2023-08-30 19:28:32.015558+05:30	2023-08-30 19:28:32.015558+05:30	hold	\N	0
130	\N	77	40	\N	\N	0	0	2023-08-31 11:20:46.611496+05:30	2023-08-31 11:20:46.611496+05:30	Approve		0
131	\N	77	40	\N	\N	0	0	2023-08-31 11:26:51.738633+05:30	2023-08-31 11:26:51.738633+05:30	pending	\N	0
88	\N	45	27	\N	\N	0	0	2023-08-30 14:40:19.157123+05:30	2023-08-30 14:40:19.157123+05:30	hold	\N	0
132	\N	64	15	\N	\N	0	0	2023-08-31 11:33:20.37283+05:30	2023-08-31 11:33:20.37283+05:30	pending	\N	0
133	\N	77	27	\N	\N	0	0	2023-08-31 11:33:47.007131+05:30	2023-08-31 11:33:47.007131+05:30	pending	\N	0
90	\N	45	27	\N	\N	0	0	2023-08-30 15:25:44.267094+05:30	2023-08-30 15:25:44.267094+05:30	hold	\N	0
134	\N	77	42	\N	\N	0	0	2023-08-31 11:37:54.512746+05:30	2023-08-31 11:37:54.512746+05:30	Approve		0
89	\N	45	27	\N	\N	0	0	2023-08-30 14:40:19.166633+05:30	2023-08-30 14:40:19.166633+05:30	hold	\N	0
72	\N	45	3	\N	\N	0	0	2023-08-27 21:01:45.23399+05:30	2023-08-27 21:01:45.23399+05:30	Approve	\N	0
99	\N	64	27	\N	\N	0	0	2023-08-30 19:07:28.333872+05:30	2023-08-30 19:07:28.333872+05:30	Approve	\N	0
75	\N	63	1	\N	\N	0	0	2023-08-28 12:33:19.716033+05:30	2023-08-28 12:33:19.716033+05:30	Approve	\N	0
82	\N	45	42	\N	\N	0	0	2023-08-29 09:48:37.157086+05:30	2023-08-29 09:48:37.157086+05:30	Approve		0
80	\N	64	27	\N	\N	0	0	2023-08-29 08:54:59.109777+05:30	2023-08-29 08:54:59.109777+05:30	Approve	\N	0
\.


--
-- Data for Name: update; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.update (id, topicname, created_at) FROM stdin;
632	/SELECT cart.id, books.title, books.descrption,cart.status, books.image_path FROM cart  LEFT JOIN books ON cart.book_fkey = books.id WHERE cart.user_fkey=null;  	2023-08-30 04:58:59+05:30
1165	/SELECT cart-BLUBLUBLU-id,users-BLUBLUBLU-username, books-BLUBLUBLU-title, books-BLUBLUBLU-descrption,cart-BLUBLUBLU-status, books-BLUBLUBLU-image_path FROM cart LEFT JOIN books ON cart-BLUBLUBLU-book_fkey = books-BLUBLUBLU-id LEFT JOIN users ON cart-BLUBLUBLU-user_fkey = users-BLUBLUBLU-id where cart-BLUBLUBLU-user_fkey=users-BLUBLUBLU-id ; 	2023-08-31 04:37:09+05:30
993	/SELECT/title,isbn,author,descrption,publisher,amount,bisac,quantity,category,language,publish_year,image_path,image_path2/from/books/where/id/=/38;	2023-08-30 12:58:10.950119+05:30
1717	/SELECT/title,isbn,author,descrption,publisher,amount,bisac,quantity,category,language,publish_year,image_path,image_path2/from/books/where/id/=/40;	2023-08-31 10:05:02.408199+05:30
973	/SELECT/username,phone,email,password/from/users/where/id/=/68;	2023-08-29 09:26:46.616355+05:30
1723	/SELECT -BLU- FROM users WHERE email=§admin@gmail-BLUBLUBLU-com§ AND password=§Bibbi12-BLUBLU-§	2023-08-31 10:09:31.926098+05:30
1714	/SELECT cart-BLUBLUBLU-id, books-BLUBLUBLU-title, books-BLUBLUBLU-descrption,cart-BLUBLUBLU-status, books-BLUBLUBLU-image_path FROM cart  LEFT JOIN books ON cart-BLUBLUBLU-book_fkey = books-BLUBLUBLU-id WHERE cart-BLUBLUBLU-user_fkey=null;  	2023-08-31 10:02:34.62772+05:30
493	/SELECT/books-BLUBLUBLU-title,users-BLUBLUBLU-username,cart-BLUBLUBLU-date,cart-BLUBLUBLU-status,cart-BLUBLUBLU-id,cart-BLUBLUBLU-remarks/FROM/cart/LEFT/JOIN/books/ON/cart-BLUBLUBLU-book_fkey/=/books-BLUBLUBLU-id/LEFT/JOIN/users/ON/users-BLUBLUBLU-id/=/cart-BLUBLUBLU-user_fkey/order/by/cart-BLUBLUBLU-id;	2023-08-31 06:08:12+05:30
505	/SELECT cart.id,users.username, books.title, books.description,cart.status, books.image_path FROM cart LEFT JOIN books ON cart.book_fkey = books.id LEFT JOIN users ON cart.user_fkey = users.id where cart.user_fkey=users.id ; 	2023-08-25 20:47:08.149417+05:30
957	/SELECT cart.id, books.title, books.descrption,cart.status, books.image_path FROM cart  LEFT JOIN books ON cart.book_fkey = books.id WHERE cart.user_fkey=64;  	2023-08-30 05:40:39+05:30
1020	/SELECT -BLU- FROM BOOKS  WHERE is_deleted=§0§ ORDER BY books/id	2023-08-30 13:37:56.485631+05:30
1776	/SELECT -BLU- FROM users WHERE email=§sanjudaviz@gmail-BLUBLUBLU-com§ AND password=§lib@1952§	2023-08-31 12:05:39.253847+05:30
499	/SELECT/username,phone,email,password/from/users/where/id/=/53;	2023-08-25 18:30:07.370379+05:30
494	/SELECT/username,phone,email,id/FROM/users/where/is_deleted/=/§0§/order/by/id;	2023-08-31 05:36:55+05:30
624	/SELECT/title,isbn,author,descrption,publisher,amount,bisac,quantity,category,language,publish_year,image_path,image_path2/from/books/where/id/=/32;	2023-08-26 11:23:00.549229+05:30
1161	/SELECT -BLU- FROM users WHERE email=§lib@gmail-BLUBLUBLU-com§ AND password=§1234§	2023-08-31 04:16:59+05:30
513	/SELECT cart.id,users.username, books.title, books.descrption,cart.status, books.image_path FROM cart LEFT JOIN books ON cart.book_fkey = books.id LEFT JOIN users ON cart.user_fkey = users.id where cart.user_fkey=users.id ; 	2023-08-28 18:27:09+05:30
628	/SELECT/username,phone,email,password/from/users/where/id/=/51;	2023-08-26 11:33:51.413745+05:30
537	/SELECT cart.id,users.username, books.title, books.descrption,cart.status, books.image_path FROM cart  LEFT JOIN books ON cart.book_fkey = books.id WHERE cart.user_fkey=42;  	2023-08-25 23:48:45.29169+05:30
539	/SELECT cart.id, books.title, books.descrption,cart.status, books.image_path FROM cart  LEFT JOIN books ON cart.book_fkey = books.id WHERE cart.user_fkey=42;  	2023-08-25 23:50:08.472944+05:30
498	/SELECT -BLU- FROM BOOKS  WHERE is_deleted=§0§ ORDER BY books.id;	2023-08-30 06:41:52+05:30
630	/SELECT cart.id, books.title, books.descrption,cart.status, books.image_path FROM cart  LEFT JOIN books ON cart.book_fkey = books.id WHERE cart.user_fkey=51;  	2023-08-26 08:09:37+05:30
969	/SELECT/title,isbn,author,descrption,publisher,amount,bisac,quantity,category,language,publish_year,image_path,image_path2/from/books/where/id/=/15;	2023-08-29 01:20:27.403403+05:30
977	/SELECT -BLU- FROM BOOKS  WHERE is_deleted=§0§ ORDER BY books/id;	2023-08-30 08:16:07+05:30
533	/SELECT cart.id,users.username, books.title, books.descrption,cart.status, books.image_path FROM cart WHERE cart.user_fkey =  42LEFT JOIN books ON cart.book_fkey = books.id ; 	2023-08-25 23:39:56.864484+05:30
535	/SELECT cart.id,users.username, books.title, books.descrption,cart.status, books.image_path FROM cart WHERE cart.user_fkey =  42 LEFT JOIN books ON cart.book_fkey = books.id ; 	2023-08-25 23:43:05.644173+05:30
665	/SELECT cart.id, books.title, books.descrption,cart.status, books.image_path FROM cart  LEFT JOIN books ON cart.book_fkey = books.id WHERE cart.user_fkey=63;  	2023-08-28 07:03:22+05:30
605	/SELECT/username,phone,email,password/from/users/where/id/=/45;	2023-08-26 11:01:48.623778+05:30
1049	/SELECT -BLU- FROM users WHERE email=§jishnu@gmail-BLUBLUBLU-com§ AND password=§1234§	2023-08-31 04:38:22+05:30
1029	/SELECT -BLU- FROM BOOKS  WHERE is_deleted=§0§ ORDER BY books-BLUBLUBLU-id;	2023-08-31 06:34:40+05:30
623	/SELECT/title,isbn,author,descrption,publisher,amount,bisac,quantity,category,language,publish_year,image_path,image_path2/from/books/where/id/=/34;	2023-08-26 11:21:50.507047+05:30
1211	/SELECT -BLU- FROM users WHERE email=§has@gmail-BLUBLUBLU-com§ AND password=§1111§	2023-08-30 19:27:42.737107+05:30
1201	/SELECT -BLU- FROM users WHERE email=§has@gmail-BLUBLUBLU-com§ AND password=§1234§	2023-08-31 04:54:52+05:30
1721	/SELECT -BLU- FROM users WHERE email=§admin@gmail-BLUBLUBLU-com§ AND password=§admin§	2023-08-31 10:09:11.734658+05:30
495	/SELECT/title,author,publisher,image_path,image_path2,amount,category,quantity,id/FROM/books/where/is_deleted=§0§/ORDER/BY/books-BLUBLUBLU-id/;	2023-08-31 05:36:30+05:30
607	/SELECT cart.id, books.title, books.descrption,cart.status, books.image_path FROM cart  LEFT JOIN books ON cart.book_fkey = books.id WHERE cart.user_fkey=45;  	2023-08-29 04:34:31+05:30
970	/SELECT/title,isbn,author,descrption,publisher,amount,bisac,quantity,category,language,publish_year,image_path,image_path2/from/books/where/id/=/39;	2023-08-31 04:34:40+05:30
1718	/SELECT/title,isbn,author,descrption,publisher,amount,bisac,quantity,category,language,publish_year,image_path,image_path2/from/books/where/id/=/41;	2023-08-31 10:05:18.073455+05:30
1727	/SELECT -BLU- FROM users WHERE email=§testuser@gmail-BLUBLUBLU-com§ AND password=§1234§	2023-08-31 10:19:43.738035+05:30
1736	/SELECT -BLU- FROM users WHERE email=§snasmonpkl@gmail-BLUBLUBLU-com§ AND password=§1234§	2023-08-31 11:09:21.433497+05:30
1051	/SELECT cart-BLUBLUBLU-id, books-BLUBLUBLU-title, books-BLUBLUBLU-descrption,cart-BLUBLUBLU-status, books-BLUBLUBLU-image_path FROM cart  LEFT JOIN books ON cart-BLUBLUBLU-book_fkey = books-BLUBLUBLU-id WHERE cart-BLUBLUBLU-user_fkey=45;  	2023-08-31 05:40:11+05:30
1316	/SELECT -BLU- FROM users WHERE email=§jjishnu@gmail-BLUBLUBLU-com§ AND password=§1234§	2023-08-31 00:06:20.298106+05:30
1719	/SELECT -BLU- FROM users WHERE email=§admin@gmail-BLUBLUBLU-com§ AND password=§9995935184§	2023-08-31 10:08:38.527653+05:30
1209	/SELECT -BLU- FROM users WHERE email=§has@gmail-BLUBLUBLU-com§ AND password=§q234§	2023-08-30 19:27:38.11261+05:30
1728	/SELECT cart-BLUBLUBLU-id, books-BLUBLUBLU-title, books-BLUBLUBLU-descrption,cart-BLUBLUBLU-status, books-BLUBLUBLU-image_path FROM cart  LEFT JOIN books ON cart-BLUBLUBLU-book_fkey = books-BLUBLUBLU-id WHERE cart-BLUBLUBLU-user_fkey=76;  	2023-08-31 10:19:45.181528+05:30
1737	/SELECT cart-BLUBLUBLU-id, books-BLUBLUBLU-title, books-BLUBLUBLU-descrption,cart-BLUBLUBLU-status, books-BLUBLUBLU-image_path FROM cart  LEFT JOIN books ON cart-BLUBLUBLU-book_fkey = books-BLUBLUBLU-id WHERE cart-BLUBLUBLU-user_fkey=77;  	2023-08-31 11:09:22.358035+05:30
1185	/SELECT cart-BLUBLUBLU-id, books-BLUBLUBLU-title, books-BLUBLUBLU-descrption,cart-BLUBLUBLU-status, books-BLUBLUBLU-image_path FROM cart  LEFT JOIN books ON cart-BLUBLUBLU-book_fkey = books-BLUBLUBLU-id WHERE cart-BLUBLUBLU-user_fkey=64;  	2023-08-31 06:03:42+05:30
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, email, password, flag, key, json, created_date, modified_date, username, phone, is_deleted, created_by, created_at, privilage) FROM stdin;
69	sherinsncd@gmail.com	03051983	\N	\N	\N	\N	\N	SHERINKUMAR S	9846473707	0	100008104	2023-08-29 09:21:56.818186+05:30	0
68	vrrejaneesh@gmail.com	15051979	\N	\N	\N	\N	\N	REJANEESH V R	9567564797	0	100739521	2023-08-29 08:36:52.782548+05:30	0
38			\N	\N	\N	\N	\N			1	100799041	2023-08-12 11:55:41.108266+05:30	0
27	f@gma.com	ACACADCA	\N	\N	\N	\N	\N	SDFDAF	9999999999	1	100636256	2023-08-11 19:53:48.792984+05:30	0
70	anaswara2336@gmail.com	20251986	\N	\N	\N	\N	\N	ANASWARA M S	9645458834	0	100036774	2023-08-29 09:34:50.339592+05:30	0
40	hvghhg@vb.com	iiououuoioi	\N	\N	\N	\N	\N	eafadfa	9897878788	1	100259563	2023-08-12 13:02:44.224581+05:30	0
39	sxsx@kmckc.com	1234	\N	\N	\N	\N	\N	dmkdckmd	9874421111	1	100211706	2023-08-12 13:00:34.635919+05:30	0
42	a@g.com	1234	\N	\N	\N	\N	\N	ebnh	6655442434	1	100868550	2023-08-12 13:09:30.076003+05:30	0
43	as@hm.com	1234	\N	\N	\N	\N	\N	sjjsj	9855422845	1	100020926	2023-08-12 14:38:59.813466+05:30	0
36	swami@gmail.com	11332	\N	\N	\N	\N	\N	swami m	8895656355	1	100512931	2023-08-11 23:31:32.109341+05:30	0
65	praveenda@gmail.com	123	\N	\N	\N	\N	\N	PRAVEEN DA	9847856366	1	100671201	2023-08-28 17:51:29.294348+05:30	0
72	admin@gmail.com	1234	\N	\N	\N	\N	\N	ADMIN	9995935184	0	100577829	2023-08-30 13:17:16.057233+05:30	0
76	testuser@gmail.com	1234	\N	\N	\N	\N	\N	Test user	9847856367	0	100566881	2023-08-31 10:19:06.539926+05:30	0
34	asa@gmail.com	sdvdsvdsv	\N	\N	\N	\N	\N	afdafda	8787879999	1	100169471	2023-08-11 20:28:41.880273+05:30	1
35	ksvysakh09@gmail.com	1223	\N	\N	\N	\N	\N	jishnu v	9895663532	1	100210999	2023-08-11 23:30:34.353166+05:30	0
37	d@g.com	scvsvsdvw	\N	\N	\N	\N	\N	wfwdfwe	9999999999	1	100799041	2023-08-12 11:55:36.748408+05:30	0
61	d@wdfwfwf.com	2r2ffvdwf	\N	\N	\N	\N	\N	klalsl	9898998989	1	100034175	2023-08-24 13:48:53.985014+05:30	0
47	sd@g.com	1234	\N	\N	\N	\N	\N	sman	9898956449	1	100152364	2023-08-24 13:24:49.315805+05:30	0
57	efefgfT@gmail.com	vfvvr	\N	\N	\N	\N	\N	fwfw	9989898988	1	100804369	2023-08-24 13:40:38.17224+05:30	0
55	sfd@g.com	wfwf	\N	\N	\N	\N	\N	gkd	8888888888	1	100856601	2023-08-24 13:35:01.974914+05:30	0
77	snasmonpkl@gmail.com	1234	\N	\N	\N	\N	\N	snas	9995935184	1	100289683	2023-08-31 11:07:45.553405+05:30	0
66	sanjudaviz@gmail.com	lib@1952	\N	\N	\N	\N	\N	SANCHU R	9746549412	0	100496526	2023-08-28 20:04:36.675553+05:30	0
44	niel@gmail.com	niel1121	\N	\N	\N	\N	\N	Niel thomas	9895668656	1	100884693	2023-08-14 11:41:50.465526+05:30	0
41	ssmxsmxm@m.com	1234	\N	\N	\N	\N	\N	snam	9854521555	1	100389808	2023-08-12 13:05:49.018498+05:30	0
53	ff@gvf.com	wfwrgrwg	\N	\N	\N	\N	\N	asds	9898989888	1	100308011	2023-08-24 13:32:45.95904+05:30	0
63	lib@gmail.com	1234	\N	\N	\N	\N	\N	librarian	9061399780	1	100423432	2023-08-26 11:57:27.148094+05:30	1
45	jishnu@gmail.com	1234	\N	\N	\N	\N	\N	jikin	9895764728	1	100864347	2023-08-16 20:27:36.378225+05:30	0
64	has@gmail.com	1234	\N	\N	\N	\N	\N	hashim	9896548795	1	100100830	2023-08-27 16:40:15.414641+05:30	0
59	sddfef@fgdfd.com	dvdwvwdvw	\N	\N	\N	\N	\N	wdfdfdfwfw	9988888888	1	100511561	2023-08-24 13:47:23.66315+05:30	0
51	as@g.com	1234	\N	\N	\N	\N	\N	ddd	8888888888	1	100649810	2023-08-24 13:27:40.520839+05:30	0
67	us.rohith@gmail.com	09011996	\N	\N	\N	\N	\N	ROHITH US  	9846508071	0	100422989	2023-08-28 20:07:35.807386+05:30	0
\.


--
-- Name: books_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.books_id_seq', 44, true);


--
-- Name: cart_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cart_id_seq', 134, true);


--
-- Name: update_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.update_id_seq', 1776, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 77, true);


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

