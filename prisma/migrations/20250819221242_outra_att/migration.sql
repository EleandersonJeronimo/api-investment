/*
  Warnings:

  - You are about to drop the `tipoInvestimento` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the column `tipo_id` on the `investimentos` table. All the data in the column will be lost.

*/
-- DropIndex
DROP INDEX "tipoInvestimento_name_key";

-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "tipoInvestimento";
PRAGMA foreign_keys=on;

-- RedefineTables
PRAGMA defer_foreign_keys=ON;
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_investimentos" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "category" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "amount" REAL NOT NULL,
    "created_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" DATETIME
);
INSERT INTO "new_investimentos" ("amount", "created_at", "id", "name", "category", "updated_at") SELECT "amount", "created_at", "id", "name", "category", "updated_at" FROM "investimentos";
DROP TABLE "investimentos";
ALTER TABLE "new_investimentos" RENAME TO "investimentos";
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;
