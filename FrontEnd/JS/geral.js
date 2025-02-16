document.addEventListener("DOMContentLoaded", () => {
    const userNameElement = document.getElementById("user-name");
    const EmpCNPJElement = document.getElementById("emp-id"); // Verificando se o ID do elemento no HTML está correto

    // Pegando os dados do sessionStorage
    const userName = sessionStorage.getItem("userName") || "Usuário não logado";
    const id_usuario = sessionStorage.getItem("id_usuario"); // Pegando o ID do usuário

    console.log("Nome do usuário:", userName);
    console.log("ID do usuário recuperado da sessão:", id_usuario);

    // Definindo o nome do usuário na tela
    if (userNameElement) {
        userNameElement.innerText = userName;
    } else {
        console.error("Elemento 'user-name' não encontrado no HTML.");
    }

    // Se não houver id_usuario, exibir erro e parar a execução
    if (!id_usuario) {
        if (EmpCNPJElement) {
            EmpCNPJElement.innerText = "CNPJ NÃO VINCULADO";
        }
        console.error("ID do usuário não encontrado no sessionStorage.");
        return;
    }

    // Fazendo a requisição para buscar o CNPJ da empresa
    fetch("http://localhost:3000/DadosEmpresa", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ id_usuario }) // Enviando ID do usuário
    })
    .then(response => response.json())
    .then(data => {
        console.log("Resposta do servidor:", data);

        if (data.success) {
            if (EmpCNPJElement) {
                EmpCNPJElement.textContent = `CNPJ: ${data.empresa.cnpj_empresa}`;
            } else {
                console.error("Elemento 'emp-id' não encontrado no HTML.");
            }
        } else {
            if (EmpCNPJElement) {
                EmpCNPJElement.textContent = "Erro ao carregar CNPJ.";
            }
        }
    })
    .catch(error => {
        console.error("Erro ao conectar com o servidor:", error);
        if (EmpCNPJElement) {
            EmpCNPJElement.textContent = "Erro interno no servidor";
        }
    });
});



function logoff() {
    localStorage.removeItem("userName");
    window.location.href = "../login.html"; 
}

const menuTitles = document.querySelectorAll('.menu-title');
menuTitles.forEach(title => {
    title.addEventListener('click', () => {
        const submenu = title.nextElementSibling;
        submenu.style.display = submenu.style.display === 'block' ? 'none' : 'block';
    });
});