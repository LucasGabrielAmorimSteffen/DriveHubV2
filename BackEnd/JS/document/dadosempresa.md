# 📌 Documentação da Rota `DadosEmpresa`

## 📍 Endpoint  
`POST /dados-empresa`

## 📄 Descrição  
Esta rota retorna as informações da empresa associada a um usuário com base no `id_usuario` fornecido.

---

### 🔹 **Requisição**  

#### **📥 Body (JSON)**  
```json
{
  "id_usuario": 1
}
```
# 🔸 Resposta

### ✅ 200 - Sucesso
```json
{
  "success": true,
  "empresa": {
    "id_empresa": 10,
    "nome_empresa": "Empresa X",
    "fantasia_empresa": "Fantasia X",
    "cnpj_empresa": "00.000.000/0000-00",
    "telefone_empresa": "(00) 0000-0000",
    "email_empresa": "empresa@email.com",
    "endereco": "Rua X N° 123 Bairro Y"
  }
};
 ```
| Campo             | Tipo     | Descrição                                      |
|-------------------|----------|------------------------------------------------|
| id_empresa        | integer  | ID da empresa associada ao usuário.            |
| nome_empresa      | string   | Nome oficial da empresa.                       |
| fantasia_empresa  | string   | Nome fantasia da empresa.                      |
| cnpj_empresa      | string   | CNPJ da empresa.                               |
| telefone_empresa  | string   | Telefone da empresa.                           |
| email_empresa     | string   | E-mail de contato da empresa.                  |
| endereco          | string   | Endereço completo (logradouro, número e bairro).|
### ❌ 400 - Requisição Inválida
```json
{
  "success": false,
  "message": "ID do usuário é obrigatório."
}
```
🛑 Ocorre quando o campo id_usuario não é enviado no body da requisição.

### ❌ 404 - Não Encontrado
```json
{
  "success": false,
  "message": "ID do usuário é obrigatório"
}
```
🛑 Ocorre quando o id_usuario não está associado a nenhuma empresa.

### ❌ 500 - Erro no Servidor
```json
{
  "success": false,
  "message": "Erro interno do servidor."
}
🛑 Ocorre quando há falha na conexão com o banco de dados.
```
### 🚀 Exemplo de Uso no cURL
```json
curl -X POST http://localhost:3000/dados-empresa \
     -H "Content-Type: application/json" \
     -d '{
           "id_usuario": 1
         }'
```