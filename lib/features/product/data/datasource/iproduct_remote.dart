import 'package:proy_productos_v1/features/product/data/model/product_model.dart';
import 'package:proy_productos_v1/features/product/domain/entities/product_state.dart';

abstract class IProductRemoteDatasource {
  Future<List<ProductModel>> requestProducts();
  Future<ProductState> crearProducto(ProductModel producto);
  Future<Map<String, dynamic>> modificarProducto(ProductModel producto);
}
