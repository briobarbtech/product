import 'package:dio/dio.dart';
import 'package:proy_productos_v1/features/product/data/datasource/iproduct_remote.dart';
import 'package:proy_productos_v1/features/product/data/model/product_model.dart';

class ProductRemoteDatasource implements IProductRemoteDatasource {
  final String _url = 'http://localhost:5000/product';
  @override
  Future<List<ProductModel>> requestProducts() async {
    Response response = await Dio().get(_url);
    if (response.statusCode == 200) {
      final List result = response.data['products'];
      return result.map((e) => ProductModel.fromJson(e)).toList();
    } else {
      throw Exception(response);
    }
  }

  @override
  crearProducto(ProductModel producto) async {
    try {
      await Dio().post(_url, data: producto.toJson());

      return {'ok': true};
    } on DioError catch (e) {
      //return {'ok': false, 'mensaje': e.response.data['error']};
      return {'ok': false, 'mensaje': e.response};
    }
  }

  @override
  Future<Map<String, dynamic>> modificarProducto(ProductModel producto) async {
    try {
      print(producto.name);
      var _url2 = "$_url/${producto.id.toString()}";
      await Dio().put(_url2, data: producto.toJson());

      return {'ok': true};
    } on DioError catch (e) {
      return {'ok': false, 'mensaje': e.response};
    }
  }
}
