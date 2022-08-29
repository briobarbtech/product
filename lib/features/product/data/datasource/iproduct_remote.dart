import 'package:proy_productos_v1/features/product/data/model/product_model.dart';

abstract class IProductRemoteDatasource {
  Future<List<ProductModel>> requestProducts();
  Future<Map<String, dynamic>> crearProducto(ProductModel producto); 
  Future<Map<String, dynamic>> modificarProducto(ProductModel producto);
}
