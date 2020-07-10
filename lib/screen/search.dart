import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/food.dart';
import '../provider/myprovider.dart';

import '../widgets/featured_container.dart';

class SearchBar extends SearchDelegate<Food> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          }),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: Icon(
          Icons.arrow_back,
        ),
        onPressed: () {
          close(
            context,
            null,
          );
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    MyProvider provider = Provider.of<MyProvider>(context, listen: false);
    var search = provider.getMyFoodList;
    final result =
        search.where((s) => s.foodName.toLowerCase().contains(query));

    return GridView.count(
        childAspectRatio: 0.87,
        crossAxisCount: 2,
        padding: EdgeInsets.only(top: 10),
        children: result
            .map<Widget>(
              (e) => FeaturedContainer(
                foodImage: e.foodImage,
                foodName: e.foodName,
                foodPrice: e.foodPrice,
                foodRating: e.foodRating,
                foodType: e.foodType,
                whenPreesd: () {},
              ),
            )
            .toList());
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    MyProvider provider = Provider.of<MyProvider>(context, listen: false);
    var search = provider.getMyFoodList;
    final result =
        search.where((s) => s.foodName.toLowerCase().contains(query));

    return GridView.count(
      childAspectRatio: 0.87,
      crossAxisCount: 2,
      padding: EdgeInsets.only(top: 10),
      children: result
          .map<Widget>(
            (e) => FeaturedContainer(
              context: context,
              foodImage: e.foodImage,
              foodName: e.foodName,
              foodPrice: e.foodPrice,
              foodRating: e.foodRating,
              foodType: e.foodType,
              whenPreesd: () {},
            ),
          )
          .toList(),
    );
  }
}
