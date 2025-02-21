# 📌 Documentação da Rota `getAllStudents`

## 📍 Endpoint  
`GET /alunos`

## 📄 Descrição  
Esta rota retorna a lista de todos os alunos cadastrados no banco de dados.

---

### 🔹 **Requisição**  

#### **📥 Parâmetros**  
Nenhum parâmetro é necessário para esta requisição.

---

### 🔸 **Resposta**  

#### ✅ **200 - Sucesso**  
```json
{
  "success": true,
  "alunos": [
    {
      "nome_aluno": "João Silva",
      "cpf_aluno": "123.456.789-00",
      "renach": "AB123456",
      "foto_aluno": "base64_encoded_string",
      "telefone": "(11) 99999-9999",
      "data_nascimento": "2000-01-01",
      "email": "joao@email.com",
      "ativo": true
    }
  ]
}
```
| Campo            | Tipo     | Descrição                                      |
|------------------|----------|------------------------------------------------|
| nome_aluno       | string   | Nome completo do aluno.                        |
| cpf_aluno        | string   | CPF do aluno.                                  |
| renach           | string   | Registro Nacional de Carteira de Habilitação.  |
| foto_aluno       | string   | Foto do aluno codificada em base64.            |
| telefone         | string   | Telefone do aluno.                             |
| data_nascimento  | string   | Data de nascimento do aluno (YYYY-MM-DD).      |
| email            | string   | E-mail do aluno.                               |
| ativo            | boolean  | Indica se o aluno está ativo (true ou false).  |

❌ 404 - Nenhum Aluno Encontrado
```json
{
  "success": false,
  "message": "Nenhum aluno encontrado."
}
```
🛑 Ocorre quando não há registros de alunos no banco de dados.

❌ 500 - Erro no Servidor
```json
{
  "success": false,
  "message": "Erro interno do servidor."
}
```
🛑 Ocorre quando há falha na conexão com o banco de dados ou erro na consulta SQL.

🚀 Exemplo de Uso no cURL
````bash
curl -X GET http://localhost:3000/alunos
````