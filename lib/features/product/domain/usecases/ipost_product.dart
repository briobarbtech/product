import 'package:proy_productos_v1/features/product/data/model/product_model.dart';
import 'package:proy_productos_v1/features/product/domain/entities/product_state.dart';

abstract class IPostProduct {
  Future<ProductState> postProduct(ProductModel product);
}
