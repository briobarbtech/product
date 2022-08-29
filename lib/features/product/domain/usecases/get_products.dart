import 'package:proy_productos_v1/features/product/domain/entities/product.dart';
import 'package:proy_productos_v1/features/product/domain/repository/iproduct_repository.dart';

import 'iget_products.dart';

class GetProducts implements IGetProducts {
  final IProductRepository productRepository;

  GetProducts(this.productRepository);
  @override
  Future<List<Product>> getProducts() {
    return productRepository.getProduct();
  }
}
