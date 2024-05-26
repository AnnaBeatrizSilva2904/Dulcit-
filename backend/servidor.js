const express = require('express');
const mysql = require('mysql');
const cors = require('cors');

const app = express();
app.use(cors());
app.use(express.json());

const db = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  database: 'dulcita',
  password: '' // Senha vazia conforme especificado
});

// Verifica conexão com o banco de dados
db.connect(err => {
  if (err) {
    console.error('Erro ao conectar ao banco de dados: ' + err.message);
    return;
  }
  console.log('Conectado ao banco de dados MySQL');
});

// Rota para listar donuts, com filtro opcional por ID da categoria
app.get('/donuts', (req, res) => {
  let sql = 'SELECT * FROM donuts INNER JOIN categorias ON donuts.id_categoria = categorias.id_categoria';
  const { id_categoria } = req.query;

  if (id_categoria) {
    sql += ' WHERE donuts.id_categoria = ?';
    db.query(sql, [id_categoria], (err, results) => {
      if (err) throw err;
      res.json(results);
    });
  } else {
    db.query(sql, (err, results) => {
      if (err) throw err;
      res.json(results);
    });
  }
});

// Rota para listar categorias
app.get('/categorias', (req, res) => {
  const sql = 'SELECT * FROM categorias';
  db.query(sql, (err, results) => {
    if (err) {
      console.error('Erro ao buscar categorias: ' + err.message);
      res.status(500).send('Erro interno do servidor');
    } else {
      res.json(results);
    }
  });
});

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Servidor rodando na porta ${PORT}`);
});
