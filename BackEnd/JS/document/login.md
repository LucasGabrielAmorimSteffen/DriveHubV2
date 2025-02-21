# 📌 Documentação da Rota `login`

## 📍 Endpoint  
`POST /login`

## 📄 Descrição  
Esta rota autentica o usuário com base no e-mail e senha fornecidos. Caso as credenciais sejam válidas, ela retorna o nome e o ID do usuário.

---

### 🔹 **Requisição**  

#### **📥 Body (JSON)**  
```json
{
  "email": "usuario@dominio.com",
  "password": "senha123"
}
```
# 🔸 Resposta
### ✅ 200 - Sucesso
```json
{
  "success": true,
  "userName": "João Silva",
  "id_usuario": 1
}
```
| Campo       | Tipo     | Descrição                                      |
|-------------|----------|------------------------------------------------|
| success     | boolean  | Indica se a operação foi bem-sucedida (true ou false). |
| userName    | string   | Nome do usuário autenticado.                   |
| id_usuario  | integer  | ID do usuário autenticado.                     |

### ❌ 400 - Requisição Inválida
```json
{
  "success": false,
  "error": "E-mail e senha são obrigatórios."
}
```
🛑 Ocorre quando o campo email ou password não é enviado no body da requisição.

### ❌ 401 - E-mail ou Senha Inválidos
```json
{
  "success": false,
  "error": "E-mail ou senha inválidos."
}
```
🛑 Ocorre quando as credenciais fornecidas não correspondem a nenhum usuário no banco de dados.

### ❌ 500 - Erro no Servidor
```json
{
  "success": false,
  "error": "Erro interno do servidor."
}
```
🛑 Ocorre quando há falha na consulta ao banco de dados ou algum erro interno do servidor.

### 🚀 Exemplo de Uso no cURL
```json
curl -X POST http://localhost:3000/login \
     -H "Content-Type: application/json" \
     -d '{
           "email": "usuario@dominio.com",
           "password": "senha123"
         }'
```