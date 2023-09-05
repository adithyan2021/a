--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3 (Ubuntu 15.3-1.pgdg22.04+1)
-- Dumped by pg_dump version 15.3 (Ubuntu 15.3-1.pgdg22.04+1)

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
-- Name: accountings; Type: TABLE; Schema: public; Owner: powerta
--

CREATE TABLE public.accountings (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    opening_balance character varying(255),
    as_of_date character varying(255),
    acc_no character varying(255),
    ifc_code character varying(255),
    upid character varying(255),
    acc_holder_name character varying(255),
    bank character varying(255),
    payment_type character varying(255),
    amount character varying(255),
    description character varying(9999),
    created_by character varying(255),
    updated_by character varying(255),
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.accountings OWNER TO powerta;

--
-- Name: accountings_id_seq; Type: SEQUENCE; Schema: public; Owner: powerta
--

CREATE SEQUENCE public.accountings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accountings_id_seq OWNER TO powerta;

--
-- Name: accountings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: powerta
--

ALTER SEQUENCE public.accountings_id_seq OWNED BY public.accountings.id;


--
-- Name: customer; Type: TABLE; Schema: public; Owner: powerta
--

CREATE TABLE public.customer (
    client_id integer NOT NULL,
    client_name character varying(255) NOT NULL,
    gst_no character varying(255),
    phone_no character varying(255),
    gst_type character varying(255),
    state character varying(255),
    email_id character varying(255),
    client_address character varying(255),
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    created_by character varying
);


ALTER TABLE public.customer OWNER TO powerta;

--
-- Name: employee; Type: TABLE; Schema: public; Owner: powerta
--

CREATE TABLE public.employee (
    empid integer NOT NULL,
    emp_name character varying(255) NOT NULL,
    address character varying(255),
    dob character varying(255),
    phone_no character varying(255),
    city character varying(255),
    employee_state character varying(255),
    district character varying(255),
    pin character varying(255),
    email_id character varying(255),
    higher_edu character varying(255),
    institute_edu character varying(255),
    higher_edu_date character varying(255),
    presently_employed character varying(255),
    last_work character varying(255),
    designation character varying(255),
    is_deleted character varying(255),
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    created_by character varying(255),
    updated_by character varying(255)
);


ALTER TABLE public.employee OWNER TO powerta;

--
-- Name: employee_empid_seq; Type: SEQUENCE; Schema: public; Owner: powerta
--

CREATE SEQUENCE public.employee_empid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.employee_empid_seq OWNER TO powerta;

--
-- Name: employee_empid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: powerta
--

ALTER SEQUENCE public.employee_empid_seq OWNED BY public.employee.empid;


--
-- Name: images; Type: TABLE; Schema: public; Owner: powerta
--

CREATE TABLE public.images (
    id integer NOT NULL,
    name character varying(255),
    data bytea,
    stock_c_f_key integer,
    is_deleted character varying(255),
    created_by character varying(255),
    updated_by character varying(255),
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.images OWNER TO powerta;

--
-- Name: images_id_seq; Type: SEQUENCE; Schema: public; Owner: powerta
--

CREATE SEQUENCE public.images_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.images_id_seq OWNER TO powerta;

--
-- Name: images_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: powerta
--

ALTER SEQUENCE public.images_id_seq OWNED BY public.images.id;


--
-- Name: invoice; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.invoice (
    invoice_id integer NOT NULL,
    pay_terms_in character varying(255),
    ship_to_in character varying(255),
    place_of_supply_in character varying(255),
    order_no_in character varying(255),
    order_date_in character varying(255),
    issue_date_in character varying(255),
    due_date_in character varying(255),
    total_disc_in character varying(255),
    shipping_charge_in character varying(255),
    payment_type_in character varying(255),
    amount_paid_in character varying(255),
    total_amount_in character varying(255),
    customer_f_key integer,
    quot_f_key integer,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    created_by character varying(255),
    updated_by character varying(255),
    is_deleted character varying(255) DEFAULT '0'::character varying,
    user_perm character varying(255) DEFAULT '0'::character varying
);


ALTER TABLE public.invoice OWNER TO postgres;

--
-- Name: invoice_invoice_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.invoice_invoice_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.invoice_invoice_id_seq OWNER TO postgres;

--
-- Name: invoice_invoice_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.invoice_invoice_id_seq OWNED BY public.invoice.invoice_id;


--
-- Name: invoice_list; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.invoice_list (
    invoice_list_id integer NOT NULL,
    price_unit_in character varying(255),
    quantity_in character varying(255),
    discount_in character varying(255),
    cgst_tax_in character varying(255),
    sgst_tax_in character varying(255),
    amount_in character varying(255),
    exp_date_in character varying(255),
    batch_no_in character varying(255),
    product_in character varying(255),
    cgst_tax_amt_in character varying(255),
    sgst_tax_amt_in character varying(255),
    discount_amt_in character varying(255),
    invoice_f_id integer,
    stock_f_id integer,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    created_by character varying(255),
    updated_by character varying(255),
    is_deleted character varying(255) DEFAULT '0'::character varying,
    user_perm character varying(255) DEFAULT '0'::character varying
);


ALTER TABLE public.invoice_list OWNER TO postgres;

--
-- Name: invoice_list_invoice_list_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.invoice_list_invoice_list_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.invoice_list_invoice_list_id_seq OWNER TO postgres;

--
-- Name: invoice_list_invoice_list_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.invoice_list_invoice_list_id_seq OWNED BY public.invoice_list.invoice_list_id;


--
-- Name: ip; Type: TABLE; Schema: public; Owner: powerta
--

CREATE TABLE public.ip (
    id integer NOT NULL,
    ipaddress character varying(255) NOT NULL,
    meta character varying(999999),
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    status character varying(255),
    location character varying(255)
);


ALTER TABLE public.ip OWNER TO powerta;

--
-- Name: ip_id_seq; Type: SEQUENCE; Schema: public; Owner: powerta
--

CREATE SEQUENCE public.ip_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ip_id_seq OWNER TO powerta;

--
-- Name: ip_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: powerta
--

ALTER SEQUENCE public.ip_id_seq OWNED BY public.ip.id;


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
-- Name: labour; Type: TABLE; Schema: public; Owner: powerta
--

CREATE TABLE public.labour (
    labour_id integer NOT NULL,
    labour_name character varying(255) NOT NULL,
    mobile_no character varying(255),
    designation character varying(255),
    adress character varying(255),
    labour_state character varying(255),
    district character varying(255),
    pin character varying(255),
    created_by character varying(25),
    updated_by character varying(25),
    is_deleted character varying(1),
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.labour OWNER TO powerta;

--
-- Name: labour_account; Type: TABLE; Schema: public; Owner: powerta
--

CREATE TABLE public.labour_account (
    labour_account_id integer NOT NULL,
    wage character varying(255),
    ot_wage character varying(255),
    ot_hour character varying(255),
    ta_da character varying(255),
    advance character varying(255),
    no_of_days character varying(255),
    labour_f_key integer,
    site_f_key integer,
    created_by character varying(25),
    updated_by character varying(25),
    is_deleted character varying(1) DEFAULT '0'::character varying,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    user_perm character varying(255) DEFAULT '0'::character varying,
    lab_dat date
);


ALTER TABLE public.labour_account OWNER TO powerta;

--
-- Name: labour_account_labour_account_id_seq; Type: SEQUENCE; Schema: public; Owner: powerta
--

CREATE SEQUENCE public.labour_account_labour_account_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.labour_account_labour_account_id_seq OWNER TO powerta;

--
-- Name: labour_account_labour_account_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: powerta
--

ALTER SEQUENCE public.labour_account_labour_account_id_seq OWNED BY public.labour_account.labour_account_id;


--
-- Name: labour_labour_id_seq; Type: SEQUENCE; Schema: public; Owner: powerta
--

CREATE SEQUENCE public.labour_labour_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.labour_labour_id_seq OWNER TO powerta;

--
-- Name: labour_labour_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: powerta
--

ALTER SEQUENCE public.labour_labour_id_seq OWNED BY public.labour.labour_id;


--
-- Name: payment_out; Type: TABLE; Schema: public; Owner: powerta
--

CREATE TABLE public.payment_out (
    party_name character varying(255),
    receipt_no character varying(255),
    pay_typ character varying(255),
    amount character varying(255),
    ad_desp character varying(255),
    vendor_f_key integer,
    pay_dte date,
    is_deleted character varying(255),
    created_by character varying(255),
    updated_by character varying(255),
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    prty_id integer NOT NULL
);


ALTER TABLE public.payment_out OWNER TO powerta;

--
-- Name: payment_out_prty_id_seq; Type: SEQUENCE; Schema: public; Owner: powerta
--

CREATE SEQUENCE public.payment_out_prty_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.payment_out_prty_id_seq OWNER TO powerta;

--
-- Name: payment_out_prty_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: powerta
--

ALTER SEQUENCE public.payment_out_prty_id_seq OWNED BY public.payment_out.prty_id;


--
-- Name: pos_receipt; Type: TABLE; Schema: public; Owner: powerta
--

CREATE TABLE public.pos_receipt (
    place_of_supply character varying(255),
    enq_date character varying(255),
    issue_date character varying(255),
    due_date character varying(255),
    total_disc character varying(255),
    shiping_charge character varying(255),
    payment_type character varying(255),
    amount_paid character varying(255),
    total_amount character varying(255),
    id integer,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    created_by character varying(255),
    pay_terms character varying(255),
    ship_to character varying(255),
    vendor_f_key integer,
    enq_no character varying(255)
);


ALTER TABLE public.pos_receipt OWNER TO powerta;

--
-- Name: purchase_bill; Type: TABLE; Schema: public; Owner: powerta
--

CREATE TABLE public.purchase_bill (
    bill_id integer NOT NULL,
    bill_date character varying(255),
    total_amount character varying(255),
    type character varying(255),
    status character varying(255),
    quantity character varying(255),
    unitprice character varying(255),
    discount character varying(255),
    discount_percentage character varying(255),
    payment_method character varying(255),
    description character varying(255),
    vendor_f_id integer,
    stock_f_id integer,
    order_id_f_id integer,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    created_by character varying(255)
);


ALTER TABLE public.purchase_bill OWNER TO powerta;

--
-- Name: purchase_bill_bill_id_seq; Type: SEQUENCE; Schema: public; Owner: powerta
--

CREATE SEQUENCE public.purchase_bill_bill_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.purchase_bill_bill_id_seq OWNER TO powerta;

--
-- Name: purchase_bill_bill_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: powerta
--

ALTER SEQUENCE public.purchase_bill_bill_id_seq OWNED BY public.purchase_bill.bill_id;


--
-- Name: purchase_bill_list; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.purchase_bill_list (
    list_id integer NOT NULL,
    list_stockname character varying(255),
    list_price character varying(255),
    list_quantity character varying(255),
    list_discount character varying(255),
    list_tax character varying(255),
    list_amount character varying(255),
    exp_dat character varying(255),
    pur_bill_f_key integer,
    stock_f_key integer,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    created_by character varying(255),
    updated_by character varying(255),
    is_deleted character varying(255) DEFAULT '0'::character varying,
    user_perm character varying(255) DEFAULT '0'::character varying
);


ALTER TABLE public.purchase_bill_list OWNER TO postgres;

--
-- Name: purchase_bill_list_list_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.purchase_bill_list_list_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.purchase_bill_list_list_id_seq OWNER TO postgres;

--
-- Name: purchase_bill_list_list_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.purchase_bill_list_list_id_seq OWNED BY public.purchase_bill_list.list_id;


--
-- Name: purchase_order; Type: TABLE; Schema: public; Owner: powerta
--

CREATE TABLE public.purchase_order (
    order_id integer NOT NULL,
    po_date character varying(255),
    due_date character varying(255),
    total_amount character varying(255),
    status character varying(255) DEFAULT 'pending'::character varying,
    quantity character varying(255),
    unitprice character varying(255),
    discount character varying(255),
    discount_percentage character varying(255),
    payment_method character varying(255),
    description character varying(255),
    vendor_f_id integer,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    created_by character varying(255),
    purchase_bill_status character varying(255) DEFAULT '0'::character varying,
    is_deleted character varying(255)
);


ALTER TABLE public.purchase_order OWNER TO powerta;

--
-- Name: purchase_order_list; Type: TABLE; Schema: public; Owner: powerta
--

CREATE TABLE public.purchase_order_list (
    batch_no character varying(255),
    expiry_date character varying(255),
    quantity character varying(255),
    unit character varying(255),
    price_unit character varying(255),
    discount character varying(255),
    tax character varying(255),
    amount character varying(255),
    pur_order_f_key integer,
    created_by character varying(255),
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    stock_f_key integer,
    list_id integer NOT NULL
);


ALTER TABLE public.purchase_order_list OWNER TO powerta;

--
-- Name: purchase_order_list_list_id_seq; Type: SEQUENCE; Schema: public; Owner: powerta
--

CREATE SEQUENCE public.purchase_order_list_list_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.purchase_order_list_list_id_seq OWNER TO powerta;

--
-- Name: purchase_order_list_list_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: powerta
--

ALTER SEQUENCE public.purchase_order_list_list_id_seq OWNED BY public.purchase_order_list.list_id;


--
-- Name: purchase_order_order_id_seq; Type: SEQUENCE; Schema: public; Owner: powerta
--

CREATE SEQUENCE public.purchase_order_order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.purchase_order_order_id_seq OWNER TO powerta;

--
-- Name: purchase_order_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: powerta
--

ALTER SEQUENCE public.purchase_order_order_id_seq OWNED BY public.purchase_order.order_id;


--
-- Name: purchase_return; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.purchase_return (
    return_id integer NOT NULL,
    return_dat character varying(255),
    pur_bill_fid integer,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    created_by character varying(255),
    updated_by character varying(255),
    is_deleted character varying(255) DEFAULT '0'::character varying,
    user_perm character varying(255) DEFAULT '0'::character varying
);


ALTER TABLE public.purchase_return OWNER TO postgres;

--
-- Name: purchase_return_return_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.purchase_return_return_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.purchase_return_return_id_seq OWNER TO postgres;

--
-- Name: purchase_return_return_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.purchase_return_return_id_seq OWNED BY public.purchase_return.return_id;


--
-- Name: quotation; Type: TABLE; Schema: public; Owner: powerta
--

CREATE TABLE public.quotation (
    place_of_supply character varying(255) NOT NULL,
    enq_date character varying(255),
    issue_date character varying(255),
    due_date character varying(255),
    total_disc character varying(255),
    shiping_charge character varying(255),
    payment_type character varying(255),
    amount_paid character varying(255),
    total_amount character varying(255),
    id integer NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    created_by character varying(255),
    pay_terms character varying(255),
    ship_to character varying(255),
    vendor_f_key integer,
    enq_no character varying(255)
);


ALTER TABLE public.quotation OWNER TO powerta;

--
-- Name: quotation_id_seq; Type: SEQUENCE; Schema: public; Owner: powerta
--

CREATE SEQUENCE public.quotation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.quotation_id_seq OWNER TO powerta;

--
-- Name: quotation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: powerta
--

ALTER SEQUENCE public.quotation_id_seq OWNED BY public.quotation.id;


--
-- Name: quotation_list; Type: TABLE; Schema: public; Owner: powerta
--

CREATE TABLE public.quotation_list (
    quot_list_id integer NOT NULL,
    batch_no character varying(255),
    exp_dat character varying(255),
    quant character varying(255),
    unit character varying(255),
    price_unit character varying(255),
    discount character varying(255),
    tax character varying(255),
    amount character varying(255),
    quot_f_id integer,
    hsn_cde character varying(255),
    created_by character varying(25),
    updated_by character varying(25),
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    stock_f_id integer
);


ALTER TABLE public.quotation_list OWNER TO powerta;

--
-- Name: quotation_list_quot_list_id_seq; Type: SEQUENCE; Schema: public; Owner: powerta
--

CREATE SEQUENCE public.quotation_list_quot_list_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.quotation_list_quot_list_id_seq OWNER TO powerta;

--
-- Name: quotation_list_quot_list_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: powerta
--

ALTER SEQUENCE public.quotation_list_quot_list_id_seq OWNED BY public.quotation_list.quot_list_id;


--
-- Name: site; Type: TABLE; Schema: public; Owner: powerta
--

CREATE TABLE public.site (
    site_id integer NOT NULL,
    site_name character varying(255) NOT NULL,
    site_location character varying(255),
    owner_name character varying(255),
    phone_no character varying(255),
    adress character varying(255),
    site_state character varying(255),
    district character varying(255),
    pin character varying(255),
    email_id character varying(255),
    created_by character varying(25),
    updated_by character varying(25),
    is_deleted character varying(1),
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.site OWNER TO powerta;

--
-- Name: site_expense; Type: TABLE; Schema: public; Owner: powerta
--

CREATE TABLE public.site_expense (
    site_exp_id integer NOT NULL,
    expense_amount character varying(255),
    previous_advance character varying(255),
    advance_required character varying(255),
    employee_f_key integer,
    site_f_key integer,
    "timestamp" timestamp without time zone,
    exp_cat character varying(255),
    pay_typ character varying(255),
    desp character varying(255),
    exp_no character varying(255),
    user_perm character varying(255) DEFAULT '0'::character varying,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    is_deleted character varying(255) DEFAULT '0'::character varying,
    exp_dat date
);


ALTER TABLE public.site_expense OWNER TO powerta;

--
-- Name: site_expense_site_exp_id_seq; Type: SEQUENCE; Schema: public; Owner: powerta
--

CREATE SEQUENCE public.site_expense_site_exp_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.site_expense_site_exp_id_seq OWNER TO powerta;

--
-- Name: site_expense_site_exp_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: powerta
--

ALTER SEQUENCE public.site_expense_site_exp_id_seq OWNED BY public.site_expense.site_exp_id;


--
-- Name: site_site_id_seq; Type: SEQUENCE; Schema: public; Owner: powerta
--

CREATE SEQUENCE public.site_site_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.site_site_id_seq OWNER TO powerta;

--
-- Name: site_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: powerta
--

ALTER SEQUENCE public.site_site_id_seq OWNED BY public.site.site_id;


--
-- Name: stock; Type: TABLE; Schema: public; Owner: powerta
--

CREATE TABLE public.stock (
    stock_id integer NOT NULL,
    sales_price character varying(255),
    unit character varying(255),
    opening_stock character varying(255),
    as_of_date character varying(255),
    low_stock character varying(255),
    purchase_price character varying(255),
    hsn_code character varying(255),
    item_code character varying(255),
    item_description character varying(255),
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    discount character varying(255),
    sku character varying(255),
    manufacturer character varying(255),
    brand character varying(255),
    bach_no character varying(255),
    expiry character varying(255),
    high_stock character varying(255),
    current_stock character varying(255),
    quantity character varying(255),
    barcode character varying(255),
    stock_f_id integer
);


ALTER TABLE public.stock OWNER TO powerta;

--
-- Name: stock_collection; Type: TABLE; Schema: public; Owner: powerta
--

CREATE TABLE public.stock_collection (
    product character varying(255) NOT NULL,
    tax_per character varying(255),
    category character varying(255) NOT NULL,
    stock_typ character varying(255),
    product_id integer NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    created_by character varying(255)
);


ALTER TABLE public.stock_collection OWNER TO powerta;

--
-- Name: stock_collection_product_id_seq; Type: SEQUENCE; Schema: public; Owner: powerta
--

CREATE SEQUENCE public.stock_collection_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stock_collection_product_id_seq OWNER TO powerta;

--
-- Name: stock_collection_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: powerta
--

ALTER SEQUENCE public.stock_collection_product_id_seq OWNED BY public.stock_collection.product_id;


--
-- Name: stock_stock_id_seq; Type: SEQUENCE; Schema: public; Owner: powerta
--

CREATE SEQUENCE public.stock_stock_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stock_stock_id_seq OWNER TO powerta;

--
-- Name: stock_stock_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: powerta
--

ALTER SEQUENCE public.stock_stock_id_seq OWNED BY public.stock.stock_id;


--
-- Name: update; Type: TABLE; Schema: public; Owner: powerta
--

CREATE TABLE public.update (
    upid integer NOT NULL,
    topicname character varying(9555) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.update OWNER TO powerta;

--
-- Name: update_upid_seq; Type: SEQUENCE; Schema: public; Owner: powerta
--

CREATE SEQUENCE public.update_upid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.update_upid_seq OWNER TO powerta;

--
-- Name: update_upid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: powerta
--

ALTER SEQUENCE public.update_upid_seq OWNED BY public.update.upid;


--
-- Name: userlog; Type: TABLE; Schema: public; Owner: powerta
--

CREATE TABLE public.userlog (
    id integer NOT NULL,
    username character varying(255) NOT NULL,
    user_password character varying(255) NOT NULL,
    emaid character varying(255) NOT NULL,
    status character varying(255) NOT NULL,
    meta character varying(999999) NOT NULL,
    created_time character varying(255) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    created_by character varying(255),
    updated_by character varying(255)
);


ALTER TABLE public.userlog OWNER TO powerta;

--
-- Name: userlog_id_seq; Type: SEQUENCE; Schema: public; Owner: powerta
--

CREATE SEQUENCE public.userlog_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.userlog_id_seq OWNER TO powerta;

--
-- Name: userlog_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: powerta
--

ALTER SEQUENCE public.userlog_id_seq OWNED BY public.userlog.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: powerta
--

CREATE TABLE public.users (
    id uuid NOT NULL,
    email character varying(128) NOT NULL,
    password character varying(128) NOT NULL,
    created_date timestamp without time zone,
    modified_date timestamp without time zone
);


ALTER TABLE public.users OWNER TO powerta;

--
-- Name: vendor; Type: TABLE; Schema: public; Owner: powerta
--

CREATE TABLE public.vendor (
    personid integer NOT NULL,
    vendor_name character varying(255) NOT NULL,
    gst_in character varying(255),
    phone_no character varying(255),
    gst_type character varying(255),
    state character varying(255),
    email_id character varying(255),
    billing_address character varying(255),
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    created_by character varying(255)
);


ALTER TABLE public.vendor OWNER TO powerta;

--
-- Name: vendor_personid_seq; Type: SEQUENCE; Schema: public; Owner: powerta
--

CREATE SEQUENCE public.vendor_personid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vendor_personid_seq OWNER TO powerta;

--
-- Name: vendor_personid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: powerta
--

ALTER SEQUENCE public.vendor_personid_seq OWNED BY public.vendor.personid;


--
-- Name: accountings id; Type: DEFAULT; Schema: public; Owner: powerta
--

ALTER TABLE ONLY public.accountings ALTER COLUMN id SET DEFAULT nextval('public.accountings_id_seq'::regclass);


--
-- Name: employee empid; Type: DEFAULT; Schema: public; Owner: powerta
--

ALTER TABLE ONLY public.employee ALTER COLUMN empid SET DEFAULT nextval('public.employee_empid_seq'::regclass);


--
-- Name: images id; Type: DEFAULT; Schema: public; Owner: powerta
--

ALTER TABLE ONLY public.images ALTER COLUMN id SET DEFAULT nextval('public.images_id_seq'::regclass);


--
-- Name: invoice invoice_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invoice ALTER COLUMN invoice_id SET DEFAULT nextval('public.invoice_invoice_id_seq'::regclass);


--
-- Name: invoice_list invoice_list_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invoice_list ALTER COLUMN invoice_list_id SET DEFAULT nextval('public.invoice_list_invoice_list_id_seq'::regclass);


--
-- Name: ip id; Type: DEFAULT; Schema: public; Owner: powerta
--

ALTER TABLE ONLY public.ip ALTER COLUMN id SET DEFAULT nextval('public.ip_id_seq'::regclass);


--
-- Name: keymeta id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.keymeta ALTER COLUMN id SET DEFAULT nextval('public.keymeta_id_seq'::regclass);


--
-- Name: labour labour_id; Type: DEFAULT; Schema: public; Owner: powerta
--

ALTER TABLE ONLY public.labour ALTER COLUMN labour_id SET DEFAULT nextval('public.labour_labour_id_seq'::regclass);


--
-- Name: labour_account labour_account_id; Type: DEFAULT; Schema: public; Owner: powerta
--

ALTER TABLE ONLY public.labour_account ALTER COLUMN labour_account_id SET DEFAULT nextval('public.labour_account_labour_account_id_seq'::regclass);


--
-- Name: payment_out prty_id; Type: DEFAULT; Schema: public; Owner: powerta
--

ALTER TABLE ONLY public.payment_out ALTER COLUMN prty_id SET DEFAULT nextval('public.payment_out_prty_id_seq'::regclass);


--
-- Name: purchase_bill bill_id; Type: DEFAULT; Schema: public; Owner: powerta
--

ALTER TABLE ONLY public.purchase_bill ALTER COLUMN bill_id SET DEFAULT nextval('public.purchase_bill_bill_id_seq'::regclass);


--
-- Name: purchase_bill_list list_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchase_bill_list ALTER COLUMN list_id SET DEFAULT nextval('public.purchase_bill_list_list_id_seq'::regclass);


--
-- Name: purchase_order order_id; Type: DEFAULT; Schema: public; Owner: powerta
--

ALTER TABLE ONLY public.purchase_order ALTER COLUMN order_id SET DEFAULT nextval('public.purchase_order_order_id_seq'::regclass);


--
-- Name: purchase_order_list list_id; Type: DEFAULT; Schema: public; Owner: powerta
--

ALTER TABLE ONLY public.purchase_order_list ALTER COLUMN list_id SET DEFAULT nextval('public.purchase_order_list_list_id_seq'::regclass);


--
-- Name: purchase_return return_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchase_return ALTER COLUMN return_id SET DEFAULT nextval('public.purchase_return_return_id_seq'::regclass);


--
-- Name: quotation id; Type: DEFAULT; Schema: public; Owner: powerta
--

ALTER TABLE ONLY public.quotation ALTER COLUMN id SET DEFAULT nextval('public.quotation_id_seq'::regclass);


--
-- Name: quotation_list quot_list_id; Type: DEFAULT; Schema: public; Owner: powerta
--

ALTER TABLE ONLY public.quotation_list ALTER COLUMN quot_list_id SET DEFAULT nextval('public.quotation_list_quot_list_id_seq'::regclass);


--
-- Name: site site_id; Type: DEFAULT; Schema: public; Owner: powerta
--

ALTER TABLE ONLY public.site ALTER COLUMN site_id SET DEFAULT nextval('public.site_site_id_seq'::regclass);


--
-- Name: site_expense site_exp_id; Type: DEFAULT; Schema: public; Owner: powerta
--

ALTER TABLE ONLY public.site_expense ALTER COLUMN site_exp_id SET DEFAULT nextval('public.site_expense_site_exp_id_seq'::regclass);


--
-- Name: stock stock_id; Type: DEFAULT; Schema: public; Owner: powerta
--

ALTER TABLE ONLY public.stock ALTER COLUMN stock_id SET DEFAULT nextval('public.stock_stock_id_seq'::regclass);


--
-- Name: stock_collection product_id; Type: DEFAULT; Schema: public; Owner: powerta
--

ALTER TABLE ONLY public.stock_collection ALTER COLUMN product_id SET DEFAULT nextval('public.stock_collection_product_id_seq'::regclass);


--
-- Name: update upid; Type: DEFAULT; Schema: public; Owner: powerta
--

ALTER TABLE ONLY public.update ALTER COLUMN upid SET DEFAULT nextval('public.update_upid_seq'::regclass);


--
-- Name: userlog id; Type: DEFAULT; Schema: public; Owner: powerta
--

ALTER TABLE ONLY public.userlog ALTER COLUMN id SET DEFAULT nextval('public.userlog_id_seq'::regclass);


--
-- Name: vendor personid; Type: DEFAULT; Schema: public; Owner: powerta
--

ALTER TABLE ONLY public.vendor ALTER COLUMN personid SET DEFAULT nextval('public.vendor_personid_seq'::regclass);


--
-- Data for Name: accountings; Type: TABLE DATA; Schema: public; Owner: powerta
--

COPY public.accountings (id, name, opening_balance, as_of_date, acc_no, ifc_code, upid, acc_holder_name, bank, payment_type, amount, description, created_by, updated_by, created_at, updated_at) FROM stdin;
84	s2	6565656546554545	2023-01-30	2145454	45545463	63541645	hguygyh	knply	\N	\N	\N	100259754	\N	2023-02-24 11:05:55.635944+00	2023-02-24 11:05:55.635944+00
85	s2	6565656546554545	2023-01-30	2145454	45545463	63541645	hguygyh	knply	\N	\N	\N	100259754	\N	2023-02-24 11:06:01.890849+00	2023-02-24 11:06:01.890849+00
86	ADDCard	5421	2023-02-12	54	\N	\N	\N	\N	\N	\N	hgfcj	100018287	\N	2023-02-24 11:08:19.705738+00	2023-02-24 11:08:19.705738+00
87	ADDCard	-1	2023-02-16	55	\N	\N	\N	\N	\N	\N	uuyty	100529083	\N	2023-02-25 06:00:50.072029+00	2023-02-25 06:00:50.072029+00
88									\N	\N	\N	100754750	\N	2023-02-25 06:07:47.172807+00	2023-02-25 06:07:47.172807+00
89	s2	rgd	2023-02-17	2144	fgnf234	2434		dfsdhh	\N	\N	\N	100754750	\N	2023-02-25 06:08:27.474687+00	2023-02-25 06:08:27.474687+00
\.


--
-- Data for Name: customer; Type: TABLE DATA; Schema: public; Owner: powerta
--

COPY public.customer (client_id, client_name, gst_no, phone_no, gst_type, state, email_id, client_address, created_at, updated_at, created_by) FROM stdin;
\.


--
-- Data for Name: employee; Type: TABLE DATA; Schema: public; Owner: powerta
--

COPY public.employee (empid, emp_name, address, dob, phone_no, city, employee_state, district, pin, email_id, higher_edu, institute_edu, higher_edu_date, presently_employed, last_work, designation, is_deleted, created_at, updated_at, created_by, updated_by) FROM stdin;
786	vbn	nmbm		1234567890	,jn,j	Tamilnadu	mnm,	123456	n				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
787	vbn	nmbm		1234567890	,jn,j	Tamilnadu	mnm,	123456	n				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
788	vbn	nmbm		1234567890	,jn,j	Tamilnadu	mnm,	123456	n				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
789	vbn	nmbm		1234567890	,jn,j	Tamilnadu	mnm,	123456	n				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
790	vbn	nmbm		1234567890	,jn,j	Tamilnadu	mnm,	123456	n				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
791	vbn	nmbm		1234567890	,jn,j	Tamilnadu	mnm,	123456	n				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
792	vbn	nmbm		1234567890	,jn,j	Tamilnadu	mnm,	123456	n				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
793	vbn	nmbm		1234567890	,jn,j	Tamilnadu	mnm,	123456	n				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
794	vbn	nmbm		1234567890	,jn,j	Tamilnadu	mnm,	123456	n				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
795	vbn	nmbm		1234567890	,jn,j	Tamilnadu	mnm,	123456	n				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
796	vbn	nmbm		1234567890	,jn,j	Tamilnadu	mnm,	123456	n				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
797	vbn	nmbm		1234567890	,jn,j	Tamilnadu	mnm,	123456	n				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
798	vbn	nmbm		1234567890	,jn,j	Tamilnadu	mnm,	123456	n				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
799	vbn	nmbm		1234567890	,jn,j	Tamilnadu	mnm,	123456	n				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
800	vbn	nmbm		1234567890	,jn,j	Tamilnadu	mnm,	123456	n				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
801	vbn	nmbm		1234567890	,jn,j	Tamilnadu	mnm,	123456	n				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
802	s	s		1234567890	d	Kerala	d	123456	d				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
803	s	s		1234567890	d	Kerala	d	123456	d				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
804	s	s		1234567890	d	Kerala	d	123456	d				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
805	s	s		1234567890	d	Kerala	d	123456	d				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
807	s	s		1234567890	d	Kerala	d	123456	d				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
823	s	s		1234567890	d	Kerala	d	123456	d				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
806	s	s		1234567890	d	Kerala	d	123456	d				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
808	s	s		1234567890	d	Kerala	d	123456	d				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
809	s	s		1234567890	d	Kerala	d	123456	d				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
810	s	s		1234567890	d	Kerala	d	123456	d				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
811	s	s		1234567890	d	Kerala	d	123456	d				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
812	s	s		1234567890	d	Kerala	d	123456	d				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
813	s	s		1234567890	d	Kerala	d	123456	d				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
814	s	s		1234567890	d	Kerala	d	123456	d				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
815	s	s		1234567890	d	Kerala	d	123456	d				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
816	s	s		1234567890	d	Kerala	d	123456	d				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
817	s	s		1234567890	d	Kerala	d	123456	d				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
818	s	s		1234567890	d	Kerala	d	123456	d				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
819	s	s		1234567890	d	Kerala	d	123456	d				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
820	s	s		1234567890	d	Kerala	d	123456	d				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
821	s	s		1234567890	d	Kerala	d	123456	d				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
822	s	s		1234567890	d	Kerala	d	123456	d				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
824	s	s		1234567890	d	Kerala	d	123456	d				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
825	s	s		1234567890	d	Kerala	d	123456	d				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
826	s	s		1234567890	d	Kerala	d	123456	d				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
827	s	s		1234567890	d	Kerala	d	123456	d				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
828	s	s		1234567890	d	Kerala	d	123456	d				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
829	s	s		1234567890	d	Kerala	d	123456	d				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
830	s	s		1234567890	d	Kerala	d	123456	d				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
831	s	s		1234567890	d	Kerala	d	123456	d				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
832	s	s		1234567890	d	Kerala	d	123456	d				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
833	s	s		1234567890	d	Kerala	d	123456	d				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
834	s	s		1234567890	d	Kerala	d	123456	d				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
835	s	s		1234567890	d	Kerala	d	123456	d				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
836	s	s		1234567890	d	Kerala	d	123456	d				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
837	s	s		1234567890	d	Kerala	d	123456	d				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
838	s	s		1234567890	d	Kerala	d	123456	d				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
839	s	s		1234567890	d	Kerala	d	123456	d				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
840	s	s		1234567890	d	Kerala	d	123456	d				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
841	s	s		1234567890	d	Kerala	d	123456	d				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
842	s	s		1234567890	d	Kerala	d	123456	d				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
843	s	s		1234567890	d	Kerala	d	123456	d				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
844	s	s		1234567890	d	Kerala	d	123456	d				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
845	s	s		1234567890	d	Kerala	d	123456	d				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
846	s	s		1234567890	d	Kerala	d	123456	d				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
847	s	s		1234567890	d	Kerala	d	123456	d				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
848	s	s		1234567890	d	Kerala	d	123456	d				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
849	s	s		1234567890	d	Kerala	d	123456	d				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
850	s	s		1234567890	d	Kerala	d	123456	d				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
851	s	s		1234567890	d	Kerala	d	123456	d				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
852	s	s		1234567890	d	Kerala	d	123456	d				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
853	s	s		1234567890	d	Kerala	d	123456	d				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
854	s	s		1234567890	d	Kerala	d	123456	d				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
855	s	s		1234567890	d	Kerala	d	123456	d				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
856	s	s		1234567890	d	Kerala	d	123456	d				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
857	s	s		1234567890	d	Kerala	d	123456	d				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
858	s	s		1234567890	d	Kerala	d	123456	d				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
859	s	s		1234567890	d	Kerala	d	123456	d				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
860	s	s		1234567890	d	Kerala	d	123456	d				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
861	s	s		1234567890	d	Kerala	d	123456	d				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
862	s	s		1234567890	d	Kerala	d	123456	d				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
863	ff	sdfg		1234567890	gb	Tamilnadu	gg	123456	g				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
864	vdf	fxfd		2345678901	bncg	Tamilnadu	bcbv	123456	d				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
865	vdf	fxfd		2345678901	bncg	Tamilnadu	bcbv	123456	d				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
866	fgggg	yuuu	2023-01-05	9995760784	lll	Tamilnadu	rttt	123456	sachi@gmail.com	rrrr	uuuu	2023-01-12	no	jhvmb	\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
867	hjg	ukg		1234567890	klh	Kerala	jkh	123456	nj				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
869	asas	asas	2022-12-28	8075569925	asas	Tamilnadu	asas	680662	a@h.com				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
884	adii	ass		9876567809	acac	Tamilnadu	acsac	123456	d@g.com				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
868	asas	asas	2022-12-28	8075569925	asas	Tamilnadu	asas	680662	a@h.com				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
870						Select State							undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
871	else oaul	else	2023-01-13	8907046265	fdsgd	Select State		785289	else@gmail.cm	else	erj	2023-01-19	yes	hrthrjd	\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
872	else	sdbnfljak	2023-01-11	7012370456	kdfjsdb	Karnataka	wayanad	670645	else@gmail.com	akdsjbkabf	asbdkbv	2023-01-04	yes	asbnvlnvlsanc	\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
873	else 	kxnclanclakz	2023-01-06	7894561235	kbcxkbv	Tamilnadu	csakca	789156	else@gmail.com	lnasfjk	asasnfk	2023-01-05	yes	asd nlan vls	\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
874	else 	kxnclanclakz	2023-01-06	7894561235	kbcxkbv	Tamilnadu	csakca	789156	else@gmail.com	lnasfjk	asasnfk	2023-01-05	yes	asd nlan vls	\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
875	adi	kollam	2023-01-27	3241657890	kollam	Tamilnadu	kollam	123456	a@g.com	ad			undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
876	adi	kollam	2023-01-27	3241657890	kollam	Tamilnadu	kollam	123456	a@g.com	ad			undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
877	adii	ass		9876567809	acac	Tamilnadu	acsac	123456	d@g.com				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
878	adii	ass		9876567809	acac	Tamilnadu	acsac	123456	d@g.com				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
879	adii	ass		9876567809	acac	Tamilnadu	acsac	123456	d@g.com				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
880	adii	ass		9876567809	acac	Tamilnadu	acsac	123456	d@g.com				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
881	adii	ass		9876567809	acac	Tamilnadu	acsac	123456	d@g.com				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
882	adii	ass		9876567809	acac	Tamilnadu	acsac	123456	d@g.com				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
883	adii	ass		9876567809	acac	Tamilnadu	acsac	123456	d@g.com				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
885	afaf	saafsa	2023-01-20	6574839209	aca	Kerala	dcad	123456	a@g.com				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
886	afaf	saafsa	2023-01-20	6574839209	aca	Kerala	dcad	123456	a@g.com				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
887	afaf	saafsa	2023-01-20	6574839209	aca	Kerala	dcad	123456	a@g.com				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
888	afaf	saafsa	2023-01-20	6574839209	aca	Kerala	dcad	123456	a@g.com				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
889	afaf	saafsa	2023-01-20	6574839209	aca	Kerala	dcad	123456	a@g.com				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
890	afaf	saafsa	2023-01-20	6574839209	aca	Kerala	dcad	123456	a@g.com				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
891	adiiii	cxc	2023-01-06	8976879087	cxCX	Tamilnadu	mnm	123456	s@g.com				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
892	adiiii	cxc	2023-01-06	8976879087	cxCX	Tamilnadu	mnm	123456	s@g.com				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
893	pran	add	2023-01-20	9061399830	sf	Kerala	etw	123456	d@g.com				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
894	pran	add	2023-01-20	9061399830	sf	Kerala	etw	123456	d@g.com				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
895	gin	sfsg	2023-01-12	9061399830	sdvda	Kerala	cs	123456	d@d.com				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
896	gin	sfsg	2023-01-12	9061399830	sdvda	Kerala	cs	123456	d@d.com				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
897	darrr	sdf		9034256176	cxzvd	Kerala	zxc	123456	d@g.com				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
898	darrr	sdf		9034256176	cxzvd	Kerala	zxc	123456	d@g.com				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
899	dddd	nbb	2023-01-27	9061399830	zvsd	Kerala	vddsvd	123456	a@g.com				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
901	kamal	ass	2023-01-05	9061399830	svsdv	Kerala	vdf	123456	s@g.com				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
900	kamal	ass	2023-01-05	9061399830	svsdv	Kerala	vdf	123456	s@g.com				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
902	adi	sss	2023-01-27	8909897865	sxa	Kerala	axax	123456	s@g.com				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
903	anas salam	kollam	2023-01-29	8075569925	kumaranchira	Kerala	kollam	680550	a@gmail.com	plus 2	abcd	2023-01-29	yes	google	\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
904	stephen	addda	2023-01-20	9078563412	sdv	Tamilnadu	ssa	123456	s@g.com				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
905	nasar	sdds	2023-01-05	9087654312	adfad	Tamilnadu	asas	123456	s@g.com				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
906	asdsds	Csc	2023-01-14	9087564321	CC	Kerala	sdv	123456	d@g.com				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
907	axan	aca	2023-01-26	9087654321	casc	Kerala	acsa	123456	d@g.com				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
908	nancy	adc	2023-01-20	9087654321	asc	Kerala	asc	123456	a@g.com				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
909	matayi	fb	2023-01-12	9087654321	d	Kerala	d	906139	a@g.com				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
910	Nancc	a	2023-01-07	9087654321	s	Kerala	n	123456	d@g.com				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
911	Nancc	a	2023-01-07	9087654321	s	Kerala	n	123456	d@g.com				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
913	Nancc	a	2023-01-07	9087654321	s	Kerala	n	123456	d@g.com				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
914	Nancc	a	2023-01-07	9087654321	s	Kerala	n	123456	d@g.com				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
915	Nancc	a	2023-01-07	9087654321	s	Kerala	n	123456	d@g.com				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
916	fone	s	2023-01-20	9061399830	a	Tamilnadu	dd	123456	a@g.com				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
917	fone	s	2023-01-20	9061399830	a	Tamilnadu	dd	123456	a@g.com				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
918	fonet	s	2023-01-20	9061399830	a	Tamilnadu	dd	123456	a@g.com				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
912	Nancc	a	2023-01-07	9087654321	s	Kerala	n	123456	d@g.com				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
919	fonet	s	2023-01-20	9061399830	a	Tamilnadu	dd	123456	a@g.com				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
920	aone	sd	2023-01-28	9089674523	fv	Kerala	f	123456	a@g.com				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
921	am	ad	2023-01-27	9654774744	as	Karnataka	a	123456	s@g.com				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
922	am	ad	2023-01-27	9654774744	as	Karnataka	a	123456	s@g.com				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
923	new	s	2023-01-23	9087653432	s	Kerala	s	123456	a@g.com				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
924	new	s	2023-01-23	9087653432	s	Kerala	s	123456	a@g.com				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
925	wwww	as	2023-01-23	9464636352	sa	Tamilnadu	as	123456	a@g.xo				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
926	aaa	a	2023-01-25	9877565622	a	Kerala	a	123456	s@g.ce				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
927	adcs	ax		1234567890	axsa	Kerala	fvdfs	123456	s				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
928	hjk	hh	2023-01-29	1234567890	sd	Tamilnadu	a	123456	h				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
929	hjk	hh	2023-01-29	1234567890	sd	Tamilnadu	a	123456	h				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
930	hjk	hh	2023-01-29	1234567890	sd	Tamilnadu	a	123456	h				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
931	hjk	hh	2023-01-29	1234567890	sd	Tamilnadu	a	123456	h				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
932	hjk	hh	2023-01-29	1234567890	sd	Tamilnadu	a	123456	h				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
933	hjk	hh	2023-01-29	1234567890	sd	Tamilnadu	a	123456	h				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
934	hjk	hh	2023-01-29	1234567890	sd	Tamilnadu	a	123456	h				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
935	hjk	hh	2023-01-29	1234567890	sd	Tamilnadu	a	123456	h				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
936	hjk	hh	2023-01-29	1234567890	sd	Tamilnadu	a	123456	h				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
937	hjk	hh	2023-01-29	1234567890	sd	Tamilnadu	a	123456	h				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
938	hjk	hh	2023-01-29	1234567890	sd	Tamilnadu	a	123456	h				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
939	hjk	hh	2023-01-29	1234567890	sd	Tamilnadu	a	123456	h				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
940	hjk	hh	2023-01-29	1234567890	sd	Tamilnadu	a	123456	h				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
941	hjk	hh	2023-01-29	1234567890	sd	Tamilnadu	a	123456	h				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
942	hjk	hh	2023-01-29	1234567890	sd	Tamilnadu	a	123456	h				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
943	hjk	hh	2023-01-29	1234567890	sd	Tamilnadu	a	123456	h				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
944	hjk	hh	2023-01-29	1234567890	sd	Tamilnadu	a	123456	h				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
946	hjk	hh	2023-01-29	1234567890	sd	Tamilnadu	a	123456	h				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
948	ads	as	2023-01-25	1234567890	wd	Karnataka	d	123456	a				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
945	hjk	hh	2023-01-29	1234567890	sd	Tamilnadu	a	123456	h				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
947	asdwd	acs	2023-01-24	1234567890	scxa	Tamilnadu	sdac	123456	s				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
949	ads	as	2023-01-25	1234567890	wd	Karnataka	d	123456	a				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
950	ads	as	2023-01-25	1234567890	wd	Karnataka	d	123456	a				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
951	a	a	2023-01-05	1232312143	a	Tamilnadu	a	122121	s				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
952	zx	s	2023-01-18	1234567890	s	Tamilnadu	s	123456	a@g.co	d	d	2023-01-25	no		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
953	sclsmcs	asmc ansmc		7867867867	as,cnslka	Tamilnadu	ascmsa	123456	a@g.co				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
954	x	s	2023-01-05	3434314132	s	Karnataka	s	123456	c				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
955	x	s	2023-01-05	3434314132	s	Karnataka	s	123456	c				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
956	x	s	2023-01-05	3434314132	s	Karnataka	s	123456	c				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
957	x	s	2023-01-05	3434314132	s	Karnataka	s	123456	c				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
958	x	s	2023-01-05	3434314132	s	Karnataka	s	123456	c				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
959	axcx	axc		8765432123	ac	Karnataka	axc	123456	d				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
960	asd	asc		1234567890	asc	Karnataka	cx	123456	s				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
961	asd	asc		1234567890	asc	Karnataka	cx	123456	s				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
962	asd	asc		1234567890	asc	Karnataka	cx	123456	s				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
963	asd	asc		1234567890	asc	Karnataka	cx	123456	s				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
964	s	s		1234567890	s	Karnataka	s	123456	d				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
965	asd	asc		1234567890	asc	Karnataka	cx	123456	s				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
966	s	s		1234567890	s	Karnataka	s	123456	d				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
967	s	s		1234567890	s	Karnataka	s	123456	d				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
968	s	s		1234567890	s	Karnataka	s	123456	d				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
969	s	s		1234567890	s	Karnataka	s	123456	d				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
970	FFFF	BGG	2023-01-24	8888888888	HGF	Tamilnadu	JFJavsc	123456	S@G.COM	WERFUDY	DGHVSNX	2023-01-13	undefined	MHDVBX	\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
971	FFFF	BGG	2023-01-24	8888888888	HGF	Tamilnadu	JFJavsc	123456	S@G.COM	WERFUDY	DGHVSNX	2023-01-13	undefined	MHDVBX	\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
972	FFFF	BGG	2023-01-24	8888888888	HGF	Tamilnadu	JFJavsc	123456	S@G.COM	WERFUDY	DGHVSNX	2023-01-13	undefined	MHDVBX	\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
973	s	s		1234567890	s	Karnataka	s	123456	d				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
974	FFFF	BGG	2023-01-24	8888888888	HGF	Tamilnadu	JFJavsc	123456	S@G.COM	WERFUDY	DGHVSNX	2023-01-13	undefined	MHDVBX	\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
975	s	s		1234567890	s	Karnataka	s	123456	d				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
976	dfd	sdcdc		9943665465	sdfd	Kerala	dc	123456	s@g.co				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
977	nbmvv	nvmnv	2023-01-20	9867857657	vnvb	Kerala	bncn	123456	a@g.co				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
978	nbmvv	nvmnv	2023-01-20	9867857657	vnvb	Kerala	bncn	123456	a@g.co				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
979	nnn	b	2023-01-17	9776654444	g	Kerala	h	123456	a@g.co				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
980	bb	bn		9088676543	b	Kerala	g	123456	a@g.co				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
981	bb	bn		9088676543	b	Kerala	g	123456	a@g.co				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
982	bb	bn		9088676543	b	Kerala	g	123456	a@g.co				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
983	bb	bn		9088676543	b	Kerala	g	123456	a@g.co				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
984	bb	bn		9088676543	b	Kerala	g	123456	a@g.co				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
985	nn	 k		9887766565	m	Kerala	n	123456	d@g.com				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
986	gn	b	2023-01-11	9767567567	n	Kerala	n	123456	d@g.com				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
987	gn	b	2023-01-11	9767567567	n	Kerala	n	123456	d@g.com				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
988	aj	g	2023-01-11	9887766555	m	Tamilnadu	n	123456	a@g.com				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
989	aa	aa	2023-01-16	9786868688	aa	Kerala	aa	123456	a@g.com				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
990	sa	da	2023-01-03	9857575773	fsg	Kerala	sd	123456	a@g.co				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
991	sa	da	2023-01-03	9857575773	fsg	Kerala	sd	123456	a@g.co				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
992	sa	da	2023-01-03	9857575773	fsg	Kerala	sd	123456	a@g.co				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
993	cx c	aca		1234567890	asc	Tamilnadu	ac	123456	d				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
994	adi	a	2023-01-11	9445346565	ade	Kerala	sd	123456	a@d.com				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
995	sdfdf	ch	2023-01-17	9568567656	df	Tamilnadu	fx	123456	a@g.com				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
996	sdas	fdgfhdh	2023-01-17	9934567890	dgf	Kerala	xfx	123455	a@g.com				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
997	adithyan	asdd	2023-01-10	8934834434	sdv	Kerala	df	123456	a@g.com				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
998	dwf	f	2023-01-17	9348377474	df	Kerala	f	123456	a@g.com				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
999	DFSF	D	2023-01-19	9766566676	D	Kerala	D	123456	a@g.com				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
1000	ss	asa	2023-01-17	9887767766	sd	Tamilnadu	sdc	123456	a@g.com				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
1001	adf	daf	2023-01-05	9778787777	ds	Kerala	asc	123456	a@g.com				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
1002	adc	dc	2023-01-17	9048484747	adca	Kerala	adc	123456	a@g.com				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
1003	adc	dc	2023-01-17	9048484747	adca	Kerala	adc	123456	a@g.com				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
1004	adc	dc	2023-01-17	9048484747	adca	Kerala	adc	123456	a@g.com				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
1005	fg	gggg	2023-01-11	9066644564	hvj	Tamilnadu	nvgh	123456	s@g.com				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
1006	fg	gggg	2023-01-11	9066644564	hvj	Tamilnadu	nvgh	123456	s@g.com				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
1007	fg	gggg	2023-01-11	9066644564	hvj	Tamilnadu	nvgh	123456	s@g.com	jbhm		2023-01-12	undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
1008	akaaaa	ghfhg	2023-01-12	9876456756	kjhkj	Tamilnadu	hh	123456	a@g.com				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
1009	akaaaa	ghfhg	2023-01-12	9876456756	kjhkj	Tamilnadu	hh	123456	a@g.com				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
1010	land	jk	2023-01-05	9876787656	kj	Kerala	h	123456	f@g.com				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
1011	shinuuuuu	jk	2023-01-05	9876787656	kj	Kerala	h	123456	f@g.com				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
1012	akaspider	hhnd	2023-01-11	9784744848	adf	Kerala	d	123456	a@g.com				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
1013	jasi	hhnd	2023-01-11	9784744848	adf	Kerala	d	123456	a@g.com				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
1014	keymansnass	dsfdfdf	2023-01-11	9747747464	df	Tamilnadu	df	123456	s@g.com				undefined		\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
1015	pringle	sf	2023-01-19	9867675676	sd	Tamilnadu	sd	321234	a@g.com	f	d	2023-01-18	yes	d	\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
1016	pringle	sf	2023-01-19	9867675676	sd	Tamilnadu	sd	321234	a@g.com	f	d	2023-01-18	yes	d	\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
1017	basil joseph vadakara	sf	2023-01-19	9867675676	sd	Tamilnadu	sd	321234	a@g.com	f	d	2023-01-18	yes	d	\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
1018	vaisakh ks	thakazhy	1993-01-17	9497219244	alappuzha	Kerala	alappuzha	688561	ksvysakh09@gmail.com	degree	GECI	2016-01-17	yes	TECH SUPPORT	\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
1019	siraj	kasargod, triu	1992-02-17	9859662352	kasargod	Kerala	kasargod	655236	siraj@gmail.com	plus two	trd	2008-10-10	no	techmahindra	\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
1020	rakesh ta	cherthala	1992-02-11	9598523333	@1	Kerala	alappuzha	688562	ksvysakh@gmail.com	plus two	trd	2008-10-10	no	techmahindra	\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
1021	sirajs	palakkad, Kuthiran	1992-01-01	9497212222	palakkad	Kerala	palakkad	655263	siraj@gmail.com	degree	geci	2016-01-01	no	infosys	\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
1022	sirajs		1992-01-01	9497212222	palakkad	Kerala	palakkad	655263	siraj@gmail.com	degree	geci	2016-01-01	no	infosys	\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
1023			1992-01-01	9497212222	palakkad	Kerala	palakkad	655263	siraj@gmail.com	degree	geci	2016-01-01	no	infosys	\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
1024	siraj	kuthiran, palakkad	1992-01-01	vaisakh	palakkad	Kerala	palakkad	688562	ksvysah90@gmail.com	degree	geci	2026-12-12	no	d	\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
1025	siraj	kuthiran, palakkad	1992-01-01	vaisakh	palakkad	Kerala	palakkad	688562	ksvysah90@gmail.com	degree	geci	2026-12-12	no	d	\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
1026	maneesha r	coimbatore, takkala	1996-02-01	9497219244	takkala	Tamilnadu	coimbatore	569852	ksvysakh@gmail.com	degree	geci	2026-12-12	no	na	\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
1027	saneesha	coimbatore	1992-01-01	9497219244	thakkala	Tamilnadu	coimbatore	688562	ksvysa@gmail.com	degree	geci	2016-01-01	no	na	\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
1028	rajimon r	bangalore	1996-02-01	9885652333	marathahalli	Karnataka	bangalore	596856	rajimon@yahoo.com	phd	ffa	2026-03-02	no	na	\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
1029	else	dfwvjkver	2023-02-03	7012370456	fvwk	Kerala	wayand	610645	else@gmail.com	msvfhhad	sadfbjakbh	2023-02-17	yes	sadsfkvaksfvk	\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
1030	sachin	kollam kumaramchirra	2023-02-04	7012370456	kollam	Kerala	wayanad	670645	else@gmail.com	hdbkjjbgasz	vckdfkf	2023-02-04	yes	kwgdkaskfka	\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
1031	test	jhj	2023-02-07	8978787878	test	Kerala	test	908756	test@t.co	test	test	2023-02-08	yes	test	\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
1032	hhdd	edasdcmldcm	2023-02-09	9874566666	edkakckac	Kerala	kollam	691566	aaa@g.co	btech	qe	2023-02-01	yes	ddasas	\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
1033	snasmon	kottarakara ,kollam	2023-02-01	7012370456	kottarakara	Kerala	kollam	6706445	snas@gmail.com	payyamapally hss	stCatherines	2023-02-03	yes	hiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii	\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
1034	snasmon	kottarakara ,kollam	2023-02-01	7012370456	kottarakara	Kerala	kollam	6706445	snas@gmail.com	payyamapally hss	stCatherines	2023-02-03	yes	hiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii	\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
1035	Sajin subair	tvm, Attingal	1991-02-01	9895656252	trivandrum	Kerala	trivandrum	655263	tvm@gmail.com	plus two	cusat	2022-09-15	no	supervisor	\N	\N	2023-02-21 05:53:28.840217+00	2023-02-21 05:53:28.840217+00	\N	\N
1036	ksdjghkjs	sdfkkj	2023-02-09	9087675643	sjdgjhdg	Karnataka	sdjh	686567	dsgsj@jhjd.com	bhgdy	sdijk	2023-02-04	yes	skdnkllk	\N	\N	2023-02-23 12:44:09.083097+00	2023-02-23 12:44:09.083097+00	100631610	\N
1037	vaisakh	babilos	2023-02-23	9494219244	alappuzha	Kerala	alappuzha	688561	ksvysakh09@gmail.com	b.tech	jabsdb	2023-02-23	yes	supervisor	\N	\N	2023-02-23 12:47:51.46753+00	2023-02-23 12:47:51.46753+00	100778065	\N
1038	else paul isac	aliyatukudy house	2023-05-05	7894561233	ambukuthy	Kerala	wayaand	670645	else@gmail.com	b-tech	govt college of engineering idukki	2023-05-18	yes	senior software developer	\N	\N	2023-05-23 11:59:26.923341+00	2023-05-23 11:59:26.923341+00	100747978	\N
1039	adihyan 	kollam	2023-05-04	7894561232	kumaramchira	Kerala	kollam	789456	adi@gmail.com	btech	amritha college of engineering	2023-05-19	yes	backend developer	\N	\N	2023-05-23 12:06:54.500417+00	2023-05-23 12:06:54.500417+00	100217665	\N
1040	sachin	trivandrum	2023-05-12	7894561230	trivandrum	Kerala	trivandrum	789456	sachu@gmail.com	electronics	polytechnic	2023-05-05	yes	senior software developer	\N	\N	2023-05-23 12:28:26.532697+00	2023-05-23 12:28:26.532697+00	100555819	\N
1041	fahdad km	thrissur	2023-05-26	7894561230	irinjalikuda	Kerala	thrissur	789456	fahad@gmail.com	btech	govt engineering college idukki	2023-05-05	yes	senior software developer	\N	\N	2023-05-23 12:33:56.520478+00	2023-05-23 12:33:56.520478+00	100680628	\N
1042	Alna mariya isac	aliyatukudy house	2023-05-05	7894561232	ambukuthy	Kerala	wayand	670645	alna@gmail.com	MA litrature	CMS college kottayam	2023-05-19	yes	Assistant Professor	\N	\N	2023-05-23 12:46:59.649457+00	2023-05-23 12:46:59.649457+00	100164460	\N
1043	isac A P	aliyatukudy house	2023-05-05	7894561232	mananthavady	Kerala	wayanad	789456	isac@gmail.com	diploma in instrumentation	punjab university	2023-05-06	yes	Ex Airforce	\N	\N	2023-05-23 12:53:48.607675+00	2023-05-23 12:53:48.607675+00	100591787	\N
1044	isac A P	aliyatukudy house	2023-05-05	7894561232	mananthavady	Kerala	wayanad	789456	isac@gmail.com	diploma in instrumentation	punjab university	2023-05-06	yes	Ex Airforce	\N	\N	2023-05-23 12:53:48.671861+00	2023-05-23 12:53:48.671861+00	100591787	\N
1045	Dona mariya isac	aliaytukudy house	2023-05-04	7894561322	mananthavdy	Kerala	wayanad	789456	dona@gmail.com	bsc optpmetry	al salama	2023-05-11	yes	Optpmetrist	\N	\N	2023-05-23 12:57:52.507999+00	2023-05-23 12:57:52.507999+00	100860784	\N
1046	Dona mariya isac	aliaytukudy house	2023-05-04	7894561322	mananthavdy	Kerala	wayanad	789456	dona@gmail.com	bsc optpmetry	al salama	2023-05-11	yes	Optpmetrist	\N	\N	2023-05-23 12:57:52.557429+00	2023-05-23 12:57:52.557429+00	100860784	\N
1047	Leena isac	pullorkudy house	2023-05-12	7891321562	kattikulam	Kerala	wayanad	789456	leena@gmail.com	Bachelor of education	st marys	2023-05-12	yes	House Wife	\N	\N	2023-05-23 13:03:04.29523+00	2023-05-23 13:03:04.29523+00	100219315	\N
1048	Leena isac	pullorkudy house	2023-05-12	7891321562	kattikulam	Kerala	wayanad	789456	leena@gmail.com	Bachelor of education	st marys	2023-05-12	yes	House Wife	\N	\N	2023-05-23 13:03:04.389005+00	2023-05-23 13:03:04.389005+00	100219315	\N
1049	Mathen k	Kalathipady	2023-05-05	7894561230	kottayam	Karnataka	kottayam	456123	mathen@gmail.com	MBA	munnnar	2023-05-05	yes	Reserch analyst	\N	\N	2023-05-23 13:07:21.473244+00	2023-05-23 13:07:21.473244+00	100156485	\N
\.


--
-- Data for Name: images; Type: TABLE DATA; Schema: public; Owner: powerta
--

COPY public.images (id, name, data, stock_c_f_key, is_deleted, created_by, updated_by, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: invoice; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.invoice (invoice_id, pay_terms_in, ship_to_in, place_of_supply_in, order_no_in, order_date_in, issue_date_in, due_date_in, total_disc_in, shipping_charge_in, payment_type_in, amount_paid_in, total_amount_in, customer_f_key, quot_f_key, created_at, updated_at, created_by, updated_by, is_deleted, user_perm) FROM stdin;
\.


--
-- Data for Name: invoice_list; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.invoice_list (invoice_list_id, price_unit_in, quantity_in, discount_in, cgst_tax_in, sgst_tax_in, amount_in, exp_date_in, batch_no_in, product_in, cgst_tax_amt_in, sgst_tax_amt_in, discount_amt_in, invoice_f_id, stock_f_id, created_at, updated_at, created_by, updated_by, is_deleted, user_perm) FROM stdin;
\.


--
-- Data for Name: ip; Type: TABLE DATA; Schema: public; Owner: powerta
--

COPY public.ip (id, ipaddress, meta, created_at, updated_at, status, location) FROM stdin;
\.


--
-- Data for Name: keymeta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.keymeta (id, instance, db, key, user_f_key, created_at, updated_at) FROM stdin;
1	1	powerta_db	1234	f9da7f2a-c3b3-4532-92f0-14d63559c479	2023-05-22 11:59:37.992928+00	2023-05-22 11:59:37.992928+00
\.


--
-- Data for Name: labour; Type: TABLE DATA; Schema: public; Owner: powerta
--

COPY public.labour (labour_id, labour_name, mobile_no, designation, adress, labour_state, district, pin, created_by, updated_by, is_deleted, created_at, updated_at) FROM stdin;
37	qwert	1234567890	helper	dtt	kerala	ftyy	123456	\N	\N	\N	2023-01-26 07:15:50.878088+00	2023-01-26 07:15:50.878088+00
38	fahad	1234567890	manager	ttttt	tamilnadu	tttt	123456	user	\N	\N	2023-01-26 14:52:50.037703+00	2023-01-26 14:52:50.037703+00
39	qwe	1234567890	daily wager	asdfg	tamilnadu	sdfgh	123456	user	\N	\N	2023-01-28 11:41:40.91219+00	2023-01-28 11:41:40.91219+00
40	qwe	1234567890	daily wager	asdfg	tamilnadu	sdfgh	123456	user	\N	\N	2023-01-28 11:41:48.288738+00	2023-01-28 11:41:48.288738+00
41	qwe	1234567890	daily wager	asdfg	tamilnadu	sdfgh	123456	user	\N	\N	2023-01-28 11:42:03.748761+00	2023-01-28 11:42:03.748761+00
42	qwe	1234567890	daily wager	asdfg	tamilnadu	sdfgh	123456	user	\N	\N	2023-01-28 11:42:08.108226+00	2023-01-28 11:42:08.108226+00
43	jasil	8888888888	daily wager	ggggggggggggg	karnataka	tttttttttt	222222	100142898	\N	\N	2023-01-28 14:34:43.431976+00	2023-01-28 14:34:43.431976+00
44	else	7012370456	manager	sjalfanlgn	karnataka	wayand	670645	100452459	\N	\N	2023-01-29 01:34:13.658409+00	2023-01-29 01:34:13.658409+00
45	akhil	7845127845	daily wager	sjfhkajfl	karnataka	thrissur	670645	100452459	\N	\N	2023-01-29 01:35:28.213243+00	2023-01-29 01:35:28.213243+00
46	Vaisakh ks	9497219244	helper	karunagapally	kerala	Alappuzha	688562	100250974	\N	\N	2023-02-01 13:56:21.924292+00	2023-02-01 13:56:21.924292+00
47	vaisakh ks	9495623535	manager	vadakara	kerala	kozhikode	699856	100583267	\N	\N	2023-02-01 14:00:04.185989+00	2023-02-01 14:00:04.185989+00
48	Vaisakh ks	9497219244	helper	thakazhy alappuzha	kerala	Alappuzha	688561	100647169	\N	\N	2023-02-01 14:06:37.276041+00	2023-02-01 14:06:37.276041+00
49	sachinss	9497219244	manager	karunagapallu	kerala	kollam	655652	100763984	\N	\N	2023-02-01 14:15:48.019909+00	2023-02-01 14:15:48.019909+00
50	Jasils	9895445652	daily wager	salam villa karunagapally	kerala	kollam	688562	100685342	\N	\N	2023-02-01 19:27:39.980798+00	2023-02-01 19:27:39.980798+00
51	vinayak	9655586865	daily wager	vytilla	kerala	Kochi	682304	100403069	\N	\N	2023-02-10 07:07:43.342184+00	2023-02-10 07:07:43.342184+00
\.


--
-- Data for Name: labour_account; Type: TABLE DATA; Schema: public; Owner: powerta
--

COPY public.labour_account (labour_account_id, wage, ot_wage, ot_hour, ta_da, advance, no_of_days, labour_f_key, site_f_key, created_by, updated_by, is_deleted, updated_at, created_at, user_perm, lab_dat) FROM stdin;
140	500	120	15	1000	1000	33	51	267	100403069	\N	1	2023-02-10 07:08:34.13392+00	2023-02-10 07:08:34.13392+00	1	2023-02-10
99	60000	1000	2	34	45000	90	38	1	100638681	\N	0	2023-01-29 14:49:37.287641+00	2023-01-29 14:49:37.287641+00	1	2023-01-29
108	400	400	1	1223	1233	1	43	27	100793916	\N	0	2023-02-08 11:48:05.438236+00	2023-02-08 11:48:05.438236+00	1	2023-02-07
83	22	22	22	22	22	22	37	110	user	\N	0	2023-01-26 11:53:36.485997+00	2023-01-26 11:53:36.485997+00	1	\N
144	2323	2323	32	232	323	232	45	25	100232307	\N	0	2023-02-10 07:27:59.175158+00	2023-02-10 07:27:59.175158+00	1	2023-02-02
100	233	23	23	23	200000	23	45	5	100649623	\N	0	2023-01-29 14:51:30.237663+00	2023-01-29 14:51:30.237663+00	1	2023-01-29
160	122	12	12	1	12	121	44	30	100450800	\N	0	2023-02-23 11:14:23.106089+00	2023-02-23 11:14:23.106089+00	1	2023-02-15
91	111	111	111	111	111	111	37	17	user	\N	1	2023-01-28 11:47:10.703752+00	2023-01-28 11:47:10.703752+00	0	2023-01-11
92	111	11111	111	11	111	1111	40	15	user	\N	0	2023-01-28 11:52:28.171418+00	2023-01-28 11:52:28.171418+00	1	2023-01-11
84	22	22	33	33	33	3	37	111	user	\N	1	2023-01-26 12:12:42.011096+00	2023-01-26 12:12:42.011096+00	0	\N
98	233	233	44	55	2000	1	44	120	100410082	\N	0	2023-01-29 14:33:45.225394+00	2023-01-29 14:33:45.225394+00	1	2023-01-11
101	2233	2323	3	232323	2323	232	44	5	100242993	\N	0	2023-01-29 14:51:44.292664+00	2023-01-29 14:51:44.292664+00	1	2023-01-29
86	44	44	44	44	44	44	37	124	user	\N	0	2023-01-26 14:49:10.08651+00	2023-01-26 14:49:10.08651+00	1	\N
146	500	120	5	200	300	10	51	267	100632591	\N	1	2023-02-10 08:14:07.228381+00	2023-02-10 08:14:07.228381+00	1	2023-02-10
156	123	12	12	1	1234	1	37	9	100441552	\N	0	2023-02-23 10:16:20.111325+00	2023-02-23 10:16:20.111325+00	1	2023-02-14
85	555	555	555	555	555	555	37	111	user	\N	0	2023-01-26 14:43:33.090662+00	2023-01-26 14:43:33.090662+00	1	\N
88	12	23	1	2	1000	45	38	71	user	\N	0	2023-01-27 09:39:55.721966+00	2023-01-27 09:39:55.721966+00	1	2023-01-03
104	-100	-500	-6	-200	-200	-2	46	267	100433651	\N	0	2023-02-01 19:54:40.383107+00	2023-02-01 19:54:40.383107+00	1	2022-10-10
150	6969	6969	6969	6969	6969	6969	45	264	100396609	\N	0	2023-02-10 15:03:46.295646+00	2023-02-10 15:03:46.295646+00	1	2023-02-09
94	89	89	6	89	78	89	37	124	user	\N	0	2023-01-28 12:05:10.448124+00	2023-01-28 12:05:10.448124+00	1	2023-01-12
102	500	50	3	100	1000	10	46	267	100647169	\N	0	2023-02-01 14:12:03.462735+00	2023-02-01 14:12:03.462735+00	1	2023-01-01
93	111	11111	111	11	111	1111	40	15	user	\N	0	2023-01-28 11:52:28.18003+00	2023-01-28 11:52:28.18003+00	1	2023-01-11
105	100	200	2	200	1000	2	37	110	100504627	\N	0	2023-02-06 17:52:50.235571+00	2023-02-06 17:52:50.235571+00	1	2023-02-08
89							37	110	user	\N	0	2023-01-28 06:35:15.253078+00	2023-01-28 06:35:15.253078+00	1	2023-01-06
95	89	89	6	89	78	89	37	124	100200335	\N	0	2023-01-28 12:05:23.494698+00	2023-01-28 12:05:23.494698+00	1	2023-01-12
139	500	120	2	150	0	10	49	284	100038103	\N	0	2023-02-10 07:06:14.193577+00	2023-02-10 07:06:14.193577+00	1	2023-02-10
151	7979	7979	7979	7979	7979	7979	50	25	100436605	\N	1	2023-02-10 15:04:49.867801+00	2023-02-10 15:04:49.867801+00	0	2023-02-08
97	69	69	69	69	69	69	45	110	100891149	\N	0	2023-01-29 14:26:49.17898+00	2023-01-29 14:26:49.17898+00	1	2023-01-29
87	11	11	11	11	11	11	38	9	user	\N	0	2023-01-26 15:05:14.420493+00	2023-01-26 15:05:14.420493+00	1	\N
90	111	111	111	111	111	111	37	17	user	\N	0	2023-01-28 11:47:10.695043+00	2023-01-28 11:47:10.695043+00	1	2023-01-11
96	23233	23232	23	23	2333	222	45	17	100076636	\N	0	2023-01-29 14:26:02.676563+00	2023-01-29 14:26:02.676563+00	1	2023-01-03
159	1345	12	12	12	12	12	44	99	100709851	\N	1	2023-02-23 10:53:57.720713+00	2023-02-23 10:53:57.720713+00	0	2023-02-14
148	1244	7677	4	6577	5667	7	45	264	100658864	\N	1	2023-02-10 14:22:28.279887+00	2023-02-10 14:22:28.279887+00	0	2023-02-09
152	4545	4545	4545	4545	4545	4545	49	27	100235489	\N	0	2023-02-10 15:20:26.653491+00	2023-02-10 15:20:26.653491+00	1	2023-02-08
161	12	12	12	12	12	12	45	30	100761317	\N	1	2023-02-23 11:15:36.696428+00	2023-02-23 11:15:36.696428+00	0	2023-02-15
145	2323	23232	32	2323	232342	2323	37	9	100062402	\N	0	2023-02-10 07:28:44.574049+00	2023-02-10 07:28:44.574049+00	1	2023-02-02
103	100	100	2	100	0	5	50	267	100174906	\N	0	2023-02-01 19:44:30.303332+00	2023-02-01 19:44:30.303332+00	1	2022-10-10
106	999	123	1	1231	1231	1	45	25	100045366	\N	0	2023-02-08 11:46:37.695446+00	2023-02-08 11:46:37.695446+00	1	2023-02-07
153	8989	8989	8989	8989	8989	8989	45	114	100878617	\N	1	2023-02-10 15:48:37.772194+00	2023-02-10 15:48:37.772194+00	0	2023-02-09
149	6969	6969	6969	6969	6969	6969	49	9	100570252	\N	1	2023-02-10 14:51:10.795303+00	2023-02-10 14:51:10.795303+00	1	2023-02-09
107	999	123	1	1231	1231	1	45	25	100045366	\N	1	2023-02-08 11:46:37.69617+00	2023-02-08 11:46:37.69617+00	1	2023-02-07
142	1212	8787	8	787	123	4	49	128	100009614	\N	1	2023-02-10 07:21:31.632289+00	2023-02-10 07:21:31.632289+00	0	2023-02-02
154	134	11	34	23	1000	2	43	10	100449990	\N	0	2023-02-23 10:09:40.664236+00	2023-02-23 10:09:40.664236+00	1	2023-02-14
147	5353	5353	5353	5353	5353	5353	45	25	100397260	\N	1	2023-02-10 09:03:06.803723+00	2023-02-10 09:03:06.803723+00	1	2023-02-09
143	2323	3232	1	323	23232	3	49	25	100107018	\N	1	2023-02-10 07:26:16.106448+00	2023-02-10 07:26:16.106448+00	1	2023-02-15
141	6	4	4	3454	3454	554	49	86	100043025	\N	1	2023-02-10 07:12:56.192603+00	2023-02-10 07:12:56.192603+00	1	2023-02-09
157	234	567	23	12	12	34	38	99	100273940	\N	1	2023-02-23 10:46:45.626812+00	2023-02-23 10:46:45.626812+00	1	2023-02-08
155	23	12	23	56	23	1	49	25	100261611	\N	0	2023-02-23 10:12:17.769011+00	2023-02-23 10:12:17.769011+00	1	2023-02-15
162	12	123	12	12	1234	123	45	31	100352595	\N	1	2023-02-23 14:04:47.584131+00	2023-02-23 14:04:47.584131+00	1	2023-02-08
158	190	23	34	21	12	34	46	112	100604205	\N	1	2023-02-23 10:50:29.641951+00	2023-02-23 10:50:29.641951+00	0	2023-02-09
163	22	33				5	51	267	100640272	\N	0	2023-02-23 14:21:06.236771+00	2023-02-23 14:21:06.236771+00	0	2023-02-17
164	2500	23	12	250	1000	20	51	267	100638653	\N	0	2023-02-23 14:21:51.388676+00	2023-02-23 14:21:51.388676+00	1	2023-02-17
\.


--
-- Data for Name: payment_out; Type: TABLE DATA; Schema: public; Owner: powerta
--

COPY public.payment_out (party_name, receipt_no, pay_typ, amount, ad_desp, vendor_f_key, pay_dte, is_deleted, created_by, updated_by, created_at, updated_at, prty_id) FROM stdin;
dfddffg	\N	UPI	23141	jjjhjdjgd	\N	2023-02-10	\N	100092693	\N	2023-02-22 11:58:40.024563+00	2023-02-22 11:58:40.024563+00	1
\.


--
-- Data for Name: pos_receipt; Type: TABLE DATA; Schema: public; Owner: powerta
--

COPY public.pos_receipt (place_of_supply, enq_date, issue_date, due_date, total_disc, shiping_charge, payment_type, amount_paid, total_amount, id, created_at, updated_at, created_by, pay_terms, ship_to, vendor_f_key, enq_no) FROM stdin;
\.


--
-- Data for Name: purchase_bill; Type: TABLE DATA; Schema: public; Owner: powerta
--

COPY public.purchase_bill (bill_id, bill_date, total_amount, type, status, quantity, unitprice, discount, discount_percentage, payment_method, description, vendor_f_id, stock_f_id, order_id_f_id, created_at, updated_at, created_by) FROM stdin;
\.


--
-- Data for Name: purchase_bill_list; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.purchase_bill_list (list_id, list_stockname, list_price, list_quantity, list_discount, list_tax, list_amount, exp_dat, pur_bill_f_key, stock_f_key, created_at, updated_at, created_by, updated_by, is_deleted, user_perm) FROM stdin;
\.


--
-- Data for Name: purchase_order; Type: TABLE DATA; Schema: public; Owner: powerta
--

COPY public.purchase_order (order_id, po_date, due_date, total_amount, status, quantity, unitprice, discount, discount_percentage, payment_method, description, vendor_f_id, created_at, updated_at, created_by, purchase_bill_status, is_deleted) FROM stdin;
40	2023-02-25		6825.000	pending	\N	\N	undefined	\N	Payment Method	\N	1	2023-02-25 07:28:37.53578+00	2023-02-25 07:28:37.53578+00	100764141	0	\N
\.


--
-- Data for Name: purchase_order_list; Type: TABLE DATA; Schema: public; Owner: powerta
--

COPY public.purchase_order_list (batch_no, expiry_date, quantity, unit, price_unit, discount, tax, amount, pur_order_f_key, created_by, created_at, updated_at, stock_f_key, list_id) FROM stdin;
14		1	\N	300	null	undefined	315	40	\N	2023-02-25 07:28:37.9217+00	2023-02-25 07:28:37.9217+00	94	12
1512		1	\N	3000	null	undefined	3150	40	\N	2023-02-25 07:28:37.9217+00	2023-02-25 07:28:37.9217+00	88	13
14		1	\N	3000	null	undefined	3360	40	\N	2023-02-25 07:28:37.9217+00	2023-02-25 07:28:37.9217+00	91	14
\.


--
-- Data for Name: purchase_return; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.purchase_return (return_id, return_dat, pur_bill_fid, created_at, updated_at, created_by, updated_by, is_deleted, user_perm) FROM stdin;
\.


--
-- Data for Name: quotation; Type: TABLE DATA; Schema: public; Owner: powerta
--

COPY public.quotation (place_of_supply, enq_date, issue_date, due_date, total_disc, shiping_charge, payment_type, amount_paid, total_amount, id, created_at, updated_at, created_by, pay_terms, ship_to, vendor_f_key, enq_no) FROM stdin;
		2023-02-25	2023-03-04					3611.75	7	2023-02-25 11:47:28.037428+00	2023-02-25 11:47:28.037428+00	100001098	NET 7		1	
		2023-02-25						6825	8	2023-02-25 17:40:33.904847+00	2023-02-25 17:40:33.904847+00	100001098		w	1	
		2023-02-25						315	9	2023-02-25 17:47:17.578629+00	2023-02-25 17:47:17.578629+00	100001098			1	
		2023-02-25	2023-02-16					315	10	2023-02-25 17:51:39.317729+00	2023-02-25 17:51:39.317729+00	100001098			1	
		2023-02-25						3150	11	2023-02-25 17:54:19.246834+00	2023-02-25 17:54:19.246834+00	100001098			1	
karnatakka		2023-02-25	2023-03-12					5250	12	2023-02-25 18:02:53.539622+00	2023-02-25 18:02:53.539622+00	100281286	NET 15	kollam	1	12345
\.


--
-- Data for Name: quotation_list; Type: TABLE DATA; Schema: public; Owner: powerta
--

COPY public.quotation_list (quot_list_id, batch_no, exp_dat, quant, unit, price_unit, discount, tax, amount, quot_f_id, hsn_cde, created_by, updated_by, created_at, updated_at, stock_f_id) FROM stdin;
12	1512		1	\N	3000	null	undefined	3150	11	\N	\N	\N	2023-02-25 18:01:27.669728+00	2023-02-25 18:01:27.669728+00	163
13	14		1	\N	300	null	undefined	315	12	\N	\N	\N	2023-02-25 18:02:53.948871+00	2023-02-25 18:02:53.948871+00	165
14	12142		1	\N	1500	null	undefined	1575	12	\N	\N	\N	2023-02-25 18:02:53.948871+00	2023-02-25 18:02:53.948871+00	163
15	14		1	\N	3000	null	undefined	3360	12	\N	\N	\N	2023-02-25 18:02:53.948871+00	2023-02-25 18:02:53.948871+00	164
16	14		1	\N	300	null	5	315	12	\N	\N	\N	2023-02-25 18:11:15.914582+00	2023-02-25 18:11:15.914582+00	165
\.


--
-- Data for Name: site; Type: TABLE DATA; Schema: public; Owner: powerta
--

COPY public.site (site_id, site_name, site_location, owner_name, phone_no, adress, site_state, district, pin, email_id, created_by, updated_by, is_deleted, created_at, updated_at) FROM stdin;
1	powertech	kochi	snas	9875097846	sheeja bhavan	eranakulam	kerala	695166	snas@gmai.com	\N	\N	\N	2023-01-07 10:52:05.675519+00	2023-01-07 12:18:15.290547+00
2	powertech	kochi	snas	9875097846	sheeja bhavan	eranakulam	kerala	695166	snas@gmai.com	\N	\N	\N	2023-01-07 10:52:05.675519+00	2023-01-07 12:18:15.290547+00
3	powertech	kochi	snas	9875097846	sheeja bhavan	eranakulam	kerala	695166	snas@gmai.com	\N	\N	\N	2023-01-07 10:52:05.675519+00	2023-01-07 12:18:15.290547+00
4	powertech	kochi	snas	9875097846	sheeja bhavan	eranakulam	kerala	695166	snas@gmai.com	\N	\N	\N	2023-01-07 10:52:05.675519+00	2023-01-07 12:18:15.290547+00
5	fitech	ulloor	amal	9876578978	mangalaseriyil	kerala	thiruvananthapuram	695551	amal@gmail.com	\N	\N	\N	2023-01-07 10:52:05.675519+00	2023-01-07 12:18:15.290547+00
6	futuretech	kottarakkara	else	9776574978	house-no-12 	kerala	kollam	695559	else@gmail.com	\N	\N	\N	2023-01-07 10:52:05.675519+00	2023-01-07 12:18:15.290547+00
7	desingz	angamali	adityan	7876579978	adityan bhavanam	kerala	eranakulam	695558	adityan@gmail.com	\N	\N	\N	2023-01-07 10:52:05.675519+00	2023-01-07 12:18:15.290547+00
8	eureka	cheruthoni	anas	9376478970	mangalaseriyil	kerala	edukki	699951	anas@gmail.com	\N	\N	\N	2023-01-07 10:52:05.675519+00	2023-01-07 12:18:15.290547+00
9	google	nedumangad	justin	9776576677	house-no-12	kerala	thiruvananthapuram	695551	justin@gmail.com	\N	\N	\N	2023-01-07 10:52:05.675519+00	2023-01-07 12:18:15.290547+00
10	facebook	chavara	jose	9276571979	adityan bhavanam	kerala	kollam	695551	jose@gmail.com	\N	\N	\N	2023-01-07 10:52:05.675519+00	2023-01-07 12:18:15.290547+00
11	qwer	asd	ghjk	1234567890	qwert	kerala	qwertyu	123456	sdf@g.com	\N	\N	\N	2023-01-11 06:22:32.521356+00	2023-01-11 06:22:32.521356+00
12	qwer	asd	ghjk	1234567890	qwert	kerala	qwertyu	123456	sdf@g.com	\N	\N	\N	2023-01-11 06:24:07.976818+00	2023-01-11 06:24:07.976818+00
13	example 2	asd	ghjk	1234567890	qwert	kerala	qwertyu	123456	sdf@g.com	\N	\N	\N	2023-01-11 06:25:33.814519+00	2023-01-11 06:25:33.814519+00
14	example 2	asd	ghjk	1234567890	qwert	kerala	qwertyu	123456	sdf@g.com	\N	\N	\N	2023-01-11 06:25:43.069788+00	2023-01-11 06:25:43.069788+00
15	regina	asd	ghjk	1234567890	qwert	kerala	qwertyu	123456	sdf@g.com	\N	\N	\N	2023-01-11 06:28:41.248103+00	2023-01-11 06:28:41.248103+00
16	regina	asd	ghjk	1234567890	qwert	kerala	qwertyu	123456	sdf@g.com	\N	\N	\N	2023-01-11 06:28:49.439781+00	2023-01-11 06:28:49.439781+00
17	snasmon	asdf	rfv	1234567890	ghjk	karnataka	rtyu	123456	saea@g.com	\N	\N	\N	2023-01-11 06:35:52.36242+00	2023-01-11 06:35:52.36242+00
18	qwerty	qwerty	ghjkl	1234567890	fttyhnni	kerala	oiuhjkm	sdfv	werr@g.com	\N	\N	\N	2023-01-11 08:34:37.626423+00	2023-01-11 08:34:37.626423+00
19	example 3	qwert	zxcv	1234567890	qwe	kerala	erty	695551	qwer@gmail.com	\N	\N	\N	2023-01-13 12:28:13.796742+00	2023-01-13 12:28:13.796742+00
20	example 3	qwert	zxcv	1234567890	qwe	kerala	erty	695551	qwer@gmail.com	\N	\N	\N	2023-01-13 12:28:13.877941+00	2023-01-13 12:28:13.877941+00
21	example 3	qwert	zxcv	1234567890	qwe	kerala	erty	695551	qwer@gmail.com	\N	\N	\N	2023-01-13 12:30:05.113767+00	2023-01-13 12:30:05.113767+00
22	example 3	qwert	zxcv	1234567890	qwe	kerala	erty	695551	qwer@gmail.com	\N	\N	\N	2023-01-13 12:30:05.190936+00	2023-01-13 12:30:05.190936+00
23	example 3	qwert	zxcv	1234567890	qwe	kerala	erty	695551	qwer@gmail.com	\N	\N	\N	2023-01-13 12:31:04.36843+00	2023-01-13 12:31:04.36843+00
24	example 3	qwert	zxcv	1234567890	qwe	kerala	erty	695551	qwer@gmail.com	\N	\N	\N	2023-01-13 12:31:04.45776+00	2023-01-13 12:31:04.45776+00
25	kuravankkonam	trivandrum	rajeev	5678355326	kuravankkonam,trivandrum	kerala	trivandrum	695551	rajeev123@gmail.com	\N	\N	\N	2023-01-13 12:42:26.336021+00	2023-01-13 12:42:26.336021+00
26	kuravankkonam	trivandrum	rajeev	5678355326	kuravankkonam,trivandrum	kerala	trivandrum	695551	rajeev123@gmail.com	\N	\N	\N	2023-01-13 12:42:34.118276+00	2023-01-13 12:42:34.118276+00
27	kuravankkonam	trivandrum	rajeev	5678355326	kuravankkonam trivandrum	kerala	trivandrum	695551	rajeev123@gmail.com	\N	\N	\N	2023-01-13 12:43:50.912751+00	2023-01-13 12:43:50.912751+00
28	kuravankkonam	trivandrum	rajeev	5678355326	kuravankkonam trivandrum	kerala	trivandrum	695551	rajeev123@gmail.com	\N	\N	\N	2023-01-13 12:44:06.425519+00	2023-01-13 12:44:06.425519+00
29	kuravankkonam	trivandrum	rajeev	5678355326	kuravankkonam trivandrum	kerala	trivandrum	695551	rajeev123@gmail.com	\N	\N	\N	2023-01-13 12:44:12.551615+00	2023-01-13 12:44:12.551615+00
30	asdfg	asdf	ijhgf	1234567890	askjhg	karnataka	gfvc 	111111	z.@d.c	\N	\N	\N	2023-01-13 16:04:09.510623+00	2023-01-13 16:04:09.510623+00
31	asdfg	asdf	ijhgf	1234567890	askjhg	karnataka	gfvc 	111111	z.@d.c	\N	\N	\N	2023-01-13 16:09:01.551457+00	2023-01-13 16:09:01.551457+00
32	asdfg	asdf	ijhgf	1234567890	askjhg	karnataka	gfvc 	111111	z.@d.c	\N	\N	\N	2023-01-13 16:38:12.871359+00	2023-01-13 16:38:12.871359+00
33	asdfg	asdf	ijhgf	1234567890	askjhg	karnataka	gfvc 	111111	z.@d.c	\N	\N	\N	2023-01-13 16:38:12.984323+00	2023-01-13 16:38:12.984323+00
65	asdfg	asdf	ijhgf	1234567890	askjhg	karnataka	gfvc 	111111	z.@d.c	\N	\N	\N	2023-01-13 16:42:06.968185+00	2023-01-13 16:42:06.968185+00
66	asdfg	asdf	ijhgf	1234567890	askjhg	karnataka	gfvc 	111111	z.@d.c	\N	\N	\N	2023-01-13 16:42:06.882237+00	2023-01-13 16:42:06.882237+00
67	asdfg	asdf	ijhgf	1234567890	askjhg	karnataka	gfvc 	111111	z.@d.c	\N	\N	\N	2023-01-13 16:46:14.562524+00	2023-01-13 16:46:14.562524+00
68	asdfg	asdf	ijhgf	1234567890	askjhg	karnataka	gfvc 	111111	z.@d.c	\N	\N	\N	2023-01-13 16:46:14.561708+00	2023-01-13 16:46:14.561708+00
69	asdcfv	asdfg	sdfg	1234567890	ascv	kerala	csd 	123456	xdc@g.c	\N	\N	\N	2023-01-13 17:07:42.533293+00	2023-01-13 17:07:42.533293+00
70	asdcfv	asdfg	sdfg	1234567890	ascv	kerala	csd 	123456	xdc@g.c	\N	\N	\N	2023-01-13 17:07:42.573906+00	2023-01-13 17:07:42.573906+00
71	qwert	asdfgn	sdfgh	1234567890	sdfgh	karnataka	zxc	123456	as@g.c	\N	\N	\N	2023-01-13 17:51:24.658978+00	2023-01-13 17:51:24.658978+00
72	qwert	asdfgn	sdfgh	1234567890	sdfgh	karnataka	zxc	123456	as@g.c	\N	\N	\N	2023-01-13 17:51:24.737238+00	2023-01-13 17:51:24.737238+00
73	qwert	qwe	adf	1234567890	wer	tamilnadu	zbhfhnb	123456	qwe@g.c	\N	\N	\N	2023-01-13 18:49:33.389609+00	2023-01-13 18:49:33.389609+00
74	example 1	asdfg	sy	1234567890	dfghjk	kerala	dfghjk	111111	34@g.com	\N	\N	\N	2023-01-14 06:16:19.810394+00	2023-01-14 06:16:19.810394+00
75	example 1	asdfg	sy	1234567890	dfghjk	kerala	dfghjk	111111	34@g.com	\N	\N	\N	2023-01-14 06:16:36.789682+00	2023-01-14 06:16:36.789682+00
76	example 1	asdfg	sy	1234567890	dfghjk	kerala	dfghjk	111111	34@g.com	\N	\N	\N	2023-01-14 06:16:36.917779+00	2023-01-14 06:16:36.917779+00
77	example 1	asdfg	sy	1234567890	dfghjk	kerala	dfghjk	111111	34@g.com	\N	\N	\N	2023-01-14 06:18:06.312679+00	2023-01-14 06:18:06.312679+00
78	example 1	asdfg	sy	1234567890	dfghjk	kerala	dfghjk	111111	34@g.com	\N	\N	\N	2023-01-14 06:18:06.416443+00	2023-01-14 06:18:06.416443+00
79	example 1	asdfg	sy	1234567890	dfghjk	kerala	dfghjk	111111	34@g.com	\N	\N	\N	2023-01-14 06:19:28.407074+00	2023-01-14 06:19:28.407074+00
80	example 1	asdfg	sy	1234567890	dfghjk	kerala	dfghjk	111111	34@g.com	\N	\N	\N	2023-01-14 06:19:28.439228+00	2023-01-14 06:19:28.439228+00
81	asdfgh	sDAF	ZVXDFVXDFBVS	1234567890	sdfg	karnataka	oijhgf	123456	qwe@d.c	\N	\N	\N	2023-01-14 17:50:03.410166+00	2023-01-14 17:50:03.410166+00
82	asdfgh	sDAF	ZVXDFVXDFBVS	1234567890	sdfg	karnataka	oijhgf	123456	qwe@d.c	\N	\N	\N	2023-01-14 17:50:03.412396+00	2023-01-14 17:50:03.412396+00
83	qwertyu	sdf	xcv	1234567890	qwer	kerala	sdfgb	123456	zx@	\N	\N	\N	2023-01-14 18:11:22.954779+00	2023-01-14 18:11:22.954779+00
84	qwertyu	sdf	xcv	1234567890	qwer	kerala	sdfgb	123456	zx@	\N	\N	\N	2023-01-14 18:11:22.966238+00	2023-01-14 18:11:22.966238+00
85	axscdvfbg	fsdgbg	adfsbg n	1234567890	dwf	kerala	sdvsdfgserg	123456	dsvz@g.c	\N	\N	\N	2023-01-14 20:46:31.963813+00	2023-01-14 20:46:31.963813+00
86	dwafsb asfdasdcasd	ADSA	asv	1123456789	qswdad	karnataka	afser	123456	fvfv@g.c	\N	\N	\N	2023-01-14 20:48:24.429382+00	2023-01-14 20:48:24.429382+00
87	dwafsb asfdasdcasd		asv	1123456789	qswdad	karnataka	afser	123456	fvfv@g.c	\N	\N	\N	2023-01-15 14:03:14.00051+00	2023-01-15 14:03:14.00051+00
88	dwafsb asfdasdcasd		asv	1123456789	qswdad	karnataka	afser	123456	fvfv@g.c	\N	\N	\N	2023-01-15 14:03:24.756053+00	2023-01-15 14:03:24.756053+00
89	Relience	alappuzha	benni	9497225656	kochuparambil, padaharam thakazhy po alappuzha	kerala	alappuzha	688562	ksvysakh09@gmail.com	\N	\N	\N	2023-01-19 02:54:47.335738+00	2023-01-19 02:54:47.335738+00
90	Relience	alappuzha	benni	9497225656	kochuparambil, padaharam thakazhy po alappuzha	kerala	alappuzha	688562	ksvysakh09@gmail.com	\N	\N	\N	2023-01-19 02:55:14.216265+00	2023-01-19 02:55:14.216265+00
91	Relience	alappuzha	benni	9497225656	kochuparambil, padaharam thakazhy po alappuzha	kerala	alappuzha	688562	ksvysakh09@gmail.com	\N	\N	\N	2023-01-19 02:55:23.314982+00	2023-01-19 02:55:23.314982+00
92	fffffff	eeeeeeeee	eeeeeee	1234567890	asd	kerala	kollam	123456	asd@gmail.com	\N	\N	\N	2023-01-19 05:55:28.342536+00	2023-01-19 05:55:28.342536+00
93	rggggg	yyyy	eeeee	3333333333	rtttt	tamilnadu	777777	123456	gg@g.c	\N	\N	\N	2023-01-19 06:10:56.211552+00	2023-01-19 06:10:56.211552+00
94	rggggg	yyyy	eeeee	3333333333	rtttt	tamilnadu	777777	123456	gg@g.c	\N	\N	\N	2023-01-19 06:11:50.608013+00	2023-01-19 06:11:50.608013+00
95	eee	ssss	ssss	ss	sss	kerala	sssss	1111111	sss	\N	\N	\N	2023-01-20 06:20:03.075175+00	2023-01-20 06:20:03.075175+00
96	eee	ssss	ssss	ss	sss	kerala	sssss	1111111	sss	\N	\N	\N	2023-01-20 06:20:03.134097+00	2023-01-20 06:20:03.134097+00
97	nnnnmnmmmm					Select State				\N	\N	\N	2023-01-20 06:26:28.930807+00	2023-01-20 06:26:28.930807+00
98	nnnnmnmmmm					Select State				\N	\N	\N	2023-01-20 06:26:28.980001+00	2023-01-20 06:26:28.980001+00
99	test 1	ghjk	dfghjk	1234567890	dfghjk	tamilnadu	ghjk	123456	k	\N	\N	\N	2023-01-21 05:21:03.245117+00	2023-01-21 05:21:03.245117+00
101	powerta	kollam	ajay	1234567890	eranakulam	kerala	eranakulam	695551	awe@.g.c	\N	\N	\N	2023-01-22 13:58:53.712972+00	2023-01-22 13:58:53.712972+00
102	integreta	thrissur	yyyyyy	1234567890	ffffffff	karnataka	cvvvvvvvv	111111	ddrr	\N	\N	\N	2023-01-23 06:28:26.895454+00	2023-01-23 06:28:26.895454+00
103	integreta	thrissur	yyyyyy	1234567890	ffffffff	karnataka	cvvvvvvvv	111111	ddrr	\N	\N	\N	2023-01-23 06:28:26.987959+00	2023-01-23 06:28:26.987959+00
104	example 3	sdf	asd	1234567890	kollam	karnataka	kolam	123456	a@h.com	\N	\N	\N	2023-01-24 04:45:55.71186+00	2023-01-24 04:45:55.71186+00
105	example 3	sdf	asd	1234567890	kollam	karnataka	kolam	123456	a@h.com	\N	\N	\N	2023-01-24 04:45:55.749753+00	2023-01-24 04:45:55.749753+00
106	eeeee	qqqq	rrrrrr	1234567890	nhhh	tamilnadu	yyyy	12345	qqq	\N	\N	\N	2023-01-24 21:11:52.087554+00	2023-01-24 21:11:52.087554+00
107	eeeee	qqqq	rrrrrr	1234567890	nhhh	tamilnadu	yyyy	12345	qqq	\N	\N	\N	2023-01-24 21:12:57.183262+00	2023-01-24 21:12:57.183262+00
108	test_site	kollam	fahad	99999999	qwerty	tamilnadu	kollam	4444444	ry@gmail.com	\N	\N	\N	2023-01-25 07:43:43.443359+00	2023-01-25 07:43:43.443359+00
109	test_site	kollam	fahad	99999999	qwerty	tamilnadu	kollam	4444444	ry@gmail.com	\N	\N	\N	2023-01-25 07:43:44.544095+00	2023-01-25 07:43:44.544095+00
110	wert	yuii	2345	56788	ert	kerala	hjk	1233	asd	\N	\N	\N	2023-01-25 07:48:38.029989+00	2023-01-25 07:48:38.029989+00
111	wert	yuii	2345	56788	ert	kerala	hjk	1233	asd	\N	\N	\N	2023-01-25 07:48:39.143154+00	2023-01-25 07:48:39.143154+00
112	hjhh	cvxbxb	svxzfs	4565446	sfdgbxfbz	kerala	bcbdvx	022222	else@gmail.com	\N	\N	\N	2023-01-25 10:10:57.950573+00	2023-01-25 10:10:57.950573+00
113	hjhh	cvxbxb	svxzfs	4565446	sfdgbxfbz	kerala	bcbdvx	022222	else@gmail.com	\N	\N	\N	2023-01-25 10:10:59.070089+00	2023-01-25 10:10:59.070089+00
114	sfdags	dvasg	safswg	1645685	defdvfsd	kerala	fdsags	2222222	else@gmail.com	\N	\N	\N	2023-01-25 10:12:18.94246+00	2023-01-25 10:12:18.94246+00
115	sfdags	dvasg	safswg	1645685	defdvfsd	kerala	fdsags	2222222	else@gmail.com	\N	\N	\N	2023-01-25 10:12:19.948745+00	2023-01-25 10:12:19.948745+00
116	example 3	fbfs	bfb	1234567890	dffd	tamilnadu	gdnsngs	123456	njj@.d	\N	\N	\N	2023-01-25 11:13:59.954376+00	2023-01-25 11:13:59.954376+00
117	example 3	fbfs	bfb	1234567890	dffd	tamilnadu	gdnsngs	123456	njj@.d	user	\N	\N	2023-01-25 11:14:00.971334+00	2023-01-25 11:14:00.971334+00
118	example 3	fbfs	bfb	1234567890	dffd	tamilnadu	gdnsngs	123456	njj@.d	\N	\N	\N	2023-01-25 11:15:05.385737+00	2023-01-25 11:15:05.385737+00
119	example 3	fbfs	bfb	1234567890	dffd	tamilnadu	gdnsngs	123456	njj@.d	user	\N	\N	2023-01-25 11:15:06.465302+00	2023-01-25 11:15:06.465302+00
120	site	idukki	sachin	34567890	dscxhb	karnataka	idukki	123456	yfyfc	\N	\N	\N	2023-01-25 14:53:24.075627+00	2023-01-25 14:53:24.075627+00
121	site	idukki	sachin	34567890	dscxhb	karnataka	idukki	123456	yfyfc	user	\N	\N	2023-01-25 14:53:25.088218+00	2023-01-25 14:53:25.088218+00
122	ddd	asdf	raju	9999		kerala			sans	\N	\N	\N	2023-01-25 16:02:58.829997+00	2023-01-25 16:02:58.829997+00
123	wer	tyu	rty	fgh	yui	kerala	tyu	34566	ert	\N	\N	\N	2023-01-25 20:51:52.322045+00	2023-01-25 20:51:52.322045+00
124	erthhh	sdfg	sdfgh	2345678234	sdfghj	tamilnadu	werty	123456	e@gmail.com	\N	\N	\N	2023-01-25 21:54:46.453077+00	2023-01-25 21:54:46.453077+00
125	erthhh	sdfg	sdfgh	2345678234	sdfghj	tamilnadu	werty	123456	e@gmail.com	\N	\N	\N	2023-01-25 21:54:57.872158+00	2023-01-25 21:54:57.872158+00
126	erthhh	sdfg	sdfgh	2345678234	sdfghj	tamilnadu	werty	123456	e@gmail.com	\N	\N	\N	2023-01-25 21:54:58.927766+00	2023-01-25 21:54:58.927766+00
127	siteee	tyuijg	sdfghh	1234567890	sdfghj	tamilnadu	werty	123456	e@gmail.com	\N	\N	\N	2023-01-25 21:56:24.3179+00	2023-01-25 21:56:24.3179+00
128	hungry build	kollam	snas	1234567890	aaaaa dddddf rttgtgf 	Select State	kollam	123456	ssssssss@c.com	\N	\N	\N	2023-01-26 05:36:29.937205+00	2023-01-26 05:36:29.937205+00
129	aaaa	kollam	ass	1245567890	aedwefarv	kerala	g	122333	as2@c.com	\N	\N	\N	2023-01-26 05:40:22.171621+00	2023-01-26 05:40:22.171621+00
130	aaaa	kollam	ass	1245567890	aedwefarv	kerala	g	122333	as2@c.com	user	\N	\N	2023-01-26 05:40:22.425203+00	2023-01-26 05:40:22.425203+00
131	aaaa	kollam	ass	1245567890	aedwefarv	kerala	g	122333	as2@c.com	\N	\N	\N	2023-01-26 05:41:00.766502+00	2023-01-26 05:41:00.766502+00
132	aaaa	kollam	ass	1245567890	aedwefarv	kerala	g	122333	as2@c.com	user	\N	\N	2023-01-26 05:41:00.76915+00	2023-01-26 05:41:00.76915+00
133	aaaa	kollam	ass	1245567890	aedwefarv	kerala	g	122333	as2@c.com	\N	\N	\N	2023-01-26 05:41:05.735486+00	2023-01-26 05:41:05.735486+00
134	aaaa	kollam	ass	1245567890	aedwefarv	kerala	g	122333	as2@c.com	\N	\N	\N	2023-01-26 05:41:05.752738+00	2023-01-26 05:41:05.752738+00
135	aaaa	kollam	ass	1245567890	aedwefarv	kerala	g	122333	as2@c.com	\N	\N	\N	2023-01-26 05:41:05.885294+00	2023-01-26 05:41:05.885294+00
136	aaaa	kollam	ass	1245567890	aedwefarv	kerala	g	122333	as2@c.com	user	\N	\N	2023-01-26 05:41:05.904215+00	2023-01-26 05:41:05.904215+00
137	test 1	cgcgb	cgc	1234567890	sdfgh	tamilnadu	bgcb	123456	gh@g.com	user	\N	\N	2023-01-26 13:07:30.083267+00	2023-01-26 13:07:30.083267+00
138	test 1	cgcgb	cgc	1234567890	sdfgh	tamilnadu	bgcb	123456	gh@g.com	user	\N	\N	2023-01-26 13:08:22.713012+00	2023-01-26 13:08:22.713012+00
139	test 1	cgcgb	cgc	1234567890	sdfgh	tamilnadu	bgcb	123456	gh@g.com	user	\N	\N	2023-01-26 13:25:14.13174+00	2023-01-26 13:25:14.13174+00
140	test 1	bvcn	nmhvhm	1234567890	nmjb	kerala	jb	123456	d@g.com	user	\N	\N	2023-01-26 13:27:12.380034+00	2023-01-26 13:27:12.380034+00
141	test 1	bvcn	nmhvhm	1234567890	nmjb	kerala	jb	123456	d@g.com	user	\N	\N	2023-01-26 13:30:32.203923+00	2023-01-26 13:30:32.203923+00
142	test 1	bvcn	nmhvhm	1234567890	nmjb	kerala	jb	123456	d@g.com	user	\N	\N	2023-01-26 13:30:59.466617+00	2023-01-26 13:30:59.466617+00
143	test 1	bvcn	nmhvhm	1234567890	nmjb	kerala	jb	123456	d@g.com	user	\N	\N	2023-01-26 13:35:19.117822+00	2023-01-26 13:35:19.117822+00
144	test 1	bvcn	nmhvhm	1234567890	nmjb	kerala	jb	123456	d@g.com	user	\N	\N	2023-01-26 13:35:19.169914+00	2023-01-26 13:35:19.169914+00
145	test 1	bvcn	nmhvhm	1234567890	nmjb	kerala	jb	123456	d@g.com	user	\N	\N	2023-01-26 13:36:43.704342+00	2023-01-26 13:36:43.704342+00
146	test 1	bvcn	nmhvhm	1234567890	nmjb	kerala	jb	123456	d@g.com	user	\N	\N	2023-01-26 13:36:43.710132+00	2023-01-26 13:36:43.710132+00
147	test 1	bvcn	nmhvhm	1234567890	nmjb	kerala	jb	123456	d@g.com	user	\N	\N	2023-01-26 13:38:03.106804+00	2023-01-26 13:38:03.106804+00
148	test 1	bvcn	nmhvhm	1234567890	nmjb	kerala	jb	123456	d@g.com	user	\N	\N	2023-01-26 13:38:03.112465+00	2023-01-26 13:38:03.112465+00
150	test 1	bvcn	nmhvhm	1234567890	nmjb	kerala	jb	123456	d@g.com	\N	\N	\N	2023-01-26 13:38:41.975191+00	2023-01-26 13:38:41.975191+00
149	test 1	bvcn	nmhvhm	1234567890	nmjb	kerala	jb	123456	d@g.com	user	\N	\N	2023-01-26 13:38:41.978133+00	2023-01-26 13:38:41.978133+00
151	rtyu	jiol	jiuy	0987654321	rtyu	tamilnadu	uu	123456	sa@gmail.com	user	\N	\N	2023-01-26 17:50:34.224815+00	2023-01-26 17:50:34.224815+00
256	leo	vytila	amal francis	9995116326	leo,vytilla	kerala	ernakulam	688596	ksvysakh111@gmail.com	100798599	\N	\N	2023-01-30 11:57:17.919125+00	2023-01-30 11:57:17.919125+00
258	smith1 	malappuram  	sakhil	9995662362	malappuram, perimanam	Select State		688562	ksvysakh009@gmail.com	100457002	\N	\N	2023-01-31 04:43:43.695325+00	2023-01-31 04:43:43.695325+00
259	smith3	malappuram	sakhil   	9995662362	malappuram, perimanam	kerala	1121	688562	ksvysakh009@gmail.com	100797545	\N	\N	2023-01-31 05:02:47.56191+00	2023-01-31 05:02:47.56191+00
257	smith llc	malappuram	sakhil	9995664532	malappuram, perimanur	kerala	malappuram	655236	ksvysakh09@gmail.com	100543634	\N	\N	2023-01-30 12:07:38.140073+00	2023-01-30 12:07:38.140073+00
260	smith4	malappuram	akhil 	9995662362	malappuram, perimanam	kerala	1234	688562	ksvysakh009@gmail.com	100158421	\N	\N	2023-01-31 05:04:39.785616+00	2023-01-31 05:04:39.785616+00
261	smith5	malappuram	sakhil 	9995662362	malappuram, perimanam	kerala	@#$	688561	ksvysakh009@gmail.com	100158421	\N	\N	2023-01-31 05:08:29.405029+00	2023-01-31 05:08:29.405029+00
262	smith 6	malappuram	sakhil	9497219244	ksvysakh009@gmail.com	tamilnadu	malappuram	688562	ksvysakh09@gmail.com	100759359	\N	\N	2023-01-31 05:37:17.132693+00	2023-01-31 05:37:17.132693+00
263	snascompany	sdc	dss	9064637373	kd	tamilnadu	df	978384	d@g.com	100583380	\N	\N	2023-01-31 06:33:13.475017+00	2023-01-31 06:33:13.475017+00
264	gldfvdf	fdvdf	fvdf	9088585858	sdv	kerala	vsv	123456	d@g.com	100547860	\N	\N	2023-01-31 06:37:16.682271+00	2023-01-31 06:37:16.682271+00
271	Zodiac	edapally	adityan	9895666222	Edapally	kerala	kochi	688564	adityan@gmail.com	100235476	\N	\N	2023-02-07 05:51:11.348475+00	2023-02-07 05:51:11.348475+00
272	zomato	edakochii	akhil	9895656232	kkk	kerala	k	890989	zomato@gmail.com	100810980	\N	\N	2023-02-07 05:59:50.096686+00	2023-02-07 05:59:50.096686+00
273	swiggy	alappuzha	norman	9497565252	alapuzha	kerala	alappuzha	688562	ksvysakh09@gmail.com	100470747	\N	\N	2023-02-07 06:04:46.980824+00	2023-02-07 06:04:46.980824+00
274	test	test	test	9878788767	test	karnataka	test	899089	test@g.com	100173140	\N	\N	2023-02-07 06:21:13.754405+00	2023-02-07 06:21:13.754405+00
276	na	bh	vhvbm	7675675656	hgf	kerala	hv	563467	hf@k.co	100173140	\N	\N	2023-02-07 06:25:50.318762+00	2023-02-07 06:25:50.318762+00
278	na	bh	vhvbm	7675675656	hgf	kerala	hv	563467	hf@k.co	100173140	\N	\N	2023-02-07 06:26:17.816763+00	2023-02-07 06:26:17.816763+00
280	Anandhu pvt	karuvatta	anadhu	9895665656	anandhu villa, karuvatta	kerala	alappuzha	688564	anandhu@gmail.com	\N	\N	\N	2023-02-09 12:05:03.537197+00	2023-02-09 12:05:03.537197+00
282	Sai trading	vytillla	sai	9896565656	sai, Vytilla	kerala	ernakulam	988956	sai@gmail.com	100135657	\N	\N	2023-02-09 12:06:45.793036+00	2023-02-09 12:06:45.793036+00
283	snas pvt ltd	Pulpalli	snas	7665636252	pulpalli, kottayam	kerala	kottayam	688562	snas@gmail.com	100690913	\N	\N	2023-02-09 12:12:14.108701+00	2023-02-09 12:12:14.108701+00
190	aaaaa	aasa	asa	2323232333	sdsds	kerala	dfdfdfdfdfdfdfdf	343434343334344	xx	user	\N	\N	2023-01-27 10:56:22.366927+00	2023-01-27 10:56:22.366927+00
191	fhd	sdsds	sds	6969696969	asas	kerala	add	69	qw	user	\N	\N	2023-01-27 11:04:40.760907+00	2023-01-27 11:04:40.760907+00
207	fahad	qwer	uiii	1234567890	dfghj	kerala	tyyyy	123456	sa@g.com	\N	\N	\N	2023-01-27 13:21:35.61432+00	2023-01-27 13:21:35.61432+00
213	fahad	qwer	uiii	1234567890	dfghj	kerala	tyyyy	123456	sa@g.com	user	\N	\N	2023-01-27 13:22:30.020218+00	2023-01-27 13:22:30.020218+00
206	fahad	qwer	uiii	1234567890	dfghj	kerala	tyyyy	123456	sa@g.com	user	\N	\N	2023-01-27 13:21:35.617926+00	2023-01-27 13:21:35.617926+00
208	fahad	qwer	uiii	1234567890	dfghj	kerala	tyyyy	123456	sa@g.com	\N	\N	\N	2023-01-27 13:22:15.699+00	2023-01-27 13:22:15.699+00
214	fahad	qwer	uiii	1234567890	dfghj	kerala	tyyyy	123456	sa@g.com	\N	\N	\N	2023-01-27 13:22:36.088243+00	2023-01-27 13:22:36.088243+00
209	fahad	qwer	uiii	1234567890	dfghj	kerala	tyyyy	123456	sa@g.com	user	\N	\N	2023-01-27 13:22:15.707162+00	2023-01-27 13:22:15.707162+00
210	fahad	qwer	uiii	1234567890	dfghj	kerala	tyyyy	123456	sa@g.com	user	\N	\N	2023-01-27 13:22:21.724417+00	2023-01-27 13:22:21.724417+00
211	fahad	qwer	uiii	1234567890	dfghj	kerala	tyyyy	123456	sa@g.com	user	\N	\N	2023-01-27 13:22:24.315137+00	2023-01-27 13:22:24.315137+00
212	fahad	qwer	uiii	1234567890	dfghj	kerala	tyyyy	123456	sa@g.com	user	\N	\N	2023-01-27 13:22:26.204118+00	2023-01-27 13:22:26.204118+00
215	fahad	qwer	uiii	1234567890	dfghj	kerala	tyyyy	123456	sa@g.com	user	\N	\N	2023-01-27 13:22:36.173651+00	2023-01-27 13:22:36.173651+00
235	jbhjbj	hmv	jj	1234567890	dfghjk	kerala	fghjk	123456	d@g.com	user	\N	\N	2023-01-28 07:13:40.485409+00	2023-01-28 07:13:40.485409+00
237	asas	sd	gf	1234567890	cgv	tamilnadu	bv	123456	s@g.com	user	\N	\N	2023-01-28 11:33:38.527349+00	2023-01-28 11:33:38.527349+00
236	asas	sd	gf	1234567890	cgv	tamilnadu	bv	123456	s@g.com	user	\N	\N	2023-01-28 11:33:38.50863+00	2023-01-28 11:33:38.50863+00
238	adsa	gcg	nv	1234567890	hgh	tamilnadu	bcv	123455	d@g.com	100438714	\N	\N	2023-01-28 12:00:32.743792+00	2023-01-28 12:00:32.743792+00
239	adsa	gcg	nv	1234567890	hgh	tamilnadu	bcv	123455	d@g.com	100438714	\N	\N	2023-01-28 12:00:42.931276+00	2023-01-28 12:00:42.931276+00
240	adds	fxfvxx	ghfghf	1234567890	drgdg	tamilnadu	hv	123453	d@g.com	100765440	\N	\N	2023-01-28 12:10:04.338801+00	2023-01-28 12:10:04.338801+00
241	adds	fxfvxx	ghfghf	1234567890	drgdg	tamilnadu	hv	123453	d@g.com	100765440	\N	\N	2023-01-28 12:10:04.38042+00	2023-01-28 12:10:04.38042+00
242	dfdf	nmm	jnb	1234567890	hhj	kerala	nmb	123456	b@g.com	100621608	\N	\N	2023-01-28 12:13:04.198819+00	2023-01-28 12:13:04.198819+00
243	dfdf	nmm	jnb	1234567890	hhj	kerala	nmb	123456	b@g.com	100621608	\N	\N	2023-01-28 12:13:04.199123+00	2023-01-28 12:13:04.199123+00
245	dfdf	nmm	jnb	1234567890	hhj	kerala	nmb	123456	b@g.com	\N	\N	\N	2023-01-28 12:14:40.588925+00	2023-01-28 12:14:40.588925+00
244	dfdf	nmm	jnb	1234567890	hhj	kerala	nmb	123456	b@g.com	100621608	\N	\N	2023-01-28 12:14:40.593527+00	2023-01-28 12:14:40.593527+00
246	dfdf	nmm	jnb	1234567890	hhj	kerala	nmb	123456	b@g.com	100621608	\N	\N	2023-01-28 12:17:13.050826+00	2023-01-28 12:17:13.050826+00
247	dfdf	nmm	jnb	1234567890	hhj	kerala	nmb	123456	b@g.com	100621608	\N	\N	2023-01-28 12:17:13.072509+00	2023-01-28 12:17:13.072509+00
248	dfdf	nmm	jnb	1234567890	hhj	kerala	nmb	123456	b@g.com	100621608	\N	\N	2023-01-28 12:20:38.931821+00	2023-01-28 12:20:38.931821+00
249	dfdf	nmm	jnb	1234567890	hhj	kerala	nmb	123456	b@g.com	100621608	\N	\N	2023-01-28 12:20:38.936875+00	2023-01-28 12:20:38.936875+00
250	dfdf	nmm	jnb	1234567890	hhj	kerala	nmb	123456	b@g.com	100621608	\N	\N	2023-01-28 12:21:28.573305+00	2023-01-28 12:21:28.573305+00
251	dfdf	nmm	jnb	1234567890	hhj	kerala	nmb	123456	b@g.com	100621608	\N	\N	2023-01-28 12:21:28.595345+00	2023-01-28 12:21:28.595345+00
252	fahadhome	thrissur	fahad	9999888666	kollam	tamilnadu	thirunalveli	345789	fahad@gmail.com	user	\N	\N	2023-01-28 13:10:41.886682+00	2023-01-28 13:10:41.886682+00
253	elsehome	idukki	else	8466778888	idukki	kerala	idukki	666666	else@gmail.com	user	\N	\N	2023-01-28 13:16:38.731146+00	2023-01-28 13:16:38.731146+00
254	test 130	sasthamcotta	anas salam	8075569925	house no 6	kerala	kollam	680550	anas123@gmail.com	100586795	\N	\N	2023-01-29 12:33:40.133383+00	2023-01-29 12:33:40.133383+00
255	test 130	sasthamcotta	anas salam	8075569925	house no 6	kerala	kollam	680550	anas123@gmail.com	100586795	\N	\N	2023-01-29 12:33:40.189511+00	2023-01-29 12:33:40.189511+00
265	site player	moscow	putin	9878767867	russia	tamilnadu	kollam	896745	putin@gmai.com	100142542	\N	\N	2023-01-31 10:39:31.284505+00	2023-01-31 10:39:31.284505+00
266	smith6	malappuram	vaisakh k s	9495886562	malappuram,ponnani,m	kerala	malappuram	688523	ksyyy@gmail.com	100173830	\N	\N	2023-02-01 07:38:54.779091+00	2023-02-01 07:38:54.779091+00
267	norman industries	thakazhy	norman	9495662323	thakazhy alappuzha	kerala	alappuzha	688561	norman@gmail.com	100444874	\N	\N	2023-02-01 07:40:45.852748+00	2023-02-01 07:40:45.852748+00
268	das enterprises	karunagapally	ajayan	9895663232	AJAYAN, kARUNAGAPALLY	Select State	ALAPPUZHA	688562	ajayan@gmail.com	100602267	\N	\N	2023-02-06 16:17:44.445823+00	2023-02-06 16:17:44.445823+00
269	Ajayan pvt ltd	kollam	ajayan	9895445566	ajayan,kollam	Select State	kollam	688564	ajayan@gmail.com	100315578	\N	\N	2023-02-06 16:21:01.086061+00	2023-02-06 16:21:01.086061+00
270	nnn	cccc	dddd	9999999999	ezfsfcf	kerala	ccccc	123456	vnvnnn@g.com	100272539	\N	\N	2023-02-06 16:26:11.785862+00	2023-02-06 16:26:11.785862+00
275	test	test	test	9878788767	test	karnataka	test	899089	test@g.com	100173140	\N	\N	2023-02-07 06:21:13.967988+00	2023-02-07 06:21:13.967988+00
277	na	bh	vhvbm	7675675656	hgf	kerala	hv	563467	hf@k.co	100173140	\N	\N	2023-02-07 06:25:50.366268+00	2023-02-07 06:25:50.366268+00
279	astaa	sd	sl	7878778788	df	tamilnadu	sdb	897865	a@g.co	100565059	\N	\N	2023-02-09 11:09:40.663268+00	2023-02-09 11:09:40.663268+00
281	Anandhu pvt	karuvatta	anadhu	9895665656	anandhu villa, karuvatta	kerala	alappuzha	688564	anandhu@gmail.com	100135657	\N	\N	2023-02-09 12:05:03.543823+00	2023-02-09 12:05:03.543823+00
284	Adityan pvt ltd	kumarakom	adityan	9895665655	Kumarakom	kerala	Kottayam	655263	adityan@gmail.com	100322939	\N	\N	2023-02-10 06:15:57.176756+00	2023-02-10 06:15:57.176756+00
285	transistorlife	thrissur	sajina	9996789045	saddddddddd	kerala	trivandrum	567890	sajina@gmal.com	100586377	\N	\N	2023-02-13 11:41:06.750974+00	2023-02-13 11:41:06.750974+00
286	Ann private limited	Kottiyam	Anandhu	9896636562	Ann villa, Kottiyam, Trivandrum	kerala	Trivandrum	688562	ann@gmail.com	100666866	\N	\N	2023-02-21 07:44:00.431237+00	2023-02-21 07:44:00.431237+00
287	jfkgcjgcfkwjg	kjvb	fkdjvkjhg	9088676564	sdkjch	karnataka	dfv	878877	kfjvhbkjgm@hjbd.gfchgf	100351804	\N	\N	2023-02-23 07:31:33.233248+00	2023-02-23 07:31:33.233248+00
288	dfty	patharam	biju	8999999999	qwert	kerala	kollam	666666	bi@gm.com	100366713	\N	\N	2023-02-23 12:03:37.348239+00	2023-02-23 12:03:37.348239+00
\.


--
-- Data for Name: site_expense; Type: TABLE DATA; Schema: public; Owner: powerta
--

COPY public.site_expense (site_exp_id, expense_amount, previous_advance, advance_required, employee_f_key, site_f_key, "timestamp", exp_cat, pay_typ, desp, exp_no, user_perm, created_at, updated_at, is_deleted, exp_dat) FROM stdin;
122	6969	\N	\N	\N	15	\N	food	debit	test		1	2023-01-29 14:22:52.728243+00	2023-01-29 14:22:52.728243+00	0	2023-01-12
123	55555	\N	\N	\N	18	\N	travel	debit	anas anaas	123	1	2023-01-29 14:23:18.855626+00	2023-01-29 14:23:18.855626+00	0	2023-01-29
124	50000	\N	\N	\N	1	\N	travel	debit	ans ans anas	124	1	2023-01-29 14:53:25.024247+00	2023-01-29 14:53:25.024247+00	0	2023-01-29
125	23000	\N	\N	\N	5	\N	meterials	upi	jasil jasil bye bye	125	1	2023-01-29 14:53:49.536591+00	2023-01-29 14:53:49.536591+00	0	2023-01-29
126	1	\N	\N	\N	12	\N	petrol	upi		126	1	2023-01-30 09:19:30.440384+00	2023-01-30 09:19:30.440384+00	0	2023-01-30
128	1000	\N	\N	\N	258	\N	petrol	cash		128	0	2023-01-31 06:01:18.946744+00	2023-01-31 06:01:18.946744+00	1	2023-01-04
130	2000	\N	\N	\N	260	\N	food	cash		130	0	2023-01-31 06:21:27.621215+00	2023-01-31 06:21:27.621215+00	1	2023-02-01
131	2000	\N	\N	\N	260	\N	food	cash		130	0	2023-01-31 06:21:27.626101+00	2023-01-31 06:21:27.626101+00	1	2023-02-01
127	1	\N	\N	\N	12	\N	petrol	upi		126	1	2023-01-30 09:19:30.525069+00	2023-01-30 09:19:30.525069+00	0	2023-01-30
154	55555555	\N	\N	\N	253	\N	travel	debit	dsvbd	154	1	2023-02-06 17:55:38.463093+00	2023-02-06 17:55:38.463093+00	0	2023-02-01
155	6666666	\N	\N	\N	8	\N	travel	debit	ssajcbjksfbj	155	1	2023-02-06 18:02:02.706226+00	2023-02-06 18:02:02.706226+00	0	2023-02-09
129	50000	\N	\N	\N	259	\N	petrol	upi		129	1	2023-01-31 06:19:49.062882+00	2023-01-31 06:19:49.062882+00	0	2023-01-12
140	2433	\N	\N	\N	2	\N	travel	cash	g	140	1	2023-01-31 12:31:37.670065+00	2023-01-31 12:31:37.670065+00	0	2023-01-10
141	2433	\N	\N	\N	2	\N	travel	cash	g	140	1	2023-01-31 12:31:37.695023+00	2023-01-31 12:31:37.695023+00	1	2023-01-10
156	777777	\N	\N	\N	110	\N	food	cash	food testing	156	1	2023-02-07 05:50:32.808464+00	2023-02-07 05:50:32.808464+00	0	2023-02-08
160	1000	\N	\N	\N	272	\N	travel	upi	qw	160	1	2023-02-07 06:01:36.265029+00	2023-02-07 06:01:36.265029+00	1	2023-02-01
159	9898	\N	\N	\N	235	\N	travel	upi	new	159	1	2023-02-07 05:57:10.367688+00	2023-02-07 05:57:10.367688+00	0	2023-02-08
143	4346	\N	\N	\N	1	\N	travel	upi	k	143	1	2023-01-31 12:50:18.592703+00	2023-01-31 12:50:18.592703+00	0	2023-01-16
161	20000	\N	\N	\N	267	\N	food	cash	adas	161	1	2023-02-08 06:44:32.201584+00	2023-02-08 06:44:32.201584+00	0	2023-02-16
144	67565	\N	\N	\N	1	\N	petrol	upi	k..	144	0	2023-01-31 13:26:39.989045+00	2023-01-31 13:26:39.989045+00	1	2023-01-10
134	1233	\N	\N	\N	31	\N	travel	upi	pp	134	1	2023-01-31 11:51:11.119679+00	2023-01-31 11:51:11.119679+00	0	2023-01-11
147	7654	\N	\N	\N	1	\N	petrol	upi	fd	147	1	2023-01-31 13:43:54.46517+00	2023-01-31 13:43:54.46517+00	0	2023-01-11
133	-1000	\N	\N	\N	259	\N	meterials	cash	NA	133	1	2023-01-31 09:57:23.067892+00	2023-01-31 09:57:23.067892+00	0	2023-01-18
135	1223	\N	\N	\N	263	\N	food	cash	v	135	1	2023-01-31 12:01:05.186161+00	2023-01-31 12:01:05.186161+00	1	2023-01-10
136	888	\N	\N	\N	263	\N	petrol	cash	i	136	1	2023-01-31 12:26:15.703404+00	2023-01-31 12:26:15.703404+00	0	2023-01-04
137	888	\N	\N	\N	263	\N	petrol	cash	i	136	1	2023-01-31 12:26:15.744379+00	2023-01-31 12:26:15.744379+00	0	2023-01-04
138	223	\N	\N	\N	1	\N	food	cash	hu	138	1	2023-01-31 12:29:53.079716+00	2023-01-31 12:29:53.079716+00	0	2023-01-11
149	56456	\N	\N	\N	1	\N	petrol	cash	uhiu	149	1	2023-01-31 14:04:05.238424+00	2023-01-31 14:04:05.238424+00	0	2023-01-24
146	3423	\N	\N	\N	1	\N	petrol	upi	fgfd	146	1	2023-01-31 13:41:51.742687+00	2023-01-31 13:41:51.742687+00	0	2023-01-10
139	223	\N	\N	\N	1	\N	food	cash	hu	138	1	2023-01-31 12:29:53.089278+00	2023-01-31 12:29:53.089278+00	0	2023-01-11
142	5535	\N	\N	\N	1	\N	petrol	cash	t	141	0	2023-01-31 12:36:28.620079+00	2023-01-31 12:36:28.620079+00	1	2023-01-05
150	422323	\N	\N	\N	1	\N	food	upi	wef	150	1	2023-01-31 14:15:27.46463+00	2023-01-31 14:15:27.46463+00	0	2023-01-11
151	1500	\N	\N	\N	102	\N	petrol	cash		151	0	2023-01-31 14:18:49.304453+00	2023-01-31 14:18:49.304453+00	1	2023-01-24
145	6776	\N	\N	\N	1	\N	travel	upi	ll	145	1	2023-01-31 13:27:27.5041+00	2023-01-31 13:27:27.5041+00	0	2023-01-11
152	100000	\N	\N	\N	267	\N	meterials	upi		152	1	2023-02-01 07:41:57.579674+00	2023-02-01 07:41:57.579674+00	0	2023-02-16
157	1222	\N	\N	\N	271	\N	travel	upi	cv vc	157	1	2023-02-07 05:52:33.430683+00	2023-02-07 05:52:33.430683+00	0	2023-02-15
158	369	\N	\N	\N	271	\N	meterials	debit	new	158	1	2023-02-07 05:54:51.759739+00	2023-02-07 05:54:51.759739+00	0	2023-02-13
153	1000	\N	\N	\N	253	\N	petrol	upi	elseisac	153	1	2023-02-06 17:53:52.777099+00	2023-02-06 17:53:52.777099+00	0	2023-02-08
163	5644	\N	\N	\N	25	\N	food	upi	fggg	163	0	2023-02-09 06:38:58.120029+00	2023-02-09 06:38:58.120029+00	1	2023-02-15
166	7856	\N	\N	\N	101	\N	food	upi	ghn	166	0	2023-02-09 06:41:56.006666+00	2023-02-09 06:41:56.006666+00	1	2023-02-15
165	6776	\N	\N	\N	235	\N	petrol	cash	hjbbnhbj	164	1	2023-02-09 06:40:16.516084+00	2023-02-09 06:40:16.516084+00	0	2023-02-08
164	6776	\N	\N	\N	235	\N	petrol	cash	hjbbnhbj	164	1	2023-02-09 06:40:16.480844+00	2023-02-09 06:40:16.480844+00	0	2023-02-08
167	767	\N	\N	\N	26	\N	travel	cash	ghtyh	167	0	2023-02-09 06:42:54.286231+00	2023-02-09 06:42:54.286231+00	1	2023-02-15
168	767	\N	\N	\N	26	\N	travel	cash	ghtyh	167	1	2023-02-09 06:42:54.314679+00	2023-02-09 06:42:54.314679+00	0	2023-02-15
171	8979	\N	\N	\N	235	\N	food	upi	vbbn	171	0	2023-02-09 06:47:44.877646+00	2023-02-09 06:47:44.877646+00	1	2023-02-08
172	9809	\N	\N	\N	25	\N	travel	debit	kura	172	0	2023-02-09 07:40:00.198755+00	2023-02-09 07:40:00.198755+00	1	2023-02-07
170	67767	\N	\N	\N	31	\N	travel	upi	bbn	169	0	2023-02-09 06:44:24.728645+00	2023-02-09 06:44:24.728645+00	1	2023-02-07
162	1233	\N	\N	\N	1	\N	petrol	debit	nowi	162	1	2023-02-09 06:34:01.386757+00	2023-02-09 06:34:01.386757+00	0	2023-02-14
174	9898	\N	\N	\N	25	\N	travel	upi	hhh	174	0	2023-02-09 07:46:35.760381+00	2023-02-09 07:46:35.760381+00	1	2023-02-16
169	67767	\N	\N	\N	31	\N	travel	upi	bbn	169	1	2023-02-09 06:44:24.620599+00	2023-02-09 06:44:24.620599+00	0	2023-02-07
175	9898	\N	\N	\N	235	\N	travel	upi	j	175	1	2023-02-09 07:53:41.489285+00	2023-02-09 07:53:41.489285+00	0	2023-02-08
177	8688	\N	\N	\N	25	\N	food	upi	jkjk	177	0	2023-02-09 08:00:09.812113+00	2023-02-09 08:00:09.812113+00	1	2023-02-08
178	9090	\N	\N	\N	25	\N	travel	debit	kkk	178	1	2023-02-09 08:05:08.939461+00	2023-02-09 08:05:08.939461+00	0	2023-02-08
179	8788	\N	\N	\N	235	\N	food	upi	hbhj	179	0	2023-02-09 08:07:25.208281+00	2023-02-09 08:07:25.208281+00	1	2023-02-08
180	6665	\N	\N	\N	5	\N	travel	upi	ss	180	0	2023-02-09 08:11:24.712624+00	2023-02-09 08:11:24.712624+00	1	2023-02-07
176	9899	\N	\N	\N	128	\N	food	upi	hungry	176	1	2023-02-09 07:57:49.622108+00	2023-02-09 07:57:49.622108+00	0	2023-02-16
181	5534	\N	\N	\N	7	\N	travel	upi	fs	181	1	2023-02-09 08:16:24.671134+00	2023-02-09 08:16:24.671134+00	0	2023-02-08
184	89	\N	\N	\N	25	\N	travel	upi	kh	184	1	2023-02-09 08:48:03.149114+00	2023-02-09 08:48:03.149114+00	1	2023-02-08
182	8889	\N	\N	\N	112	\N	travel	upi	bnh	182	0	2023-02-09 08:42:28.077781+00	2023-02-09 08:42:28.077781+00	1	2023-02-08
183	8889	\N	\N	\N	112	\N	travel	upi	bnh	182	1	2023-02-09 08:42:28.118414+00	2023-02-09 08:42:28.118414+00	0	2023-02-08
185	89	\N	\N	\N	25	\N	travel	upi	kh	184	1	2023-02-09 08:48:03.15778+00	2023-02-09 08:48:03.15778+00	0	2023-02-08
186	89	\N	\N	\N	26	\N	travel	upi	jk	186	1	2023-02-09 08:49:40.577499+00	2023-02-09 08:49:40.577499+00	0	2023-02-08
187	89	\N	\N	\N	26	\N	travel	upi	jk	186	0	2023-02-09 08:49:40.588748+00	2023-02-09 08:49:40.588748+00	1	2023-02-08
195	8998	\N	\N	\N	5	\N	food	upi	KJLLJ	195	1	2023-02-09 11:59:07.60649+00	2023-02-09 11:59:07.60649+00	0	2023-02-08
188	345436	\N	\N	\N	279	\N	travel	upi	dfgdf	188	1	2023-02-09 11:22:31.198678+00	2023-02-09 11:22:31.198678+00	1	2023-02-15
190	876554	\N	\N	\N	235	\N	travel	debit	hg	189	0	2023-02-09 11:31:00.25011+00	2023-02-09 11:31:00.25011+00	1	2023-02-08
196	6565	\N	\N	\N	9	\N	travel	upi	FDFD	196	0	2023-02-09 12:06:38.250571+00	2023-02-09 12:06:38.250571+00	1	2023-02-08
189	876554	\N	\N	\N	235	\N	travel	debit	hg	189	1	2023-02-09 11:31:00.240114+00	2023-02-09 11:31:00.240114+00	0	2023-02-08
192	7687	\N	\N	\N	128	\N	food	debit	gj	191	1	2023-02-09 11:35:57.724984+00	2023-02-09 11:35:57.724984+00	1	2023-02-08
193	7887	\N	\N	\N	112	\N	travel	debit	GH	193	1	2023-02-09 11:49:35.395952+00	2023-02-09 11:49:35.395952+00	0	2023-02-08
194	909	\N	\N	\N	9	\N	travel	upi	H	194	0	2023-02-09 11:55:12.39117+00	2023-02-09 11:55:12.39117+00	1	2023-02-08
199	3456	\N	\N	\N	25	\N	food	upi	new test 75588	199	1	2023-02-09 12:41:11.49456+00	2023-02-09 12:41:11.49456+00	0	2023-02-08
197	4356	\N	\N	\N	9	\N	petrol	upi	gfgf	197	1	2023-02-09 12:36:29.926249+00	2023-02-09 12:36:29.926249+00	1	2023-02-08
198	4567	\N	\N	\N	6	\N	travel	upi	this is a test 777000	198	1	2023-02-09 12:38:39.763292+00	2023-02-09 12:38:39.763292+00	0	2023-02-08
201	3322	\N	\N	\N	25	\N	travel	upi	new 3322	201	1	2023-02-09 12:45:29.314164+00	2023-02-09 12:45:29.314164+00	0	2023-02-08
200	5543	\N	\N	\N	128	\N	travel	upi	new test 5543	200	1	2023-02-09 12:42:42.216763+00	2023-02-09 12:42:42.216763+00	0	2023-02-08
203	25696	\N	\N	\N	282	\N	meterials	upi	na	203	0	2023-02-09 13:13:04.781308+00	2023-02-09 13:13:04.781308+00	0	2023-01-05
205	555	\N	\N	\N	26	\N	meterials	upi	don	205	0	2023-02-09 13:23:57.829032+00	2023-02-09 13:23:57.829032+00	0	2023-02-08
206	1313	\N	\N	\N	256	\N	food	cash	123654	206	0	2023-02-09 13:35:39.703058+00	2023-02-09 13:35:39.703058+00	0	2023-02-08
207	1313	\N	\N	\N	256	\N	food	cash	123654	206	0	2023-02-09 13:35:43.90954+00	2023-02-09 13:35:43.90954+00	0	2023-02-08
210	5241	\N	\N	\N	256	\N	food	upi	15241	210	0	2023-02-09 14:43:00.204794+00	2023-02-09 14:43:00.204794+00	0	2023-02-08
243	256	\N	\N	\N	30	\N	travel	cash	fggh	211	0	2023-02-09 15:06:53.891236+00	2023-02-09 15:06:53.891236+00	0	2023-02-10
244	256	\N	\N	\N	30	\N	travel	cash	fggh	211	0	2023-02-09 15:07:13.525889+00	2023-02-09 15:07:13.525889+00	0	2023-02-10
245	6969	\N	\N	\N	7	\N	food	debit	yyyyyy	245	0	2023-02-09 15:17:00.388213+00	2023-02-09 15:17:00.388213+00	0	2023-02-10
246	6969	\N	\N	\N	7	\N	food	debit	yyyyyy	245	0	2023-02-09 15:17:05.466797+00	2023-02-09 15:17:05.466797+00	0	2023-02-10
247	911	\N	\N	\N	113	\N	travel	cash	911	247	0	2023-02-09 15:25:53.615483+00	2023-02-09 15:25:53.615483+00	0	2023-02-08
248	911	\N	\N	\N	113	\N	travel	cash	911	247	0	2023-02-09 15:25:59.64982+00	2023-02-09 15:25:59.64982+00	0	2023-02-08
249	5654	\N	\N	\N	5	\N	travel	cash	yy	249	0	2023-02-09 15:30:11.987451+00	2023-02-09 15:30:11.987451+00	0	2023-02-08
250	5654	\N	\N	\N	5	\N	travel	cash	yy	249	0	2023-02-09 15:30:19.195737+00	2023-02-09 15:30:19.195737+00	0	2023-02-08
251	2323	\N	\N	\N	128	\N	food	upi	1515	251	0	2023-02-09 15:41:14.844277+00	2023-02-09 15:41:14.844277+00	0	2023-02-01
252	3214	\N	\N	\N	26	\N	travel	cash	4646	252	0	2023-02-09 15:42:03.569551+00	2023-02-09 15:42:03.569551+00	0	2023-01-11
253	9898	\N	\N	\N	128	\N	food	upi	1414	253	0	2023-02-09 15:43:36.777572+00	2023-02-09 15:43:36.777572+00	0	2023-02-08
254	9898	\N	\N	\N	128	\N	food	upi	1414	253	0	2023-02-09 15:44:21.008599+00	2023-02-09 15:44:21.008599+00	0	2023-02-08
255	6969	\N	\N	\N	9	\N	travel	cash	6969	255	0	2023-02-09 15:50:05.824461+00	2023-02-09 15:50:05.824461+00	0	2023-02-07
256	6969	\N	\N	\N	9	\N	travel	cash	6969	255	0	2023-02-09 15:50:05.829104+00	2023-02-09 15:50:05.829104+00	0	2023-02-07
257	6969	\N	\N	\N	9	\N	travel	cash	6969	255	0	2023-02-09 15:51:59.690615+00	2023-02-09 15:51:59.690615+00	0	2023-02-07
258	6969	\N	\N	\N	99	\N	food	upi	5445	258	0	2023-02-09 16:00:18.096283+00	2023-02-09 16:00:18.096283+00	0	2023-02-08
259	6969	\N	\N	\N	99	\N	food	upi	5445	258	0	2023-02-09 16:00:18.105167+00	2023-02-09 16:00:18.105167+00	0	2023-02-08
260	6969	\N	\N	\N	99	\N	food	upi	5445	258	0	2023-02-09 16:00:18.094704+00	2023-02-09 16:00:18.094704+00	0	2023-02-08
261	4565	\N	\N	\N	27	\N	travel	upi	1212	261	0	2023-02-09 16:01:31.516538+00	2023-02-09 16:01:31.516538+00	0	2023-02-08
262	4565	\N	\N	\N	27	\N	travel	upi	1212	261	0	2023-02-09 16:01:31.595533+00	2023-02-09 16:01:31.595533+00	0	2023-02-08
263	4565	\N	\N	\N	27	\N	travel	upi	1212	261	0	2023-02-09 16:01:31.605566+00	2023-02-09 16:01:31.605566+00	0	2023-02-08
264	4141	\N	\N	\N	128	\N	food	debit	1441	264	0	2023-02-09 16:02:43.694604+00	2023-02-09 16:02:43.694604+00	0	2023-02-02
265	4141	\N	\N	\N	128	\N	food	debit	1441	264	0	2023-02-09 16:02:43.700895+00	2023-02-09 16:02:43.700895+00	0	2023-02-02
266	4141	\N	\N	\N	128	\N	food	debit	1441	264	0	2023-02-09 16:02:43.700901+00	2023-02-09 16:02:43.700901+00	0	2023-02-02
268	456	\N	\N	\N	25	\N	travel	upi	456	267	0	2023-02-10 05:47:23.839006+00	2023-02-10 05:47:23.839006+00	0	2023-02-08
267	456	\N	\N	\N	25	\N	travel	upi	456	267	0	2023-02-10 05:47:23.829995+00	2023-02-10 05:47:23.829995+00	0	2023-02-08
269	456	\N	\N	\N	113	\N	travel	debit	test case	269	0	2023-02-10 05:50:05.903202+00	2023-02-10 05:50:05.903202+00	0	2023-02-08
270	456	\N	\N	\N	113	\N	travel	debit	test case	269	0	2023-02-10 05:50:05.928422+00	2023-02-10 05:50:05.928422+00	0	2023-02-08
271	2000	\N	\N	\N	267	\N	food	upi	na	271	0	2023-02-10 06:03:11.761749+00	2023-02-10 06:03:11.761749+00	0	2022-12-15
272	6969	\N	\N	\N	101	\N	travel	debit	this 6969	272	0	2023-02-10 06:09:43.761973+00	2023-02-10 06:09:43.761973+00	0	2023-02-02
273	6969	\N	\N	\N	5	\N	travel	upi	y 6969	273	0	2023-02-10 06:14:37.910237+00	2023-02-10 06:14:37.910237+00	0	2023-02-08
274	60000	\N	\N	\N	284	\N	travel	upi	na	274	0	2023-02-10 06:16:15.448429+00	2023-02-10 06:16:15.448429+00	0	2023-01-20
275	55639	\N	\N	\N	284	\N	petrol	cash	petrol	275	0	2023-02-10 06:29:21.531461+00	2023-02-10 06:29:21.531461+00	0	2023-01-12
276	1144	\N	\N	\N	256	\N	travel	upi	1414	276	0	2023-02-10 06:37:47.082177+00	2023-02-10 06:37:47.082177+00	0	2023-02-02
277	12336	\N	\N	\N	284	\N	meterials	cash	this 8998	277	0	2023-02-10 06:43:44.479885+00	2023-02-10 06:43:44.479885+00	0	2022-11-18
132	2000	\N	\N	\N	261	\N	meterials	debit	na	132	1	2023-01-31 07:25:37.341106+00	2023-01-31 07:25:37.341106+00	0	2023-01-04
279	2021	\N	\N	\N	9	\N	travel	cash	new test 2021	279	1	2023-02-10 07:25:13.595411+00	2023-02-10 07:25:13.595411+00	0	2023-02-09
278	4452	\N	\N	\N	25	\N	food	upi	144554	278	1	2023-02-10 06:56:14.892045+00	2023-02-10 06:56:14.892045+00	0	2023-02-15
280	212	\N	\N	\N	25	\N	travel	upi	hjhjjhhj	280	0	2023-02-10 13:49:27.607964+00	2023-02-10 13:49:27.607964+00	0	2023-02-09
281	8989	\N	\N	\N	235	\N	food	upi	my test 8989	281	0	2023-02-10 15:50:01.716107+00	2023-02-10 15:50:01.716107+00	0	2023-02-09
282	66969	\N	\N	\N	26	\N	travel	cash	kjjk	282	0	2023-02-10 15:52:42.667895+00	2023-02-10 15:52:42.667895+00	0	2023-02-08
283	2525	\N	\N	\N	235	\N	petrol	upi	test	283	0	2023-02-15 12:45:05.484727+00	2023-02-15 12:45:05.484727+00	0	2023-02-03
303	124	\N	\N	\N	26	\N	petrol	upi		301	0	2023-02-15 13:34:58.151153+00	2023-02-15 13:34:58.151153+00	0	2023-02-01
284	2525	\N	\N	\N	235	\N	petrol	upi	test	283	0	2023-02-15 12:45:13.768905+00	2023-02-15 12:45:13.768905+00	1	2023-02-03
285	25236	\N	\N	\N	235	\N	travel	cash	test case	285	0	2023-02-15 12:48:48.43527+00	2023-02-15 12:48:48.43527+00	0	2023-02-03
286	15	\N	\N	\N	17	\N	petrol	upi	te	286	0	2023-02-15 12:51:14.885618+00	2023-02-15 12:51:14.885618+00	0	2023-02-04
287	52	\N	\N	\N	17	\N	petrol	cash	kd	287	0	2023-02-15 12:55:21.155196+00	2023-02-15 12:55:21.155196+00	0	2023-02-11
288	6558	\N	\N	\N	15	\N	travel	upi	h.vh;	288	0	2023-02-15 13:13:21.850139+00	2023-02-15 13:13:21.850139+00	0	2023-02-08
289	131331	\N	\N	\N	7	\N	petrol	cash		289	0	2023-02-15 13:15:45.299576+00	2023-02-15 13:15:45.299576+00	0	2023-02-15
290	131331	\N	\N	\N	7	\N	petrol	cash		289	0	2023-02-15 13:15:54.340144+00	2023-02-15 13:15:54.340144+00	0	2023-02-15
291	4555	\N	\N	\N	256	\N	travel	upi	jjkkk	290	0	2023-02-15 13:18:38.072595+00	2023-02-15 13:18:38.072595+00	0	2023-02-09
292	4555	\N	\N	\N	256	\N	travel	upi	jjkkk	290	0	2023-02-15 13:18:45.918234+00	2023-02-15 13:18:45.918234+00	0	2023-02-09
293	4554	\N	\N	\N	256	\N	travel	cash		292	0	2023-02-15 13:22:53.226465+00	2023-02-15 13:22:53.226465+00	0	2023-02-01
294	4554	\N	\N	\N	256	\N	travel	cash		292	0	2023-02-15 13:23:30.248911+00	2023-02-15 13:23:30.248911+00	0	2023-02-01
295	444	\N	\N	\N	9	\N	food	upi	kmk	294	0	2023-02-15 13:25:28.708895+00	2023-02-15 13:25:28.708895+00	0	2023-02-02
296	444	\N	\N	\N	9	\N	food	upi	kmk	294	0	2023-02-15 13:25:35.299088+00	2023-02-15 13:25:35.299088+00	0	2023-02-02
297	21	\N	\N	\N	108	\N	petrol	upi	hj	296	0	2023-02-15 13:32:02.459367+00	2023-02-15 13:32:02.459367+00	0	2023-02-03
298	21	\N	\N	\N	108	\N	petrol	upi	hj	296	0	2023-02-15 13:32:09.297001+00	2023-02-15 13:32:09.297001+00	0	2023-02-03
299	5	\N	\N	\N	235	\N	travel	cash		298	0	2023-02-15 13:33:09.041456+00	2023-02-15 13:33:09.041456+00	0	2023-05-04
300	104	\N	\N	\N	26	\N	travel	cash		300	0	2023-02-15 13:33:51.025389+00	2023-02-15 13:33:51.025389+00	0	2023-02-08
301	104	\N	\N	\N	26	\N	travel	cash		300	0	2023-02-15 13:33:56.035836+00	2023-02-15 13:33:56.035836+00	0	2023-02-08
302	124	\N	\N	\N	26	\N	petrol	upi		301	0	2023-02-15 13:34:50.21438+00	2023-02-15 13:34:50.21438+00	0	2023-02-01
304	1000454545	\N	\N	\N	128	\N	travel	upi		303	0	2023-02-15 13:38:50.299339+00	2023-02-15 13:38:50.299339+00	0	2023-02-16
305	1000454545	\N	\N	\N	128	\N	travel	upi		303	0	2023-02-15 13:39:23.467261+00	2023-02-15 13:39:23.467261+00	0	2023-02-16
306	555555555555555511111	\N	\N	\N	25	\N	petrol	upi		305	0	2023-02-15 13:43:36.441107+00	2023-02-15 13:43:36.441107+00	0	2023-02-22
307	555555555555555511111	\N	\N	\N	25	\N	petrol	upi		305	0	2023-02-15 13:43:43.913563+00	2023-02-15 13:43:43.913563+00	0	2023-02-22
308	12121	\N	\N	\N	26	\N	food	upi		307	0	2023-02-15 13:48:23.629206+00	2023-02-15 13:48:23.629206+00	0	2023-02-01
309	12121	\N	\N	\N	26	\N	food	upi		307	0	2023-02-15 13:48:31.865944+00	2023-02-15 13:48:31.865944+00	0	2023-02-01
310	5454	\N	\N	\N	25	\N	travel	upi		310	0	2023-02-15 13:57:27.328967+00	2023-02-15 13:57:27.328967+00	0	2023-02-01
311	5454	\N	\N	\N	25	\N	travel	upi		310	0	2023-02-15 13:57:34.796796+00	2023-02-15 13:57:34.796796+00	0	2023-02-01
312	24	\N	\N	\N	235	\N	travel	cash		311	0	2023-02-15 14:01:03.855392+00	2023-02-15 14:01:03.855392+00	0	2023-02-11
313	24	\N	\N	\N	235	\N	travel	cash		311	0	2023-02-15 14:01:08.930926+00	2023-02-15 14:01:08.930926+00	0	2023-02-11
209	36696	\N	\N	\N	282	\N	food	cash	NA	208	0	2023-02-09 13:36:53.260331+00	2023-02-09 13:36:53.260331+00	1	2023-01-20
202	6683	\N	\N	\N	112	\N	travel	upi	6683	202	1	2023-02-09 13:03:14.286864+00	2023-02-09 13:03:14.286864+00	0	2023-02-08
204	8978	\N	\N	\N	128	\N	travel	upi	hhj	204	0	2023-02-09 13:22:04.298+00	2023-02-09 13:22:04.298+00	1	2023-02-08
314	658	\N	\N	\N	112	\N	travel	cash		313	0	2023-02-15 14:02:47.574412+00	2023-02-15 14:02:47.574412+00	0	2023-02-02
315	658	\N	\N	\N	112	\N	travel	cash		313	0	2023-02-15 14:02:55.113504+00	2023-02-15 14:02:55.113504+00	0	2023-02-02
316	11	\N	\N	\N	256	\N	travel	cash		315	0	2023-02-15 14:04:51.451042+00	2023-02-15 14:04:51.451042+00	0	2023-02-08
317	11	\N	\N	\N	26	\N	petrol	upi		317	0	2023-02-15 14:06:46.70329+00	2023-02-15 14:06:46.70329+00	0	2023-02-02
318	4545	\N	\N	\N	25	\N	travel	cash		318	0	2023-02-15 14:10:02.393515+00	2023-02-15 14:10:02.393515+00	0	2023-02-08
319	4554	\N	\N	\N	25	\N	travel	cash		319	0	2023-02-15 14:10:57.221488+00	2023-02-15 14:10:57.221488+00	0	2023-02-02
320	1212	\N	\N	\N	26	\N	travel	cash		320	0	2023-02-15 14:16:51.942177+00	2023-02-15 14:16:51.942177+00	0	2023-02-10
321	121	\N	\N	\N	256	\N	travel	upi		321	0	2023-02-15 14:17:54.093686+00	2023-02-15 14:17:54.093686+00	0	2023-02-01
322	900000009	\N	\N	\N	25	\N	food	upi	jjj	322	0	2023-02-16 06:35:09.112344+00	2023-02-16 06:35:09.112344+00	0	2023-02-01
323	4000004	\N	\N	\N	9	\N	food	upi		323	0	2023-02-16 06:36:33.477936+00	2023-02-16 06:36:33.477936+00	0	2023-02-01
355	111111	\N	\N	\N	31	\N	travel	cash		324	0	2023-02-16 06:49:03.303049+00	2023-02-16 06:49:03.303049+00	0	2023-02-08
356	111	\N	\N	\N	9	\N	travel	debit		356	0	2023-02-16 06:50:36.274767+00	2023-02-16 06:50:36.274767+00	0	2023-02-09
357	111	\N	\N	\N	7	\N	travel	upi		357	0	2023-02-16 06:52:27.584626+00	2023-02-16 06:52:27.584626+00	0	2023-02-09
358	12121	\N	\N	\N	5	\N	food	upi		358	0	2023-02-16 06:59:37.302475+00	2023-02-16 06:59:37.302475+00	0	2023-02-08
359	02221	\N	\N	\N	10	\N	food	upi		359	0	2023-02-16 07:38:14.948838+00	2023-02-16 07:38:14.948838+00	0	2023-02-08
360	12121	\N	\N	\N	26	\N	travel	upi		360	0	2023-02-16 07:44:49.540719+00	2023-02-16 07:44:49.540719+00	0	2023-02-08
361	200000	\N	\N	\N	30	\N	travel	upi		361	0	2023-02-16 07:55:25.583446+00	2023-02-16 07:55:25.583446+00	0	2023-03-01
362	2000	\N	\N	\N	17	\N	petrol	cash		361	0	2023-02-16 07:56:30.078623+00	2023-02-16 07:56:30.078623+00	0	2023-02-16
363	3000	\N	\N	\N	30	\N	food	debit		363	0	2023-02-16 07:58:18.643873+00	2023-02-16 07:58:18.643873+00	0	2023-02-16
364	4324	\N	\N	\N	115	\N	meterials	cash		364	0	2023-02-16 07:59:43.429908+00	2023-02-16 07:59:43.429908+00	0	2023-02-16
365	421	\N	\N	\N	127	\N	petrol	upi		364	0	2023-02-16 08:03:35.785979+00	2023-02-16 08:03:35.785979+00	0	2023-02-16
366	88776	\N	\N	\N	30	\N	food	debit		365	0	2023-02-16 08:05:25.772206+00	2023-02-16 08:05:25.772206+00	0	2023-02-16
367	500	\N	\N	\N	120	\N	travel	cash		366	0	2023-02-16 08:07:12.52803+00	2023-02-16 08:07:12.52803+00	0	2023-02-16
368	654	\N	\N	\N	120	\N	travel	cash		368	0	2023-02-16 08:10:49.456411+00	2023-02-16 08:10:49.456411+00	0	2023-02-16
369	432	\N	\N	\N	114	\N	petrol	cash		369	0	2023-02-16 08:20:22.622175+00	2023-02-16 08:20:22.622175+00	0	2023-02-16
370	4215	\N	\N	\N	127	\N	petrol	debit		369	0	2023-02-16 08:22:05.15166+00	2023-02-16 08:22:05.15166+00	0	2023-02-16
371	4343	\N	\N	\N	17	\N	travel	upi		371	0	2023-02-16 08:26:43.941744+00	2023-02-16 08:26:43.941744+00	0	2023-02-09
372	454	\N	\N	\N	17	\N	travel	upi		371	0	2023-02-16 08:32:15.454283+00	2023-02-16 08:32:15.454283+00	0	2023-02-08
373	1214	\N	\N	\N	17	\N	travel	upi		372	0	2023-02-16 08:33:55.672609+00	2023-02-16 08:33:55.672609+00	0	2023-02-08
374	8787	\N	\N	\N	17	\N	travel	upi		373	0	2023-02-16 08:35:17.328011+00	2023-02-16 08:35:17.328011+00	0	2023-02-10
375	8787	\N	\N	\N	17	\N	travel	upi		373	0	2023-02-16 08:35:27.498754+00	2023-02-16 08:35:27.498754+00	0	2023-02-10
376	9898	\N	\N	\N	5	\N	travel	upi		374	0	2023-02-16 08:36:34.683632+00	2023-02-16 08:36:34.683632+00	0	2023-02-02
377	7676	\N	\N	\N	7	\N	petrol	cash		377	0	2023-02-16 08:37:22.394838+00	2023-02-16 08:37:22.394838+00	0	2023-02-02
378	7676	\N	\N	\N	7	\N	petrol	cash		377	0	2023-02-16 08:37:33.432541+00	2023-02-16 08:37:33.432541+00	0	2023-02-02
379	4343	\N	\N	\N	7	\N	travel	upi		377	0	2023-02-16 08:39:34.415916+00	2023-02-16 08:39:34.415916+00	0	2023-02-01
380	22	\N	\N	\N	30	\N	travel	upi		380	0	2023-02-16 08:41:07.509973+00	2023-02-16 08:41:07.509973+00	0	2023-02-02
381	99999999	\N	\N	\N	5	\N	travel	upi		381	0	2023-02-16 08:47:02.410344+00	2023-02-16 08:47:02.410344+00	0	2023-02-17
382	3444	\N	\N	\N	17	\N	petrol	upi		382	0	2023-02-16 08:48:19.981212+00	2023-02-16 08:48:19.981212+00	0	2023-02-08
383	335	\N	\N	\N	191	\N	travel	debit		383	0	2023-02-16 08:53:37.102269+00	2023-02-16 08:53:37.102269+00	0	2023-02-08
384	99988899	\N	\N	\N	26	\N	travel	debit		384	0	2023-02-16 09:21:15.567365+00	2023-02-16 09:21:15.567365+00	0	2023-02-02
385	555	\N	\N	\N	9	\N	food	upi		385	0	2023-02-16 09:22:43.15671+00	2023-02-16 09:22:43.15671+00	0	2023-02-09
386	8898989	\N	\N	\N	235	\N	travel	upi		386	0	2023-02-16 09:23:55.829885+00	2023-02-16 09:23:55.829885+00	0	2023-02-02
387	590	\N	\N	\N	282	\N	travel	cash	yyyy	387	0	2023-02-16 09:34:35.087172+00	2023-02-16 09:34:35.087172+00	0	2023-02-14
388	444	\N	\N	\N	7	\N	travel	cash		388	0	2023-02-16 09:50:31.735754+00	2023-02-16 09:50:31.735754+00	0	2023-02-08
389	4455	\N	\N	\N	6	\N	travel	upi		389	0	2023-02-16 09:51:10.470782+00	2023-02-16 09:51:10.470782+00	0	2023-02-02
390	2345	\N	\N	\N	7	\N	travel	upi	566	390	0	2023-02-16 10:20:19.978021+00	2023-02-16 10:20:19.978021+00	0	2023-02-10
391	255	\N	\N	\N	7	\N	petrol	cash	dxs	391	0	2023-02-16 13:46:09.89893+00	2023-02-16 13:46:09.89893+00	0	2023-02-16
392	5656	\N	\N	\N	15	\N	petrol	upi	dfdf	392	0	2023-02-16 13:59:44.343707+00	2023-02-16 13:59:44.343707+00	0	2023-02-08
393	5656	\N	\N	\N	15	\N	petrol	upi	dfdf	392	0	2023-02-16 13:59:44.350288+00	2023-02-16 13:59:44.350288+00	0	2023-02-08
394	3333	\N	\N	\N	31	\N	food	upi		394	0	2023-02-16 14:53:15.27285+00	2023-02-16 14:53:15.27285+00	0	2023-02-08
395	54	\N	\N	\N	8	\N	travel	cash		395	0	2023-02-16 14:59:11.731758+00	2023-02-16 14:59:11.731758+00	0	2023-02-02
396	34	\N	\N	\N	15	\N	meterials	upi	gg	396	0	2023-02-17 13:28:43.690806+00	2023-02-17 13:28:43.690806+00	0	2023-02-01
397	34	\N	\N	\N	15	\N	meterials	upi	gg	396	0	2023-02-17 13:28:43.691295+00	2023-02-17 13:28:43.691295+00	0	2023-02-01
398	546	\N	\N	\N	5	\N	petrol	upi	sd	398	0	2023-02-18 12:52:56.445199+00	2023-02-18 12:52:56.445199+00	0	2023-02-03
148	43544	\N	\N	\N	1	\N	petrol	cash	fdg	148	1	2023-01-31 14:01:33.567793+00	2023-01-31 14:01:33.567793+00	0	2023-01-18
417	999999999	\N	\N	\N	1	\N	travel	upi		417	0	2023-02-23 05:53:36.495413+00	2023-02-23 05:53:36.495413+00	0	2023-02-08
173	999	\N	\N	\N	1	\N	meterials	debit	pss	173	1	2023-02-09 07:44:42.099723+00	2023-02-09 07:44:42.099723+00	0	2023-02-08
399	100	\N	\N	\N	17	\N	petrol	cash	czxczd	399	0	2023-02-21 06:20:34.333673+00	2023-02-21 06:20:34.333673+00	0	2023-02-08
400	100	\N	\N	\N	17	\N	petrol	cash	czxczd	399	0	2023-02-21 06:20:34.334231+00	2023-02-21 06:20:34.334231+00	0	2023-02-08
401	1000	\N	\N	\N	15	\N	petrol	cash	ty	401	0	2023-02-21 06:31:27.667955+00	2023-02-21 06:31:27.667955+00	0	2023-02-10
402	1000	\N	\N	\N	15	\N	petrol	cash	ty	401	0	2023-02-21 06:31:27.666549+00	2023-02-21 06:31:27.666549+00	0	2023-02-10
403	25000	\N	\N	\N	286	\N	petrol	upi	Ann pvt ltd expense pending	403	0	2023-02-21 07:45:08.605436+00	2023-02-21 07:45:08.605436+00	0	2023-02-21
404	345	\N	\N	\N	5	\N	petrol	cash	67	404	0	2023-02-21 14:01:36.422978+00	2023-02-21 14:01:36.422978+00	0	2023-02-08
405	999999	\N	\N	\N	235	\N	petrol	cash	new	405	0	2023-02-22 11:17:12.678126+00	2023-02-22 11:17:12.678126+00	0	2023-02-14
406	99999	\N	\N	\N	9	\N	petrol	cash		406	0	2023-02-22 11:26:08.139491+00	2023-02-22 11:26:08.139491+00	0	2023-02-08
407	344	\N	\N	\N	264	\N	food	upi	ee	407	0	2023-02-22 11:29:13.288036+00	2023-02-22 11:29:13.288036+00	0	2023-02-08
408	344	\N	\N	\N	264	\N	food	upi	ee	407	0	2023-02-22 11:29:13.295341+00	2023-02-22 11:29:13.295341+00	0	2023-02-08
409	5599	\N	\N	\N	25	\N	travel	cash		409	0	2023-02-22 11:32:22.576675+00	2023-02-22 11:32:22.576675+00	0	2023-02-08
410	5599	\N	\N	\N	25	\N	travel	cash		409	0	2023-02-22 11:32:22.576329+00	2023-02-22 11:32:22.576329+00	0	2023-02-08
411	111	\N	\N	\N	9	\N	travel	upi		411	0	2023-02-22 11:33:36.702598+00	2023-02-22 11:33:36.702598+00	0	2023-02-15
412	111	\N	\N	\N	9	\N	travel	upi		411	0	2023-02-22 11:33:36.706627+00	2023-02-22 11:33:36.706627+00	0	2023-02-15
413	5555	\N	\N	\N	7	\N	petrol	cash	j	413	0	2023-02-22 11:39:26.543681+00	2023-02-22 11:39:26.543681+00	0	2023-02-07
414	3333	\N	\N	\N	114	\N	food	upi		414	0	2023-02-22 13:30:22.098293+00	2023-02-22 13:30:22.098293+00	0	2023-02-15
415	1000	\N	\N	\N	286	\N	food	upi		415	0	2023-02-22 15:38:03.104722+00	2023-02-22 15:38:03.104722+00	0	2023-02-25
416	56563	\N	\N	\N	267	\N	food	upi		416	1	2023-02-23 05:16:23.990171+00	2023-02-23 05:16:23.990171+00	0	2023-02-23
418	555555555	\N	\N	\N	17	\N	travel	upi		418	0	2023-02-23 05:57:45.302452+00	2023-02-23 05:57:45.302452+00	0	2023-02-14
419	78896	\N	\N	\N	286	\N	meterials	upi		419	1	2023-02-23 06:08:55.420543+00	2023-02-23 06:08:55.420543+00	0	2023-02-23
191	7687	\N	\N	\N	128	\N	food	debit	gj	191	0	2023-02-09 11:35:57.714891+00	2023-02-09 11:35:57.714891+00	1	2023-02-08
208	36696	\N	\N	\N	282	\N	food	cash	NA	208	0	2023-02-09 13:36:47.900555+00	2023-02-09 13:36:47.900555+00	1	2023-01-20
420	23456	\N	\N	\N	15	\N	petrol	upi	yuuu	420	0	2023-02-23 12:03:59.769059+00	2023-02-23 12:03:59.769059+00	0	2023-02-08
421	12458	\N	\N	\N	267	\N	travel	upi		421	1	2023-02-23 14:19:49.828629+00	2023-02-23 14:19:49.828629+00	0	2023-02-23
422	3000	\N	\N	\N	69	\N	petrol	debit	zxcDVCS	422	0	2023-02-23 14:44:35.082286+00	2023-02-23 14:44:35.082286+00	0	2023-02-15
\.


--
-- Data for Name: stock; Type: TABLE DATA; Schema: public; Owner: powerta
--

COPY public.stock (stock_id, sales_price, unit, opening_stock, as_of_date, low_stock, purchase_price, hsn_code, item_code, item_description, created_at, updated_at, discount, sku, manufacturer, brand, bach_no, expiry, high_stock, current_stock, quantity, barcode, stock_f_id) FROM stdin;
86	500	pair	4	\N	3	450	123	qwe1234	shoe	2023-02-21 08:55:56.217844+00	2023-02-21 08:55:56.217844+00	\N	\N		puma	12345		100	50	\N	\N	163
87	1500	pair	2	\N	1	1200	1224	ac123	casual shoe	2023-02-21 08:55:56.217844+00	2023-02-21 08:55:56.217844+00	\N	\N		nike	12142		25	25	\N	\N	163
88	3000	pair	1	\N	1	1800	1412	ad121	executive	2023-02-21 08:55:56.217844+00	2023-02-21 08:55:56.217844+00	\N	\N		crocks	1512		70	25	\N	\N	163
89	1500	pcs	1	\N	3	1000	1213	101	blue	2023-02-21 09:02:10.301804+00	2023-02-21 09:02:10.301804+00	\N	\N			12		10	5	\N	\N	164
90	2500	pcs	2	\N	1	2000	1213	102	black	2023-02-21 09:02:10.301804+00	2023-02-21 09:02:10.301804+00	\N	\N			13		25	5	\N	\N	164
91	3000	pcs	1	\N	1	2500	1213	103	white	2023-02-21 09:02:10.301804+00	2023-02-21 09:02:10.301804+00	\N	\N			14		20	5	\N	\N	164
92	150	pcs	1	\N	3	75	1213	101	steel	2023-02-21 09:06:02.744845+00	2023-02-21 09:06:02.744845+00	\N	\N			12		10	5	\N	\N	165
93	250	pcs	2	\N	1	200	1213	102	iron	2023-02-21 09:06:02.744845+00	2023-02-21 09:06:02.744845+00	\N	\N			13		25	5	\N	\N	165
94	300	pcs	1	\N	1	250	1213	103	iron	2023-02-21 09:06:02.744845+00	2023-02-21 09:06:02.744845+00	\N	\N			14		20	5	\N	\N	165
95	15000	pcs	1	\N	3	14000	12210	9798	s22	2023-02-21 09:19:34.761046+00	2023-02-21 09:19:34.761046+00	\N	\N		samsung	12432		6	5	\N	\N	166
96	25000	pcs	5	\N	3	24000	12211	9799	5A	2023-02-21 09:19:34.761046+00	2023-02-21 09:19:34.761046+00	\N	\N		Redmi	13543		8	5	\N	\N	166
97	60000	pcs	3	\N	2	59999	12212	65757	11pro	2023-02-21 09:19:34.761046+00	2023-02-21 09:19:34.761046+00	\N	\N		apple	146765		7	5	\N	\N	166
98	265	kilogram	100			222	AMB1213	c11		2023-02-21 11:23:13.950388+00	2023-02-21 11:23:13.950388+00	10	\N	Ambuja	Ambuja	012			500		\N	168
99			34		3					2023-02-23 07:14:59.908202+00	2023-02-23 07:14:59.908202+00		\N					4	23		\N	170
100	35000	pcs	0	2023-02-23	2	25000		1522		2023-02-23 07:51:55.647011+00	2023-02-23 07:51:55.647011+00	1000	\N		toshiba	ad15278	2025-10-23	20	15		\N	171
101	45000					35200		1251		2023-02-23 07:51:55.647011+00	2023-02-23 07:51:55.647011+00	300	\N		dell	as1452	2026-10-23		15		\N	171
102	30000	pcs				15000				2023-02-23 07:51:55.647011+00	2023-02-23 07:51:55.647011+00		\N		hp	124555	2026-06-24		12		\N	171
\.


--
-- Data for Name: stock_collection; Type: TABLE DATA; Schema: public; Owner: powerta
--

COPY public.stock_collection (product, tax_per, category, stock_typ, product_id, created_at, created_by) FROM stdin;
blanket	12	cloth	product	164	2023-02-21 08:14:47.30504+00	\N
screw	5	building_meterials	product	165	2023-02-21 08:14:47.30504+00	\N
phone	12	electronics	product	166	2023-02-21 08:14:47.30504+00	\N
Hammer	12		product	167	2023-02-21 09:58:58.596897+00	100325695
Cement	5		product	168	2023-02-21 11:23:13.623889+00	100130881
	0		undefined	169	2023-02-21 11:23:16.10188+00	100649181
shoe	5	footwear	product	163	2023-02-21 08:14:47.30504+00	100184557
shoe	0	jwellery	product	170	2023-02-23 07:14:59.341525+00	100184557
laptop	18	gadget	product	171	2023-02-23 07:51:55.013255+00	100528141
\.


--
-- Data for Name: update; Type: TABLE DATA; Schema: public; Owner: powerta
--

COPY public.update (upid, topicname, created_at) FROM stdin;
3585	/SELECT/personid,vendor_name/FROM/vendor/;	2023-02-25 18:10:59+00
3600	/SELECT/vendor-BLUBLUBLU-vendor_name,purchase_order-BLUBLUBLU-order_id,purchase_order-BLUBLUBLU-po_date,purchase_order-BLUBLUBLU-due_date,purchase_order-BLUBLUBLU-total_amount,purchase_order-BLUBLUBLU-payment_method,purchase_order-BLUBLUBLU-status/from/purchase_order/left/join//vendor/on/vendor-BLUBLUBLU-PersonID/=/purchase_order-BLUBLUBLU-vendor_f_id;	2023-02-23 10:02:42.723677+00
3581	/SELECT/site-BLUBLUBLU-site_name,site-BLUBLUBLU-site_id,site-BLUBLUBLU-owner_name,employee-BLUBLUBLU-designation,site_expense-BLUBLUBLU-expense_amount,site_expense-BLUBLUBLU-previous_advance,site_expense-BLUBLUBLU-advance_required,to_char(site_expense-BLUBLUBLU-exp_dat,§DD-MM-YYYY§)/as/exp_dat/FROM/site_expense/LEFT/JOIN/site/ON/site-BLUBLUBLU-site_id=site_expense-BLUBLUBLU-site_f_key/LEFT/JOIN/employee/ON/employee-BLUBLUBLU-empid=site_expense-BLUBLUBLU-employee_f_key/WHERE/site_expense-BLUBLUBLU-user_perm/=/§1§/AND/site_expense-BLUBLUBLU-is_deleted=/§0§ORDER/BY/site_expense-BLUBLUBLU-site_exp_id/;	2023-02-25 11:18:14+00
3595	/SELECT/category/FROM/stock	2023-02-23 08:05:44.597994+00
3596	/SELECT/stock_name,category/FROM/stock	2023-02-23 08:05:44.608347+00
3599	/select/stock_collection-BLUBLUBLU-product_id,stock_collection-BLUBLUBLU-product,stock_collection-BLUBLUBLU-category,stock-BLUBLUBLU-item_description,stock-BLUBLUBLU-purchase_price,stock-BLUBLUBLU-sales_price,stock-BLUBLUBLU-brand,stock-BLUBLUBLU-expiry/FROM/stock_collection/left/join/stock/on/stock_collection-BLUBLUBLU-product_id=stock-BLUBLUBLU-stock_f_id/;	2023-02-24 11:13:44+00
3603	/SELECT/site-BLUBLUBLU-site_name/FROM/site;	2023-02-24 09:29:46+00
3584	/SELECT/site-BLUBLUBLU-site_name,site-BLUBLUBLU-site_id,labour-BLUBLUBLU-labour_name,labour-BLUBLUBLU-designation,labour_account-BLUBLUBLU-wage,labour_account-BLUBLUBLU-ot_wage,labour_account-BLUBLUBLU-no_of_days,labour_account-BLUBLUBLU-ot_hour,labour_account-BLUBLUBLU-ta_da,labour_account-BLUBLUBLU-advance,labour_account-BLUBLUBLU-labour_account_id,to_char(labour_account-BLUBLUBLU-lab_dat,§DD-MM-YYYY§)/as/lab_dat/FROM/labour_account/LEFT/JOIN/labour/ON/labour-BLUBLUBLU-labour_id/=/labour_account-BLUBLUBLU-labour_f_key/LEFT/JOIN/site/ON/site-BLUBLUBLU-site_id/=/labour_account-BLUBLUBLU-site_f_key/WHERE/labour_account-BLUBLUBLU-user_perm/=/§0§/AND/labour_account-BLUBLUBLU-is_deleted=/§0§ORDER/BY/labour_account-BLUBLUBLU-labour_account_id	2023-02-23 15:23:44+00
3605	/SELECT/site-BLUBLUBLU-site_name/FROM/site;	2023-02-24 09:29:46+00
3608	/SELECT/site-BLUBLUBLU-site_name/FROM/site;	2023-02-24 09:29:46+00
3606	/SELECT/site-BLUBLUBLU-site_name,site-BLUBLUBLU-site_id,site-BLUBLUBLU-owner_name,employee-BLUBLUBLU-designation,site_expense-BLUBLUBLU-expense_amount,site_expense-BLUBLUBLU-previous_advance,site_expense-BLUBLUBLU-advance_required,to_char(site_expense-BLUBLUBLU-exp_dat,§DD-MM-YYYY§)/as/exp_dat/FROM/site_expense/LEFT/JOIN/site/ON/site-BLUBLUBLU-site_id=site_expense-BLUBLUBLU-site_f_key/LEFT/JOIN/employee/ON/employee-BLUBLUBLU-empid=site_expense-BLUBLUBLU-employee_f_key/WHERE/site_expense-BLUBLUBLU-user_perm/=/§1§/AND/site_expense-BLUBLUBLU-is_deleted=/§0§ORDER/BY/site_expense-BLUBLUBLU-site_exp_id;	2023-02-24 09:29:46+00
3583	/	2023-02-24 12:07:45+00
3604	/SELECT/site-BLUBLUBLU-site_name,site-BLUBLUBLU-site_id,labour-BLUBLUBLU-labour_name,labour-BLUBLUBLU-designation,labour_account-BLUBLUBLU-wage,labour_account-BLUBLUBLU-ot_wage,labour_account-BLUBLUBLU-no_of_days,labour_account-BLUBLUBLU-ot_hour,labour_account-BLUBLUBLU-ta_da,labour_account-BLUBLUBLU-advance,to_char(labour_account-BLUBLUBLU-lab_dat,§DD-MM-YYYY§)/as/lab_dat//FROM/labour_account/LEFT/JOIN/labour/ON/labour-BLUBLUBLU-labour_id/=/labour_account-BLUBLUBLU-labour_f_key/LEFT/JOIN/site/ON/site-BLUBLUBLU-site_id/=/labour_account-BLUBLUBLU-site_f_key/WHERE/labour_account-BLUBLUBLU-user_perm/=/§1§/AND/labour_account-BLUBLUBLU-is_deleted=/§0§ORDER/BY/labour_account-BLUBLUBLU-labour_account_id	2023-02-23 15:23:44+00
3626	/SELECT/stock_id,stock_name/FROM/stock/;	2023-02-25 11:19:45+00
3630	/select/opening_balance,name,ifc_code,upid,bank,acc_holder_name,amount,as_of_date/FROM/accountings;	2023-02-25 11:52:55+00
3631	/select/opening_balance,name,ifc_code,upid,bank,acc_holder_name,amount,to_char(as_of_date,§DD-MM-YYYY§)/as/as_of_date//FROM/accountings;	2023-02-24 12:42:10.088482+00
3620	/SELECT/stock-BLUBLUBLU-stock_id,stock_collection-BLUBLUBLU-product,stock-BLUBLUBLU-sales_price,stock-BLUBLUBLU-discount,stock-BLUBLUBLU-bach_no,stock-BLUBLUBLU-expiry,stock-BLUBLUBLU-unit,stock-BLUBLUBLU-item_description,stock_collection-BLUBLUBLU-tax_per/FROM/stock_collection/LEFT/JOIN/stock/ON/stock_collection-BLUBLUBLU-product_id/=/stock-BLUBLUBLU-stock_f_id	2023-02-25 11:09:29+00
3607	/SELECT/site-BLUBLUBLU-site_name,site-BLUBLUBLU-site_id,site-BLUBLUBLU-owner_name,employee-BLUBLUBLU-designation,site_expense-BLUBLUBLU-expense_amount,site_expense-BLUBLUBLU-previous_advance,site_expense-BLUBLUBLU-advance_required,site_expense-BLUBLUBLU-site_exp_id,to_char(site_expense-BLUBLUBLU-exp_dat,§DD-MM-YYYY§)/as/exp_dat/FROM/site_expense/LEFT/JOIN/site/ON/site-BLUBLUBLU-site_id=site_expense-BLUBLUBLU-site_f_key/LEFT/JOIN/employee/ON/employee-BLUBLUBLU-empid=site_expense-BLUBLUBLU-employee_f_key/WHERE/site_expense-BLUBLUBLU-user_perm/=/§0§/AND/site_expense-BLUBLUBLU-is_deleted=/§0§ORDER/BY/site_expense-BLUBLUBLU-site_exp_id	2023-02-24 09:29:46+00
3598	/select/stock_collection-BLUBLUBLU-product_id,stock_collection-BLUBLUBLU-product,stock_collection-BLUBLUBLU-category,stock-BLUBLUBLU-item_desription,stock-BLUBLUBLU-purchase_price,stock-BLUBLUBLU-sales_price,stock-BLUBLUBLU-brand,stock-BLUBLUBLU-expiry/FROM/stock_collection/left/join/stock/on/stock_collection-BLUBLUBLU-product_id=stock-BLUBLUBLU-stock_f_id/;	2023-02-23 08:28:01+00
3621	/SELECT/order_id/FROM/purchase_order	2023-02-25 11:09:29+00
3594	/	2023-02-24 12:07:45+00
3592	/SELECT/category/FROM/stock	2023-02-23 08:04:49.723416+00
3616	/select/stock_collection-BLUBLUBLU-product_id,stock_collection-BLUBLUBLU-product,stock_collection-BLUBLUBLU-category,stock-BLUBLUBLU-purchase_price,stock-BLUBLUBLU-sales_price,stock-BLUBLUBLU-discount,stock-BLUBLUBLU-expiry/FROM/stock_collection/left/join/stock/on/stock_collection-BLUBLUBLU-product_id=stock-BLUBLUBLU-stock_f_id/;	2023-02-23 14:14:07.232559+00
3593	/SELECT/stock_name,category/FROM/stock	2023-02-23 08:04:49.730662+00
3610	/SELECT/labour_id,labour_name/FROM/labour	2023-02-23 15:25:09+00
3580	/SELECT/site-BLUBLUBLU-site_name/FROM/site/;	2023-05-23 11:18:59+00
3597	/SELECT/emp_name,designation,phone_no,email_id/FROM/employee	2023-05-23 13:11:18+00
3618	/SELECT/vendor-BLUBLUBLU-vendor_name,purchase_order-BLUBLUBLU-order_id,purchase_order-BLUBLUBLU-po_date,purchase_order-BLUBLUBLU-due_date,purchase_order-BLUBLUBLU-total_amount,purchase_order-BLUBLUBLU-payment_method,purchase_order-BLUBLUBLU-status/from/vendor/left/join//purchase_order/on/vendor-BLUBLUBLU-PersonID/=/purchase_order-BLUBLUBLU-vendor_f_id;	2023-02-23 14:18:25.714139+00
3619	/SELECT/personid,vendor_name/FROM/vendor;	2023-02-23 14:18:31.365433+00
3609	/SELECT/site-BLUBLUBLU-site_name,site-BLUBLUBLU-site_id,site-BLUBLUBLU-owner_name,employee-BLUBLUBLU-designation,site_expense-BLUBLUBLU-expense_amount,site_expense-BLUBLUBLU-previous_advance,site_expense-BLUBLUBLU-advance_required,to_char(site_expense-BLUBLUBLU-exp_dat,§DD-MM-YYYY§)/as/exp_dat/FROM/site_expense/LEFT/JOIN/site/ON/site-BLUBLUBLU-site_id=site_expense-BLUBLUBLU-site_f_key/LEFT/JOIN/employee/ON/employee-BLUBLUBLU-empid=site_expense-BLUBLUBLU-employee_f_key/WHERE/site_expense-BLUBLUBLU-user_perm/=/§1§/AND/site_expense-BLUBLUBLU-is_deleted=/§0§ORDER/BY/site_expense-BLUBLUBLU-site_exp_id;	2023-02-24 09:29:46+00
3622	/SELECT/labour_id,labour_name/FROM/labour	2023-02-23 15:25:09+00
3611	/SELECT/site_id,site_name/FROM/site	2023-02-23 15:25:09+00
3612	/SELECT/site_id,site_name/FROM/site/	2023-02-24 11:07:28+00
3614	/SELECT/site_id,site_name/FROM/site/	2023-02-24 11:07:28+00
3613	/SELECT/site_exp_id/FROM/site_expense/ORDER/BY/site_exp_id/desc/limit/1	2023-02-24 11:07:28+00
3623	/SELECT/category/FROM/stock_collection	2023-02-24 11:13:44+00
3615	/SELECT/category/FROM/stock_collection	2023-02-24 11:13:44+00
3617	/SELECT/product_id,category/FROM/stock_collection	2023-02-25 06:03:46+00
3601	/select/stock_collection-BLUBLUBLU-product_id,stock_collection-BLUBLUBLU-product,stock_collection-BLUBLUBLU-category,stock-BLUBLUBLU-purchase_price,stock-BLUBLUBLU-sales_price,stock-BLUBLUBLU-discount,stock-BLUBLUBLU-expiry,stock-BLUBLUBLU-bach_no/FROM/stock_collection/left/join/stock/on/stock_collection-BLUBLUBLU-product_id=stock-BLUBLUBLU-stock_f_id/;	2023-02-26 22:39:09+00
3588	/SELECT/vendor-BLUBLUBLU-vendor_name,purchase_order-BLUBLUBLU-order_id,purchase_order-BLUBLUBLU-po_date,purchase_order-BLUBLUBLU-due_date,purchase_order-BLUBLUBLU-total_amount,purchase_order-BLUBLUBLU-payment_method,purchase_order-BLUBLUBLU-status/from/vendor/left/join//purchase_order/on/vendor-BLUBLUBLU-PersonID/=/purchase_order-BLUBLUBLU-vendor_f_id/;	2023-02-25 18:10:55+00
3587	/SELECT/id/FROM/quotation	2023-02-25 18:10:59+00
3627	/select/name,opening_balance,acc_no,ifc_code,upid,bank,acc_holder_name,amount,as_of_date/;	2023-02-24 12:20:50.628403+00
3628	/select/name,opening_balance,acc_no,ifc_code,upid,bank,acc_holder_name,amount,as_of_date/FROM/accountings;	2023-02-24 12:23:52+00
3629	/select/opening_balance,name,acc_no,ifc_code,upid,bank,acc_holder_name,amount,as_of_date/FROM/accountings;	2023-02-24 12:34:44.320386+00
3624	/SELECT/site-BLUBLUBLU-site_name,site-BLUBLUBLU-site_id,labour-BLUBLUBLU-labour_name,labour-BLUBLUBLU-designation,labour_account-BLUBLUBLU-wage,labour_account-BLUBLUBLU-ot_wage,labour_account-BLUBLUBLU-no_of_days,labour_account-BLUBLUBLU-ot_hour,labour_account-BLUBLUBLU-ta_da,labour_account-BLUBLUBLU-advance,to_char(labour_account-BLUBLUBLU-lab_dat,§DD-MM-YYYY§)/as/lab_dat//FROM/labour_account/LEFT/JOIN/labour/ON/labour-BLUBLUBLU-labour_id/=/labour_account-BLUBLUBLU-labour_f_key/LEFT/JOIN/site/ON/site-BLUBLUBLU-site_id/=/labour_account-BLUBLUBLU-site_f_key/WHERE/labour_account-BLUBLUBLU-user_perm/=/§1§/AND/labour_account-BLUBLUBLU-is_deleted=/§0§ORDER/BY/labour_account-BLUBLUBLU-labour_account_id/;	2023-02-25 10:03:23+00
3625	/SELECT/site-BLUBLUBLU-site_name,site-BLUBLUBLU-site_id,labour-BLUBLUBLU-labour_name,labour-BLUBLUBLU-designation,labour_account-BLUBLUBLU-wage,labour_account-BLUBLUBLU-ot_wage,labour_account-BLUBLUBLU-no_of_days,labour_account-BLUBLUBLU-ot_hour,labour_account-BLUBLUBLU-ta_da,labour_account-BLUBLUBLU-advance,labour_account-BLUBLUBLU-labour_account_id,to_char(labour_account-BLUBLUBLU-lab_dat,§DD-MM-YYYY§)/as/lab_dat/FROM/labour_account/LEFT/JOIN/labour/ON/labour-BLUBLUBLU-labour_id/=/labour_account-BLUBLUBLU-labour_f_key/LEFT/JOIN/site/ON/site-BLUBLUBLU-site_id/=/labour_account-BLUBLUBLU-site_f_key/WHERE/labour_account-BLUBLUBLU-user_perm/=/§0§/AND/labour_account-BLUBLUBLU-is_deleted=/§0§ORDER/BY/labour_account-BLUBLUBLU-labour_account_id/;	2023-02-25 10:03:23+00
3589	/SELECT/personid,vendor_name/FROM/vendor/;	2023-02-25 18:10:59+00
3591	/SELECT/personid,vendor_name/FROM/vendor/;	2023-02-25 18:10:59+00
3586	/SELECT/stc-BLUBLUBLU-product_id,stc-BLUBLUBLU-product,st-BLUBLUBLU-bach_no,st-BLUBLUBLU-item_description,st-BLUBLUBLU-hsn_code,st-BLUBLUBLU-unit,st-BLUBLUBLU-sales_price,st-BLUBLUBLU-discount,stc-BLUBLUBLU-tax_per,st-BLUBLUBLU-expiry/FROM/stock/AS/st/LEFT/JOIN/stock_collection/AS/stc/ON/stc-BLUBLUBLU-product_id=st-BLUBLUBLU-stock_f_id	2023-02-25 18:10:59+00
3590	/SELECT/stc-BLUBLUBLU-product_id,stc-BLUBLUBLU-product,st-BLUBLUBLU-bach_no,st-BLUBLUBLU-item_description,st-BLUBLUBLU-hsn_code,st-BLUBLUBLU-unit,st-BLUBLUBLU-sales_price,st-BLUBLUBLU-discount,stc-BLUBLUBLU-tax_per,st-BLUBLUBLU-expiry/FROM/stock/AS/st/LEFT/JOIN/stock_collection/AS/stc/ON/stc-BLUBLUBLU-product_id=st-BLUBLUBLU-stock_f_id	2023-02-25 18:10:59+00
3602	/select/stock_collection-BLUBLUBLU-product_id,stock_collection-BLUBLUBLU-product,stock_collection-BLUBLUBLU-category,stock-BLUBLUBLU-purchase_price,stock-BLUBLUBLU-sales_price,stock-BLUBLUBLU-discount,stock-BLUBLUBLU-expiry,stock-BLUBLUBLU-bach_no/FROM/stock_collection/left/join/stock/on/stock_collection-BLUBLUBLU-product_id=stock-BLUBLUBLU-stock_f_id/;	2023-02-26 22:39:09+00
3632	/SELECT/vendor-BLUBLUBLU-vendor_name,purchase_order-BLUBLUBLU-order_id,purchase_order-BLUBLUBLU-po_date,purchase_order-BLUBLUBLU-due_date,purchase_order-BLUBLUBLU-total_amount,purchase_order-BLUBLUBLU-payment_method,purchase_order-BLUBLUBLU-status/from/purchase_order/left/join//vendor/on/vendor-BLUBLUBLU-PersonID/=/purchase_order-BLUBLUBLU-vendor_f_id/;	2023-02-25 11:19:40+00
3634	/SELECT/po-BLUBLUBLU-prty_id,vendor-BLUBLUBLU-vendor_name,po-BLUBLUBLU-amount,to_char(po-BLUBLUBLU-pay_dte,§DD-MM-YYYY§)/as/pay_dte/from/payment_out/as/po/LEFT/JOIN/vendor/ON/po-BLUBLUBLU-vendor_f_key/=/vendor-BLUBLUBLU-personid/;	2023-05-23 11:14:14.402076+00
3635	/SELECT/purchase_bill-BLUBLUBLU-bill_id,vendor-BLUBLUBLU-vendor_name,purchase_bill-BLUBLUBLU-bill_pay_method,purchase_bill-BLUBLUBLU-total_amnt/FROM/purchase_bill/left/join/vendor/on/vendor-BLUBLUBLU-PersonID/=/purchase_bill-BLUBLUBLU-vendor_f_id/WHERE/purchase_bill-BLUBLUBLU-is_deleted/=/§0§/;	2023-05-23 11:16:28.567953+00
3636	/SELECT/site-BLUBLUBLU-site_name,site-BLUBLUBLU-site_id,labour-BLUBLUBLU-labour_name,labour-BLUBLUBLU-designation,labour_account-BLUBLUBLU-wage,labour_account-BLUBLUBLU-ot_wage,labour_account-BLUBLUBLU-no_of_days,labour_account-BLUBLUBLU-ot_hour,labour_account-BLUBLUBLU-ta_da,labour_account-BLUBLUBLU-advance,to_char(labour_account-BLUBLUBLU-lab_dat,§DD-MM-YYYY§)/as/lab_dat,labour_account-BLUBLUBLU-labour_account_id//FROM/labour_account/LEFT/JOIN/labour/ON/labour-BLUBLUBLU-labour_id/=/labour_account-BLUBLUBLU-labour_f_key/LEFT/JOIN/site/ON/site-BLUBLUBLU-site_id/=/labour_account-BLUBLUBLU-site_f_key/WHERE/labour_account-BLUBLUBLU-user_perm/=/§1§/AND/labour_account-BLUBLUBLU-is_deleted=/§0§ORDER/BY/labour_account-BLUBLUBLU-labour_account_id/;	2023-05-23 11:18:27.475581+00
3637	/SELECT/site-BLUBLUBLU-site_name,site-BLUBLUBLU-site_id,labour-BLUBLUBLU-labour_name,labour-BLUBLUBLU-designation,labour_account-BLUBLUBLU-wage,labour_account-BLUBLUBLU-ot_wage,labour_account-BLUBLUBLU-no_of_days,labour_account-BLUBLUBLU-ot_hour,labour_account-BLUBLUBLU-ta_da,labour_account-BLUBLUBLU-advance,labour_account-BLUBLUBLU-labour_account_id,to_char(labour_account-BLUBLUBLU-lab_dat,§DD-MM-YYYY§)/as/lab_dat/FROM/labour_account/LEFT/JOIN/labour/ON/labour-BLUBLUBLU-labour_id/=/labour_account-BLUBLUBLU-labour_f_key/LEFT/JOIN/site/ON/site-BLUBLUBLU-site_id/=/labour_account-BLUBLUBLU-site_f_key/WHERE/labour_account-BLUBLUBLU-user_perm/=/§0§/AND/labour_account-BLUBLUBLU-is_deleted=/§0§/ORDER/BY/labour_account-BLUBLUBLU-labour_account_id/;	2023-05-23 11:18:27.501088+00
3633	/SELECT/site-BLUBLUBLU-site_name,site-BLUBLUBLU-site_id,site-BLUBLUBLU-owner_name,employee-BLUBLUBLU-designation,site_expense-BLUBLUBLU-expense_amount,site_expense-BLUBLUBLU-previous_advance,site_expense-BLUBLUBLU-advance_required,to_char(site_expense-BLUBLUBLU-exp_dat,§DD-MM-YYYY§)/as/exp_dat,exp_no/FROM/site_expense/LEFT/JOIN/site/ON/site-BLUBLUBLU-site_id=site_expense-BLUBLUBLU-site_f_key/LEFT/JOIN/employee/ON/employee-BLUBLUBLU-empid=site_expense-BLUBLUBLU-employee_f_key/WHERE/site_expense-BLUBLUBLU-user_perm/=/§1§/AND/site_expense-BLUBLUBLU-is_deleted=/§0§ORDER/BY/site_expense-BLUBLUBLU-site_exp_id/;	2023-05-23 11:18:59+00
3582	/SELECT/site-BLUBLUBLU-site_name,site-BLUBLUBLU-site_id,site-BLUBLUBLU-owner_name,employee-BLUBLUBLU-designation,site_expense-BLUBLUBLU-expense_amount,site_expense-BLUBLUBLU-previous_advance,site_expense-BLUBLUBLU-advance_required,site_expense-BLUBLUBLU-site_exp_id,to_char(site_expense-BLUBLUBLU-exp_dat,§DD-MM-YYYY§)/as/exp_dat/FROM/site_expense/LEFT/JOIN/site/ON/site-BLUBLUBLU-site_id=site_expense-BLUBLUBLU-site_f_key/LEFT/JOIN/employee/ON/employee-BLUBLUBLU-empid=site_expense-BLUBLUBLU-employee_f_key/WHERE/site_expense-BLUBLUBLU-user_perm/=/§0§/AND/site_expense-BLUBLUBLU-is_deleted=/§0§ORDER/BY/site_expense-BLUBLUBLU-site_exp_id/;	2023-05-23 11:18:59+00
\.


--
-- Data for Name: userlog; Type: TABLE DATA; Schema: public; Owner: powerta
--

COPY public.userlog (id, username, user_password, emaid, status, meta, created_time, created_at, updated_at, created_by, updated_by) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: powerta
--

COPY public.users (id, email, password, created_date, modified_date) FROM stdin;
f9da7f2a-c3b3-4532-92f0-14d63559c479	poweta@gmail.com	$2b$08$eYG8oVJaSQ0IMQQCCNVXUuhLJt9M8pNbM26I2YHvG916kMge.lpDy	2023-05-22 11:44:52.02	2023-05-22 11:44:52.021
\.


--
-- Data for Name: vendor; Type: TABLE DATA; Schema: public; Owner: powerta
--

COPY public.vendor (personid, vendor_name, gst_in, phone_no, gst_type, state, email_id, billing_address, created_at, updated_at, created_by) FROM stdin;
1	fahad	1234567890	9999222255		kerala	fahad@gmail.com	kerala	2023-02-24 11:44:03.895535+00	2023-02-24 11:44:03.895535+00	\N
2	jishnu	3456567890	9923222255		kerala	jishnu@gmail.com	kerala	2023-02-24 11:44:03.895535+00	2023-02-24 11:44:03.895535+00	\N
\.


--
-- Name: accountings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: powerta
--

SELECT pg_catalog.setval('public.accountings_id_seq', 89, true);


--
-- Name: employee_empid_seq; Type: SEQUENCE SET; Schema: public; Owner: powerta
--

SELECT pg_catalog.setval('public.employee_empid_seq', 1049, true);


--
-- Name: images_id_seq; Type: SEQUENCE SET; Schema: public; Owner: powerta
--

SELECT pg_catalog.setval('public.images_id_seq', 1, false);


--
-- Name: invoice_invoice_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.invoice_invoice_id_seq', 1, false);


--
-- Name: invoice_list_invoice_list_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.invoice_list_invoice_list_id_seq', 1, false);


--
-- Name: ip_id_seq; Type: SEQUENCE SET; Schema: public; Owner: powerta
--

SELECT pg_catalog.setval('public.ip_id_seq', 1, false);


--
-- Name: keymeta_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.keymeta_id_seq', 1, true);


--
-- Name: labour_account_labour_account_id_seq; Type: SEQUENCE SET; Schema: public; Owner: powerta
--

SELECT pg_catalog.setval('public.labour_account_labour_account_id_seq', 164, true);


--
-- Name: labour_labour_id_seq; Type: SEQUENCE SET; Schema: public; Owner: powerta
--

SELECT pg_catalog.setval('public.labour_labour_id_seq', 51, true);


--
-- Name: payment_out_prty_id_seq; Type: SEQUENCE SET; Schema: public; Owner: powerta
--

SELECT pg_catalog.setval('public.payment_out_prty_id_seq', 1, true);


--
-- Name: purchase_bill_bill_id_seq; Type: SEQUENCE SET; Schema: public; Owner: powerta
--

SELECT pg_catalog.setval('public.purchase_bill_bill_id_seq', 341, true);


--
-- Name: purchase_bill_list_list_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.purchase_bill_list_list_id_seq', 1, false);


--
-- Name: purchase_order_list_list_id_seq; Type: SEQUENCE SET; Schema: public; Owner: powerta
--

SELECT pg_catalog.setval('public.purchase_order_list_list_id_seq', 14, true);


--
-- Name: purchase_order_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: powerta
--

SELECT pg_catalog.setval('public.purchase_order_order_id_seq', 40, true);


--
-- Name: purchase_return_return_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.purchase_return_return_id_seq', 1, false);


--
-- Name: quotation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: powerta
--

SELECT pg_catalog.setval('public.quotation_id_seq', 12, true);


--
-- Name: quotation_list_quot_list_id_seq; Type: SEQUENCE SET; Schema: public; Owner: powerta
--

SELECT pg_catalog.setval('public.quotation_list_quot_list_id_seq', 16, true);


--
-- Name: site_expense_site_exp_id_seq; Type: SEQUENCE SET; Schema: public; Owner: powerta
--

SELECT pg_catalog.setval('public.site_expense_site_exp_id_seq', 422, true);


--
-- Name: site_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: powerta
--

SELECT pg_catalog.setval('public.site_site_id_seq', 288, true);


--
-- Name: stock_collection_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: powerta
--

SELECT pg_catalog.setval('public.stock_collection_product_id_seq', 171, true);


--
-- Name: stock_stock_id_seq; Type: SEQUENCE SET; Schema: public; Owner: powerta
--

SELECT pg_catalog.setval('public.stock_stock_id_seq', 102, true);


--
-- Name: update_upid_seq; Type: SEQUENCE SET; Schema: public; Owner: powerta
--

SELECT pg_catalog.setval('public.update_upid_seq', 3637, true);


--
-- Name: userlog_id_seq; Type: SEQUENCE SET; Schema: public; Owner: powerta
--

SELECT pg_catalog.setval('public.userlog_id_seq', 1, false);


--
-- Name: vendor_personid_seq; Type: SEQUENCE SET; Schema: public; Owner: powerta
--

SELECT pg_catalog.setval('public.vendor_personid_seq', 298, true);


--
-- Name: accountings accountings_pkey; Type: CONSTRAINT; Schema: public; Owner: powerta
--

ALTER TABLE ONLY public.accountings
    ADD CONSTRAINT accountings_pkey PRIMARY KEY (id);


--
-- Name: customer customer_pkey; Type: CONSTRAINT; Schema: public; Owner: powerta
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (client_id);


--
-- Name: employee employee_pkey; Type: CONSTRAINT; Schema: public; Owner: powerta
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_pkey PRIMARY KEY (empid);


--
-- Name: images images_pkey; Type: CONSTRAINT; Schema: public; Owner: powerta
--

ALTER TABLE ONLY public.images
    ADD CONSTRAINT images_pkey PRIMARY KEY (id);


--
-- Name: invoice_list invoice_list_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invoice_list
    ADD CONSTRAINT invoice_list_pkey PRIMARY KEY (invoice_list_id);


--
-- Name: invoice invoice_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invoice
    ADD CONSTRAINT invoice_pkey PRIMARY KEY (invoice_id);


--
-- Name: ip ip_pkey; Type: CONSTRAINT; Schema: public; Owner: powerta
--

ALTER TABLE ONLY public.ip
    ADD CONSTRAINT ip_pkey PRIMARY KEY (id);


--
-- Name: keymeta keymeta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.keymeta
    ADD CONSTRAINT keymeta_pkey PRIMARY KEY (id);


--
-- Name: labour_account labour_account_pkey; Type: CONSTRAINT; Schema: public; Owner: powerta
--

ALTER TABLE ONLY public.labour_account
    ADD CONSTRAINT labour_account_pkey PRIMARY KEY (labour_account_id);


--
-- Name: labour labour_pkey; Type: CONSTRAINT; Schema: public; Owner: powerta
--

ALTER TABLE ONLY public.labour
    ADD CONSTRAINT labour_pkey PRIMARY KEY (labour_id);


--
-- Name: users newusers_email_key; Type: CONSTRAINT; Schema: public; Owner: powerta
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT newusers_email_key UNIQUE (email);


--
-- Name: users newusers_pkey; Type: CONSTRAINT; Schema: public; Owner: powerta
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT newusers_pkey PRIMARY KEY (id);


--
-- Name: payment_out payment_out_pkey; Type: CONSTRAINT; Schema: public; Owner: powerta
--

ALTER TABLE ONLY public.payment_out
    ADD CONSTRAINT payment_out_pkey PRIMARY KEY (prty_id);


--
-- Name: purchase_bill_list purchase_bill_list_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchase_bill_list
    ADD CONSTRAINT purchase_bill_list_pkey PRIMARY KEY (list_id);


--
-- Name: purchase_bill purchase_bill_pkey; Type: CONSTRAINT; Schema: public; Owner: powerta
--

ALTER TABLE ONLY public.purchase_bill
    ADD CONSTRAINT purchase_bill_pkey PRIMARY KEY (bill_id);


--
-- Name: purchase_order_list purchase_order_list_pkey; Type: CONSTRAINT; Schema: public; Owner: powerta
--

ALTER TABLE ONLY public.purchase_order_list
    ADD CONSTRAINT purchase_order_list_pkey PRIMARY KEY (list_id);


--
-- Name: purchase_order purchase_order_pkey; Type: CONSTRAINT; Schema: public; Owner: powerta
--

ALTER TABLE ONLY public.purchase_order
    ADD CONSTRAINT purchase_order_pkey PRIMARY KEY (order_id);


--
-- Name: purchase_return purchase_return_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchase_return
    ADD CONSTRAINT purchase_return_pkey PRIMARY KEY (return_id);


--
-- Name: quotation_list quotation_list_pkey; Type: CONSTRAINT; Schema: public; Owner: powerta
--

ALTER TABLE ONLY public.quotation_list
    ADD CONSTRAINT quotation_list_pkey PRIMARY KEY (quot_list_id);


--
-- Name: quotation quotation_pkey; Type: CONSTRAINT; Schema: public; Owner: powerta
--

ALTER TABLE ONLY public.quotation
    ADD CONSTRAINT quotation_pkey PRIMARY KEY (id);


--
-- Name: site_expense site_expense_pkey; Type: CONSTRAINT; Schema: public; Owner: powerta
--

ALTER TABLE ONLY public.site_expense
    ADD CONSTRAINT site_expense_pkey PRIMARY KEY (site_exp_id);


--
-- Name: site site_pkey; Type: CONSTRAINT; Schema: public; Owner: powerta
--

ALTER TABLE ONLY public.site
    ADD CONSTRAINT site_pkey PRIMARY KEY (site_id);


--
-- Name: stock_collection stock_collection_pkey; Type: CONSTRAINT; Schema: public; Owner: powerta
--

ALTER TABLE ONLY public.stock_collection
    ADD CONSTRAINT stock_collection_pkey PRIMARY KEY (product_id);


--
-- Name: stock stock_pkey; Type: CONSTRAINT; Schema: public; Owner: powerta
--

ALTER TABLE ONLY public.stock
    ADD CONSTRAINT stock_pkey PRIMARY KEY (stock_id);


--
-- Name: update update_pkey; Type: CONSTRAINT; Schema: public; Owner: powerta
--

ALTER TABLE ONLY public.update
    ADD CONSTRAINT update_pkey PRIMARY KEY (upid);


--
-- Name: userlog userlog_pkey; Type: CONSTRAINT; Schema: public; Owner: powerta
--

ALTER TABLE ONLY public.userlog
    ADD CONSTRAINT userlog_pkey PRIMARY KEY (id);


--
-- Name: vendor vendor_pkey; Type: CONSTRAINT; Schema: public; Owner: powerta
--

ALTER TABLE ONLY public.vendor
    ADD CONSTRAINT vendor_pkey PRIMARY KEY (personid);


--
-- Name: images images_stock_c_f_key_fkey; Type: FK CONSTRAINT; Schema: public; Owner: powerta
--

ALTER TABLE ONLY public.images
    ADD CONSTRAINT images_stock_c_f_key_fkey FOREIGN KEY (stock_c_f_key) REFERENCES public.stock_collection(product_id);


--
-- Name: invoice invoice_customer_f_key_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invoice
    ADD CONSTRAINT invoice_customer_f_key_fkey FOREIGN KEY (customer_f_key) REFERENCES public.customer(client_id);


--
-- Name: invoice_list invoice_list_invoice_f_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invoice_list
    ADD CONSTRAINT invoice_list_invoice_f_id_fkey FOREIGN KEY (invoice_f_id) REFERENCES public.invoice(invoice_id);


--
-- Name: invoice_list invoice_list_stock_f_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invoice_list
    ADD CONSTRAINT invoice_list_stock_f_id_fkey FOREIGN KEY (stock_f_id) REFERENCES public.stock(stock_id);


--
-- Name: invoice invoice_quot_f_key_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invoice
    ADD CONSTRAINT invoice_quot_f_key_fkey FOREIGN KEY (quot_f_key) REFERENCES public.quotation(id);


--
-- Name: labour_account labour_account_labour_f_key_fkey; Type: FK CONSTRAINT; Schema: public; Owner: powerta
--

ALTER TABLE ONLY public.labour_account
    ADD CONSTRAINT labour_account_labour_f_key_fkey FOREIGN KEY (labour_f_key) REFERENCES public.labour(labour_id);


--
-- Name: labour_account labour_account_site_f_key_fkey; Type: FK CONSTRAINT; Schema: public; Owner: powerta
--

ALTER TABLE ONLY public.labour_account
    ADD CONSTRAINT labour_account_site_f_key_fkey FOREIGN KEY (site_f_key) REFERENCES public.site(site_id);


--
-- Name: payment_out payment_out_vendor_f_key_fkey; Type: FK CONSTRAINT; Schema: public; Owner: powerta
--

ALTER TABLE ONLY public.payment_out
    ADD CONSTRAINT payment_out_vendor_f_key_fkey FOREIGN KEY (vendor_f_key) REFERENCES public.vendor(personid);


--
-- Name: purchase_bill_list purchase_bill_list_pur_bill_f_key_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchase_bill_list
    ADD CONSTRAINT purchase_bill_list_pur_bill_f_key_fkey FOREIGN KEY (pur_bill_f_key) REFERENCES public.purchase_bill(bill_id);


--
-- Name: purchase_bill_list purchase_bill_list_stock_f_key_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchase_bill_list
    ADD CONSTRAINT purchase_bill_list_stock_f_key_fkey FOREIGN KEY (stock_f_key) REFERENCES public.stock(stock_id);


--
-- Name: purchase_bill purchase_bill_order_id_f_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: powerta
--

ALTER TABLE ONLY public.purchase_bill
    ADD CONSTRAINT purchase_bill_order_id_f_id_fkey FOREIGN KEY (order_id_f_id) REFERENCES public.purchase_order(order_id);


--
-- Name: purchase_bill purchase_bill_stock_f_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: powerta
--

ALTER TABLE ONLY public.purchase_bill
    ADD CONSTRAINT purchase_bill_stock_f_id_fkey FOREIGN KEY (stock_f_id) REFERENCES public.stock(stock_id);


--
-- Name: purchase_bill purchase_bill_vendor_f_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: powerta
--

ALTER TABLE ONLY public.purchase_bill
    ADD CONSTRAINT purchase_bill_vendor_f_id_fkey FOREIGN KEY (vendor_f_id) REFERENCES public.vendor(personid);


--
-- Name: purchase_order_list purchase_order_list_pur_order_f_key_fkey; Type: FK CONSTRAINT; Schema: public; Owner: powerta
--

ALTER TABLE ONLY public.purchase_order_list
    ADD CONSTRAINT purchase_order_list_pur_order_f_key_fkey FOREIGN KEY (pur_order_f_key) REFERENCES public.purchase_order(order_id);


--
-- Name: purchase_order_list purchase_order_list_purchase_order_f_key_fkey; Type: FK CONSTRAINT; Schema: public; Owner: powerta
--

ALTER TABLE ONLY public.purchase_order_list
    ADD CONSTRAINT purchase_order_list_purchase_order_f_key_fkey FOREIGN KEY (stock_f_key) REFERENCES public.stock(stock_id);


--
-- Name: purchase_order purchase_order_vendor_f_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: powerta
--

ALTER TABLE ONLY public.purchase_order
    ADD CONSTRAINT purchase_order_vendor_f_id_fkey FOREIGN KEY (vendor_f_id) REFERENCES public.vendor(personid);


--
-- Name: purchase_return purchase_return_pur_bill_fid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchase_return
    ADD CONSTRAINT purchase_return_pur_bill_fid_fkey FOREIGN KEY (pur_bill_fid) REFERENCES public.purchase_bill(bill_id);


--
-- Name: quotation_list quotation_list_quot_f_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: powerta
--

ALTER TABLE ONLY public.quotation_list
    ADD CONSTRAINT quotation_list_quot_f_id_fkey FOREIGN KEY (quot_f_id) REFERENCES public.quotation(id);


--
-- Name: quotation_list quotation_list_stock_f_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: powerta
--

ALTER TABLE ONLY public.quotation_list
    ADD CONSTRAINT quotation_list_stock_f_id_fkey FOREIGN KEY (stock_f_id) REFERENCES public.stock_collection(product_id);


--
-- Name: quotation quotation_vendor_f_key_fkey; Type: FK CONSTRAINT; Schema: public; Owner: powerta
--

ALTER TABLE ONLY public.quotation
    ADD CONSTRAINT quotation_vendor_f_key_fkey FOREIGN KEY (vendor_f_key) REFERENCES public.vendor(personid);


--
-- Name: site_expense site_expense_employee_f_key_fkey; Type: FK CONSTRAINT; Schema: public; Owner: powerta
--

ALTER TABLE ONLY public.site_expense
    ADD CONSTRAINT site_expense_employee_f_key_fkey FOREIGN KEY (employee_f_key) REFERENCES public.employee(empid);


--
-- Name: site_expense site_expense_site_f_key_fkey; Type: FK CONSTRAINT; Schema: public; Owner: powerta
--

ALTER TABLE ONLY public.site_expense
    ADD CONSTRAINT site_expense_site_f_key_fkey FOREIGN KEY (site_f_key) REFERENCES public.site(site_id);


--
-- Name: stock stock_stock_f_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: powerta
--

ALTER TABLE ONLY public.stock
    ADD CONSTRAINT stock_stock_f_id_fkey FOREIGN KEY (stock_f_id) REFERENCES public.stock_collection(product_id);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: pg_database_owner
--

GRANT USAGE ON SCHEMA public TO powerta;
GRANT ALL ON SCHEMA public TO powerta_user;


--
-- Name: TABLE accountings; Type: ACL; Schema: public; Owner: powerta
--

GRANT SELECT ON TABLE public.accountings TO powerta_user;


--
-- Name: TABLE customer; Type: ACL; Schema: public; Owner: powerta
--

GRANT SELECT ON TABLE public.customer TO powerta_user;


--
-- Name: TABLE employee; Type: ACL; Schema: public; Owner: powerta
--

GRANT SELECT ON TABLE public.employee TO powerta_user;


--
-- Name: TABLE images; Type: ACL; Schema: public; Owner: powerta
--

GRANT SELECT ON TABLE public.images TO powerta_user;


--
-- Name: TABLE invoice; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.invoice TO powerta;
GRANT ALL ON TABLE public.invoice TO powerta_user;


--
-- Name: SEQUENCE invoice_invoice_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.invoice_invoice_id_seq TO powerta;
GRANT ALL ON SEQUENCE public.invoice_invoice_id_seq TO powerta_user;


--
-- Name: TABLE invoice_list; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.invoice_list TO powerta;
GRANT ALL ON TABLE public.invoice_list TO powerta_user;


--
-- Name: SEQUENCE invoice_list_invoice_list_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.invoice_list_invoice_list_id_seq TO powerta;
GRANT ALL ON SEQUENCE public.invoice_list_invoice_list_id_seq TO powerta_user;


--
-- Name: TABLE ip; Type: ACL; Schema: public; Owner: powerta
--

GRANT SELECT ON TABLE public.ip TO powerta_user;


--
-- Name: TABLE keymeta; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.keymeta TO powerta;
GRANT ALL ON TABLE public.keymeta TO powerta_user;


--
-- Name: SEQUENCE keymeta_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.keymeta_id_seq TO powerta;
GRANT ALL ON SEQUENCE public.keymeta_id_seq TO powerta_user;


--
-- Name: TABLE labour; Type: ACL; Schema: public; Owner: powerta
--

GRANT SELECT ON TABLE public.labour TO powerta_user;


--
-- Name: TABLE labour_account; Type: ACL; Schema: public; Owner: powerta
--

GRANT SELECT ON TABLE public.labour_account TO powerta_user;


--
-- Name: TABLE payment_out; Type: ACL; Schema: public; Owner: powerta
--

GRANT SELECT ON TABLE public.payment_out TO powerta_user;


--
-- Name: TABLE pos_receipt; Type: ACL; Schema: public; Owner: powerta
--

GRANT SELECT ON TABLE public.pos_receipt TO powerta_user;


--
-- Name: TABLE purchase_bill; Type: ACL; Schema: public; Owner: powerta
--

GRANT SELECT ON TABLE public.purchase_bill TO powerta_user;


--
-- Name: TABLE purchase_bill_list; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.purchase_bill_list TO powerta;
GRANT ALL ON TABLE public.purchase_bill_list TO powerta_user;


--
-- Name: SEQUENCE purchase_bill_list_list_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.purchase_bill_list_list_id_seq TO powerta;
GRANT ALL ON SEQUENCE public.purchase_bill_list_list_id_seq TO powerta_user;


--
-- Name: TABLE purchase_order; Type: ACL; Schema: public; Owner: powerta
--

GRANT SELECT ON TABLE public.purchase_order TO powerta_user;


--
-- Name: TABLE purchase_order_list; Type: ACL; Schema: public; Owner: powerta
--

GRANT SELECT ON TABLE public.purchase_order_list TO powerta_user;


--
-- Name: TABLE purchase_return; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.purchase_return TO powerta;
GRANT ALL ON TABLE public.purchase_return TO powerta_user;


--
-- Name: SEQUENCE purchase_return_return_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.purchase_return_return_id_seq TO powerta;
GRANT ALL ON SEQUENCE public.purchase_return_return_id_seq TO powerta_user;


--
-- Name: TABLE quotation; Type: ACL; Schema: public; Owner: powerta
--

GRANT SELECT ON TABLE public.quotation TO powerta_user;


--
-- Name: TABLE quotation_list; Type: ACL; Schema: public; Owner: powerta
--

GRANT SELECT ON TABLE public.quotation_list TO powerta_user;


--
-- Name: TABLE site; Type: ACL; Schema: public; Owner: powerta
--

GRANT SELECT ON TABLE public.site TO powerta_user;


--
-- Name: TABLE site_expense; Type: ACL; Schema: public; Owner: powerta
--

GRANT SELECT ON TABLE public.site_expense TO powerta_user;


--
-- Name: TABLE stock; Type: ACL; Schema: public; Owner: powerta
--

GRANT SELECT ON TABLE public.stock TO powerta_user;


--
-- Name: TABLE stock_collection; Type: ACL; Schema: public; Owner: powerta
--

GRANT SELECT ON TABLE public.stock_collection TO powerta_user;


--
-- Name: TABLE update; Type: ACL; Schema: public; Owner: powerta
--

GRANT SELECT ON TABLE public.update TO powerta_user;


--
-- Name: TABLE userlog; Type: ACL; Schema: public; Owner: powerta
--

GRANT SELECT ON TABLE public.userlog TO powerta_user;


--
-- Name: TABLE users; Type: ACL; Schema: public; Owner: powerta
--

GRANT SELECT ON TABLE public.users TO powerta_user;


--
-- Name: TABLE vendor; Type: ACL; Schema: public; Owner: powerta
--

GRANT SELECT ON TABLE public.vendor TO powerta_user;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES  TO powerta;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES  TO powerta_user;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES  TO powerta;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES  TO powerta_user;


--
-- PostgreSQL database dump complete
--

