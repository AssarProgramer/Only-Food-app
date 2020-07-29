import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../model/cart_product.dart';
import '../model/food.dart';

class MyProvider with ChangeNotifier {
  List<CartProduct> _cartListProduct = [];
  CartProduct cartProduct;

  List<Food> _allFoodsList = [];
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
    return _allFoodsList;
  }

  Future<void> fetchAllFoods()async {
    Food food;
    List<Food> newList =[];
    QuerySnapshot allFood =
        await Firestore.instance.collection("Food").getDocuments();
    allFood.documents.forEach((element) {
      food = Food(
          foodName: element.data['foodName'],
          foodImage: element.data['foodImage'],
          foodPrice: element.data['foodPrice'],
          foodRating: element.data['foodRating'],
          foodType: element.data['foodType']);
          newList.add(food);
    });
    _allFoodsList = newList;
  }

  List<Food> search(String query) {
    List<Food> searchFood = _allFoodsList.where((element) {
      return element.foodName.contains(query);
    }).toList();
    return searchFood;
  }
}
