import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:proy_productos_v1/features/product/data/datasource/product_remote.dart';
import 'package:proy_productos_v1/features/product/domain/entities/product.dart';
import 'package:proy_productos_v1/provider_dependency.dart';

part 'product_state.freezed.dart';
part 'product_state.g.dart';

@Freezed()
class ProductState with _$ProductState {
  const factory ProductState(
      {@Default([]) List<Product> products,
      @Default(true) bool isLoading}) = _ProductState;

  factory ProductState.fromJson(Map<String, dynamic> json) =>
      _$ProductStateFromJson(json);

  const ProductState._();
}

final productProvider =
    StateNotifierProvider<StateNotifierProduct, ProductState>((ref) {
  return StateNotifierProduct();
});

class StateNotifierProduct extends StateNotifier<ProductState> {
  StateNotifierProduct() : super(const ProductState()) {
    loadProducts();
  }

  void loadProducts() async {
    state = state.copyWith(isLoading: true);
    final product = await ProductRemoteDatasource().requestProducts();
    //final product = await ProductServices().fetchProducts();
    state = state.copyWith(products: product, isLoading: false);
  }
}

/* class ProductServices {
  late final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'http://localhost:5000',
      connectTimeout: 5000,
      receiveTimeout: 3000,
      responseType: ResponseType.json,
    ),
  );

  Future<List<dynamic>> fetchProducts() async {
    // Load json data
    final productData = await _dio.get('/product');
    // Decode json data to list
    return productData.data;
  }} */