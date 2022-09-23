import { Sequelize } from "sequelize";
import db from "../config/Database.js";


const { DataTypes } = Sequelize;


const Order = db.define('pedido', {
    id: {
        type: DataTypes.NUMBER,
        primaryKey: true
    },
    idUsuario: {
        type: DataTypes.NUMBER
    },
    totalPedido: {
        type: DataTypes.DECIMAL
    }
},
{
    freezeTableName: true
});

export default Order;



