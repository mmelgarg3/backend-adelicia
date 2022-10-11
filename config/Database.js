import {Sequelize} from "sequelize";

const db = new Sequelize('restauranteadelicias','mmelgar','David$2020',{
    host: "azdb6789-mysql-adelicias.mysql.database.azure.com",
    dialect: "mysql"
});

export default db;
