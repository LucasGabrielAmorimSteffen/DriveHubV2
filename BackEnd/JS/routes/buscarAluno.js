const pool = require("../utils/db");

async function buscarAluno(req, res) {
    const { cpf, renach } = req.body;

    if (!cpf && !renach) {
        return res.status(400).json({
            success: false,
            message: "Por favor, forneça ao menos um campo: CPF ou RENACH."
        });
    }

    try {
        let query = 
       `SELECT nome_aluno, 
               cpf_aluno, 
               renach, 
               encode(foto_aluno, 'base64') AS foto_aluno, 
               telefone, 
               data_nascimento, 
               email, 
               ativo 
          FROM talunos`;
        let values = [];

        if (cpf && renach) {
            query += " cpf_aluno = $1 AND renach = $2";
            values = [cpf, renach];
        } else if (cpf) {
            query += " cpf_aluno = $1";
            values = [cpf];
        } else if (renach) {
            query += " renach = $1";
            values = [renach];
        }

        const result = await pool.query(query, values);

        if (result.rows.length > 0) {
            return res.status(200).json({
                success: true,
                aluno: result.rows[0]
            });
        } else {
            return res.status(404).json({
                success: false,
                message: "Aluno não encontrado."
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

module.exports = { buscarAluno };