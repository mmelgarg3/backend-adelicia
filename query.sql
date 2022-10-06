
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

CREATE TABLE `complementodetalle` (
  `idDetallePedido` int(11) NOT NULL,
  `idPedido` int(11) NOT NULL,
  `idProducto` int(11) NOT NULL,
  `cantidad` int(5) NOT NULL,
  `idDescuento` int(11) DEFAULT NULL,
  `precioUnitario` decimal(10,2) DEFAULT NULL,
  `valorDetalle` decimal(10,2) DEFAULT NULL,
  `porcentajeDescuento` int(3) DEFAULT NULL,
  `valorDescuento` decimal(10,2) DEFAULT NULL,
  `valorTotal` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Tabla Complemento Detalle Pedido';

--
-- Volcado de datos para la tabla `complementodetalle`
--

INSERT INTO `complementodetalle` (`idDetallePedido`, `idPedido`, `idProducto`, `cantidad`, `idDescuento`, `precioUnitario`, `valorDetalle`, `porcentajeDescuento`, `valorDescuento`, `valorTotal`) VALUES
(1, 15, 2, 2, NULL, '43.00', '86.00', NULL, NULL, '86.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `descuento`
--

CREATE TABLE `descuento` (
  `id` int(11) NOT NULL,
  `Descripcion` varchar(120) NOT NULL,
  `fechaIniciaDescuento` datetime DEFAULT NULL,
  `fechaFinalizaDescuento` datetime DEFAULT NULL,
  `idProducto` int(11) NOT NULL,
  `porcentajeDescuento` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Tabla Descuento';

--
-- Volcado de datos para la tabla `descuento`
--

INSERT INTO `descuento` (`id`, `Descripcion`, `fechaIniciaDescuento`, `fechaFinalizaDescuento`, `idProducto`, `porcentajeDescuento`) VALUES
(6, 'Descuento dia del padre', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 10),
(7, 'Descuento Octubre', '2022-08-06 00:00:00', '2022-10-06 00:00:00', 2, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallepedido`
--

CREATE TABLE `detallepedido` (
  `idDetallePedido` int(11) NOT NULL,
  `idPedido` int(11) NOT NULL,
  `idProducto` int(11) NOT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `idDescuento` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `detallepedido`
--

INSERT INTO `detallepedido` (`idDetallePedido`, `idPedido`, `idProducto`, `cantidad`, `idDescuento`) VALUES
(1, 15, 2, 2, 6);

--
-- Disparadores `detallepedido`
--
DELIMITER $$
CREATE TRIGGER `TR_AltaDetallePedido` AFTER INSERT ON `detallepedido` FOR EACH ROW BEGIN
CALL SP_AltaDetallePedido  (NEW.idDetallePedido,NEW.idPedido, NEW.idProducto, NEW.cantidad );
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `TR_BajaDetallePedido` AFTER DELETE ON `detallepedido` FOR EACH ROW BEGIN
CALL SP_BajaDetallePedido  (OLD.idDetallePedido,OLD.idPedido, OLD.idProducto, OLD.cantidad );
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `TR_CambioDetallePedido` AFTER UPDATE ON `detallepedido` FOR EACH ROW BEGIN
CALL SP_CambioDetallePedido  (NEW.idDetallePedido,NEW.idPedido, NEW.idProducto, NEW.cantidad );
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturacion`
--

CREATE TABLE `facturacion` (
  `id` int(11) NOT NULL,
  `fechaFactura` datetime DEFAULT NULL,
  `totalFactura` decimal(10,2) NOT NULL,
  `idPedido` int(11) NOT NULL,
  `idTipoDePago` int(11) NOT NULL,
  `nTarjeta` int(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Tabla Facturacion';

--
-- Volcado de datos para la tabla `facturacion`
--

INSERT INTO `facturacion` (`id`, `fechaFactura`, `totalFactura`, `idPedido`, `idTipoDePago`, `nTarjeta`) VALUES
(1, '2022-10-04 01:42:56', '86.00', 18, 2, 0),
(2, '2022-10-04 01:47:23', '86.00', 18, 1, 0),
(3, '2022-10-04 01:47:41', '86.00', 18, 1, 0),
(4, '2022-10-04 02:38:00', '189.00', 19, 2, 2147483647),
(5, '2022-10-04 02:39:46', '300.00', 17, 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `id` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `estado` int(11) NOT NULL,
  `totalPedido` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Tabla de Pedido';

--
-- Volcado de datos para la tabla `pedido`
--

INSERT INTO `pedido` (`id`, `fecha`, `idUsuario`, `estado`, `totalPedido`) VALUES
(15, '2022-09-27 23:32:20', 9, 5, '86.00'),
(16, '2022-09-29 02:07:17', 9, 2, '83.00'),
(17, '2022-09-30 02:03:00', 9, 4, '300.00'),
(18, '2022-09-30 02:28:25', 9, 4, '86.00'),
(19, '2022-10-04 02:35:21', 9, 4, '189.00'),
(20, '2022-10-04 04:02:46', 12, 1, '88.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id` int(11) NOT NULL,
  `nombre` varchar(120) DEFAULT NULL,
  `descripcion` varchar(120) DEFAULT NULL,
  `imagen` varchar(200) NOT NULL,
  `precio` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id`, `nombre`, `descripcion`, `imagen`, `precio`) VALUES
(1, 'Cuarto de Libra', 'Delicioso Cuarto de Libra acompañado de papas y bebida', 'https://mcdco.vteximg.com.br/arquivos/ids/157720-1000-1000/26054---McCombo-Doble-Cuarto-de-Libra-con-Queso---Delivery-Propio.png?v=637449304221330000', '40.00'),
(2, 'Torito', 'Delicioso Torito acompañado de papas y bebida', 'https://st3.depositphotos.com/8341086/16399/i/950/depositphotos_163998812-stock-photo-bacon-burger-with-beef-patty.jpg', '43.00'),
(3, 'El Jefe', 'Deliciosa Hamburguesa acompañada de papas y bebida', 'https://www.sitiosargentina.com.ar/wp-content/uploads/2016/03/hamburguesas-gourmet.jpg', '45.00'),
(4, 'Tabla de queso', '12 Quesadillas de queso fundido con fajitas de pollo y vegetales (chile pimiento y cebolla). Acompañada de pico de gallo', 'https://cebollines.com/images/dish/9d92862e9a1636773c95346e6b36e983.jpeg', '149.99'),
(5, 'Platón de Carnitas', '3/4 de libra de carne de cerdo, acompañada de guacamole, frijoles refritos, tortillas y pico de gallo.', 'https://cebollines.com/images/dish/6502700f2deb1533b83dc667dbce36f0.jpeg', '153.00'),
(6, 'Molcajete', 'Combinación de salsa molcajeteada, lomito de res asado, filete de pechuga y camarones, acompañado de aguacate, queso y t', 'https://cebollines.com/images/dish/cfb285fbb983e5cf0ca85d39ddf5d190.jpeg', '147.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipodepago`
--

CREATE TABLE `tipodepago` (
  `idTipoDePago` int(11) NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipodepago`
--

INSERT INTO `tipodepago` (`idTipoDePago`, `descripcion`) VALUES
(1, 'Efectivo'),
(2, 'Tarjeta');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipousuario`
--

CREATE TABLE `tipousuario` (
  `idTipoUsuario` int(11) NOT NULL,
  `descripcion` varchar(120) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipousuario`
--

INSERT INTO `tipousuario` (`idTipoUsuario`, `descripcion`) VALUES
(1, 'Administrador'),
(2, 'Cocinero'),
(3, 'Mesero'),
(4, 'Cliente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `nombre` varchar(120) DEFAULT NULL,
  `apellido` varchar(120) DEFAULT NULL,
  `correo` varchar(120) DEFAULT NULL,
  `contra` varchar(15) DEFAULT NULL,
  `idTipoUsuario` int(11) NOT NULL,
  `refresh_token` text DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `nombre`, `apellido`, `correo`, `contra`, `idTipoUsuario`, `refresh_token`, `createdAt`, `updatedAt`) VALUES
(7, 'Daniela', 'Tubin', 'daniela_tub@gmail.com', 'pusho', 2, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjcsIm5hbWUiOiJEYW5pZWxhIiwiZW1haWwiOiJkYW5pZWxhX3R1YkBnbWFpbC5jb20iLCJpYXQiOjE2NjQ5MDY1ODcsImV4cCI6MTY2NDk5Mjk4N30.7NMpNOzDyfav4pwOkAn6UoE3YXuK5Qfj9Qsw95rqwEQ', '2022-09-20 00:04:08', '2022-10-04 18:03:07'),
(8, 'Oliver', 'Tzunun', 'olstertecn597@gmail.com', 'daniela11', 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjgsIm5hbWUiOiJPbGl2ZXIiLCJlbWFpbCI6Im9sc3RlcnRlY241OTdAZ21haWwuY29tIiwiaWF0IjoxNjY0ODU2MTIyLCJleHAiOjE2NjQ5NDI1MjJ9.e5uzswR3wzGho_ZrZdlMZ9ceuLggWpAzZILCgFfO7wI', '2022-09-20 21:15:10', '2022-10-04 04:02:02'),
(9, 'Ever', 'Lopez', 'ever@gmail.com', '1234', 4, NULL, '2022-09-20 21:15:53', '2022-10-05 17:18:20'),
(10, 'taylor', 'swift', 'tswift@gmail.com', 'daniela', 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjEwLCJuYW1lIjoidGF5bG9yIiwiZW1haWwiOiJ0c3dpZnRAZ21haWwuY29tIiwiaWF0IjoxNjYzNzI0ODE0LCJleHAiOjE2NjM4MTEyMTR9.Tn-mw86yJpJjAWBbhaa0ltK8J-_x3BtqUUlNo1lbefg', '2022-09-21 01:46:42', '2022-09-21 01:46:54'),
(11, 'Manuel', 'Ramirez', 'manur@gmail.com', '1234', 3, NULL, '2022-09-28 04:34:54', '2022-10-04 02:40:11'),
(12, 'neymar', 'silva', 'ney@gmail.com', '1234', 4, NULL, '2022-10-04 04:02:29', '2022-10-04 18:02:26');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `complementodetalle`
--
ALTER TABLE `complementodetalle`
  ADD PRIMARY KEY (`idDetallePedido`),
  ADD UNIQUE KEY `idDetallePedido` (`idDetallePedido`);

--
-- Indices de la tabla `descuento`
--
ALTER TABLE `descuento`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idDescuento` (`id`),
  ADD KEY `idProducto` (`idProducto`);

--
-- Indices de la tabla `detallepedido`
--
ALTER TABLE `detallepedido`
  ADD PRIMARY KEY (`idDetallePedido`),
  ADD KEY `idPedido` (`idPedido`),
  ADD KEY `idProducto` (`idProducto`),
  ADD KEY `idDescuento` (`idDescuento`);

--
-- Indices de la tabla `facturacion`
--
ALTER TABLE `facturacion`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idFactura` (`id`),
  ADD KEY `idPedido` (`idPedido`),
  ADD KEY `idTipoDePago` (`idTipoDePago`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idPedido` (`id`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipodepago`
--
ALTER TABLE `tipodepago`
  ADD PRIMARY KEY (`idTipoDePago`);

--
-- Indices de la tabla `tipousuario`
--
ALTER TABLE `tipousuario`
  ADD PRIMARY KEY (`idTipoUsuario`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idTipoUsuario` (`idTipoUsuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `complementodetalle`
--
ALTER TABLE `complementodetalle`
  MODIFY `idDetallePedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `descuento`
--
ALTER TABLE `descuento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `detallepedido`
--
ALTER TABLE `detallepedido`
  MODIFY `idDetallePedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `facturacion`
--
ALTER TABLE `facturacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `pedido`
--
ALTER TABLE `pedido`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `tipodepago`
--
ALTER TABLE `tipodepago`
  MODIFY `idTipoDePago` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `descuento`
--
ALTER TABLE `descuento`
  ADD CONSTRAINT `descuento_ibfk_1` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`id`);

--
-- Filtros para la tabla `detallepedido`
--
ALTER TABLE `detallepedido`
  ADD CONSTRAINT `detallepedido_ibfk_1` FOREIGN KEY (`idPedido`) REFERENCES `pedido` (`id`),
  ADD CONSTRAINT `detallepedido_ibfk_2` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`id`),
  ADD CONSTRAINT `detallepedido_ibfk_3` FOREIGN KEY (`idDescuento`) REFERENCES `descuento` (`id`);

--
-- Filtros para la tabla `facturacion`
--
ALTER TABLE `facturacion`
  ADD CONSTRAINT `facturacion_ibfk_1` FOREIGN KEY (`idPedido`) REFERENCES `pedido` (`id`),
  ADD CONSTRAINT `facturacion_ibfk_2` FOREIGN KEY (`idTipoDePago`) REFERENCES `tipodepago` (`idTipoDePago`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`idTipoUsuario`) REFERENCES `tipousuario` (`idTipoUsuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/

-- PROCEDURES 

-- Alta

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_AltaDetallePedido`(IN `Xid_idDetallePedido` INT(11), IN `Xid_idPedido` INT(11), IN `Xid_idProducto` INT(11), IN `Xid_cantidad` INT(5))
BEGIN 
INSERT ComplementoDetalle (idDetallePedido, idPedido, idProducto, cantidad, idDescuento, precioUnitario, valorDetalle, porcentajeDescuento, valorDescuento, valorTotal) VALUES (Xid_idDetallePedido,Xid_idPedido,Xid_idProducto,Xid_cantidad, 
(select id
from Descuento  where Descuento.idProducto=Xid_idProducto
and Descuento.fechaIniciaDescuento<= (select fecha from Pedido where Pedido.id=Xid_idPedido)  
and Descuento.fechaFinalizaDescuento>= (select fecha from Pedido where Pedido.id=Xid_idPedido)), 
(select precio from Producto where Producto.id=Xid_idProducto),
(cantidad * (select precio from Producto where Producto.id=Xid_idProducto)),
(select porcentajeDescuento
from Descuento  where Descuento.idProducto=Xid_idProducto
and Descuento.fechaIniciaDescuento<= (select fecha from Pedido where Pedido.id=Xid_idPedido)  
and Descuento.fechaFinalizaDescuento>= (select fecha from Pedido where Pedido.id=Xid_idPedido)),
(valorDetalle * (porcentajeDescuento / 100)),
(valorDetalle -   (ifnull(valorDescuento,0)))
);
UPDATE Pedido set totalPedido = (select sum(valorTotal) from complementoDetalle where id=Xid_idPedido) where id= Xid_idPedido;
END$$
DELIMITER ;






-- baja 
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_BajaDetallePedido`( 
in Xid_idDetallePedido INT (11),
in Xid_idPedido INT(11) ,
in Xid_idProducto INT (11),
in Xid_cantidad  INT(5)
)
BEGIN 
DELETE From ComplementoDetalle where idDetallePedido=Xid_idDetallePedido;
UPDATE Pedido set totalPedido = (select sum(valorTotal) from complementoDetalle where id=Xid_idPedido) where id= Xid_idPedido;
END$$
DELIMITER ;
