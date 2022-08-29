import 'package:proy_productos_v1/features/product/data/model/product_model.dart';
import 'package:proy_productos_v1/features/product/domain/entities/product.dart';

abstract class IProductRepository {
  Future<List<Product>> getProduct();
  postProduct(ProductModel product);
  putProduct(ProductModel product);
}
