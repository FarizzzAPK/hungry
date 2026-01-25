import 'package:hungry/core/network/api_service.dart';
import 'package:hungry/features/product/data/models/options_model.dart';
import 'package:hungry/features/product/data/models/product_model.dart';
import 'package:hungry/features/product/data/models/topping_model.dart';

class ProductRepo {
  final ApiService apiService = ApiService();

  Future<List<ProductModel>> getProducts() async {
    try {
      final response = await apiService.get('/products/');

      return (response['data'] as List)
          .map((e) => ProductModel.fromJson(e))
          .toList();
    } catch (e) {
      print(e.toString());
      return [];
    }
  }


  Future<List<ToppingModel>> getToppings() async {
    try {
      final response = await apiService.get('/toppings');

      return (response['data'] as List)
          .map((e) => ToppingModel.fromJson(e))
          .toList();
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  Future<List<OptionsModel>> getOptions() async {
    try {
      final response = await apiService.get('/side-options');

      return (response['data'] as List)
          .map((e) => OptionsModel.fromJson(e))
          .toList();
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
