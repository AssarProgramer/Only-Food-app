import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/food.dart';
import '../provider/myprovider.dart';

import '../widgets/featured_container.dart';

class SearchBarA extends SearchDelegate<Food> {
  SearchBarA({
    String hintText = "Song Search",
  }) : super(
          searchFieldLabel: hintText,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.search,
        );
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
    MyProvider provider = Provider.of<MyProvider>(context);

    List<Food>_searchFood=provider.search(query);

    return GridView.count(
        childAspectRatio: 0.87,
        crossAxisCount: 2,
        padding: EdgeInsets.only(top: 10),
        children: _searchFood.map<Widget>(
          (e) {
            return FeaturedContainer(
              foodImage: e.foodImage,
              foodName: e.foodName,
              foodPrice: e.foodPrice,
              foodRating: e.foodRating,
              foodType: e.foodType,
              whenPreesd: () {},
            );
          },
        ).toList());
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    MyProvider provider = Provider.of<MyProvider>(
      context,
    );
    List<Food> _searchFood = provider.search(query);

    return GridView.count(
      childAspectRatio: 0.87,
      crossAxisCount: 2,
      padding: EdgeInsets.only(top: 10),
      children: _searchFood
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
