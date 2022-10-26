import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapi_app/bloc/news_bloc.dart';
import 'package:newsapi_app/models/news_model.dart';
import 'package:newsapi_app/pages/details_page.dart';

class NewsListWidget extends StatelessWidget {
  final List<Articles> newsList;
  const NewsListWidget(this.newsList, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<NewsBloc>().add(LoadingRefreshEvent());
      },
      child: ListView.separated(
        physics: const AlwaysScrollableScrollPhysics(
            parent: BouncingScrollPhysics()),
        itemCount: newsList.length,
        separatorBuilder: ((context, index) => const SizedBox(height: 6)),
        itemBuilder: ((context, index) {
          _showNextPage(index, context);
          return GestureDetector(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => DetailsPage(newsList[index]))),
            child: Card(
              child: Row(children: [
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 10, top: 10, bottom: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          newsList[index].title,
                          maxLines: 2,
                          textAlign: TextAlign.left,
                          style: Theme.of(context).textTheme.headline1,
                        ),
                        Text(
                          newsList[index].description,
                          maxLines: 3,
                        ),
                      ],
                    ),
                  ),
                ),
                IconButton(onPressed: () {}, icon: const Icon(Icons.favorite)),
              ]),
            ),
          );
        }),
      ),
    );
  }

  void _showNextPage(int index, BuildContext context) {
    if (index < newsList.length - 1) return;
    context.read<NewsBloc>().add(LoadingNextPageEvent());
  }
}
