import mysql from "mysql";


// const mysqlConnection = mysql.createConnection({
//     host: 'azdb6789-mysql-adelicias.mysql.database.azure.com',
//     user:'mmelgar',
//     database:'restauranteadelicias',
//     password:'David$2020',
//     multipleStatements: true
// });

const mysqlConnection = mysql.createConnection({
    host: 'localhost',
    user:'root',
    database:'restauranteadelicias',
    password:'',
    multipleStatements: true
});

mysqlConnection.connect((err) =>{
    if(err){
        console.log(err);
        return;
    }else{
        console.log('db is connected!');
    }
})

export default mysqlConnection;
