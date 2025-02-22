function saveChanges() {
    const name = document.getElementById('name').value;
    const phone = document.getElementById('phone').value;
    const status = document.getElementById('status').value;
    const cpf = document.getElementById('cpf').value;
    const renach = document.getElementById('renach').value;
    const email = document.getElementById('email').value;
    const cnhSocial = document.getElementById('cnh-social').checked;

    // Aqui você pode adicionar a lógica para salvar as alterações
    console.log('Alterações salvas:', { name, phone, status, cpf, renach, email, cnhSocial });
    console.log('Alterações salvas com sucesso!');
}

function cancelChanges() {
    // Lógica para cancelar as alterações
    console.log('Alterações canceladas.');
}

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