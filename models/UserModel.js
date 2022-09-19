import { Sequelize } from "sequelize";
import db from "../config/Database.js";

const { DataTypes } = Sequelize;

const Users = db.define('usuario',{
    idUsuario: {
        type: DataTypes.NUMBER
    },
    nombre: {
        type: DataTypes.STRING
    },
    apellido: {
        type: DataTypes.STRING
    },
    correo:{
        type: DataTypes.STRING
    },
    contra:{
        type: DataTypes.STRING
    },
    idTipoUsuario: {
        type: DataTypes.NUMBER
    },
    refresh_token:{
        type: DataTypes.TEXT
    }
},{
    freezeTableName:true
});

export default Users;