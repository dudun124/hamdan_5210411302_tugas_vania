import 'package:vania/vania.dart';
import 'package:tugas_vania/app/models/orders.dart';

class OrderController extends Controller {
  Future<Response> index() async {
    final orders = await Orders().query().get();
    return Response.json(orders);
  }

  Future<Response> create() async {
    return Response.json({'message': 'Render form to create a new order'});
  }

  Future<Response> store(Request request) async {
    request.validate({
      'order_date': 'required|date',
      'cust_id': 'required',
    });

    await Orders().query().insert(request.body);
    return Response.json(
        {'message': 'Berhasil Menambahkan Order!', 'data': request.body});
  }

  Future<Response> show(int id) async {
    // Fetch the order using the provided ID
    final order = await Orders()
        .query()
        .where('order_num', id.toString())
        .first(); // Get the first order matching the order_num

    if (order == null) {
      return Response.json({'message': 'Order not found'});
    }

    return Response.json(order); // Return the order data
  }

  Future<Response> edit(int id) async {
    return Response.json({});
  }

  Future<Response> update(Request request, int id) async {
    request.validate({
      'order_date': 'required|date',
      'cust_id': 'required',
    });
    final updated = await Orders()
        .query()
        .where('order_num', id.toString())
        .update(request.body);
    if (updated == 0) {
      return Response.json({'message': 'Order not found'});
    }
    return Response.json(
        {'message': 'Berhasil Mengupdate Order!', 'data': request.body});
  }

  Future<Response> destroy(int id) async {
    final deleted = await Orders()
        .query()
        .where('order_num', '=', id.toString())
        .delete()
        .timeout(Duration(seconds: 5));
    if (deleted == 0) {
      return Response.json({'message': 'Order not found'});
    }
    return Response.json({'message': 'Order terhapus!'});
  }
}

final OrderController orderController = OrderController();
