import 'package:dio/dio.dart';
import 'package:lafyuu/model/categorey_response.dart';
import 'package:lafyuu/model/home_response.dart';

class HomeRepository{

  Future<CategoryModel> getCategorys() async {
    final res = await Dio().get('https://student.valuxapps.com/api/categories');
    final data = CategoryModel.fromJson(res.data);
    return data;
  }

  Future<HomeModel> getHome() async {
    final res = await Dio().get('https://student.valuxapps.com/api/home');
    final data = HomeModel.fromJson(res.data);
    return data;
  }

  Future<HomeModel> getFavoriteProduct() async {
    final res = await Dio().get('https://student.valuxapps.com/api/products?category_id=44');
    final data = HomeModel.fromJson(res.data);
    return data;
  }

  Future<HomeModel> getProductDetail() async {
    final res = await Dio().get('https://student.valuxapps.com/api/products?category_id=44');
    final data = HomeModel.fromJson(res.data);
    return data;
  }
}