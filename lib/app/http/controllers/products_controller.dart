import 'package:tugas_vania/app/models/products.dart';
import 'package:vania/vania.dart';

class ProductsController extends Controller {
  Future<Response> index() async {
    final products = await Products().query().get();
    return Response.json(products);
  }

  Future<Response> create() async {
    return Response.json({});
  }

  Future<Response> store(Request request) async {
    request.validate({
      'prod_name': 'required',
      'vend_id': 'required',
      'prod_price': 'required|numeric',
      'prod_desc': 'required',
    });
    await Products().query().insert(request.body);
    return Response.json(
        {'message': 'Berhasil Menambahkan data produk!', 'data': request.body});
  }

  Future<Response> show(int id) async {
    return Response.json({});
  }

  Future<Response> edit(int id) async {
    return Response.json({});
  }

  Future<Response> update(Request request, int id) async {
    request.validate({
      'prod_name': 'required',
      'vend_id': 'required',
      'prod_price': 'required|numeric',
      'prod_desc': 'required',
    });

    await Products()
        .query()
        .where('prod_id', id.toString())
        .update(request.body);
    return Response.json(
        {'message': 'Berhasil Mengupdate data Produk', 'data': request.body});
  }

  Future<Response> destroy(int id) async {
    await Products()
        .query()
        .where('prod_id', '=', id.toString())
        .delete()
        .timeout(Duration(seconds: 5));
    return Response.json({
      'message': 'Data Produk Terhapus!',
    });
  }
}

final ProductsController productsController = ProductsController();
