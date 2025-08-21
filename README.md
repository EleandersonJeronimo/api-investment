## 📄 Sobre o Projeto

Esta é a API RESTful desenvolvida para gerenciar o cadastro de investimentos financeiros. O projeto foi construído com foco em boas práticas de desenvolvimento, código limpo, escalabilidade e robustez, utilizando um stack moderno baseado em Node.js e TypeScript.

A aplicação serve como o **Backend** da solução, sendo responsável por toda a lógica de negócio, validação de dados e comunicação com o banco de dados.

---

## 🏛️ Arquitetura e Decisões Técnicas


* **Express.js:** Utilizado como o framework principal para a construção do servidor, gerenciamento de rotas e middlewares.

* **Prisma ORM:** Escolhido para ser a camada de acesso ao banco de dados.

* **TypeScript:** A aplicação foi escrita inteiramente em TypeScript para adicionar tipagem estática, o que aumenta a previsibilidade do código, melhora a experiência de desenvolvimento com autocompletar e previne uma classe inteira de bugs em tempo de execução.

* **Validação com Zod:** Todas as entradas de dados (request body) são validadas através de esquemas do Zod. Isso cria uma barreira de proteção na borda da aplicação, garantindo que nenhum dado malformado chegue às camadas de negócio.

* **Middleware de Tratamento de Erros:** Utilizando `express-async-errors`, o tratamento de erros assíncronos é centralizado. Isso evita a repetição de blocos `try...catch` nos controllers, resultando em um código mais limpo e um sistema de tratamento de falhas mais confiável e padronizado.

* **Qualidade de Código com Biome:** O projeto utiliza o Biome para formatação e linting do código. Isso garante um padrão de estilo consistente em toda a base de código e ajuda a identificar potenciais problemas de forma automatizada.

---

## Endpoints da API

A API expõe os seguintes endpoints para a gestão de investimentos:

### Cadastrar um novo investimento

* **Endpoint:** `POST /investments`
* **Descrição:** Cria um novo registro de investimento no banco de dados.
* **Request Body:**

    ```json
    {
      "nome": "Ações da Empresa X",
      "valor": 1500.75,
      "categoria": "Renda Variável"
    }
    ```

* **Resposta de Sucesso (201 Created):**

    ```json
    {
      "id": "clx123abc456def",
      "nome": "Ações da Empresa X",
      "valor": 1500.75,
      "categoria": "Renda Variável",
      "createdAt": "2025-08-21T02:20:00.000Z"
    }
    ```

---

## 🚀 Como Executar o Projeto

### Pré-requisitos
* Node.js (versão 18 ou superior)
* NPM ou Yarn
* Uma instância de um banco de dados compatível com o Prisma (ex: PostgreSQL, MySQL, SQLite)

### Passos

1.  **Clone o repositório:**
    

2.  **Acesse o diretório do projeto:**
    

3.  **Instale as dependências:**
    ```bash
    npm install
    ```

4.  **Inicie a aplicação em modo de desenvolvimento:**
    Conforme definido no arquivo `package.json`, utilize o seguinte comando:
    ```bash
    npm prisma studio
    npm run dev
    ```