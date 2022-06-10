const mysql = require('mysql');

var con = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "",
    database: 'exercises'
});
con.connect();

function runQuery(q) {
    return new Promise((res, rej) => {
        con.query(q, function (err, rows) {
            if (err) return rej(err);
            return res(rows);
        });
    })

}

module.exports = {
    runQuery
}


