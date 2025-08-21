import { Router } from "express";
import { investmentRoutes } from "./investment-routes";

const routes = Router();

routes.use("/investments", investmentRoutes);

export { routes };
