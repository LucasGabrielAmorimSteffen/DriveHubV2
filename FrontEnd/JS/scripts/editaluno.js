document.addEventListener("DOMContentLoaded", function () {
    const nomeInput = document.getElementById("nomeA");
    const cpfInput = document.getElementById("cpfA");
    const renachInput = document.getElementById("renachA");

    // Pegando os valores armazenados no sessionStorage
    const nomeSalvo = sessionStorage.getItem("nameStudent");
    const cpfSalvo = sessionStorage.getItem("CpfStudent");
    const renachSalvo = sessionStorage.getItem("renachStud");

    // Preenchendo os campos automaticamente
    if (nomeSalvo) nomeInput.value = nomeSalvo;
    if (cpfSalvo) cpfInput.value = cpfSalvo;
    if (renachSalvo) renachInput.value = renachSalvo;
    });