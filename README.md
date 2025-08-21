# 📊 Sistema de Cadastro de Investimentos

Este projeto é uma **API backend** desenvolvida em **Node.js** com **TypeScript**, utilizando o **Prisma ORM** para gerenciamento do banco de dados.  
O sistema permite o **cadastro de investimentos**, contendo as seguintes informações:  

- **Nome** do investimento  
- **Valor** aplicado  
- **Categoria**  

O objetivo é oferecer uma base sólida de backend com boas práticas, incluindo validações, middlewares para tratamento de erros e rotas bem estruturadas.

---

## 🚀 Tecnologias Utilizadas

- **Node.js + TypeScript** → base do projeto  
- **Express** → criação das rotas e servidor HTTP  
- **Prisma ORM** → mapeamento do banco de dados  
- **Zod** → validação de dados de entrada  
- **Middlewares personalizados** → tratamento centralizado de erros  
- **CORS** → permitir acesso de diferentes origens  
- **tsx** → execução do projeto em ambiente de desenvolvimento  

---

### 1️⃣ Clonar o repositório
### 2️⃣ Instalar dependências: npm install
### 3️⃣ Iniciar o servidor em modo desenvolvimento
   - npm run dev
### 4️⃣Rodar as migrações do banco
   - npx prisma studio

✅ Boas Práticas Implementadas

Uso de TypeScript para maior segurança do código

Validação de dados com zod

Tratamento de erros centralizado com middlewares

Organização do código em camadas (rotas, middlewares, prisma)

Scripts automatizados no package.json

