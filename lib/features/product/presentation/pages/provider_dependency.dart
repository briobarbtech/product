import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:proy_productos_v1/features/product/data/datasource/iproduct_remote.dart';
import 'package:proy_productos_v1/features/product/data/datasource/product_remote.dart';
import 'package:proy_productos_v1/features/product/data/repository/product_repository.dart';
import 'package:proy_productos_v1/features/product/domain/entities/product.dart';
import 'package:proy_productos_v1/features/product/domain/repository/iproduct_repository.dart';
import 'package:proy_productos_v1/features/product/domain/usecases/get_products.dart';
import 'package:proy_productos_v1/features/product/domain/usecases/iget_products.dart';
import 'package:proy_productos_v1/features/product/domain/usecases/iput_product.dart';
import 'package:proy_productos_v1/features/product/domain/usecases/post_product.dart';
import 'package:proy_productos_v1/features/product/domain/usecases/ipost_product.dart';
import 'package:proy_productos_v1/features/product/domain/usecases/put_product.dart';

//Data
final productDataSource = Provider.autoDispose<ProductRemoteDatasource>(
  (ref) => ProductRemoteDatasource(),
);
//Repository
final productRepositoryProvider = Provider.autoDispose<IProductRepository>(
    (ref) => ProductRepository(ref.watch(productDataSource)));
//Domain
final productUseCaseProvider = Provider.autoDispose<IGetProducts>(
    (ref) => GetProducts(ref.watch(productRepositoryProvider)));
//Presentation
final getProductData = FutureProvider.autoDispose<List<Product>>((ref) async {
  return ref.watch(productUseCaseProvider).getProducts();
});

//Data
IProductRemoteDatasource productDataSourcePost = ProductRemoteDatasource();
//Repository
IProductRepository productRepositoryProviderPost =
    ProductRepository(productDataSourcePost);
//Domain
IPostProduct productUseCasePost = PostProducts(productRepositoryProviderPost);
//Presentation

//Data
IProductRemoteDatasource productDataSourcePut = ProductRemoteDatasource();
//Repository
IProductRepository productRepositoryProviderPut =
    ProductRepository(productDataSourcePut);
//Domain
IPutProduct productUseCasePut = PutProducts(productRepositoryProviderPut);
//Presentation
