import Order from "../models/OrderModel";

export const RegisterOrder = async(req, res) =>{
    const { userId, total } = req.body;
    try{
        await Order.create({
            idUsuario: userId,
            totalPedido: total
        });
        res.json({msg: "Orden realizada"});
    }catch(error){
        console.log(error);
    }
}