/*
  Warnings:

  - Added the required column `type` to the `investimentos` table without a default value. This is not possible if the table is not empty.

*/
-- RedefineTables
PRAGMA defer_foreign_keys=ON;
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_investimentos" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "category" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "amount" REAL NOT NULL,
    "tipo_id" TEXT NOT NULL,
    "created_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" DATETIME,
    CONSTRAINT "investimentos_tipo_id_fkey" FOREIGN KEY ("tipo_id") REFERENCES "tipoInvestimento" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_investimentos" ("amount", "created_at", "id", "name", "tipo_id", "updated_at") SELECT "amount", "created_at", "id", "name", "tipo_id", "updated_at" FROM "investimentos";
DROP TABLE "investimentos";
ALTER TABLE "new_investimentos" RENAME TO "investimentos";
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;
