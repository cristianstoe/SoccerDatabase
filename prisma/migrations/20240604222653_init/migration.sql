/*
  Warnings:

  - The primary key for the `classificacoes` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `estatisticas` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `jogadores` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `jogador_id` on the `jogadores` table. All the data in the column will be lost.
  - You are about to drop the column `liga_id` on the `jogadores` table. All the data in the column will be lost.
  - You are about to drop the column `temporada_id` on the `jogadores` table. All the data in the column will be lost.
  - You are about to drop the column `time_id` on the `jogadores` table. All the data in the column will be lost.
  - You are about to drop the column `timesTime_id` on the `jogadores` table. All the data in the column will be lost.
  - You are about to drop the `jogador_nascimento` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `jogador_nomes` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `ligas_x_times_x_temporadas` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `cidade_nome` to the `cidades` table without a default value. This is not possible if the table is not empty.
  - Added the required column `jogador_id` to the `classificacoes` table without a default value. This is not possible if the table is not empty.
  - Added the required column `estatistica_jogador_data` to the `estatisticas` table without a default value. This is not possible if the table is not empty.
  - Added the required column `jogador_id` to the `estatisticas` table without a default value. This is not possible if the table is not empty.
  - Added the required column `jogador_idade` to the `jogadores` table without a default value. This is not possible if the table is not empty.
  - Added the required column `jogador_nascimento_id` to the `jogadores` table without a default value. This is not possible if the table is not empty.
  - Added the required column `jogador_primeiro_nome` to the `jogadores` table without a default value. This is not possible if the table is not empty.
  - Added the required column `jogador_segundo_nome` to the `jogadores` table without a default value. This is not possible if the table is not empty.
  - Added the required column `jogador_id` to the `jogos` table without a default value. This is not possible if the table is not empty.
  - Changed the type of `temporada_ano` on the `temporadas` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.

*/
-- DropForeignKey
ALTER TABLE "classificacoes" DROP CONSTRAINT "classificacoes_liga_id_time_id_temporada_id_fkey";

-- DropForeignKey
ALTER TABLE "estatisticas" DROP CONSTRAINT "estatisticas_estatistica_jogador_id_fkey";

-- DropForeignKey
ALTER TABLE "estatisticas" DROP CONSTRAINT "estatisticas_liga_id_time_id_temporada_id_fkey";

-- DropForeignKey
ALTER TABLE "jogador_nascimento" DROP CONSTRAINT "jogador_nascimento_cidade_id_fkey";

-- DropForeignKey
ALTER TABLE "jogador_nascimento" DROP CONSTRAINT "jogador_nascimento_pais_id_fkey";

-- DropForeignKey
ALTER TABLE "jogador_nomes" DROP CONSTRAINT "jogador_nomes_jogador_nascimento_id_fkey";

-- DropForeignKey
ALTER TABLE "jogadores" DROP CONSTRAINT "jogadores_jogador_nome_id_fkey";

-- DropForeignKey
ALTER TABLE "jogadores" DROP CONSTRAINT "jogadores_liga_id_time_id_temporada_id_fkey";

-- DropForeignKey
ALTER TABLE "jogadores" DROP CONSTRAINT "jogadores_timesTime_id_fkey";

-- DropForeignKey
ALTER TABLE "jogos" DROP CONSTRAINT "jogos_liga_id_time_id_temporada_id_fkey";

-- DropForeignKey
ALTER TABLE "ligas_x_times_x_temporadas" DROP CONSTRAINT "ligas_x_times_x_temporadas_liga_id_fkey";

-- DropForeignKey
ALTER TABLE "ligas_x_times_x_temporadas" DROP CONSTRAINT "ligas_x_times_x_temporadas_temporada_id_fkey";

-- DropForeignKey
ALTER TABLE "ligas_x_times_x_temporadas" DROP CONSTRAINT "ligas_x_times_x_temporadas_time_id_fkey";

-- DropForeignKey
ALTER TABLE "treinadores" DROP CONSTRAINT "treinadores_treinador_nome_id_fkey";

-- AlterTable
ALTER TABLE "cidades" ADD COLUMN     "cidade_nome" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "classificacoes" DROP CONSTRAINT "classificacoes_pkey",
ADD COLUMN     "jogador_id" INTEGER NOT NULL,
ADD CONSTRAINT "classificacoes_pkey" PRIMARY KEY ("liga_id", "time_id", "temporada_id", "jogador_id");

-- AlterTable
ALTER TABLE "estatisticas" DROP CONSTRAINT "estatisticas_pkey",
ADD COLUMN     "estatistica_jogador_data" TIMESTAMP(3) NOT NULL,
ADD COLUMN     "jogador_id" INTEGER NOT NULL,
ALTER COLUMN "estatistica_jogador_id" DROP DEFAULT,
ADD CONSTRAINT "estatisticas_pkey" PRIMARY KEY ("estatistica_jogador_id", "estatistica_jogador_data");
DROP SEQUENCE "estatisticas_estatistica_jogador_id_seq";

-- AlterTable
CREATE SEQUENCE jogadores_jogador_nome_id_seq;
ALTER TABLE "jogadores" DROP CONSTRAINT "jogadores_pkey",
DROP COLUMN "jogador_id",
DROP COLUMN "liga_id",
DROP COLUMN "temporada_id",
DROP COLUMN "time_id",
DROP COLUMN "timesTime_id",
ADD COLUMN     "jogador_idade" TEXT NOT NULL,
ADD COLUMN     "jogador_nascimento_id" INTEGER NOT NULL,
ADD COLUMN     "jogador_primeiro_nome" TEXT NOT NULL,
ADD COLUMN     "jogador_segundo_nome" TEXT NOT NULL,
ALTER COLUMN "jogador_nome_id" SET DEFAULT nextval('jogadores_jogador_nome_id_seq'),
ADD CONSTRAINT "jogadores_pkey" PRIMARY KEY ("jogador_nome_id");
ALTER SEQUENCE jogadores_jogador_nome_id_seq OWNED BY "jogadores"."jogador_nome_id";

-- AlterTable
ALTER TABLE "jogos" ADD COLUMN     "jogador_id" INTEGER NOT NULL;

-- AlterTable
CREATE SEQUENCE temporadas_temporada_id_seq;
ALTER TABLE "temporadas" ALTER COLUMN "temporada_id" SET DEFAULT nextval('temporadas_temporada_id_seq'),
DROP COLUMN "temporada_ano",
ADD COLUMN     "temporada_ano" INTEGER NOT NULL;
ALTER SEQUENCE temporadas_temporada_id_seq OWNED BY "temporadas"."temporada_id";

-- DropTable
DROP TABLE "jogador_nascimento";

-- DropTable
DROP TABLE "jogador_nomes";

-- DropTable
DROP TABLE "ligas_x_times_x_temporadas";

-- CreateTable
CREATE TABLE "treinador_nomes" (
    "treinador_nome_id" SERIAL NOT NULL,
    "treinador_nome" TEXT NOT NULL,

    CONSTRAINT "treinador_nomes_pkey" PRIMARY KEY ("treinador_nome_id")
);

-- CreateTable
CREATE TABLE "estatistica_jogadores" (
    "estatistica_jogador_id" SERIAL NOT NULL,
    "estatistica_jogador_data" TIMESTAMP(3) NOT NULL,
    "estatistica_jogador_numero_jogos" INTEGER NOT NULL,
    "estatistica_jogador_chutes" INTEGER NOT NULL,
    "estatistica_jogador_gols" INTEGER NOT NULL,
    "estatistica_jogador_passes" INTEGER NOT NULL,
    "estatistica_jogador_faltas" INTEGER NOT NULL,
    "estatistica_jogador_dribles" INTEGER NOT NULL,
    "estatistica_jogador_cartoes" INTEGER NOT NULL,

    CONSTRAINT "estatistica_jogadores_pkey" PRIMARY KEY ("estatistica_jogador_id")
);

-- CreateTable
CREATE TABLE "jogadores_nascimentos" (
    "jogador_nascimento_id" SERIAL NOT NULL,
    "jogador_nascimento_data" TIMESTAMP(3) NOT NULL,
    "pais_id" INTEGER NOT NULL,
    "cidade_id" INTEGER NOT NULL,

    CONSTRAINT "jogadores_nascimentos_pkey" PRIMARY KEY ("jogador_nascimento_id")
);

-- CreateTable
CREATE TABLE "ligas_x_times_x_temporadas_x_jogadores" (
    "liga_id" INTEGER NOT NULL,
    "time_id" INTEGER NOT NULL,
    "temporada_id" INTEGER NOT NULL,
    "jogador_id" INTEGER NOT NULL,

    CONSTRAINT "ligas_x_times_x_temporadas_x_jogadores_pkey" PRIMARY KEY ("liga_id","time_id","temporada_id","jogador_id")
);

-- CreateIndex
CREATE UNIQUE INDEX "estatistica_jogadores_estatistica_jogador_id_estatistica_jo_key" ON "estatistica_jogadores"("estatistica_jogador_id", "estatistica_jogador_data");

-- AddForeignKey
ALTER TABLE "jogadores_nascimentos" ADD CONSTRAINT "jogadores_nascimentos_pais_id_fkey" FOREIGN KEY ("pais_id") REFERENCES "paises"("pais_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "jogadores_nascimentos" ADD CONSTRAINT "jogadores_nascimentos_cidade_id_fkey" FOREIGN KEY ("cidade_id") REFERENCES "cidades"("cidade_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "jogadores" ADD CONSTRAINT "jogadores_jogador_nascimento_id_fkey" FOREIGN KEY ("jogador_nascimento_id") REFERENCES "jogadores_nascimentos"("jogador_nascimento_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "treinadores" ADD CONSTRAINT "treinadores_treinador_nome_id_fkey" FOREIGN KEY ("treinador_nome_id") REFERENCES "treinador_nomes"("treinador_nome_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ligas_x_times_x_temporadas_x_jogadores" ADD CONSTRAINT "ligas_x_times_x_temporadas_x_jogadores_liga_id_fkey" FOREIGN KEY ("liga_id") REFERENCES "ligas"("liga_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ligas_x_times_x_temporadas_x_jogadores" ADD CONSTRAINT "ligas_x_times_x_temporadas_x_jogadores_time_id_fkey" FOREIGN KEY ("time_id") REFERENCES "times"("time_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ligas_x_times_x_temporadas_x_jogadores" ADD CONSTRAINT "ligas_x_times_x_temporadas_x_jogadores_temporada_id_fkey" FOREIGN KEY ("temporada_id") REFERENCES "temporadas"("temporada_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ligas_x_times_x_temporadas_x_jogadores" ADD CONSTRAINT "ligas_x_times_x_temporadas_x_jogadores_jogador_id_fkey" FOREIGN KEY ("jogador_id") REFERENCES "jogadores"("jogador_nome_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "jogos" ADD CONSTRAINT "jogos_liga_id_time_id_temporada_id_jogador_id_fkey" FOREIGN KEY ("liga_id", "time_id", "temporada_id", "jogador_id") REFERENCES "ligas_x_times_x_temporadas_x_jogadores"("liga_id", "time_id", "temporada_id", "jogador_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "estatisticas" ADD CONSTRAINT "estatisticas_estatistica_jogador_id_estatistica_jogador_da_fkey" FOREIGN KEY ("estatistica_jogador_id", "estatistica_jogador_data") REFERENCES "estatistica_jogadores"("estatistica_jogador_id", "estatistica_jogador_data") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "estatisticas" ADD CONSTRAINT "estatisticas_liga_id_time_id_temporada_id_jogador_id_fkey" FOREIGN KEY ("liga_id", "time_id", "temporada_id", "jogador_id") REFERENCES "ligas_x_times_x_temporadas_x_jogadores"("liga_id", "time_id", "temporada_id", "jogador_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "classificacoes" ADD CONSTRAINT "classificacoes_liga_id_time_id_temporada_id_jogador_id_fkey" FOREIGN KEY ("liga_id", "time_id", "temporada_id", "jogador_id") REFERENCES "ligas_x_times_x_temporadas_x_jogadores"("liga_id", "time_id", "temporada_id", "jogador_id") ON DELETE RESTRICT ON UPDATE CASCADE;
