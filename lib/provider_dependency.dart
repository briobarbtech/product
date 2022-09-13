import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:proy_productos_v1/features/product/data/model/product_model.dart';
import 'package:proy_productos_v1/features/product/data/datasource/product_remote.dart';
import 'package:proy_productos_v1/features/product/data/repository/product_repository.dart';
import 'package:proy_productos_v1/features/product/domain/entities/product_state.dart';
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

/* POST */

//Data
final productDataSourcePost = Provider<ProductRemoteDatasource>(
  (ref) => ProductRemoteDatasource(),
);
//Repository
final productRepositoryProviderPost = Provider<IProductRepository>(
    (ref) => ProductRepository(ref.watch(productDataSourcePost)));
//Domain
final productUseCasePost = Provider<IPostProduct>(
    (ref) => PostProducts(ref.watch(productRepositoryProviderPost)));
//Presentation
final postProductData =
    FutureProvider.family<ProductState, ProductModel>((ref, product) async {
  return ref.watch(productUseCasePost).postProduct(product);
});

/* PUT */

//Data
final productDataSourcePut = Provider<ProductRemoteDatasource>(
  (ref) => ProductRemoteDatasource(),
);
//Repository
final productRepositoryProviderPut = Provider<IProductRepository>(
    (ref) => ProductRepository(ref.watch(productDataSourcePut)));
//Domain
final productUseCasePut = Provider<IPutProduct>(
    (ref) => PutProducts(ref.watch(productRepositoryProviderPut)));
//Presentation
final putProductData =
    FutureProvider.family<Map<String, dynamic>, ProductModel>(
        (ref, product) async {
  return ref.watch(productUseCasePut).putProduct(product);
});
