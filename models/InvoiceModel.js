import { Sequelize } from "sequelize";
import db from "../config/Database.js";


const { DataTypes } = Sequelize;


const Invoice = db.define('facturacion', {
    id: {
        type: DataTypes.NUMBER,
        primaryKey: true
    },
    fechaFactura: {
        type: DataTypes.DATE
    },
    totalFactura: {
        type: DataTypes.DECIMAL
    },
    idPedido: {
        type: DataTypes.NUMBER
    },
    idTipoDePago: {
        type: DataTypes.NUMBER
    },
    nTarjeta: {
        type: DataTypes.NUMBER
    }


},
{
    createdAt: false,
    updatedAt: false,
    freezeTableName: true
});

export default Invoice;