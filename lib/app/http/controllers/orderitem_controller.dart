import 'package:vania/vania.dart';
import 'package:tugas_vania/app/models/orderitems.dart';

class OrderitemController extends Controller {
  Future<Response> index() async {
    final orderItems = await Orderitems().query().get();
    return Response.json(orderItems);
  }

  Future<Response> create() async {
    return Response.json({'message': 'Render form to create a new order item'});
  }

  Future<Response> store(Request request) async {
    request.validate({
      'order_num': 'required|integer',
      'prod_id': 'required',
      'quantity': 'required|integer',
      'size': 'required|integer',
    });

    await Orderitems().query().insert(request.body);
    return Response.json(
        {'message': 'Berhasil Menambahkan Order Item!', 'data': request.body});
  }

  Future<Response> show(int id) async {
    final orderItem =
        await Orderitems().query().where('order_item', id.toString()).first();
    if (orderItem == null) {
      return Response.json({'message': 'Order Item not found'});
    }
    return Response.json(orderItem);
  }

  Future<Response> edit(int id) async {
    return Response.json({});
  }

  Future<Response> update(Request request, int id) async {
    request.validate({
      'order_num': 'required|integer',
      'prod_id': 'required',
      'quantity': 'required|integer',
      'size': 'required|integer',
    });

    final updated = await Orderitems()
        .query()
        .where('order_item', id.toString())
        .update(request.body);

    if (updated == 0) {
      return Response.json({'message': 'Order Item not found'});
    }

    return Response.json(
        {'message': 'Berhasil Mengupdate Order Item!', 'data': request.body});
  }

  Future<Response> destroy(int id) async {
    final deleted = await Orderitems()
        .query()
        .where('order_item', '=', id.toString())
        .delete()
        .timeout(Duration(seconds: 5));

    if (deleted == 0) {
      return Response.json({'message': 'Order Item not found'});
    }

    return Response.json({'message': 'Order Item terhapus!'});
  }
}

final OrderitemController orderitemController = OrderitemController();
