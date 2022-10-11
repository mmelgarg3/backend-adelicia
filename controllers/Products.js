import Product from "../models/ProductModel.js";


export const getProducts = async(req, res) => {
    try {
        const products = await Product.findAll({
            attributes:['id','nombre','descripcion','imagen', 'precio']
        });
        res.json(products);
    } catch (error) {
        console.log(error);
	res.json(error);
    }
}
