document.addEventListener("DOMContentLoaded", function () {
    const nomeInput = document.getElementById("nome");
    const cpfInput = document.getElementById("cpf");
    const renachInput = document.getElementById("renach");
    const foneInput = document.getElementById("telefone");
    const emailInput = document.getElementById("email");

    // Pegando os valores armazenados no sessionStorage
    const nomeSalvo = sessionStorage.getItem("nameStudent");
    const cpfSalvo = sessionStorage.getItem("CpfStudent");
    const renachSalvo = sessionStorage.getItem("renachStud");
    const foneSalvo = sessionStorage.getItem("FoneStudent");
    const emailSalvo = sessionStorage.getItem("emailStudent");

    // Preenchendo os campos automaticamente
    if (nomeSalvo) nomeInput.value = nomeSalvo;
    if (cpfSalvo) cpfInput.value = cpfSalvo;
    if (renachSalvo) renachInput.value = renachSalvo;
    if (foneSalvo) foneInput.value = foneSalvo;  
    if (emailSalvo) emailInput.value = emailSalvo; 
});

console.log(sessionStorage.getItem("nameStudent"));
console.log(sessionStorage.getItem("CpfStudent"));
console.log(sessionStorage.getItem("renachStud"));
console.log(sessionStorage.getItem("FoneStudent"));
console.log(sessionStorage.getItem("emailStudent"));


    /*Ediçaõ Cadastro de Aluno. */ 

    function changeTab(event, tabName) {
        // Esconde todas as abas
        let tabContents = document.querySelectorAll('.tab-content');
        tabContents.forEach(tab => {
            tab.style.display = 'none';
        });
    
        // Remove a classe "active" de todas as abas
        let tabs = document.querySelectorAll('.tab');
        tabs.forEach(tab => {
            tab.classList.remove('active');
        });
    
        // Mostra a aba selecionada e adiciona a classe "active"
        document.getElementById(tabName).style.display = 'block';
        event.currentTarget.classList.add('active');
    }
    