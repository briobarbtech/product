import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:proy_productos_v1/features/product/domain/entities/product_state.dart';

final postProvider =
    StateNotifierProvider<StateNotifierProduct, ProductState>((ref) {
  return StateNotifierProduct();
});

class StateNotifierProduct extends StateNotifier<ProductState> {
  StateNotifierProduct() : super(const ProductState());

  void postSuccesful(ProductState response) {
    state = response;
  }
}
