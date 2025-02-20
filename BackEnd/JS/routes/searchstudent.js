const pool = require("../utils/db");

async function searchstudent(req, res) {
    const { nome_aluno, cpf, renach } = req.body;

    if (!nome_aluno && !cpf && !renach) {
        return res.status(400).json({
            success: false,
            message: "Por favor, forneça ao menos um campo: Nome, CPF ou RENACH."
        });
    }

    try {
        let query = `
            SELECT nome_aluno, 
                   cpf_aluno, 
                   renach, 
                   encode(foto_aluno, 'base64') AS foto_aluno, 
                   telefone, 
                   data_nascimento, 
                   email, 
                   ativo 
              FROM talunos
             WHERE`;
        let values = [];
        let conditions = [];

        if (nome_aluno) {
            conditions.push(`nome_aluno ILIKE $${conditions.length + 1}`);
            values.push(`%${nome_aluno}%`);
        }
        if (cpf) {
            conditions.push(`cpf_aluno = $${conditions.length + 1}`);
            values.push(cpf);
        }
        if (renach) {
            conditions.push(`renach = $${conditions.length + 1}`);
            values.push(renach);
        }

        query += " " + conditions.join(" AND ");

        const result = await pool.query(query, values);

        if (result.rows.length > 0) {
            return res.status(200).json({
                success: true,
                aluno: result.rows[0] // Retorna o primeiro aluno encontrado
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

module.exports = { searchstudent };