import Order from "../models/OrderModel.js";

export const RegisterOrder = async(req, res) =>{
    const { userId, total } = req.body;
    try{
        await Order.create({
            fecha: new Date(),
            idUsuario: userId,
            estado: 1,
            totalPedido: total
        });
        res.json({msg: "Orden realizada"});
    }catch(error){
        console.log(error);
    }
}

export const getOrdersForCook = async(req, res)=>{
    try {
        const orders = await Order.findAll({
            attributes:['id', 'fecha', 'idUsuario', 'estado', 'totalPedido']
        });
        res.json(orders);
    } catch (error) {
        console.log(error);
    }
}