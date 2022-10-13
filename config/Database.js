import {Sequelize} from "sequelize";
import fs from "fs";

// const servca = [fs.readFileSync("./ssl/DigiCertGlobalRootCA.crt.pem", "utf8")];
// const db = new Sequelize('restauranteadelicias','mmelgar','David$2020',{
//     host: "azdb6789-mysql-adelicias.mysql.database.azure.com",
//     dialect: "mysql",
//     ssl: true,
//     dialectOptions: {
//       ssl: {
// 	require: true
//       }
//     }
// });

const db = new Sequelize('restauranteadelicias','root','',{
    host: "localhost",
    dialect: "mysql",
});




export default db;
