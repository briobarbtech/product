import 'package:proy_productos_v1/features/product/data/model/product_model.dart';
import 'package:proy_productos_v1/features/product/domain/repository/iproduct_repository.dart';
import 'package:proy_productos_v1/features/product/domain/usecases/iput_product.dart';

class PutProducts implements IPutProduct {
  final IProductRepository productRepository;

  PutProducts(this.productRepository);
  @override
  Future<Map<String, dynamic>> putProduct(ProductModel product) {
    return productRepository.putProduct(product);
  }
}
