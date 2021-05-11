const express = require('express');
const mysql = require('mysql');
const cors = require("cors");

const bodyParser = require('body-parser');

const PORT = process.env.PORT || 8080;

const app = express();

app.use(bodyParser.json());

const connection = mysql.createConnection({
    host: 'localhost',
    user:'root',
    password: '',
    database: 'accounts_db'
});

// Use Cors
app.use(cors());

// Route
app.get('/api/v1/', (req, res) => {
    res.send('Welcome to my API!');
});

// All Account
app.get('/api/v1/accounts/', (req, res) => {
    const sql = 'Select * FROM accounts';

    connection.query(sql, (error, results) => {
        if (error) throw error;
        if (results.length > 0) {
            res.json(results);
        } else {
            res.send('Not result');
        }
    });
});

app.get('/api/v1/accounts/:id', (req, res) => {
    const { id } = req.params;
    const sql = `SELECT * FROM accounts where id = ${id}`

    connection.query(sql, (error, result) => {
        if (error) throw error;

        if (result.length > 0) {
            res.json(result);
        } else {
            res.send('Not result');
        }
    });
});

app.post('/api/v1/accounts/', (req, res) => {
    const sql = 'INSERT INTO accounts SET ?';

    const accountObj = {
        //id: req.body.id,
        nombreCliente: req.body.nombreCliente,
        numCuenta: req.body.numCuenta,
        //saldoCuenta: number,
        //estadoCuenta: string
    }

    connection.query(sql, accountObj, error => {
        if (error) throw error;

        res.send('Account Created!');
    })
});

app.put('/api/v1/accounts/:id', (req, res) => {
    const { id } = req.params;
    const { nombreCliente, numCuenta, saldoCuenta, estadoCuenta } = req.body;
    const sql = `UPDATE accounts SET nombreCliente ='${nombreCliente}', numCuenta='${numCuenta}', saldoCuenta='${saldoCuenta}', estadoCuenta='${estadoCuenta}'WHERE id =${id}`;

    connection.query(sql, error => {
        if (error) throw error;
        res.send('Account Updated!');
    });
});

app.delete('/api/v1/accounts/:id', (req, res) => {
    const { id } = req.params;
    const { estadoCuenta } = req.body;
    const sql = `UPDATE accounts SET estadoCuenta ='${estadoCuenta}' WHERE id =${id}`;

    connection.query(sql, error => {
        if (error) throw error;
        res.send('State Updated!');
    });
});

// Check connect
connection.connect(error => {
    if (error) throw error;
    console.log('Database serve running');
});

app.listen(PORT, () => console.log('Server running on port ' + PORT));