/*
  Warnings:

  - Changed the type of `fundacao` on the `TimesSerieA2022` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.

*/
-- AlterTable
ALTER TABLE "TimesSerieA2022" DROP COLUMN "fundacao",
ADD COLUMN     "fundacao" INTEGER NOT NULL;
