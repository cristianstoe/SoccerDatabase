/*
  Warnings:

  - You are about to drop the `EstadiosBrasil` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `EstatisticasJogadoresSerieA2022` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `JogadoresSerieA2022` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `PartidasSerieA2022` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `TimesSerieA2022` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "EstatisticasJogadoresSerieA2022" DROP CONSTRAINT "EstatisticasJogadoresSerieA2022_id_jogador_fkey";

-- DropForeignKey
ALTER TABLE "JogadoresSerieA2022" DROP CONSTRAINT "JogadoresSerieA2022_id_time_fkey";

-- DropForeignKey
ALTER TABLE "PartidasSerieA2022" DROP CONSTRAINT "PartidasSerieA2022_estadio_id_fkey";

-- DropTable
DROP TABLE "EstadiosBrasil";

-- DropTable
DROP TABLE "EstatisticasJogadoresSerieA2022";

-- DropTable
DROP TABLE "JogadoresSerieA2022";

-- DropTable
DROP TABLE "PartidasSerieA2022";

-- DropTable
DROP TABLE "TimesSerieA2022";

-- CreateTable
CREATE TABLE "temporadas" (
    "temporada_id" INTEGER NOT NULL,
    "temporada_ano" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "temporadas_pkey" PRIMARY KEY ("temporada_id")
);

-- CreateTable
CREATE TABLE "liga_tipo" (
    "liga_tipo_id" SERIAL NOT NULL,
    "liga_tipo_nome" TEXT NOT NULL,

    CONSTRAINT "liga_tipo_pkey" PRIMARY KEY ("liga_tipo_id")
);

-- CreateTable
CREATE TABLE "paises" (
    "pais_id" SERIAL NOT NULL,
    "pais_nome" TEXT NOT NULL,
    "pais_sigla" CHAR(2) NOT NULL,

    CONSTRAINT "paises_pkey" PRIMARY KEY ("pais_id")
);

-- CreateTable
CREATE TABLE "cidades" (
    "cidade_id" SERIAL NOT NULL,

    CONSTRAINT "cidades_pkey" PRIMARY KEY ("cidade_id")
);

-- CreateTable
CREATE TABLE "paises_x_cidades" (
    "pais_id" INTEGER NOT NULL,
    "cidade_id" INTEGER NOT NULL,

    CONSTRAINT "paises_x_cidades_pkey" PRIMARY KEY ("pais_id","cidade_id")
);

-- CreateTable
CREATE TABLE "jogador_nascimento" (
    "jogador_nascimento_id" SERIAL NOT NULL,
    "jogador_nascimento_data" TIMESTAMP(3) NOT NULL,
    "pais_id" INTEGER NOT NULL,
    "cidade_id" INTEGER NOT NULL,

    CONSTRAINT "jogador_nascimento_pkey" PRIMARY KEY ("jogador_nascimento_id")
);

-- CreateTable
CREATE TABLE "jogador_nomes" (
    "jogador_nome_id" SERIAL NOT NULL,
    "jogador_primeiro_nome" TEXT NOT NULL,
    "jogador_segundo_nome" TEXT NOT NULL,
    "jogador_idade" TEXT NOT NULL,
    "jogador_nascimento_id" INTEGER NOT NULL,

    CONSTRAINT "jogador_nomes_pkey" PRIMARY KEY ("jogador_nome_id")
);

-- CreateTable
CREATE TABLE "enderecos" (
    "endereco_id" SERIAL NOT NULL,
    "endereco" TEXT NOT NULL,
    "pais_id" INTEGER NOT NULL,
    "cidade_id" INTEGER NOT NULL,
    "paisesPais_id" INTEGER,
    "cidadesCidade_id" INTEGER,

    CONSTRAINT "enderecos_pkey" PRIMARY KEY ("endereco_id")
);

-- CreateTable
CREATE TABLE "estadios" (
    "estadio_id" SERIAL NOT NULL,
    "estadio_nome" TEXT NOT NULL,
    "estadio_capacidade" INTEGER NOT NULL,
    "endereco_id" INTEGER NOT NULL,

    CONSTRAINT "estadios_pkey" PRIMARY KEY ("estadio_id")
);

-- CreateTable
CREATE TABLE "times" (
    "time_id" SERIAL NOT NULL,
    "time_nome" TEXT NOT NULL,
    "pais_id" INTEGER NOT NULL,

    CONSTRAINT "times_pkey" PRIMARY KEY ("time_id")
);

-- CreateTable
CREATE TABLE "treinadores" (
    "treinador_id" SERIAL NOT NULL,
    "treinador_nome_id" INTEGER NOT NULL,
    "time_id" INTEGER NOT NULL,

    CONSTRAINT "treinadores_pkey" PRIMARY KEY ("treinador_id")
);

-- CreateTable
CREATE TABLE "ligas" (
    "liga_id" SERIAL NOT NULL,
    "liga_nome" TEXT NOT NULL,
    "liga_tipo_id" INTEGER NOT NULL,
    "pais_id" INTEGER NOT NULL,

    CONSTRAINT "ligas_pkey" PRIMARY KEY ("liga_id")
);

-- CreateTable
CREATE TABLE "ligas_x_times_x_temporadas" (
    "liga_id" INTEGER NOT NULL,
    "time_id" INTEGER NOT NULL,
    "temporada_id" INTEGER NOT NULL,

    CONSTRAINT "ligas_x_times_x_temporadas_pkey" PRIMARY KEY ("liga_id","time_id","temporada_id")
);

-- CreateTable
CREATE TABLE "jogadores" (
    "jogador_id" SERIAL NOT NULL,
    "jogador_nome_id" INTEGER NOT NULL,
    "liga_id" INTEGER NOT NULL,
    "time_id" INTEGER NOT NULL,
    "temporada_id" INTEGER NOT NULL,
    "timesTime_id" INTEGER,

    CONSTRAINT "jogadores_pkey" PRIMARY KEY ("jogador_id")
);

-- CreateTable
CREATE TABLE "jogos" (
    "jogo_id" SERIAL NOT NULL,
    "jogo_data" TIMESTAMP(3) NOT NULL,
    "jogo_fuso_horario" TIMESTAMP(3) NOT NULL,
    "liga_id" INTEGER NOT NULL,
    "time_id" INTEGER NOT NULL,
    "temporada_id" INTEGER NOT NULL,

    CONSTRAINT "jogos_pkey" PRIMARY KEY ("jogo_id")
);

-- CreateTable
CREATE TABLE "estatisticas" (
    "estatistica_jogador_id" SERIAL NOT NULL,
    "liga_id" INTEGER NOT NULL,
    "time_id" INTEGER NOT NULL,
    "temporada_id" INTEGER NOT NULL,
    "jogo_id" INTEGER NOT NULL,

    CONSTRAINT "estatisticas_pkey" PRIMARY KEY ("estatistica_jogador_id")
);

-- CreateTable
CREATE TABLE "classificacoes" (
    "liga_id" INTEGER NOT NULL,
    "time_id" INTEGER NOT NULL,
    "temporada_id" INTEGER NOT NULL,
    "classificacao_valor" INTEGER NOT NULL,

    CONSTRAINT "classificacoes_pkey" PRIMARY KEY ("liga_id","time_id","temporada_id")
);

-- AddForeignKey
ALTER TABLE "paises_x_cidades" ADD CONSTRAINT "paises_x_cidades_pais_id_fkey" FOREIGN KEY ("pais_id") REFERENCES "paises"("pais_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "paises_x_cidades" ADD CONSTRAINT "paises_x_cidades_cidade_id_fkey" FOREIGN KEY ("cidade_id") REFERENCES "cidades"("cidade_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "jogador_nascimento" ADD CONSTRAINT "jogador_nascimento_pais_id_fkey" FOREIGN KEY ("pais_id") REFERENCES "paises"("pais_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "jogador_nascimento" ADD CONSTRAINT "jogador_nascimento_cidade_id_fkey" FOREIGN KEY ("cidade_id") REFERENCES "cidades"("cidade_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "jogador_nomes" ADD CONSTRAINT "jogador_nomes_jogador_nascimento_id_fkey" FOREIGN KEY ("jogador_nascimento_id") REFERENCES "jogador_nascimento"("jogador_nascimento_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "enderecos" ADD CONSTRAINT "enderecos_pais_id_cidade_id_fkey" FOREIGN KEY ("pais_id", "cidade_id") REFERENCES "paises_x_cidades"("pais_id", "cidade_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "enderecos" ADD CONSTRAINT "enderecos_paisesPais_id_fkey" FOREIGN KEY ("paisesPais_id") REFERENCES "paises"("pais_id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "enderecos" ADD CONSTRAINT "enderecos_cidadesCidade_id_fkey" FOREIGN KEY ("cidadesCidade_id") REFERENCES "cidades"("cidade_id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "estadios" ADD CONSTRAINT "estadios_endereco_id_fkey" FOREIGN KEY ("endereco_id") REFERENCES "enderecos"("endereco_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "times" ADD CONSTRAINT "times_pais_id_fkey" FOREIGN KEY ("pais_id") REFERENCES "paises"("pais_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "treinadores" ADD CONSTRAINT "treinadores_time_id_fkey" FOREIGN KEY ("time_id") REFERENCES "times"("time_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "treinadores" ADD CONSTRAINT "treinadores_treinador_nome_id_fkey" FOREIGN KEY ("treinador_nome_id") REFERENCES "jogador_nomes"("jogador_nome_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ligas" ADD CONSTRAINT "ligas_liga_tipo_id_fkey" FOREIGN KEY ("liga_tipo_id") REFERENCES "liga_tipo"("liga_tipo_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ligas" ADD CONSTRAINT "ligas_pais_id_fkey" FOREIGN KEY ("pais_id") REFERENCES "paises"("pais_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ligas_x_times_x_temporadas" ADD CONSTRAINT "ligas_x_times_x_temporadas_liga_id_fkey" FOREIGN KEY ("liga_id") REFERENCES "ligas"("liga_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ligas_x_times_x_temporadas" ADD CONSTRAINT "ligas_x_times_x_temporadas_time_id_fkey" FOREIGN KEY ("time_id") REFERENCES "times"("time_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ligas_x_times_x_temporadas" ADD CONSTRAINT "ligas_x_times_x_temporadas_temporada_id_fkey" FOREIGN KEY ("temporada_id") REFERENCES "temporadas"("temporada_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "jogadores" ADD CONSTRAINT "jogadores_jogador_nome_id_fkey" FOREIGN KEY ("jogador_nome_id") REFERENCES "jogador_nomes"("jogador_nome_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "jogadores" ADD CONSTRAINT "jogadores_liga_id_time_id_temporada_id_fkey" FOREIGN KEY ("liga_id", "time_id", "temporada_id") REFERENCES "ligas_x_times_x_temporadas"("liga_id", "time_id", "temporada_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "jogadores" ADD CONSTRAINT "jogadores_timesTime_id_fkey" FOREIGN KEY ("timesTime_id") REFERENCES "times"("time_id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "jogos" ADD CONSTRAINT "jogos_liga_id_time_id_temporada_id_fkey" FOREIGN KEY ("liga_id", "time_id", "temporada_id") REFERENCES "ligas_x_times_x_temporadas"("liga_id", "time_id", "temporada_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "estatisticas" ADD CONSTRAINT "estatisticas_estatistica_jogador_id_fkey" FOREIGN KEY ("estatistica_jogador_id") REFERENCES "jogadores"("jogador_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "estatisticas" ADD CONSTRAINT "estatisticas_liga_id_time_id_temporada_id_fkey" FOREIGN KEY ("liga_id", "time_id", "temporada_id") REFERENCES "ligas_x_times_x_temporadas"("liga_id", "time_id", "temporada_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "estatisticas" ADD CONSTRAINT "estatisticas_jogo_id_fkey" FOREIGN KEY ("jogo_id") REFERENCES "jogos"("jogo_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "classificacoes" ADD CONSTRAINT "classificacoes_liga_id_time_id_temporada_id_fkey" FOREIGN KEY ("liga_id", "time_id", "temporada_id") REFERENCES "ligas_x_times_x_temporadas"("liga_id", "time_id", "temporada_id") ON DELETE RESTRICT ON UPDATE CASCADE;
