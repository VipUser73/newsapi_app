import 'package:flutter/material.dart';
import 'package:newsapi_app/pages/widgets/everything.dart';
import 'package:newsapi_app/pages/widgets/top_headlines.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: Container(
            color: Colors.green.shade700,
            child: SafeArea(
              child: Column(
                children: [
                  Expanded(child: Container()),
                  const TabBar(
                    indicatorColor: Colors.black,
                    tabs: [
                      Tab(
                          iconMargin: EdgeInsets.only(bottom: 3),
                          text: 'Top Headlines',
                          icon: Icon(Icons.topic)),
                      Tab(
                          iconMargin: EdgeInsets.only(bottom: 3),
                          text: 'Everything',
                          icon: Icon(Icons.event)),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.grey.shade300,
          selectedItemColor: Colors.red,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.newspaper),
              label: 'News',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favorites',
            ),
          ],
        ),
        body: TabBarView(
          children: [
            TopHeadlines(),
            Everything(),
          ],
        ),
      ),
    );
  }
}
