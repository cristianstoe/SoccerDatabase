/*
  Warnings:

  - You are about to drop the column `liga_tipo_id` on the `ligas` table. All the data in the column will be lost.
  - You are about to drop the `liga_tipo` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `liga_tipo` to the `ligas` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "ligas" DROP CONSTRAINT "ligas_liga_tipo_id_fkey";

-- AlterTable
ALTER TABLE "ligas" DROP COLUMN "liga_tipo_id",
ADD COLUMN     "liga_tipo" TEXT NOT NULL;

-- DropTable
DROP TABLE "liga_tipo";
