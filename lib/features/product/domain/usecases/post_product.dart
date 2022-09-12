import 'package:proy_productos_v1/features/product/data/model/product_model.dart';
import 'package:proy_productos_v1/features/product/domain/entities/product_state.dart';
import 'package:proy_productos_v1/features/product/domain/repository/iproduct_repository.dart';
import 'package:proy_productos_v1/features/product/domain/usecases/ipost_product.dart';

class PostProducts implements IPostProduct {
  final IProductRepository productRepository;

  PostProducts(this.productRepository);
  @override
  Future<ProductState> postProduct(ProductModel product) {
    return productRepository.postProduct(product);
  }
}
