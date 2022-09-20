import { Sequelize } from "sequelize";
import db from "../config/Database.js";


const { DataTypes } = Sequelize;


const Product = db.define('producto', {
    id: {
        type: DataTypes.NUMBER,
        primaryKey: true
    },
    nombre: {
        type: DataTypes.STRING
    },
    descripcion: {
        type: DataTypes.STRING
    },
    imagen: {
        type: DataTypes.STRING
    },
    precio: {
        type: DataTypes.DECIMAL
    }
},
{
    freezeTableName: true
});

export default Product;




