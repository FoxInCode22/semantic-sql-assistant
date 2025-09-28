  # Building a ChatGPT-like Interface for Azure PostgreSQL Data

We'll explore how to build a ChatGPT-like interface that allows users to query data from an Azure PostgreSQL database using natural language. This approach, often called Natural Language Querying (NLQ), bridges the gap between non-technical users and complex databases by translating everyday questions into SQL queries, executing them, and generating human-readable responses.

This project demonstrates a ChatGPT-like interface for querying an Azure PostgreSQL database using natural language. It leverages Microsoft's Semantic Kernel to orchestrate AI-driven workflows, integrating Azure OpenAI for natural language processing and psycopg2 for database connectivity. The demo uses the classic Iris dataset to showcase how users can ask questions like "What species does this belong to: 6.8, 3.2, 5.9, 2.3?" and receive human-readable answers based on generated SQL queries.


**Features**
  - Converts natural language questions into PostgreSQL queries using Semantic Kernel and Azure OpenAI.
  - Executes queries on an Azure PostgreSQL database containing the Iris dataset.
  - Formats database results into user-friendly responses.
  - Handles transactions with commit/rollback for database integrity.
  - Modular design with reusable "skills" for SQL generation and answer formatting.

**Prerequisites**
  -  Python 3.10+
  -  An Azure PostgreSQL database with the Iris dataset loaded (schema: sepal_length, sepal_width, petal_length, petal_width, species).
  -  Azure OpenAI service with a deployed chat completion model (e.g., GPT-3.5 or GPT-4).
  -  A .env file with the following environment variables:

**How It Works**
1.  Environment Setup
  -  The application loads environment variables (e.g., database credentials, API keys) from a .env file using python-dotenv.
  -  This keeps sensitive information out of the codebase and makes the setup portable.
2.  Database Connection
  -  A secure connection is established to Azure Database for PostgreSQL using the psycopg2 driver.
  -  Transaction management ensures queries execute safely.
3.  Semantic Kernel Setup
  -  The Semantic Kernel is initialized as the orchestration layer.
  -  Azure OpenAI’s Chat Completion service is added to handle natural language understanding and generation.
4.  Skills 
  -  GenerateSql: Converts natural language questions into SQL queries using few-shot prompt examples.
  -  AnswerQuestion: Takes raw query results and turns them into clear, human-readable answers.
5.  Pipeline Orchestration (ask_db function)
  -  Generates SQL from user input.
  -  Executes the SQL query with transaction safety.
  -  Passes the results back into the LLM to generate a natural-language answer.
6.  Execution Demo (run_queries function)
  -  Demonstrates end-to-end usage by running a set of sample queries.
  -  Shows how plain English inputs are translated into SQL, executed against PostgreSQL, and returned as conversational answers.

