const { Pool } = require("pg");
const pool = new Pool({
    host: "localhost",
    user: "postgres",
    password: "postgres",
    port: 5432,
    database: "DriveHub",
});

async function login(req, res) {
    const { email, password } = req.body;

    if (!email || !password) {
        return res.status(400).json({
            success: false,
            error: "E-mail e senha são obrigatórios.",
        });
    }

    try {
        const query = `
          SELECT id_usuario, 
                 nome_usuario,
                 id_empresa 
            FROM tusuarios  
            WHERE email_usuario = $1 AND senha_usuario = $2
        `;
        const result = await pool.query(query, [email, password]);

        if (result.rows.length > 0) {
            res.json({
                success: true,
                userName: result.rows[0].nome_usuario,
                id_usuario: result.rows[0].id_usuario,
            });
        } else {
            res.status(401).json({
                success: false,
                error: "E-mail ou senha inválidos.",
            });
        }
    } catch (err) {
        console.log("Erro na consulta ao banco de dados:", err);
        res.status(500).json({
            success: false,
            error: "Erro interno do servidor.",
        });
    }
}

module.exports = { login };