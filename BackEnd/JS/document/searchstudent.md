# 📌 Documentação da Rota `searchstudent`

## 📍 Endpoint  
`POST /searchstudent`

## 📄 Descrição  
Esta rota realiza a busca de um aluno baseado em um ou mais campos fornecidos: nome, CPF ou RENACH. Se o aluno for encontrado, as informações do primeiro aluno correspondente são retornadas.

---

### 🔹 **Requisição**  

#### **📥 Body (JSON)**  
```json
{
  "nome_aluno": "João",
  "cpf": "123.456.789-00",
  "renach": "AB123456"
}
```
* nome_aluno: Nome do aluno (parcial ou completo).
* cpf: CPF do aluno (formato completo).
* renach: RENACH do aluno (número do registro).
##### OBS: Ao menos um campo deve ser fornecido para a busca.

# 🔸 Resposta
### ✅ 200 - Sucesso
```json
{
  "success": true,
  "aluno": {
    "nome_aluno": "João Silva",
    "cpf_aluno": "123.456.789-00",
    "renach": "AB123456",
    "foto_aluno": "base64_encoded_string",
    "telefone": "(11) 99999-9999",
    "data_nascimento": "2000-01-01",
    "email": "joao@email.com",
    "ativo": true
  }
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

### ❌ 400 - Requisição Inválida
```json
{
  "success": false,
  "message": "Por favor, forneça ao menos um campo: Nome, CPF ou RENACH."
}
```
🛑 Ocorre quando nenhum campo (nome_aluno, cpf ou renach) é fornecido na requisição.

### ❌ 404 - Não Encontrado
```json
{
  "success": false,
  "message": "Aluno não encontrado."
}
```
🛑 Ocorre quando não há aluno que corresponda aos critérios de pesquisa fornecidos.

### ❌ 500 - Erro no Servidor
```json
{
  "success": false,
  "message": "Erro interno do servidor."
}
```
🛑 Ocorre quando há falha na consulta ao banco de dados ou erro interno do servidor.

### 🚀 Exemplo de Uso no cURL
```bash
curl -X POST http://localhost:3000/searchstudent \
     -H "Content-Type: application/json" \
     -d '{
           "nome_aluno": "João",
           "cpf": "123.456.789-00"
         }'
```