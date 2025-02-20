const express      = require("express");
const cors         = require ("cors");
const bodyParser   = require("body-parser");
const { login }    = require("../js/routes/login")
const { searchstudent } = require('../js/routes/searchstudent');
const { DadosEmpresa} = require('../js/routes/dadosempresa')
const { getAllStudents } = require('../js/routes/getAllStudents'); 


const app = express();
app.use(cors({origin: "*"}));
app.use(bodyParser.json());

// Rotas
// Rota de Login
app.post("/login", login);

// Rota de busca de alunos
app.post("/buscar-aluno" , searchstudent);

// Rota para todos alunos.
app.get("/todos-alunos", getAllStudents); 

// Rota para buscar empresa
app.post("/DadosEmpresa", DadosEmpresa)

// Rota para simular um erro
app.get("/simular-erro", (req, res) => {
    throw new Error("Erro Simulado!");  
});

app.listen(3000,()=>{
    console.log("Servidor rodando em http://localhost:3000")
});