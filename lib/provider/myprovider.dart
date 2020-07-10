import 'package:flutter/material.dart';
import '../model/cart_product.dart';
import '../model/food.dart';

class MyProvider with ChangeNotifier {
  List<CartProduct> _cartListProduct = [];
  CartProduct cartProduct;
  List<Food> foodList = [];
  void addCartProduct({
    String foodName,
    String foodImage,
    String foodType,
    double foodPrice,
    int foodQuantity,
  }) {
    cartProduct = CartProduct(
      foodName: foodName,
      foodType: foodType,
      foodImage: foodImage,
      foodPrice: foodPrice,
      foodQuantity: foodQuantity,
    );
    _cartListProduct.add(
      cartProduct,
    );
  }

  List<CartProduct> get allCartProductList {
    return List.from(_cartListProduct);
  }

  int get cartProductList {
    return _cartListProduct.length;
  }

  List<CartProduct> get allCartProduct {
    return _cartListProduct;
  }

  void deteleCartFood(int index) {
    _cartListProduct.removeAt(index);

    notifyListeners();
  }
   List<Food> get getfoodList {
    return foodList;
  }

  List<Food> get getMyFoodList {
    return foodList;
  }
}
