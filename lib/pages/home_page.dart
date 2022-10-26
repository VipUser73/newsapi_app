import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapi_app/bloc/news_bloc.dart';
import 'package:newsapi_app/pages/widgets/news_tabs.dart';
import 'package:newsapi_app/repositories/local_repository.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(76),
          child: Container(
            color: Colors.green.shade700,
            child: SafeArea(
              child: Column(
                children: const [
                  TabBar(
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
        body: const TabBarView(
          children: [
            NewsTabs(SelectTab.topHeadlines),
            NewsTabs(SelectTab.everything),
          ],
        ),
      ),
    );
  }
}
