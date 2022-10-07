import mysql from "mysql";


const mysqlConnection = mysql.createConnection({
    host: 'localhost',
    user:'root',
    database:'restauranteadelicias',
    password:'',
    multipleStatements: true
});


mysqlConnection.connect((err) =>{
    if(err){
        console.err(err);
        return;
    }else{
        console.log('db is connected!');
    }
})

export default mysqlConnection;
