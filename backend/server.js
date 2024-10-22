const express = require ('express');
const mysql = require ('mysql');
const cors = require ('cors');

const app = express();
app.use(cors());
app.use(express.json());

const db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'test',
    database: 'todo_app'
});

db.connect(err => {
    if (err) throw err;
    console.log('MySQL Connected...');
});


app.get('/todos', (req, res) => {
    db.query('SELECT * FROM todos', (err, results) => {
        if (err) throw err;
        res.json(results);
    });
});

app.post('/todos', (req, res) => {
    const { title } = req.body;
    db.query('INSERT INTO todos (title) VALUES (?)', [title], (err, result) => {
        if (err) throw err;
        res.json({ id: result.insertId, title, completed: false });
    });
});

app.listen(5000, () => {
    console.log('Server started on port 5000');
});

// app.get('/', (re, res)=>{
//     return res.json("From backendside");
// })

// app.listen(3306, ()=>{
//     console.log("Server running on port 8081")
// })