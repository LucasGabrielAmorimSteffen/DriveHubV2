const pool = require("../utils/db");

async function getAllStudents(req, res) {
    try {
        const query = `
            SELECT nome_aluno, 
                   cpf_aluno, 
                   renach, 
                   encode(foto_aluno, 'base64') AS foto_aluno, 
                   telefone, 
                   data_nascimento, 
                   email, 
                   ativo 
              FROM talunos`;
        const result = await pool.query(query);

        if (result.rows.length > 0) {
            return res.status(200).json({
                success: true,
                alunos: result.rows // Retorna todos os alunos
            });
        } else {
            return res.status(404).json({
                success: false,
                message: "Nenhum aluno encontrado."
            });
        }
    } catch (error) {
        console.error("Erro ao consultar o banco de dados:", error);
        return res.status(500).json({
            success: false,
            message: "Erro interno do servidor."
        });
    }
}

module.exports = { getAllStudents };