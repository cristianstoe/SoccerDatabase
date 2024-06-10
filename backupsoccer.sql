PGDMP  .              
        |            Soccer    16.2 (Debian 16.2-1.pgdg120+2)    16.1 �    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16384    Soccer    DATABASE     s   CREATE DATABASE "Soccer" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';
    DROP DATABASE "Soccer";
                cristiansto    false            �            1259    16445    _prisma_migrations    TABLE     �  CREATE TABLE public._prisma_migrations (
    id character varying(36) NOT NULL,
    checksum character varying(64) NOT NULL,
    finished_at timestamp with time zone,
    migration_name character varying(255) NOT NULL,
    logs text,
    rolled_back_at timestamp with time zone,
    started_at timestamp with time zone DEFAULT now() NOT NULL,
    applied_steps_count integer DEFAULT 0 NOT NULL
);
 &   DROP TABLE public._prisma_migrations;
       public         heap    cristiansto    false            �            1259    16642    cidades    TABLE     _   CREATE TABLE public.cidades (
    cidade_id integer NOT NULL,
    cidade_nome text NOT NULL
);
    DROP TABLE public.cidades;
       public         heap    cristiansto    false            �            1259    16641    cidades_cidade_id_seq    SEQUENCE     �   CREATE SEQUENCE public.cidades_cidade_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.cidades_cidade_id_seq;
       public          cristiansto    false    220            �           0    0    cidades_cidade_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.cidades_cidade_id_seq OWNED BY public.cidades.cidade_id;
          public          cristiansto    false    219            �            1259    16738    classificacoes    TABLE     �   CREATE TABLE public.classificacoes (
    liga_id integer NOT NULL,
    time_id integer NOT NULL,
    temporada_id integer NOT NULL,
    classificacao_valor integer NOT NULL,
    jogador_id integer NOT NULL
);
 "   DROP TABLE public.classificacoes;
       public         heap    cristiansto    false            �            1259    16670 	   enderecos    TABLE     �   CREATE TABLE public.enderecos (
    endereco_id integer NOT NULL,
    endereco text NOT NULL,
    pais_id integer NOT NULL,
    cidade_id integer NOT NULL,
    "paisesPais_id" integer,
    "cidadesCidade_id" integer
);
    DROP TABLE public.enderecos;
       public         heap    cristiansto    false            �            1259    16669    enderecos_endereco_id_seq    SEQUENCE     �   CREATE SEQUENCE public.enderecos_endereco_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.enderecos_endereco_id_seq;
       public          cristiansto    false    223            �           0    0    enderecos_endereco_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.enderecos_endereco_id_seq OWNED BY public.enderecos.endereco_id;
          public          cristiansto    false    222            �            1259    16679    estadios    TABLE     �   CREATE TABLE public.estadios (
    estadio_id integer NOT NULL,
    estadio_nome text NOT NULL,
    estadio_capacidade integer NOT NULL,
    endereco_id integer NOT NULL
);
    DROP TABLE public.estadios;
       public         heap    cristiansto    false            �            1259    16678    estadios_estadio_id_seq    SEQUENCE     �   CREATE SEQUENCE public.estadios_estadio_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.estadios_estadio_id_seq;
       public          cristiansto    false    225            �           0    0    estadios_estadio_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.estadios_estadio_id_seq OWNED BY public.estadios.estadio_id;
          public          cristiansto    false    224            �            1259    25821    estatistica_jogadores    TABLE     �  CREATE TABLE public.estatistica_jogadores (
    estatistica_jogador_id integer NOT NULL,
    estatistica_jogador_data timestamp(3) without time zone NOT NULL,
    estatistica_jogador_numero_jogos integer NOT NULL,
    estatistica_jogador_chutes integer NOT NULL,
    estatistica_jogador_gols integer NOT NULL,
    estatistica_jogador_passes integer NOT NULL,
    estatistica_jogador_faltas integer NOT NULL,
    estatistica_jogador_dribles integer NOT NULL,
    estatistica_jogador_cartoes integer NOT NULL
);
 )   DROP TABLE public.estatistica_jogadores;
       public         heap    cristiansto    false            �            1259    25820 0   estatistica_jogadores_estatistica_jogador_id_seq    SEQUENCE     �   CREATE SEQUENCE public.estatistica_jogadores_estatistica_jogador_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 G   DROP SEQUENCE public.estatistica_jogadores_estatistica_jogador_id_seq;
       public          cristiansto    false    242            �           0    0 0   estatistica_jogadores_estatistica_jogador_id_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.estatistica_jogadores_estatistica_jogador_id_seq OWNED BY public.estatistica_jogadores.estatistica_jogador_id;
          public          cristiansto    false    241            �            1259    16732    estatisticas    TABLE     6  CREATE TABLE public.estatisticas (
    estatistica_jogador_id integer NOT NULL,
    liga_id integer NOT NULL,
    time_id integer NOT NULL,
    temporada_id integer NOT NULL,
    jogo_id integer NOT NULL,
    estatistica_jogador_data timestamp(3) without time zone NOT NULL,
    jogador_id integer NOT NULL
);
     DROP TABLE public.estatisticas;
       public         heap    cristiansto    false            �            1259    16718 	   jogadores    TABLE     �   CREATE TABLE public.jogadores (
    jogador_nome_id integer NOT NULL,
    jogador_idade text NOT NULL,
    jogador_nascimento_id integer NOT NULL,
    jogador_primeiro_nome text NOT NULL,
    jogador_segundo_nome text NOT NULL
);
    DROP TABLE public.jogadores;
       public         heap    cristiansto    false            �            1259    25803    jogadores_jogador_nome_id_seq    SEQUENCE     �   CREATE SEQUENCE public.jogadores_jogador_nome_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.jogadores_jogador_nome_id_seq;
       public          cristiansto    false    232            �           0    0    jogadores_jogador_nome_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.jogadores_jogador_nome_id_seq OWNED BY public.jogadores.jogador_nome_id;
          public          cristiansto    false    237            �            1259    25828    jogadores_nascimentos    TABLE     �   CREATE TABLE public.jogadores_nascimentos (
    jogador_nascimento_id integer NOT NULL,
    jogador_nascimento_data timestamp(3) without time zone NOT NULL,
    pais_id integer NOT NULL,
    cidade_id integer NOT NULL
);
 )   DROP TABLE public.jogadores_nascimentos;
       public         heap    cristiansto    false            �            1259    25827 /   jogadores_nascimentos_jogador_nascimento_id_seq    SEQUENCE     �   CREATE SEQUENCE public.jogadores_nascimentos_jogador_nascimento_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 F   DROP SEQUENCE public.jogadores_nascimentos_jogador_nascimento_id_seq;
       public          cristiansto    false    244            �           0    0 /   jogadores_nascimentos_jogador_nascimento_id_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.jogadores_nascimentos_jogador_nascimento_id_seq OWNED BY public.jogadores_nascimentos.jogador_nascimento_id;
          public          cristiansto    false    243            �            1259    16725    jogos    TABLE     2  CREATE TABLE public.jogos (
    jogo_id integer NOT NULL,
    jogo_data timestamp(3) without time zone NOT NULL,
    jogo_fuso_horario timestamp(3) without time zone NOT NULL,
    liga_id integer NOT NULL,
    time_id integer NOT NULL,
    temporada_id integer NOT NULL,
    jogador_id integer NOT NULL
);
    DROP TABLE public.jogos;
       public         heap    cristiansto    false            �            1259    16724    jogos_jogo_id_seq    SEQUENCE     �   CREATE SEQUENCE public.jogos_jogo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.jogos_jogo_id_seq;
       public          cristiansto    false    234            �           0    0    jogos_jogo_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.jogos_jogo_id_seq OWNED BY public.jogos.jogo_id;
          public          cristiansto    false    233            �            1259    16704    ligas    TABLE     �   CREATE TABLE public.ligas (
    liga_id integer NOT NULL,
    liga_nome text NOT NULL,
    pais_id integer NOT NULL,
    liga_tipo text NOT NULL
);
    DROP TABLE public.ligas;
       public         heap    cristiansto    false            �            1259    16703    ligas_liga_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ligas_liga_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.ligas_liga_id_seq;
       public          cristiansto    false    231            �           0    0    ligas_liga_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.ligas_liga_id_seq OWNED BY public.ligas.liga_id;
          public          cristiansto    false    230            �            1259    25834 &   ligas_x_times_x_temporadas_x_jogadores    TABLE     �   CREATE TABLE public.ligas_x_times_x_temporadas_x_jogadores (
    liga_id integer NOT NULL,
    time_id integer NOT NULL,
    temporada_id integer NOT NULL,
    jogador_id integer NOT NULL
);
 :   DROP TABLE public.ligas_x_times_x_temporadas_x_jogadores;
       public         heap    cristiansto    false            �            1259    16633    paises    TABLE     �   CREATE TABLE public.paises (
    pais_id integer NOT NULL,
    pais_nome text NOT NULL,
    pais_sigla character(2) NOT NULL
);
    DROP TABLE public.paises;
       public         heap    cristiansto    false            �            1259    16632    paises_pais_id_seq    SEQUENCE     �   CREATE SEQUENCE public.paises_pais_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.paises_pais_id_seq;
       public          cristiansto    false    218            �           0    0    paises_pais_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.paises_pais_id_seq OWNED BY public.paises.pais_id;
          public          cristiansto    false    217            �            1259    16648    paises_x_cidades    TABLE     g   CREATE TABLE public.paises_x_cidades (
    pais_id integer NOT NULL,
    cidade_id integer NOT NULL
);
 $   DROP TABLE public.paises_x_cidades;
       public         heap    cristiansto    false            �            1259    16618 
   temporadas    TABLE     j   CREATE TABLE public.temporadas (
    temporada_id integer NOT NULL,
    temporada_ano integer NOT NULL
);
    DROP TABLE public.temporadas;
       public         heap    cristiansto    false            �            1259    25809    temporadas_temporada_id_seq    SEQUENCE     �   CREATE SEQUENCE public.temporadas_temporada_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.temporadas_temporada_id_seq;
       public          cristiansto    false    216            �           0    0    temporadas_temporada_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.temporadas_temporada_id_seq OWNED BY public.temporadas.temporada_id;
          public          cristiansto    false    238            �            1259    16688    times    TABLE     �   CREATE TABLE public.times (
    time_id integer NOT NULL,
    time_nome text NOT NULL,
    pais_id integer NOT NULL,
    code text NOT NULL
);
    DROP TABLE public.times;
       public         heap    cristiansto    false            �            1259    16687    times_time_id_seq    SEQUENCE     �   CREATE SEQUENCE public.times_time_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.times_time_id_seq;
       public          cristiansto    false    227            �           0    0    times_time_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.times_time_id_seq OWNED BY public.times.time_id;
          public          cristiansto    false    226            �            1259    25812    treinador_nomes    TABLE     r   CREATE TABLE public.treinador_nomes (
    treinador_nome_id integer NOT NULL,
    treinador_nome text NOT NULL
);
 #   DROP TABLE public.treinador_nomes;
       public         heap    cristiansto    false            �            1259    25811 %   treinador_nomes_treinador_nome_id_seq    SEQUENCE     �   CREATE SEQUENCE public.treinador_nomes_treinador_nome_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public.treinador_nomes_treinador_nome_id_seq;
       public          cristiansto    false    240            �           0    0 %   treinador_nomes_treinador_nome_id_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE public.treinador_nomes_treinador_nome_id_seq OWNED BY public.treinador_nomes.treinador_nome_id;
          public          cristiansto    false    239            �            1259    16697    treinadores    TABLE     �   CREATE TABLE public.treinadores (
    treinador_id integer NOT NULL,
    treinador_nome_id integer NOT NULL,
    time_id integer NOT NULL
);
    DROP TABLE public.treinadores;
       public         heap    cristiansto    false            �            1259    16696    treinadores_treinador_id_seq    SEQUENCE     �   CREATE SEQUENCE public.treinadores_treinador_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.treinadores_treinador_id_seq;
       public          cristiansto    false    229            �           0    0    treinadores_treinador_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.treinadores_treinador_id_seq OWNED BY public.treinadores.treinador_id;
          public          cristiansto    false    228            �           2604    16645    cidades cidade_id    DEFAULT     v   ALTER TABLE ONLY public.cidades ALTER COLUMN cidade_id SET DEFAULT nextval('public.cidades_cidade_id_seq'::regclass);
 @   ALTER TABLE public.cidades ALTER COLUMN cidade_id DROP DEFAULT;
       public          cristiansto    false    220    219    220            �           2604    16673    enderecos endereco_id    DEFAULT     ~   ALTER TABLE ONLY public.enderecos ALTER COLUMN endereco_id SET DEFAULT nextval('public.enderecos_endereco_id_seq'::regclass);
 D   ALTER TABLE public.enderecos ALTER COLUMN endereco_id DROP DEFAULT;
       public          cristiansto    false    223    222    223            �           2604    16682    estadios estadio_id    DEFAULT     z   ALTER TABLE ONLY public.estadios ALTER COLUMN estadio_id SET DEFAULT nextval('public.estadios_estadio_id_seq'::regclass);
 B   ALTER TABLE public.estadios ALTER COLUMN estadio_id DROP DEFAULT;
       public          cristiansto    false    225    224    225            �           2604    25824 ,   estatistica_jogadores estatistica_jogador_id    DEFAULT     �   ALTER TABLE ONLY public.estatistica_jogadores ALTER COLUMN estatistica_jogador_id SET DEFAULT nextval('public.estatistica_jogadores_estatistica_jogador_id_seq'::regclass);
 [   ALTER TABLE public.estatistica_jogadores ALTER COLUMN estatistica_jogador_id DROP DEFAULT;
       public          cristiansto    false    242    241    242            �           2604    25806    jogadores jogador_nome_id    DEFAULT     �   ALTER TABLE ONLY public.jogadores ALTER COLUMN jogador_nome_id SET DEFAULT nextval('public.jogadores_jogador_nome_id_seq'::regclass);
 H   ALTER TABLE public.jogadores ALTER COLUMN jogador_nome_id DROP DEFAULT;
       public          cristiansto    false    237    232            �           2604    25831 +   jogadores_nascimentos jogador_nascimento_id    DEFAULT     �   ALTER TABLE ONLY public.jogadores_nascimentos ALTER COLUMN jogador_nascimento_id SET DEFAULT nextval('public.jogadores_nascimentos_jogador_nascimento_id_seq'::regclass);
 Z   ALTER TABLE public.jogadores_nascimentos ALTER COLUMN jogador_nascimento_id DROP DEFAULT;
       public          cristiansto    false    244    243    244            �           2604    16728    jogos jogo_id    DEFAULT     n   ALTER TABLE ONLY public.jogos ALTER COLUMN jogo_id SET DEFAULT nextval('public.jogos_jogo_id_seq'::regclass);
 <   ALTER TABLE public.jogos ALTER COLUMN jogo_id DROP DEFAULT;
       public          cristiansto    false    234    233    234            �           2604    16707    ligas liga_id    DEFAULT     n   ALTER TABLE ONLY public.ligas ALTER COLUMN liga_id SET DEFAULT nextval('public.ligas_liga_id_seq'::regclass);
 <   ALTER TABLE public.ligas ALTER COLUMN liga_id DROP DEFAULT;
       public          cristiansto    false    230    231    231            �           2604    16636    paises pais_id    DEFAULT     p   ALTER TABLE ONLY public.paises ALTER COLUMN pais_id SET DEFAULT nextval('public.paises_pais_id_seq'::regclass);
 =   ALTER TABLE public.paises ALTER COLUMN pais_id DROP DEFAULT;
       public          cristiansto    false    217    218    218            �           2604    25810    temporadas temporada_id    DEFAULT     �   ALTER TABLE ONLY public.temporadas ALTER COLUMN temporada_id SET DEFAULT nextval('public.temporadas_temporada_id_seq'::regclass);
 F   ALTER TABLE public.temporadas ALTER COLUMN temporada_id DROP DEFAULT;
       public          cristiansto    false    238    216            �           2604    16691    times time_id    DEFAULT     n   ALTER TABLE ONLY public.times ALTER COLUMN time_id SET DEFAULT nextval('public.times_time_id_seq'::regclass);
 <   ALTER TABLE public.times ALTER COLUMN time_id DROP DEFAULT;
       public          cristiansto    false    227    226    227            �           2604    25815 !   treinador_nomes treinador_nome_id    DEFAULT     �   ALTER TABLE ONLY public.treinador_nomes ALTER COLUMN treinador_nome_id SET DEFAULT nextval('public.treinador_nomes_treinador_nome_id_seq'::regclass);
 P   ALTER TABLE public.treinador_nomes ALTER COLUMN treinador_nome_id DROP DEFAULT;
       public          cristiansto    false    240    239    240            �           2604    16700    treinadores treinador_id    DEFAULT     �   ALTER TABLE ONLY public.treinadores ALTER COLUMN treinador_id SET DEFAULT nextval('public.treinadores_treinador_id_seq'::regclass);
 G   ALTER TABLE public.treinadores ALTER COLUMN treinador_id DROP DEFAULT;
       public          cristiansto    false    228    229    229            �          0    16445    _prisma_migrations 
   TABLE DATA           �   COPY public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) FROM stdin;
    public          cristiansto    false    215   J�       �          0    16642    cidades 
   TABLE DATA           9   COPY public.cidades (cidade_id, cidade_nome) FROM stdin;
    public          cristiansto    false    220   �       �          0    16738    classificacoes 
   TABLE DATA           i   COPY public.classificacoes (liga_id, time_id, temporada_id, classificacao_valor, jogador_id) FROM stdin;
    public          cristiansto    false    236   a�       �          0    16670 	   enderecos 
   TABLE DATA           s   COPY public.enderecos (endereco_id, endereco, pais_id, cidade_id, "paisesPais_id", "cidadesCidade_id") FROM stdin;
    public          cristiansto    false    223   ~�       �          0    16679    estadios 
   TABLE DATA           ]   COPY public.estadios (estadio_id, estadio_nome, estadio_capacidade, endereco_id) FROM stdin;
    public          cristiansto    false    225   ��       �          0    25821    estatistica_jogadores 
   TABLE DATA           +  COPY public.estatistica_jogadores (estatistica_jogador_id, estatistica_jogador_data, estatistica_jogador_numero_jogos, estatistica_jogador_chutes, estatistica_jogador_gols, estatistica_jogador_passes, estatistica_jogador_faltas, estatistica_jogador_dribles, estatistica_jogador_cartoes) FROM stdin;
    public          cristiansto    false    242   ��       �          0    16732    estatisticas 
   TABLE DATA           �   COPY public.estatisticas (estatistica_jogador_id, liga_id, time_id, temporada_id, jogo_id, estatistica_jogador_data, jogador_id) FROM stdin;
    public          cristiansto    false    235   ջ       �          0    16718 	   jogadores 
   TABLE DATA           �   COPY public.jogadores (jogador_nome_id, jogador_idade, jogador_nascimento_id, jogador_primeiro_nome, jogador_segundo_nome) FROM stdin;
    public          cristiansto    false    232   �       �          0    25828    jogadores_nascimentos 
   TABLE DATA           s   COPY public.jogadores_nascimentos (jogador_nascimento_id, jogador_nascimento_data, pais_id, cidade_id) FROM stdin;
    public          cristiansto    false    244   %�       �          0    16725    jogos 
   TABLE DATA           r   COPY public.jogos (jogo_id, jogo_data, jogo_fuso_horario, liga_id, time_id, temporada_id, jogador_id) FROM stdin;
    public          cristiansto    false    234   ͽ       �          0    16704    ligas 
   TABLE DATA           G   COPY public.ligas (liga_id, liga_nome, pais_id, liga_tipo) FROM stdin;
    public          cristiansto    false    231   �       �          0    25834 &   ligas_x_times_x_temporadas_x_jogadores 
   TABLE DATA           l   COPY public.ligas_x_times_x_temporadas_x_jogadores (liga_id, time_id, temporada_id, jogador_id) FROM stdin;
    public          cristiansto    false    245   ��       �          0    16633    paises 
   TABLE DATA           @   COPY public.paises (pais_id, pais_nome, pais_sigla) FROM stdin;
    public          cristiansto    false    218   ��       �          0    16648    paises_x_cidades 
   TABLE DATA           >   COPY public.paises_x_cidades (pais_id, cidade_id) FROM stdin;
    public          cristiansto    false    221   ��       �          0    16618 
   temporadas 
   TABLE DATA           A   COPY public.temporadas (temporada_id, temporada_ano) FROM stdin;
    public          cristiansto    false    216   �       �          0    16688    times 
   TABLE DATA           B   COPY public.times (time_id, time_nome, pais_id, code) FROM stdin;
    public          cristiansto    false    227   i�       �          0    25812    treinador_nomes 
   TABLE DATA           L   COPY public.treinador_nomes (treinador_nome_id, treinador_nome) FROM stdin;
    public          cristiansto    false    240   ��       �          0    16697    treinadores 
   TABLE DATA           O   COPY public.treinadores (treinador_id, treinador_nome_id, time_id) FROM stdin;
    public          cristiansto    false    229   ��       �           0    0    cidades_cidade_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.cidades_cidade_id_seq', 4, true);
          public          cristiansto    false    219            �           0    0    enderecos_endereco_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.enderecos_endereco_id_seq', 1, false);
          public          cristiansto    false    222            �           0    0    estadios_estadio_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.estadios_estadio_id_seq', 1, false);
          public          cristiansto    false    224            �           0    0 0   estatistica_jogadores_estatistica_jogador_id_seq    SEQUENCE SET     _   SELECT pg_catalog.setval('public.estatistica_jogadores_estatistica_jogador_id_seq', 1, false);
          public          cristiansto    false    241            �           0    0    jogadores_jogador_nome_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.jogadores_jogador_nome_id_seq', 38, true);
          public          cristiansto    false    237            �           0    0 /   jogadores_nascimentos_jogador_nascimento_id_seq    SEQUENCE SET     ^   SELECT pg_catalog.setval('public.jogadores_nascimentos_jogador_nascimento_id_seq', 36, true);
          public          cristiansto    false    243            �           0    0    jogos_jogo_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.jogos_jogo_id_seq', 1, false);
          public          cristiansto    false    233            �           0    0    ligas_liga_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.ligas_liga_id_seq', 1486, true);
          public          cristiansto    false    230            �           0    0    paises_pais_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.paises_pais_id_seq', 167, true);
          public          cristiansto    false    217            �           0    0    temporadas_temporada_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.temporadas_temporada_id_seq', 19, true);
          public          cristiansto    false    238            �           0    0    times_time_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.times_time_id_seq', 439, true);
          public          cristiansto    false    226            �           0    0 %   treinador_nomes_treinador_nome_id_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public.treinador_nomes_treinador_nome_id_seq', 5, true);
          public          cristiansto    false    239            �           0    0    treinadores_treinador_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.treinadores_treinador_id_seq', 1, false);
          public          cristiansto    false    228            �           2606    16453 *   _prisma_migrations _prisma_migrations_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public._prisma_migrations
    ADD CONSTRAINT _prisma_migrations_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public._prisma_migrations DROP CONSTRAINT _prisma_migrations_pkey;
       public            cristiansto    false    215            �           2606    16647    cidades cidades_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.cidades
    ADD CONSTRAINT cidades_pkey PRIMARY KEY (cidade_id);
 >   ALTER TABLE ONLY public.cidades DROP CONSTRAINT cidades_pkey;
       public            cristiansto    false    220            �           2606    25800 "   classificacoes classificacoes_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.classificacoes
    ADD CONSTRAINT classificacoes_pkey PRIMARY KEY (liga_id, time_id, temporada_id, jogador_id);
 L   ALTER TABLE ONLY public.classificacoes DROP CONSTRAINT classificacoes_pkey;
       public            cristiansto    false    236    236    236    236            �           2606    16677    enderecos enderecos_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.enderecos
    ADD CONSTRAINT enderecos_pkey PRIMARY KEY (endereco_id);
 B   ALTER TABLE ONLY public.enderecos DROP CONSTRAINT enderecos_pkey;
       public            cristiansto    false    223            �           2606    16686    estadios estadios_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.estadios
    ADD CONSTRAINT estadios_pkey PRIMARY KEY (estadio_id);
 @   ALTER TABLE ONLY public.estadios DROP CONSTRAINT estadios_pkey;
       public            cristiansto    false    225                       2606    25826 0   estatistica_jogadores estatistica_jogadores_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.estatistica_jogadores
    ADD CONSTRAINT estatistica_jogadores_pkey PRIMARY KEY (estatistica_jogador_id);
 Z   ALTER TABLE ONLY public.estatistica_jogadores DROP CONSTRAINT estatistica_jogadores_pkey;
       public            cristiansto    false    242            �           2606    25802    estatisticas estatisticas_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.estatisticas
    ADD CONSTRAINT estatisticas_pkey PRIMARY KEY (estatistica_jogador_id, estatistica_jogador_data);
 H   ALTER TABLE ONLY public.estatisticas DROP CONSTRAINT estatisticas_pkey;
       public            cristiansto    false    235    235                       2606    25833 0   jogadores_nascimentos jogadores_nascimentos_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.jogadores_nascimentos
    ADD CONSTRAINT jogadores_nascimentos_pkey PRIMARY KEY (jogador_nascimento_id);
 Z   ALTER TABLE ONLY public.jogadores_nascimentos DROP CONSTRAINT jogadores_nascimentos_pkey;
       public            cristiansto    false    244            �           2606    25805    jogadores jogadores_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.jogadores
    ADD CONSTRAINT jogadores_pkey PRIMARY KEY (jogador_nome_id);
 B   ALTER TABLE ONLY public.jogadores DROP CONSTRAINT jogadores_pkey;
       public            cristiansto    false    232            �           2606    16730    jogos jogos_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.jogos
    ADD CONSTRAINT jogos_pkey PRIMARY KEY (jogo_id);
 :   ALTER TABLE ONLY public.jogos DROP CONSTRAINT jogos_pkey;
       public            cristiansto    false    234            �           2606    16711    ligas ligas_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.ligas
    ADD CONSTRAINT ligas_pkey PRIMARY KEY (liga_id);
 :   ALTER TABLE ONLY public.ligas DROP CONSTRAINT ligas_pkey;
       public            cristiansto    false    231                       2606    25838 R   ligas_x_times_x_temporadas_x_jogadores ligas_x_times_x_temporadas_x_jogadores_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.ligas_x_times_x_temporadas_x_jogadores
    ADD CONSTRAINT ligas_x_times_x_temporadas_x_jogadores_pkey PRIMARY KEY (liga_id, time_id, temporada_id, jogador_id);
 |   ALTER TABLE ONLY public.ligas_x_times_x_temporadas_x_jogadores DROP CONSTRAINT ligas_x_times_x_temporadas_x_jogadores_pkey;
       public            cristiansto    false    245    245    245    245            �           2606    16640    paises paises_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.paises
    ADD CONSTRAINT paises_pkey PRIMARY KEY (pais_id);
 <   ALTER TABLE ONLY public.paises DROP CONSTRAINT paises_pkey;
       public            cristiansto    false    218            �           2606    16652 &   paises_x_cidades paises_x_cidades_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public.paises_x_cidades
    ADD CONSTRAINT paises_x_cidades_pkey PRIMARY KEY (pais_id, cidade_id);
 P   ALTER TABLE ONLY public.paises_x_cidades DROP CONSTRAINT paises_x_cidades_pkey;
       public            cristiansto    false    221    221            �           2606    16622    temporadas temporadas_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.temporadas
    ADD CONSTRAINT temporadas_pkey PRIMARY KEY (temporada_id);
 D   ALTER TABLE ONLY public.temporadas DROP CONSTRAINT temporadas_pkey;
       public            cristiansto    false    216            �           2606    16695    times times_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.times
    ADD CONSTRAINT times_pkey PRIMARY KEY (time_id);
 :   ALTER TABLE ONLY public.times DROP CONSTRAINT times_pkey;
       public            cristiansto    false    227            �           2606    25819 $   treinador_nomes treinador_nomes_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY public.treinador_nomes
    ADD CONSTRAINT treinador_nomes_pkey PRIMARY KEY (treinador_nome_id);
 N   ALTER TABLE ONLY public.treinador_nomes DROP CONSTRAINT treinador_nomes_pkey;
       public            cristiansto    false    240            �           2606    16702    treinadores treinadores_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.treinadores
    ADD CONSTRAINT treinadores_pkey PRIMARY KEY (treinador_id);
 F   ALTER TABLE ONLY public.treinadores DROP CONSTRAINT treinadores_pkey;
       public            cristiansto    false    229                        1259    25839 ?   estatistica_jogadores_estatistica_jogador_id_estatistica_jo_key    INDEX     �   CREATE UNIQUE INDEX estatistica_jogadores_estatistica_jogador_id_estatistica_jo_key ON public.estatistica_jogadores USING btree (estatistica_jogador_id, estatistica_jogador_data);
 S   DROP INDEX public.estatistica_jogadores_estatistica_jogador_id_estatistica_jo_key;
       public            cristiansto    false    242    242                       2606    25895 J   classificacoes classificacoes_liga_id_time_id_temporada_id_jogador_id_fkey    FK CONSTRAINT     :  ALTER TABLE ONLY public.classificacoes
    ADD CONSTRAINT classificacoes_liga_id_time_id_temporada_id_jogador_id_fkey FOREIGN KEY (liga_id, time_id, temporada_id, jogador_id) REFERENCES public.ligas_x_times_x_temporadas_x_jogadores(liga_id, time_id, temporada_id, jogador_id) ON UPDATE CASCADE ON DELETE RESTRICT;
 t   ALTER TABLE ONLY public.classificacoes DROP CONSTRAINT classificacoes_liga_id_time_id_temporada_id_jogador_id_fkey;
       public          cristiansto    false    236    245    245    236    3334    236    245    245    236            	           2606    16778 )   enderecos enderecos_cidadesCidade_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.enderecos
    ADD CONSTRAINT "enderecos_cidadesCidade_id_fkey" FOREIGN KEY ("cidadesCidade_id") REFERENCES public.cidades(cidade_id) ON UPDATE CASCADE ON DELETE SET NULL;
 U   ALTER TABLE ONLY public.enderecos DROP CONSTRAINT "enderecos_cidadesCidade_id_fkey";
       public          cristiansto    false    220    3305    223            
           2606    16768 *   enderecos enderecos_pais_id_cidade_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.enderecos
    ADD CONSTRAINT enderecos_pais_id_cidade_id_fkey FOREIGN KEY (pais_id, cidade_id) REFERENCES public.paises_x_cidades(pais_id, cidade_id) ON UPDATE CASCADE ON DELETE RESTRICT;
 T   ALTER TABLE ONLY public.enderecos DROP CONSTRAINT enderecos_pais_id_cidade_id_fkey;
       public          cristiansto    false    223    221    221    3307    223                       2606    16773 &   enderecos enderecos_paisesPais_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.enderecos
    ADD CONSTRAINT "enderecos_paisesPais_id_fkey" FOREIGN KEY ("paisesPais_id") REFERENCES public.paises(pais_id) ON UPDATE CASCADE ON DELETE SET NULL;
 R   ALTER TABLE ONLY public.enderecos DROP CONSTRAINT "enderecos_paisesPais_id_fkey";
       public          cristiansto    false    218    3303    223                       2606    16783 "   estadios estadios_endereco_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.estadios
    ADD CONSTRAINT estadios_endereco_id_fkey FOREIGN KEY (endereco_id) REFERENCES public.enderecos(endereco_id) ON UPDATE CASCADE ON DELETE RESTRICT;
 L   ALTER TABLE ONLY public.estadios DROP CONSTRAINT estadios_endereco_id_fkey;
       public          cristiansto    false    3309    223    225                       2606    25885 L   estatisticas estatisticas_estatistica_jogador_id_estatistica_jogador_da_fkey    FK CONSTRAINT     7  ALTER TABLE ONLY public.estatisticas
    ADD CONSTRAINT estatisticas_estatistica_jogador_id_estatistica_jogador_da_fkey FOREIGN KEY (estatistica_jogador_id, estatistica_jogador_data) REFERENCES public.estatistica_jogadores(estatistica_jogador_id, estatistica_jogador_data) ON UPDATE CASCADE ON DELETE RESTRICT;
 v   ALTER TABLE ONLY public.estatisticas DROP CONSTRAINT estatisticas_estatistica_jogador_id_estatistica_jogador_da_fkey;
       public          cristiansto    false    235    242    3328    235    242                       2606    16858 &   estatisticas estatisticas_jogo_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.estatisticas
    ADD CONSTRAINT estatisticas_jogo_id_fkey FOREIGN KEY (jogo_id) REFERENCES public.jogos(jogo_id) ON UPDATE CASCADE ON DELETE RESTRICT;
 P   ALTER TABLE ONLY public.estatisticas DROP CONSTRAINT estatisticas_jogo_id_fkey;
       public          cristiansto    false    3321    234    235                       2606    25890 F   estatisticas estatisticas_liga_id_time_id_temporada_id_jogador_id_fkey    FK CONSTRAINT     6  ALTER TABLE ONLY public.estatisticas
    ADD CONSTRAINT estatisticas_liga_id_time_id_temporada_id_jogador_id_fkey FOREIGN KEY (liga_id, time_id, temporada_id, jogador_id) REFERENCES public.ligas_x_times_x_temporadas_x_jogadores(liga_id, time_id, temporada_id, jogador_id) ON UPDATE CASCADE ON DELETE RESTRICT;
 p   ALTER TABLE ONLY public.estatisticas DROP CONSTRAINT estatisticas_liga_id_time_id_temporada_id_jogador_id_fkey;
       public          cristiansto    false    245    235    245    245    3334    235    235    235    245                       2606    25850 .   jogadores jogadores_jogador_nascimento_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jogadores
    ADD CONSTRAINT jogadores_jogador_nascimento_id_fkey FOREIGN KEY (jogador_nascimento_id) REFERENCES public.jogadores_nascimentos(jogador_nascimento_id) ON UPDATE CASCADE ON DELETE RESTRICT;
 X   ALTER TABLE ONLY public.jogadores DROP CONSTRAINT jogadores_jogador_nascimento_id_fkey;
       public          cristiansto    false    3332    232    244                       2606    25845 :   jogadores_nascimentos jogadores_nascimentos_cidade_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jogadores_nascimentos
    ADD CONSTRAINT jogadores_nascimentos_cidade_id_fkey FOREIGN KEY (cidade_id) REFERENCES public.cidades(cidade_id) ON UPDATE CASCADE ON DELETE RESTRICT;
 d   ALTER TABLE ONLY public.jogadores_nascimentos DROP CONSTRAINT jogadores_nascimentos_cidade_id_fkey;
       public          cristiansto    false    3305    220    244                       2606    25840 8   jogadores_nascimentos jogadores_nascimentos_pais_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jogadores_nascimentos
    ADD CONSTRAINT jogadores_nascimentos_pais_id_fkey FOREIGN KEY (pais_id) REFERENCES public.paises(pais_id) ON UPDATE CASCADE ON DELETE RESTRICT;
 b   ALTER TABLE ONLY public.jogadores_nascimentos DROP CONSTRAINT jogadores_nascimentos_pais_id_fkey;
       public          cristiansto    false    3303    218    244                       2606    25880 8   jogos jogos_liga_id_time_id_temporada_id_jogador_id_fkey    FK CONSTRAINT     (  ALTER TABLE ONLY public.jogos
    ADD CONSTRAINT jogos_liga_id_time_id_temporada_id_jogador_id_fkey FOREIGN KEY (liga_id, time_id, temporada_id, jogador_id) REFERENCES public.ligas_x_times_x_temporadas_x_jogadores(liga_id, time_id, temporada_id, jogador_id) ON UPDATE CASCADE ON DELETE RESTRICT;
 b   ALTER TABLE ONLY public.jogos DROP CONSTRAINT jogos_liga_id_time_id_temporada_id_jogador_id_fkey;
       public          cristiansto    false    245    245    234    234    234    234    3334    245    245                       2606    16808    ligas ligas_pais_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.ligas
    ADD CONSTRAINT ligas_pais_id_fkey FOREIGN KEY (pais_id) REFERENCES public.paises(pais_id) ON UPDATE CASCADE ON DELETE RESTRICT;
 B   ALTER TABLE ONLY public.ligas DROP CONSTRAINT ligas_pais_id_fkey;
       public          cristiansto    false    231    3303    218                       2606    25875 ]   ligas_x_times_x_temporadas_x_jogadores ligas_x_times_x_temporadas_x_jogadores_jogador_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.ligas_x_times_x_temporadas_x_jogadores
    ADD CONSTRAINT ligas_x_times_x_temporadas_x_jogadores_jogador_id_fkey FOREIGN KEY (jogador_id) REFERENCES public.jogadores(jogador_nome_id) ON UPDATE CASCADE ON DELETE RESTRICT;
 �   ALTER TABLE ONLY public.ligas_x_times_x_temporadas_x_jogadores DROP CONSTRAINT ligas_x_times_x_temporadas_x_jogadores_jogador_id_fkey;
       public          cristiansto    false    3319    245    232                       2606    25860 Z   ligas_x_times_x_temporadas_x_jogadores ligas_x_times_x_temporadas_x_jogadores_liga_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.ligas_x_times_x_temporadas_x_jogadores
    ADD CONSTRAINT ligas_x_times_x_temporadas_x_jogadores_liga_id_fkey FOREIGN KEY (liga_id) REFERENCES public.ligas(liga_id) ON UPDATE CASCADE ON DELETE RESTRICT;
 �   ALTER TABLE ONLY public.ligas_x_times_x_temporadas_x_jogadores DROP CONSTRAINT ligas_x_times_x_temporadas_x_jogadores_liga_id_fkey;
       public          cristiansto    false    231    3317    245                       2606    25870 _   ligas_x_times_x_temporadas_x_jogadores ligas_x_times_x_temporadas_x_jogadores_temporada_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.ligas_x_times_x_temporadas_x_jogadores
    ADD CONSTRAINT ligas_x_times_x_temporadas_x_jogadores_temporada_id_fkey FOREIGN KEY (temporada_id) REFERENCES public.temporadas(temporada_id) ON UPDATE CASCADE ON DELETE RESTRICT;
 �   ALTER TABLE ONLY public.ligas_x_times_x_temporadas_x_jogadores DROP CONSTRAINT ligas_x_times_x_temporadas_x_jogadores_temporada_id_fkey;
       public          cristiansto    false    3301    245    216                       2606    25865 Z   ligas_x_times_x_temporadas_x_jogadores ligas_x_times_x_temporadas_x_jogadores_time_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.ligas_x_times_x_temporadas_x_jogadores
    ADD CONSTRAINT ligas_x_times_x_temporadas_x_jogadores_time_id_fkey FOREIGN KEY (time_id) REFERENCES public.times(time_id) ON UPDATE CASCADE ON DELETE RESTRICT;
 �   ALTER TABLE ONLY public.ligas_x_times_x_temporadas_x_jogadores DROP CONSTRAINT ligas_x_times_x_temporadas_x_jogadores_time_id_fkey;
       public          cristiansto    false    245    227    3313                       2606    16748 0   paises_x_cidades paises_x_cidades_cidade_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.paises_x_cidades
    ADD CONSTRAINT paises_x_cidades_cidade_id_fkey FOREIGN KEY (cidade_id) REFERENCES public.cidades(cidade_id) ON UPDATE CASCADE ON DELETE RESTRICT;
 Z   ALTER TABLE ONLY public.paises_x_cidades DROP CONSTRAINT paises_x_cidades_cidade_id_fkey;
       public          cristiansto    false    220    3305    221                       2606    16743 .   paises_x_cidades paises_x_cidades_pais_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.paises_x_cidades
    ADD CONSTRAINT paises_x_cidades_pais_id_fkey FOREIGN KEY (pais_id) REFERENCES public.paises(pais_id) ON UPDATE CASCADE ON DELETE RESTRICT;
 X   ALTER TABLE ONLY public.paises_x_cidades DROP CONSTRAINT paises_x_cidades_pais_id_fkey;
       public          cristiansto    false    3303    218    221                       2606    16788    times times_pais_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.times
    ADD CONSTRAINT times_pais_id_fkey FOREIGN KEY (pais_id) REFERENCES public.paises(pais_id) ON UPDATE CASCADE ON DELETE RESTRICT;
 B   ALTER TABLE ONLY public.times DROP CONSTRAINT times_pais_id_fkey;
       public          cristiansto    false    3303    218    227                       2606    16793 $   treinadores treinadores_time_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.treinadores
    ADD CONSTRAINT treinadores_time_id_fkey FOREIGN KEY (time_id) REFERENCES public.times(time_id) ON UPDATE CASCADE ON DELETE RESTRICT;
 N   ALTER TABLE ONLY public.treinadores DROP CONSTRAINT treinadores_time_id_fkey;
       public          cristiansto    false    227    3313    229                       2606    25855 .   treinadores treinadores_treinador_nome_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.treinadores
    ADD CONSTRAINT treinadores_treinador_nome_id_fkey FOREIGN KEY (treinador_nome_id) REFERENCES public.treinador_nomes(treinador_nome_id) ON UPDATE CASCADE ON DELETE RESTRICT;
 X   ALTER TABLE ONLY public.treinadores DROP CONSTRAINT treinadores_treinador_nome_id_fkey;
       public          cristiansto    false    229    3327    240            �   �  x�}U[n\7��"����Hq��z�v`O�v��4�ém`pЕ�sx�@guk����>��M�ST-�P���\����
c-��d��V�]�U0d]�1C�-f>`.h�C�#��[E�? �o��
p}�i�_�9�y������������+*����ƚm@�er��t7,���u�CtL8��VV��27 N��]Ib��[�dhMp�A��EDZo/� �����t9y8���3���$c{�c��^�*�%��4=U�^q`�AT%��D,���<�N��¶1 o�\�*���Z�� Ć/�4j���z��<��F�76k����BѼ0�U:s-cD԰�qX�N$�mX�1h�����^<f��l�L!5;�x�M��`à�N��q���x�xyXO�/������3ʳ>��Tk%}�hI�&ݷkݨ}�Z~hm��m+���3�bT�ޠ�-����]3-�-����
M�g��)���T��������w�i�߸��w��el����b�FI4�i�g	dt5l�yϵ��m9�î�]z�^�β�$~�Y3�@�ҷ�X��J>����Z�c͇�����.��L�I��%MƅS�b2�4�<lϸ��M�Fz�'kM%5{��DVJ�\����#L��s�WP�m��{����r�,���F��1~��vK��l�,1k����,�^��w?P��H������&�rR�a�i��u˚#p�K=��5Â� � @<��vb�^������;Ws����:2�i�(�O��IKjM���k�2���Th=����)DXib[Y۱�1צN66�{Ԟ%�ю�n[W��=]�����0�l����,m^7�,�))@XQ4�P��fF9�f[5�YA�Z8��N��5�ù󘇈�����E� ��z�v|���s6�����ѳ�?�����m��      �   >   x�3�tN,.I���2�t)-,MUHIUpN��L,�2�H,�Wp*J�K��2��S �=... �C      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �   #  x�}�=j1��zt�=�����6��Bܦkc�
�v�6�4�h�����t��%:��6Ä����9�kh��_����}q��/�΀�����1�u���)����Ǡ���ͫ����|Y\L�x��f��v�g�W�!�C�3;j�٩`�>�i5��,�������
n!��o�ou�������%?
?��$�T�y���
�6��'�����Xj�Zn,��Kq\&���ѱTǵ�X�c5<��L��� 顖$=��A�C�$=��A�C-=HzP���c~ (�QN      �   �   x�}һC1D�XT���������'g
���&Ǜ��j[1_f��5��3m����	gZjx�B���y>���.�nͺ��֮[Y���{]s�9��7Ho��"�MzY�`uN�( R@��X����� ^�x	�%�� ^�x	����1i��      �      x������ � �      �      x��\Ko��v^s~ww�I׃�e���eK�Gm[���-Z����f�#��+$@y �]A`f��$�$�E�9E��YY��Uu���yWEZ{���.���e���?D:���6y�U�����fO@�-�*���'�m���U�ʡ��K���n}�m��>�%$�y���O�6�AO	&0^���*�/���v�@x�]�&}d7��C���w���6y���U�t����?kfV�=a)���MV5�B�#�6��t��;+!���ػNk2-z����xt��q�j����b��+��j�`VZ{,.�Ey������N>���ǟ@J���=l\jb�߰��mk��}�_���l#K�<��5��Hk⩦�?�_U�n��#�h��%���8]�%g�W <��2^��e����#mIE��;B쀲��):��$��2H<9c��='Uj�U�=�'��6/r`��=y��|[W-��$��i�+��d��.����r��v�ZF�����鲙���Ɓ7/��sZ��ڳ��eH�Y�!�86�[32u{|~���w6����G�Y�(<����l�=#���(Ϟ�N>ў'��������MY�u��/����E�Ԩ�����2mN�e��J�������d�MO��$�Ux�*�~Nי+�NYY�Y��?dU��e��\Q Btb[�7˫|����t[MXZ�H��F����B�&�oY��*�댍��wۚb��!�����'� �:��8篕��q�a� ѿd�-��N���^�l�B	ڟ�X[��β�*��Fo����I��E���ϴbdG��Uz��V���&�"a�'�g���C�I��ۄt��Id�4Ѳ$����8��E�V�~q)M{��K�����~�$�)�Hb���[S�&����?|-,P�uff
���;`^������;�%����1�N�a+iZ�X�jM���WY����aC~.{a�(�ˬ�$������m������jy�b
���U)5b�bO�t�`c&߁F>��C�[�/;Q=aDɉ�9(Y^�y�Y�
.��;��kFUޟ���3h���S�?>��Z$4��v��,��k�m��X�@�ٗ��c���t����C�)�� [�������-�� �Qy��A�i+͑�Ls{��)Yz����\�g7i�w�d�,�^�_/n����D�Ä%�W֔�a��~���D��
�lu4���ޛb����Ft�-_�#�څ�F��Ko�v����-����H �h~?�\����?�<��c�+06o�%V���~��,�f0���gl���M�� ���j���g�g��|�m, X����`���g�I�a��(��@�|m%��c0���H��l����u�f�	��´���uN-�l㏋K��lTr�a<j�1��(����9:���ہ�+��Fr#���҄2:8�M�I׃�#,�V�V���ak���
G���10dG\��s�a㡚cr��,<I~?���,�� t��!��u��K�����ȗi�}�";���[OX[�S�u�:6�<s��@��`���6�|�1�C�Z�/���1S��a��l��k6����pP� �2��(�T�g��O��u>��L��	��������1����1(����|�~~	F)��{w���A<�
�4�i��i]�iK� W�5=l�#;����%���q�P��{tBQ;�9D��XRܻ�n�%�wZ�'؛�tM�0�w��SZl�EҒഔ�M�_�i��EhV
��YY��i���V|���KO�_K�3.�Y4m�SME	�Qd`�!NмU
�0rX;P�ןf�,{D�H��pɁ0X��1I���?{�n��+�+��e"�u���ꗯZ��m��$����D���|��
�/L���z�$�ۘ���Kb�&`�Ϋt�ɨߝȸ��hh����
5�8�O
0T$��(�nU�6�i�y����+��X�Y���p�Pf�2����0n$��AD��� 翀h��"��u
?���KM̬�v��F����ʛ5��Sw(m0/Ѣ�����.ʂ�X N�ծ�B99�� ���H��U{o�UnUE[�������"�E�N����&`x��`Q;~�;�W�_�ĥ�;��`�`O�T�C��V5Pq���n��3������້���D��*���륉�*#܂&R����0mY�7	➩왩{EI$C�:!�/�}��	ؐ4������5��wLD��o����|¡��jd�UY7������+����� +�?���ؠA��.��ru�����5�`���
�� c����H���d�^�L�KШ���� s~>���*�6�mü�@D�R�L���n?�:ޑ]���������,;{0�O�eˇ�B��sPX�%n,x#0HB���l��mg��i5��.+���Q_�ďqd �︉��!�bӵa�Կ)W�^�Y�[�I5�*�8N X'���h��#ǝ� �n��*�|��U�qr=���$y�}C���"��,�w'�8@�������k���[���тQ�`��ͧ�}�>��_�l��A�`�?�+���:{��M��ٖ�����=��L/�s�������?p�v�~s�C�ӽ �షi�u�1�c�s͗0˪���+~��0Ts�"-�}�irP���'z�r�`��#"��TViU����h̡���"/q��t>'�	��FR��i��	X�_�j��_@	�k�s����9Nr��L�]�1�c.��>��"V��SL�`v�d��� r�u��Uq�;`��OE�k\��s,f9bs�/y���G┈��P���=�
J]��=��� ��[�3�P���&��t��p������A@�j1�����=��[S�� �d�!��C�����1��s��t��%R`rֈNS�u�����fh7�a�����H��W�S�+���]��}<�ɵ��W�
�-���j5L�[�����<u'��~��i�10�q���k8X��_�0ϲʚՍ��w�]�L-l �!�>.�Ύo>���@�?�{��J� %;K��KC"�� )r�!��,B@�qT�����(*��g�A@�!b�r�8�5D�q�"�9""��8""^sD<D\p�[]��������h�8�XT�u�Nq��r:�c��tHV-�ߠ�up�!8�����X��c�C|�C�tH�u�x�U�t���X��� �n���q|������p6;:�������ng����-�����p6<:�������g��u�5��8��TIˬ$:����^3����^�N/�]�Μ^� P�����c��Dc�S���0g��a�&��a�#�0�9F�a.8F�a�p�ü��u���u�☈�&P�/�y�ģ(��q�Z�Z���g��ڴ�h�	��L�	Z�<���R�yH�$�&0qɒ>�cԠ��O+hAO��n2b�|�a8"frؑ#�3�����؋�ӪkJ��R��5��u+_��\�S�mME�����|��ɧl<�&�N��b1�k �v>�������5ÚrTIB������>�����u9-�r�9O13g(Q�3|h�%��Sd�&�<-�#P�v,�j��ˇ�Y��ē�)�X�hs�H�ڌ�!I��&Ek+�MV�$n	�U7��t�`Y���>t�n]D�����K�E?�}�̿�KXpF��	��W�5ݦ�8�|
�aK��0H^䩋�2�|Y��I4u����� ���w%N�T����`#н���'id�
7+����J�����@6������:�w˶�]}�C�&���8�s�[5|��Fgf��UWu��'���8p����*8�@�t`�ʟ�ʻ&��p���� �hҖ�2H�JW��?���cN�0e4p�a\���8S�iK��qr�8 �8L����)���0p#���i�n�p8�GC�6"��"����Y��k4�$�$ 
��,���gH�Ee�L���_��BD���=�&B �  :c�{����F�h���~��3<ԡ�g^�&���4��{��c�~(5w�bTZqb��Nǻ&�M	?�r
�@M�+��0���|<L6����j�U~I?��]��[ل\P�v�^ |�|+��)1�5�k�&e"4�x{��Z;Q�#�,�{�3��R����o�O { 8'W�X������y��%n�#����n9��:�'W��W�v;@nv�6��|����rñ@������4��x�g�	A���i]e#[s��`����|L��N��r0���^Iz�����z�a8�g�t��#��̮�J�z���b��`� �� ^g� S@�S���A%u�t��'￤�7���E
�J:H����@��On��Wu��0����͡�\��AN	��l��݁)���h5�U�\Vq�%���|pl�DD����:��?�X W,k$Ǝ�Ĵ���;%'�8��SRL�aʁ�q�v`r805��/x=�`�p	�� "H8�(!ځtec��kⶂ֊$B$�����B��CH�@�:=�D$Bb!��F�n�`�^4y���Ք�Xjk�R��tw�ڲ�ʤ"�cR�#x����r��^;x}8��>t�ݽN��/��Fn��$��^�Ҵ�?T�'�91:�J����+wwb�R�#*K�vݔ���*��zH�<�dOY���Q*�DKp~~2�z�Ljc}�LZ�3%�8�5?�~=d� ��Rs+Qr"z0�ߖ�/��#�^��ָ��pD�}e�hDF��rQ����1���1]��u�@�־�$	�@��w�t�o���� 1�b���0�N��| ����a�䄐�I'�pB+
08V9 ,���S1���i�J׃��ђܠc��	����5�)���8���8��8��b��mW-H
~�b�]�����%_�6�%�g�ʏ��HU��DOj����S��(x/�BW�N&~�Y����o�M��1��{}���������WAL���xv	t�2���� ��҈��MI},�&ߕ�8g���y������,��^ߗgy��ruX�oiX�2�AA��Mƃz���7	���G,.c�� O��g�L���ܲ5�M}�$�L��2�`��M8N{E�(��H&�8rP�"�m�5Q������G0�+�c.�n��Z �vLEw��d�<>�K�I��6���g8r��	�w^\�{L#��bw�,���J�I�ôW��^��b4dO��b�<m�f�QaXG������ޥ��� K��Un.��D��\91 QQ��EC.�J�m��3��1�m�ۦ�.WB�����b�7�L��["������N��v�,��G^�eM�Y���Շ0�����������
�@4�C~"� �����o�~�K����0?4���~�)8.��\=��ȤlK@����(�4:�X>��k~�,��OQ��m^�m�+C��M�PG1��(ɢ7h�}i�b3L2��l��	R
a����#�D넸W��"A�<?��C�6D�mP�>*��G�������2&��?7����2ϚݑG�'�s�B��D2P��P\4H��Ww�ˁ䡘���8N%X�#�Y%A�>$�]��&r����.�È�q����]j ���?eß�PX�Z&�Fi���
~N��M��6AG� K\].�iQ��#6B�t�C�vG���V�jQ���L��Y�}��2Q�*A7	L����~t=|�륪7�<��R՛j*_제ѱ���8�~X�dQ���)���>�J"2�%0	FۛG$Gu?���A۷�z��k|N�|8=������~�
�16U�U����t�D�O*�949Tl>�bz�M~c��&_�x��T�\���g���E�\��Ɋ쾭���|��ѻ�����pM�����hh��U8�
 ���(8�ΫH`Ε��b�UT���^pd�$HpG�X�o�)�l��Gt�';6�a�B�k��5.����.n.@�v9/*f6��>����3X�.ؑqE�9'G�rwZL���:4�~or��Be���b��K� wT�s%�pw}�{�98 ��?.RZ��+���t��^1�J��I�#�'�.��48�N��xUO��V� O�Af۰̄�>!Xu8L�]�w�뉶/��Q�R��Y" �|jp�m�j�f4>�'�W�P��UO�!B���6i�+�.IlD�W���u�K�>�B����dׄ1_\C\�np�ߡA��4o��ncs��+���7��U~�vm�i�l�"��3Hϝ�s�ý��Ł�\/�Lb\ySJח���%Z��|-/xn�Fs��Z�����R�l�eu�L��EM���y��D����JL�1OG�楠j�����b�w��P�۠��Zu~�Z&N�[ڥ�k�O:Gu� ,j���$#t�\�K]y�7Ny'���\P���h9��/�������Sg#4oD6�AsZ55�/=�S4u���p@��;a�/�ז{m8G�2]5�3}p���k�&SC���]`|ٲ�۴xYÁ!�Z!FJ�v�7��|��2|����U�<�Pٰ�\�eOZ;�9,Z�$^�&2��:���,��a����wc�@4����LF:�X!l���k���/�F�un��bYֵ[H��a�.YXb(9 Ǣ?�cF=�>!kf�+� �w6KL�eV��H�㚱kh\��%����L��q3'J7z��B�N�$����(Z�8����J@poI���E}��8� �njE�Ut���R�a��
G�3l�5>��)|��Mhw�y���<cAD����!�J>4d0R�0©���e��B�x��#��"���f��	�%�5"����}y�΄��V;�_�j�N�˶ هOOyO��ն�tH������s�����?�h'�)      �      x������ � �      �   ?  x�EV�v�}����������Khl���"@�1G�����]N��C�jKVi�m�&�A�F�d�#��v �w�iR��sؙq p��a��ܩ>���62�h��{5��ǀWݻ^s�`�qB��i��dg���*��h����闪i��ވRuq�Ԕ.���s�N��P:c/ ��N��4e/�TW�u@?ً�Mw�t��X�yhJ�6���3{	lw�0�5���^���%�<Jme>�.}���FBJ'<�6_
�o<���t�#�誳��ҌG�ѹ$f�K��Ʋ��'CiΣ���z�'|�\�(���5M��kz�	�M/��4]�?�O7����=(��iC��Mme�������4��}ۃَ��c��U��9������U+��RrV�p��q >R����:*�|� |�7I��' ����`�oݡ2G��s�L�W�>h�� ����W��~6{� ���CQͧ�i~��Z�g�4���>��╃��������!͛�J��s=�/���h�^���nɡOO�Y=�9���;�'����3�!̺w��sѓS�Q�ӎ�1e��dc�}��5�	eں��9GC wU��f@e�l�ш2s���Q�s�S洆�l�Q �/x6�(��Е�n��r�B��
���L��l8�i�Lkh����>�>-6<
<��G�%�=Zt5��N�=�G�um^�ا��n�q.ۢ��xR�LP����?�?x<������1�S��|���VUw�K���ZwL�jZ��{���J��B1����c���;	x�8��z��K#��|�8�����9�-mc?-���xL��I���1-��||�8Nh� �	'C������VR���RNF@�m/�V'>�̡W�Վ�@.^��$��&ouݴr��9���^�^VW%'cZuj�w�δ�sӺ��'����w�z	9b�R_��o@^���5m8|2����+�/߮`b��:::gڞ�z������|�ExǴ��#x�R�:�O|Y��ȃ��z]
F���p j
�^[g�r~fw%�M�5�Ou52�h�o��� h/�}O�ܡ��5xת�r�AS8���69b,|�O�0��u���y ���/u���G/@z'��V}���H5|�*�@4m,X�ь�g�����;m�{��V����
��M$��x���[۳�" H��3bޢ��J��<C�w��Wf���]�H�w(�|�GÿC@���OIm�@�Bu'3�8%�-�aD�Ѷ�� j^H�py��A�<�r���s�NS�LBϋ
��o�D]p�vH<d� ]i�t!����`�?'S����%�b$�o��&��wBЋN&��'�ЈH4�!�}��&29/�L����"����.e/PHz�~��e,�zC�KU?�t�h�zyQ�?^��J�G�D���7��:�?_J{P��
A�ˮ6R�9�ėx���Jp����3�������/����������� ��ڴ�ԗi0��nh�!�{��}��)>�	�`��������J>:48���^�n%y��	������?��爽,      �      x������ � �      �   N   x�̹�0��[��H����:,FȠ�U�C���A�`fh���ap�DR�(���B�,��F��P6w�����{��#�      �      x�e��n�H�@��Wpսʆ���%E=�ԣ$�.f��+)RÇ������3��A/
���؜A�.4
(C�d��`6�^����i����w�NO�ce~�c��L�R���Y��]�Y�r1+�s��̍���8�t��BD?t��*U����:�c���Ro�g-��b��8ä:ĩN#�k���:�7ʛr!��[���m\9+�yU%�]v�6��:��C�m4�--3��ʟ���h�������(ׇ�<1Z�p�	�<NKlO�c�|�6��`��z��v_���0���s��M��}o�f�{�6n�LtoDI1�l��n��	���lP�\��+�>.y�]b�M̉w7]<2�ͦ3�d������ͣ5k9�� y�\����+������ˉ��H��8��o�"h���5z$ʛe/�&���:s]�F��`�61�E�ƚ{ދ5˞]�綮�0K���<�B�A�*�V6V�n��+�<���V�eq��|���]��Ӳښ�ޭ��J�}�e<q�I!��w����"����3�(�ZٸO�֍�b�=�2�%I��y�?n�ʙ��D�#1g�U���eq�'���M'����z�I�*VO��k��BE�H0��v��<�^b��|�n��!����`궻�ϼ�:<U�M�1��q�Q��u��_��-�&&I2kj�v�ߺ�?n�A�䵪����P�yU�{�m��ݎ�M^V,S�i�m����Ip�ڪ�f�u��t�z���w$`��鴪si�v�[Z�*�V��8�7�4�^u����έ��-$d��n���k�[��h�~�n8Qvx:�.�O�릳Nc�@���d��Y�����Ƚn9�G�P�S_�>.&u������b/�8K]��fܒ4��v������	o� �\"Ho��_�����w}��֙��7m2Z��+g��U.m����n�|����6��۔P�dW���M����n��N�MV+Jۮ���'r�n]B��v��,)��m�C�{�L�]L��Q`>r�]�ߨ�x�K�9�^�?��.��c�ԅ<�n��o���ٖ^��\9wjS�s:`�M�	�ŭ�K���->����/9����d�@������?9M E7QŎr���v��]d�����.�U6���u���I���J�}�zCj^"��9D��-uP�rU�M�� ��r���+���x�p�?]+3qo68=���֎Br��i�fJyK��*po[�b��cg�-��Q��&���
��7UI��I[�����s�뮲!�>��f�1,�N�v*���#���*V�ms�+�	�9
��que�0HT=�dz^5�yr�'c��5'�J������/cPobK�ٸj;�����Ȃ�U�ԑ��%*�	�h1`N^u/���� @J3W�j����;����7��mbH�^�����4��`�۶�4@�@=e�y�Q�=Ā�Q�1m�*��@C����|�^���'.���ڠ���Y�ډ(Ib]x�iE�D4�:�<�6_]&<�Ԁƀ���r��@@�^�d&�)�ˠ�9;�G��!�3����S��9LJu����fY$�K���?���S�J�p��da��N���ZȝXV�Ґ%Փ�҃����/B&���ie��=2�w*�rDFȀ-�>fډ8��E�%���8AҨ�-K�p�Z lҶ頴�<��R����R���@��I���	��)F��g������m�U{$q*�+V�&�[U�d���
?�d�&K���g�b�2<U/B5@#����Kr�aU��`1�.Μ���3�����=I`D:e~��GRA�B�6�v�b$��'BѪ�ɂ2ȶ4�p�Q����dX�:K��5� 3���Ɗ�k�d20�jG�A���To�G6$z#��x
�kt$LUQ�V:�&���F�G
���ζ���ڿHǀ8�fo��������m��
��~�*��c�u�cH�%�:���2϶*9��'��=�u]�t}!@�0�1�{We��,2��%ݧ���<��7*�:�S1�t�N?��w�,Щ��ϡ���t`r�f��κ��.�N��~���Ho�#>Ȣ�b��xOIT����釡�Ū��?=)V�$ kr}���Ai]A��׊�l��6�����8��֮�>��	Ac����1�?���x{v6A)�<޳p�<��@�d����nɋ��Et����ū��Όcs.c ��6�����g��WV酔�B�7'������(~��ekK��)�����A�0t0�!�ݹ��$.���w�hI��z�n��O�)Hb.�,�R	b���D	��uڅkLWN�����A�� ��ě���Ĵ[�����+IY�$����9�A%ÿn&�\��Ď.V���~�e�+gs�
�k����@?���?�E H/c����"���AB�qBʴ�?�7�]~?�����L��Pᓪ�]�бLL��|��c���$�7� �ڼʶ��V��O'i���P�An^I��#X���i�k���|b�R<e$�HW��-N���(�ٱ7d�+�Pc��	T���To��cs,\������0�̽-�	Y��B�)=�ͧ�FC��1�9uj͛/م7��ު�Oy�����-�bvQ�BcU"������w��h�Ft���{\Ǯ7�a��|����{�	]�b�u���6�:��9zBa�P�P��s_t��	m
�J�����2X�&��h�M�"T/ԕ,a^�ҠG��Xb#��)�I½���ˁ�~�~ӹ�h%�k�B;X�7��M�"ș��yO ���#�9l=�<�&�h�M8b��=�����^n���:�dH0��:N_���>�GB��y��*�ٗ�:���[?� ������2~� ���b�*��M�����©�O�	Z����ej'
X�-s8K����Ϭ������u��&�V>�ek���ܶ���Ž:�Ľ���6vƧl��JSe�74�Kr`��y���_%���g7ےyO:�x���_�� ����CG��0F�%��|c@cjv���-h���]�6%�]���[a�i��υ9]�S�F�T2}���G�G��'kVDwlv�V2YazG�=��KjN�4m�c��q�q(y�j{)黵,H.��h]ޟ�zXu�e �����o"�U��O�(<9��7b�$W�b�p�u���Xq����rR���u��V�'��P��:�Km.N�:`��~e�Yҗ�ٍ�Hu�P�K���x<�:1����&0�J�Ĉ`M �!K��E"�B���ZGN�l�a�U%/9�䉜^�E���Z*���$�a���]�{\5�� ��CQV�����\��:�&�hF�����n_�ؓcЮþ�	[� �+���m
�8? ���=�ghar,^��^D�������5��R9�0}ؼi!�)<��|�:r�$����8�[�Ɠ+i#pB������6Q%�������\�V?rP^g")���=s�`\*�!�0�N�P�n����	xЧ��w���&sfo�T�S�U����<0����1��%��X�O����JZe�ť�%��웾X���MrT��]��4^I�>��!><	�����-�a�h]�f�֋�Wse�Xmə�wI�OY?�y��
�=��.2zߦJ�}��t��-�uL �֕|��ܨ���V��vI��D��z�Z2�Hn���yq�߂>ۂ)V�\�D�:b�t[�e�5N1�b��a�����T�֦��7�E�v��2ˆ��Z���F�J����	L�U�pͫ�b��Q]�d�$	�NF�wQ����8��p�M��R��;�GJ���Ǿh����Q�lly�)ۋ������@��A�P��s�R&���t��mdm�T����G�1O.�y���Tq�%���4��Uʾ�<A���섥��!�|	dїݞTӟ���*k�쏸~�L��m� E�)F�^+cψN�j�Io�����2f[-9�Rԛ�SXn<f�7c���"�/��a�F/��~�=S�9�KK�fY^�.J���O���D�xȾhۙ�"�155|��j�alzz*���>�h��   �����U?�����, ?y��>e�Rl�F@Q՚c4�3�q�����'hn�>���U�`iv�6}I2�c�uAy�\g�H\w��[�o�si�4��=�o��i8~$��5�YG�7#������]��*�.�-iq@)'�u��!& A����8O� @h� {^�W�&�c��X@�F���i���ly�(V��K��6��%%:r���G4R��BFD��XI\�d���x�(�Ѩ?"���$�f&���$$���׶�X��@fe-�RrXoMh�k��r-���r�����[EQԩ3��z���GV>|�f)LYeR����TvOj�b�UiH�Lgeqy�Lz��S���M��|@�0�w;&ݫl�.�2�[�K/�q�,4�}ddO�ו]�.�rz�.�xSo.����yƲ�jue���|Q���gMx��N�涋_̧�.�g��,�(5�f����tJ� 7ì���&�K�)�Y 8�̜by��G�l(g�� �?y�t69���?��3�[��QKTa��N�I=fC�}�J�Fl��D�Bs����/�������9�˕.-�L�ͷ�|*�Z0{><��W����N�9SD9hY{�7gj㍹��h���Q��O�-��Sz����֭l*���80����������h"��;���˞�<���� \z����C�)u<��ই��w?y��,�@�^f���ޞDz
�1ۑ�\�O�6�ԯa7�d9ȓ4-��S/�x�����e�G�4�Q�U��/mpι�"����B�tm8��X�|k���!��>����GVR�3h�u����l�VQ��}]Ξ���R�v��^���A�O�y`�����AN̆��ޘ~�����1���`�ً��H�G���Џ�wm�k�M��{!�������R��I�iVփ���s�gU�������P��av�e9B*V�9���|�ѐ���uq���h�s�rd��??`���6�T	�x�ׄ�G��W�Ӧ�75�]Vho@��a�o��pGڵ�4�@˔��͚mg��9k=�'d�!��\^HB�kc6�bs�-U��\�=l�y��S�WRV[��+[�6�6�e������7���D��8�o~��o�}�����Of}��-��N���2.�����埰P|�+ڃ9iދg��ʰ-_���C�n������i�I�E��"%G^7�[�8����2$ܯ�y����?����MQ�,Zˢ$ʣd�!�7�Eڕ�Tʗ�LΥōRxp�b�ct,_�Dk��W�\�b���_\��t\`      �      x������ � �      �      x������ � �     