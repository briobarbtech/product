import 'package:proy_productos_v1/features/product/data/datasource/iproduct_remote.dart';
import 'package:proy_productos_v1/features/product/data/model/product_model.dart';
import 'package:proy_productos_v1/features/product/domain/entities/product.dart';
import 'package:proy_productos_v1/features/product/domain/entities/product_state.dart';
import 'package:proy_productos_v1/features/product/domain/repository/iproduct_repository.dart';

class ProductRepository implements IProductRepository {
  final IProductRemoteDatasource remoteDatasource;

  ProductRepository(this.remoteDatasource);

  @override
  Future<List<Product>> getProduct() {
    final productList = remoteDatasource.requestProducts();
    return productList;
  }

  @override
  Future<ProductState> postProduct(ProductModel producto) {
    return remoteDatasource.crearProducto(producto);
  }

  @override
  putProduct(ProductModel product) {
    return remoteDatasource.modificarProducto(product);
  }
}
