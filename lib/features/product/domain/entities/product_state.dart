import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_state.freezed.dart';
part 'product_state.g.dart';

@Freezed()
class ProductState with _$ProductState {
  const factory ProductState({
    @Default(false) bool isLoading,
  }) = _ProductState;

  factory ProductState.fromJson(Map<String, dynamic> json) =>
      _$ProductStateFromJson(json);
}
