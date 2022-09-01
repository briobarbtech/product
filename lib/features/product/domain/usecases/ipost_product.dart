import 'package:proy_productos_v1/features/product/data/model/product_model.dart';

abstract class IPostProduct {
  Future<Map<String, dynamic>> postProduct(ProductModel product);
}
