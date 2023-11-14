/*
  Warnings:

  - Added the required column `gols_total` to the `PartidasSerieA2022` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "PartidasSerieA2022" ADD COLUMN     "gols_total" INTEGER NOT NULL;
