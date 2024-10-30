CREATE DATABASE contato_db;
 
-- Use o banco de dados
USE contato_db;
 
-- Crie a tabela para armazenar os contatos
CREATE TABLE contatos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(15),
    email VARCHAR(100) NOT NULL
); 

SHOW DATABASE;


const express = require('express');
const mysql = require('mysql');
const bodyParser = require('body-parser');
 
const app = express();
const port = 3000;
 
// Configuração do body-parser
app.use(bodyParser.urlencoded({ extended: true }));
 
// Configuração do banco de dados
const db = mysql.createConnection({
    host: 'localhost',
    user: 'seu_usuario',
    password: 'sua_senha',
    database: 'contato_db'
});
 
db.connect((err) => {
    if (err) throw err;
    console.log('Conectado ao banco de dados MySQL!');
});
 
// Rota para salvar os contatos
app.post('/contato', (req, res) => {
    const { nome, telefone, email } = req.body;
    const sql = 'INSERT INTO contatos (nome, telefone, email) VALUES (?, ?, ?)';
    db.query(sql, [nome, telefone, email], (err, result) => {
        if (err) throw err;
        res.send('Contato salvo com sucesso!');
    });
});
 
// Rota para listar os contatos
app.get('/contatos', (req, res) => {
    const sql = 'SELECT * FROM contatos';
    db.query(sql, (err, results) => {
        if (err) throw err;
        let html = '<h1>Lista de Contatos</h1><table><tr><th>ID</th><th>Nome</th><th>Telefone</th><th>Email</th></tr>';
        results.forEach(contact => {
            html += `<tr><td>${contact.id}</td><td>${contact.nome}</td><td>${contact.telefone}</td><td>${contact.email}</td></tr>`;
        });
        html += '</table>';
        res.send(html);
    });
});
 
// Inicia o servidor
app.listen(port, () => {
    console.log(`Servidor rodando em http://localhost:${port}`);
});