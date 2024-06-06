/*
  Warnings:

  - Added the required column `code` to the `times` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "times" ADD COLUMN     "code" TEXT NOT NULL;
