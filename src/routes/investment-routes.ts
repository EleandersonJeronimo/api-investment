import { Router } from "express";
import { InvestmentController } from "@/controllers/investment-controller";

const investmentRoutes = Router();
const investmentController = new InvestmentController();

investmentRoutes.post("/", investmentController.create);
investmentRoutes.get("/", investmentController.index);
investmentRoutes.get("/:id", investmentController.show);

export { investmentRoutes };
