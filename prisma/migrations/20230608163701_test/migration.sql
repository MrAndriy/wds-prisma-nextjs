/*
  Warnings:

  - You are about to drop the column `preferences` on the `User` table. All the data in the column will be lost.
  - You are about to drop the column `userId` on the `UserPreference` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[UserPreferenceId]` on the table `User` will be added. If there are existing duplicate values, this will fail.

*/
-- DropForeignKey
ALTER TABLE "UserPreference" DROP CONSTRAINT "UserPreference_userId_fkey";

-- DropIndex
DROP INDEX "UserPreference_userId_key";

-- AlterTable
ALTER TABLE "User" DROP COLUMN "preferences",
ADD COLUMN     "UserPreferenceId" TEXT;

-- AlterTable
ALTER TABLE "UserPreference" DROP COLUMN "userId";

-- CreateIndex
CREATE UNIQUE INDEX "User_UserPreferenceId_key" ON "User"("UserPreferenceId");

-- AddForeignKey
ALTER TABLE "User" ADD CONSTRAINT "User_UserPreferenceId_fkey" FOREIGN KEY ("UserPreferenceId") REFERENCES "UserPreference"("id") ON DELETE SET NULL ON UPDATE CASCADE;
