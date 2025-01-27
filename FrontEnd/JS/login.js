function login() {
    const email = document.getElementById("email").value;
    const password = document.getElementById("password").value;
    const rememberMe = document.getElementById("remember-me").checked;
    const errorMessageDiv = document.getElementById("error-message");
    errorMessageDiv.style.display = "none";
    errorMessageDiv.textContent = "";

    // Armazenando as informações no localStorage se "Lembrar-me" estiver marcado
    if (rememberMe) {
        const expirationDate = new Date();
        expirationDate.setDate(expirationDate.getDate() + 7); // 7 dias de validade
        localStorage.setItem("email", email);
        localStorage.setItem("password", password);
        localStorage.setItem("expirationDate", expirationDate);
    }

    fetch("http://localhost:3000/login", {
        method: "POST",
        headers: {
            "Content-Type": "application/json",
        },
        body: JSON.stringify({ email, password }),
    })
    .then((response) => response.json())
    .then((data) => {
        if (data.success) {
            logAccess(data.userName);
            sessionStorage.setItem("userName", data.userName);
            window.location.href = "../HTML/index.html";
        } else {
            errorMessageDiv.style.display = "block";
            errorMessageDiv.textContent = data.error || "E-mail ou senha inválidos, tente novamente.";
        }
    })
    .catch((error) => {
        alert("Erro ao conectar ao servidor. Contate nosso suporte técnico");
        console.error("Erro:", error);
    });
}

function logAccess(userName) {
    // Obtendo o IP do usuário
    fetch('https://api.ipify.org?format=json')
        .then(response => response.json())
        .then(data => {
            const ip = data.ip;
            const now = new Date();
            const logMessage = `O IP ${ip} acessou o usuário ${userName} às ${now.getHours()} horas, ${now.getMinutes()} minutos, ${now.getSeconds()} segundos, do dia ${now.getDate()} de ${getMonthName(now.getMonth())} de ${now.getFullYear()} na cidade não disponível no Brasil.`;
            
            // Enviar a requisição POST para gravar o log no servidor
            fetch("http://localhost:3000/login", {
                method: "POST",
                headers: {
                    "Content-Type": "application/json",
                },
                body: JSON.stringify({
                    email: email,
                    password: password
                }),
            })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    sessionStorage.setItem("userName", userName);
                    window.location.href = "../HTML/index.html";
                } else {
                    const errorMessageDiv = document.getElementById("error-message");
                    errorMessageDiv.style.display = "block";
                    errorMessageDiv.textContent = data.error || "E-mail ou senha inválidos.";
                }
            })
            .catch(error => {
                alert("Erro ao conectar ao servidor. Contate nosso suporte técnico");
                console.error("Erro:", error);
            });
        })
        .catch(error => {
            console.error("Erro ao obter o IP:", error);
        });
}


function togglePasswordVisibility() {
    const passwordField = document.getElementById("password");
    const toggleIcon = document.getElementById("toggle-password");

    if (passwordField.type === "password") {
        passwordField.type = "text"; // Torna a senha visível
        toggleIcon.classList.remove("fa-eye");
        toggleIcon.classList.add("fa-eye-slash"); 
    } else {
        passwordField.type = "password"; // Torna a senha oculta
        toggleIcon.classList.remove("fa-eye-slash"); 
        toggleIcon.classList.add("fa-eye"); 
    }
}

// Função para recuperar as informações do usuário se "Lembrar-me" estiver marcado
document.addEventListener("DOMContentLoaded", () => {
    const email = localStorage.getItem("email");
    const password = localStorage.getItem("password");
    const expirationDate = localStorage.getItem("expirationDate");

    if (email && password && new Date(expirationDate) > new Date()) {
        document.getElementById("email").value = email;
        document.getElementById("password").value = password;
        document.getElementById("remember-me").checked = true;
    }
});

function getMonthName(monthIndex) {
    const months = [
        "Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho", 
        "Julho", "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro"
    ];
    return months[monthIndex];
}