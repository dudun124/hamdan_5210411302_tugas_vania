import 'package:tugas_vania/app/models/customers.dart';

Map<String, dynamic> authConfig = {
  'guards': {
    'default': {
      'provider': Customers(),
    }
  }
};
