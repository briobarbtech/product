import 'package:proy_productos_v1/features/product/data/model/product_model.dart';

abstract class IPutProduct {
  Future<Map<String, dynamic>> putProduct(ProductModel product);
}
