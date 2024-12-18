import 'package:tugas_vania/app/models/vendors.dart';
import 'package:vania/vania.dart';

class VendorController extends Controller {
  Future<Response> index() async {
    final vendors = await Vendors().query().get();
    return Response.json(vendors);
  }

  Future<Response> create() async {
    return Response.json({'message': 'Render form to create a new vendor'});
  }

  Future<Response> store(Request request) async {
    request.validate({
      'vend_name': 'required',
      'vend_address': 'required',
      'vend_kota': 'required',
      'vend_state': 'required',
      'vend_zip': 'required',
      'vend_country': 'required',
    });

    await Vendors().query().insert(request.body);
    return Response.json(
        {'message': 'Berhasil Menambahkan data vendor!', 'data': request.body});
  }

  Future<Response> show(int id) async {
    return Response.json({});
  }

  Future<Response> edit(int id) async {
    return Response.json({});
  }

  Future<Response> update(Request request, int id) async {
    request.validate({
      'vend_name': 'required',
      'vend_address': 'required',
      'vend_kota': 'required',
      'vend_state': 'required',
      'vend_zip': 'required',
      'vend_country': 'required',
    });

    await Vendors()
        .query()
        .where('vend_id', id.toString())
        .update(request.body);
    return Response.json(
        {'message': 'Berhasil Mengupdate data vendor!', 'data': request.body});
  }

  Future<Response> destroy(int id) async {
    await Vendors()
        .query()
        .where('vend_id', '=', id.toString())
        .delete()
        .timeout(Duration(seconds: 5));
    return Response.json({'message': 'Data vendor terhapus!'});
  }
}

final VendorController vendorController = VendorController();
