import 'package:vania/vania.dart';
import 'package:tugas_vania/app/models/productnotes.dart';

class ProductnoteController extends Controller {
  Future<Response> index() async {
    final productnotes = await Productnotes().query().get();
    return Response.json(productnotes);
  }

  Future<Response> create() async {
    return Response.json({});
  }

  Future<Response> store(Request request) async {
    request.validate({
      'prod_id': 'required',
      'note_date': 'required|date',
      'note_text': 'required',
    });

    await Productnotes().query().insert(request.body);
    return Response.json({
      'message': 'Berhasil Menambahkan Product Note!',
      'data': request.body
    });
  }

  Future<Response> show(int id) async {
    return Response.json({});
  }

  Future<Response> edit(int id) async {
    return Response.json({});
  }

  Future<Response> update(Request request, int id) async {
    request.validate({
      'prod_id': 'required',
      'note_date': 'required|date',
      'note_text': 'required',
    });

    final updated = await Productnotes()
        .query()
        .where('note_id', id.toString())
        .update(request.body);

    if (updated == 0) {
      return Response.json({'message': 'Product Note not found'});
    }

    return Response.json(
        {'message': 'Berhasil Mengupdate Product Note!', 'data': request.body});
  }

  Future<Response> destroy(int id) async {
    final deleted = await Productnotes()
        .query()
        .where('note_id', '=', id.toString())
        .delete()
        .timeout(Duration(seconds: 5));

    if (deleted == 0) {
      return Response.json({'message': 'Product Note not found'});
    }

    return Response.json({'message': 'Product Note terhapus!'});
  }
}

final ProductnoteController productnoteController = ProductnoteController();
