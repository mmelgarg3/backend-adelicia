import Order from "../models/OrderModel.js";
import  {createOrderDetail} from "../controllers/OrderDetail.js";
import mysqlConnection from "../db/index.js";



export const RegisterOrder = async(req, res) =>{
    const { userId, total, products} = req.body;
    try{
        // const order_created = await Order.create({
        //     fecha: new Date(),
        //     idUsuario: userId,
        //     estado: 1,
        //     totalPedido: total
        // });
	console.log(total);
	var sql = "insert into pedido(fecha, idUsuario, estado, totalPedido)values ?";
	var values = [[new Date(), userId, 1, total]]
	mysqlConnection.query(sql, [values],(err, result)=>{
	  if(err) throw err;
	  products.forEach((prd)=>{
	    console.log(result.insertId);
	    createOrderDetail(result.insertId, prd.id, 1, 7);
	  });
	});

        res.json({msg: "Orden realizada"});
    }catch(error){
        console.log(error);
    }
}

export const getOrdersByStatus = async(req, res)=>{
    try {
        const orders = await Order.findAll({
            attributes:['id', 'fecha', 'idUsuario', 'estado', 'totalPedido'],
            where:{
                estado: req.query.estado 
            }
        });
        res.json(orders);
    } catch (error) {
        console.log(error);
    }
}


export const getOrderById = async(req, res)=>{
    try {
        const orders = await Order.findAll({
            attributes:['id', 'fecha', 'idUsuario', 'estado', 'totalPedido'],
            order: [
                ['fecha', 'DESC']
            ],
            where: {
                idUsuario: req.query.id 
            }

        });
        res.json(orders);
    } catch (error) {
        console.log(error);
    }
}


export const getAllOrders = async(req, res)=>{
    try {
        const orders = await Order.findAll({
            attributes:['id', 'fecha', 'idUsuario', 'estado', 'totalPedido'],
            order: [
                ['fecha', 'DESC']
            ],
            where: {
                idUsuario: req.query.id 
            }

        });
        res.json(orders);
    } catch (error) {
        console.log(error);
    }
}



export const FinishOrder = async ( req, res) =>{
    try{
        await Order.update({estado:3}, {
            where:{
                id: req.body.id
            }
        });
    }
    catch(err){
        console.log(err)
    }
}

export const CheckOrder = async (idOrder) =>{
    try{
        await Order.update({estado:4}, {
            where:{
                id: idOrder 
            }
        });
    }
    catch(err){
        console.log(err)
    }
}

export const changeToWaiter = async (req, res) =>{
    try{
        await Order.update({estado:2}, {
            where:{
                id: req.body.id
            }
        });
    }
    catch(err){
        console.log(err)
    }
}

export const cancelOrder = async(req, res)=>{
    try{
        await Order.update({estado: 5},{
            where:{
                id: req.body.id
            }
        });
    }catch(err){
        console.log(err);
    }
}
    

