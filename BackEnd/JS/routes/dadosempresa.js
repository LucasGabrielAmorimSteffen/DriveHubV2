const pool = require('../utils/db');

async function DadosEmpresa(req, res) {
    const { id_usuario } = req.body;

    if (!id_usuario) {
        return res.status(400).json({
            success: false,
            message: "ID do usuário é obrigatório."
        });
    }

    try {
        const query = `
            SELECT 
                e.id_empresa , 
                e.nome_empresa, 
                e.fantasia_empresa ,
                e.cnpj_empresa , 
                e.telefone_empresa , 
                e.email_empresa ,               
                (E.logradouro || ' N° ' || E.numero_endereco || ' ' || E.bairro_endereco) AS endereco
            FROM tempresa E
            INNER JOIN tusuarios U
                ON U.id_empresa = E.id_empresa
            WHERE U.id_usuario = $1;
        `;

        const values = [id_usuario];

        const result = await pool.query(query, values);

        if (result.rows.length > 0) {
            return res.status(200).json({
                success: true,
                empresa: result.rows[0]
            });
        } else {
            return res.status(404).json({
                success: false,
                message: "ID do usuário é obrigatório"
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

module.exports = { DadosEmpresa };
