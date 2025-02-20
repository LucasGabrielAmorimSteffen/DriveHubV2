const { response } = require("express");

document.addEventListener("DOMContentLoaded", function(){
    const NameStudentElement = document.getElementById("nameA");
    const CPFStudentElement  = document.getElementById("cpfA");
    const RenachStudentElement = document.getElementById("renachA");
    const statusStudentElement = document.getElementById("statusA");

    console.log("Nome do aluno:", NameStudentElement);
    console.log("CPF:", CPFStudentElement);
    console.log("renach:", RenachStudentElement);
    console.log("Status: ", statusStudentElement);

    fetch("http://localhost:3000/buscarAluno",{
        method: "POST",
        headers: {"Content-Type": "application/json"},
        body: JSON.stringify({ id_aluno}) // Enviar ID Aluno
    })
    .then(response => response.json())
    .then(data => {
        console.log("Resposta do servidor: ", data);

        if(data.success){
            if(NameStudentElement){
                NameStudentElement.textContent = `${data.talunos.nome_aluno}`;
            } else{
                console.error("Elemento 'nomeA' não encontrado no HTML.")
            }
        } else {
            if(NameStudentElement){
                NameStudentElement.textContent = "Erro ao carregar nome do aluno.";
            }
        }
    })
    .catch(error => {
        console.error("Erro ao conectar com o servidor: ", error);
        if(NameStudentElement){
            NameStudentElement.textContent = "Erro interno no servidor";
        }
    });
});
