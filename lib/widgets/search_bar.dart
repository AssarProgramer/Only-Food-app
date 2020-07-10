import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flappy_search_bar/scaled_tile.dart';
import 'featured_container.dart';

class Post {
  final String title;
  final String body;

  Post(this.title, this.body);
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final SearchBarController<Post> _searchBarController = SearchBarController();
  bool isReplay = false;

  Future<List<Post>> _getALlPosts(String text) async {
    await Future.delayed(Duration(seconds: text.length == 4 ? 10 : 1));
    if (isReplay) return [Post("Assar", "Replaying body")];
    if (text.length == 50) throw Error();
    if (text.length == 20) return [];
    List<Post> posts = [];

    var random = new Random();
    for (int i = 0; i < 10; i++) {
      posts
          .add(Post("$text $i", "body random number : ${random.nextInt(100)}"));
    }
    return posts;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SearchBar<Post>(
          searchBarPadding: EdgeInsets.symmetric(horizontal: 10),
          headerPadding: EdgeInsets.symmetric(horizontal: 10),
          listPadding: EdgeInsets.symmetric(horizontal: 10),
          onSearch: _getALlPosts,
          searchBarController: _searchBarController,
          // placeHolder: Text("placeholder"),
          cancellationWidget: Text("Cancel"),
          emptyWidget: Text("empty"),
          indexedScaledTileBuilder: (int index) =>
              ScaledTile.count(3, index.isEven ? 4 : 0),
          header: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: <Widget>[
                Container(
                  child: FeaturedContainer(
                    foodImage: 'sad',
                    foodName: 'dsad',
                    foodPrice: 10,
                    foodRating: 3.2,
                    foodType: 'sadsa',
                    whenPreesd: () {},
                  ),
                ),
                Container(
                  child: FeaturedContainer(
                    foodImage: 'Bugti',
                    foodName: 'Assar',
                    foodPrice: 10,
                    foodRating: 3.2,
                    foodType: 'assar',
                    whenPreesd: () {},
                  ),
                ),
              ],
            ),
          ),
          onCancelled: () {
            print("Cancelled triggered");
          },
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          crossAxisCount: 1,
          onItemFound: (Post post, int index) {
            return Column(
              children: <Widget>[
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: <Widget>[
                      Container(
                        child: FeaturedContainer(
                          foodImage: 'sad',
                          foodName: 'dsad',
                          foodPrice: 10,
                          foodRating: 3.2,
                          foodType: 'sadsa',
                          whenPreesd: () {},
                        ),
                      ),
                      Container(
                        child: FeaturedContainer(
                          foodImage: 'Bugti',
                          foodName: 'Assar',
                          foodPrice: 10,
                          foodRating: 3.2,
                          foodType: 'assar',
                          whenPreesd: () {},
                        ),
                      ),
                    ],
                  ),
                ),

                // child: ListTile(
                //   title: Text(post.title),
                //   isThreeLine: true,
                //   subtitle: Text(post.body),
                //   onTap: () {
                //     Navigator.of(context)
                //         .push(MaterialPageRoute(builder: (context) => Detail()));
                //   },
                // ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class Detail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.of(context).pop(),
            ),
            Text("Detail"),
          ],
        ),
      ),
    );
  }
}
