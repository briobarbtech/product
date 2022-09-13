// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductState _$$_ProductStateFromJson(Map<String, dynamic> json) =>
    _$_ProductState(
      products: json['products'] as List<dynamic>? ?? const [],
      isLoading: json['isLoading'] as bool? ?? true,
    );

Map<String, dynamic> _$$_ProductStateToJson(_$_ProductState instance) =>
    <String, dynamic>{
      'products': instance.products,
      'isLoading': instance.isLoading,
    };
