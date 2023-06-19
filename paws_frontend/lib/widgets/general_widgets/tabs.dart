import 'package:flutter/material.dart';

import '../../screens/tabs_screens/MyFav.dart';
import '../../screens/tabs_screens/MyPost.dart';
import '../../screens/tabs_screens/MyRequest.dart';

class tabs extends StatefulWidget {
  const tabs({super.key, required this.userId, required this.favorites});

  final int userId;
  final List favorites;

  @override
  State<tabs> createState() => tabsState();
}

class tabsState extends State<tabs> with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          const SizedBox(height: 50),
          Container(
            // height: 20,
            width: MediaQuery.of(context).size.height,

            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(5)),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: TabBar(
                    // indicator: BoxDecoration(color: Colors.black),
                    indicatorColor: Colors.amberAccent,
                    labelColor: Colors.black,
                    controller: tabController,
                    tabs: const [
                      Tab(
                        text: "Offers",
                      ),
                      Tab(
                        text: "Requests",
                      ),
                      Tab(
                        text: "Favorites",
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: [
                MyPosts(
                  userId: widget.userId,
                  userFavorites: widget.favorites,
                ),
                MyRequest(
                  userId: widget.userId,
                  userFavorites: widget.favorites,
                ),
                Fav(favorites: widget.favorites),
              ],
            ),
          )
        ],
      ),
    );
  }
}
