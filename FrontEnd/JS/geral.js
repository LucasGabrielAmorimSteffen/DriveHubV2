document.addEventListener("DOMContentLoaded", () => {
    const userNameElement = document.getElementById("user-name");
    const userName = sessionStorage.getItem("userName");
    document.getElementById("user-name").innerText = userName || "Usuário não logado";

    fetch("http://localhost:3000/getUserName", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ userId }),
    })
        .then((response) => response.json())
        .then((data) => {
            if (data.success) {
                userNameElement.textContent = data.userName; 
            } else {
                userNameElement.textContent = "Erro ao carregar nome.";
            }
        })
        .catch((error) => {
            console.error("Erro ao conectar com o servidor:", error);
            userNameElement.textContent = "Erro de conexão.";
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