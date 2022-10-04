import Invoice from './../models/InvoiceModel.js';


export const registerInvoice = async(req, res) =>{
    const { total, idOrder, idTypePayment, nCard } = req.body;
    try{
        await Invoice.create({
            fechaFactura: new Date(),
            totalFactura: total,
            idPedido: idOrder,
            idTipoDePago: idTypePayment,
            nTarjeta: nCard
        });
        res.json({msg: "Orden realizada"});
    }catch(error){
        console.log(error);
    }
}