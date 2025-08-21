import { Request, Response } from "express";
import { prisma } from "@/database/prisma";
import { z } from "zod";

const CategoryEnum = z.enum(["ação", "fundo", "titulo", "imovel"]);

class InvestmentController {
	async create(request: Request, response: Response) {
		const bodySchema = z.object({
			name: z.string().trim().min(2, { message: "Nome é obrigatório" }),
			amount: z
				.number()
				.positive()
				.min(0, { message: "O valor precisa ser positivo" }),
			category: CategoryEnum,
		});

		const { name, amount, category } = bodySchema.parse(request.body);

		await prisma.Investimentos.create({
			data: {
				name,
				amount,
				category,
			},
		});

		response.status(201).json();
	}

	async index(request: Request, response: Response) {
		const querySchema = z.object({
			name: z.string().optional().default(""),
			page: z.coerce.number().optional().default(1),
			perPage: z.coerce.number().optional().default(10),
		});

		const { name, page, perPage } = querySchema.parse(request.query);

		//calcular os valores de skip
		const skip = (page - 1) * perPage;

		const investments = await prisma.Investimentos.findMany({
			skip,
			take: perPage,
			where: {
				name: {
					contains: name.trim(),
				},
			},
		});

		//obter o total de investimentos
		const totalRecords = await prisma.Investimentos.count({
			where: {
				name: {
					contains: name.trim(),
				},
			},
		});

		const totalPages = Math.ceil(totalRecords / perPage);

		response.json({
			investments,
			pagination: {
				page,
				perPage,
				totalRecords,
				totalPages: totalPages > 0 ? totalPages : 1, // Garantir que totalPages seja pelo menos 1
			},
		});
	}

	async show(request: Request, response: Response) {
		const paramsSchema = z.object({
			id: z.string().uuid(),
		});

		const { id } = paramsSchema.parse(request.params);
		const investment = await prisma.Investimentos.findFirst({
			where: { id },
		});

		response.json(investment);
	}
}

export { InvestmentController };
