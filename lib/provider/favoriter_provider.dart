import 'package:flutter/cupertino.dart';
import 'package:lafyuu/model/home_response.dart';

class FavoriteProvider extends ChangeNotifier{
  final List<Product> _products = [];
  List <Product> get products => _products;

  void addRemoveFav(Product product){
    final isExist = _products.contains(product);
    if(isExist) {
      _products.remove(product);
    } else {
      _products.add(product);
    }
    notifyListeners();
  }

  bool isExist(Product product){
    final isExist = _products.contains(product);
    return isExist;
  }
}