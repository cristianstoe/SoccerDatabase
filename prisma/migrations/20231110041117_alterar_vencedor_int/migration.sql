/*
  Warnings:

  - Changed the type of `vencedor` on the `PartidasSerieA2022` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.

*/
-- AlterTable
ALTER TABLE "PartidasSerieA2022" DROP COLUMN "vencedor",
ADD COLUMN     "vencedor" INTEGER NOT NULL;
