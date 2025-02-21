document.addEventListener("DOMContentLoaded", function() {
    const searchInput = document.querySelector(".search");
    const tableBody = document.querySelector("table tbody"); 
    let alunos = [];

    // Função para carregar todos os alunos
    function carregarTodosAlunos() {
     fetch("http://localhost:3000/todos-alunos")
        .then(response => {
            if (!response.ok) throw new Error("Erro na resposta do servidor");
            return response.json();
        })
        .then(data => {
            if (data.success) {
                alunos = data.alunos;
                atualizarTabela(alunos);
            } else {
                alert("Nenhum aluno encontrado!");
            }
        })
        .catch(error => {
            console.error("Erro:", error);
            alert("Erro ao carregar alunos. Tente recarregar a página.");
        });
    }

    function formatarCPF(cpf) {
      if (!cpf) return "";
      const cpfLimpo = cpf.toString().replace(/\D/g, '');
      return cpfLimpo.replace(/(\d{3})(\d{3})(\d{3})(\d{2})/, "$1.$2.$3-$4");
    }
    function formatarRENACH(renach) {
      if (!renach) return "";
      const renachLimpo = renach.toString().replace(/\D/g, '');
    return `MT${renachLimpo}`;
    }
    function atualizarTabela(alunos) {
       tableBody.innerHTML = "";

       alunos.forEach(aluno => {
        const row = document.createElement("tr");

        const cpfFormatado = formatarCPF(aluno.cpf_aluno);
        const renachFormatado = formatarRENACH(aluno.renach);

        row.innerHTML = `
            <td>${aluno.nome_aluno}</td>
            <td>${cpfFormatado}</td>
            <td>${renachFormatado}</td>
            <td><span class="status ${aluno.ativo ? 'active' : 'inactive'}">${aluno.ativo ? "Ativo" : "Inativo"}</span></td>
            <td><button class="edit-btn" onclick="edit(); return false;">Editar</button></td>
        `;

        tableBody.appendChild(row);
    });
}

    // Função para filtrar alunos conforme o texto digitado
function filtrarAlunos(texto) {
    const textoLower = texto.toLowerCase();
    const alunosFiltrados = alunos.filter(aluno => 
        aluno.nome_aluno.toLowerCase().includes(textoLower) || 
        aluno.cpf_aluno.toLowerCase().includes(textoLower) || // Adicione toLowerCase()
        aluno.renach.toLowerCase().includes(textoLower) // Adicione toLowerCase()
    );
    atualizarTabela(alunosFiltrados);
}
    searchInput.addEventListener("input", function() {
        const searchValue = this.value.trim();
        filtrarAlunos(searchValue); 
    });
 
    carregarTodosAlunos();
});