import 'package:vania/vania.dart';

class CreateOrderitemsTable extends Migration {
  @override
  Future<void> up() async {
    super.up();
    await createTableNotExists('orderitems', () {
      integer('order_item', unique: true);
      primary('order_item');
      integer('order_num', length: 11);
      foreign('order_num', 'orders', 'order_num',
          constrained: true, onDelete: 'CASCADE');
      char('prod_id', length: 10);
      foreign('prod_id', 'products', 'prod_id',
          constrained: true, onDelete: 'CASCADE');
      integer('quantity', length: 11);
      integer('size', length: 11);
    });
  }

  @override
  Future<void> down() async {
    super.down();
    await dropIfExists('orderitems');
  }
}
