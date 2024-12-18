import 'package:tugas_vania/app/http/controllers/auth_controller.dart';
import 'package:tugas_vania/app/http/controllers/customer_controller.dart';
import 'package:tugas_vania/app/http/controllers/order_controller.dart';
import 'package:tugas_vania/app/http/controllers/orderitem_controller.dart';
import 'package:tugas_vania/app/http/controllers/productnote_controller.dart';
import 'package:tugas_vania/app/http/controllers/products_controller.dart';
import 'package:tugas_vania/app/http/controllers/users_controller.dart';
import 'package:tugas_vania/app/http/controllers/vendor_controller.dart';
import 'package:vania/vania.dart';

class ApiRoute implements Route {
  @override
  void register() {
    Router.get("/customer", customerController.index);
    Router.get("/customer/{id}", customerController.show);
    Router.post("/customer", customerController.store);
    Router.put("/customer/{id}", customerController.update);
    Router.delete("/customer/{id}", customerController.destroy);

    Router.get("/product", productsController.index);
    Router.post("/product", productsController.store);
    Router.put("/product/{id}", productsController.update);
    Router.delete("/product/{id}", productsController.destroy);

    Router.get("/vendor", vendorController.index);
    Router.post("/vendor", vendorController.store);
    Router.put("/vendor/{id}", vendorController.update);
    Router.delete("/vendor/{id}", vendorController.destroy);

    Router.get("/productnote", productnoteController.index);
    Router.post("/productnote", productnoteController.store);
    Router.get("/productnote/{id}", productnoteController.show);
    Router.put("/productnote/{id}", productnoteController.update);
    Router.delete("/productnote/{id}", productnoteController.destroy);

    Router.get("/order", orderController.index);
    Router.get("/order/{id}", orderController.show);
    Router.get("/order/{id}", orderController.show);
    Router.post("/order", orderController.store);
    Router.put("/order/{id}", orderController.update);
    Router.delete("/order/{id}", orderController.destroy);

    Router.get("/orderitem", orderitemController.index);
    Router.get("/orderitem/{id}", orderitemController.show);
    Router.post("/orderitem", orderitemController.store);
    Router.put("/orderitem/{id}", orderitemController.update);
    Router.delete("/orderitem/{id}", orderitemController.destroy);

    Router.get('/users', usersController.index);
    Router.post('/users', authController.register);
    Router.put('/users', usersController.updatePassword);
    Router.delete('/users/{id}', usersController.destroy);
    Router.post('/login', authController.login);
  }
}
