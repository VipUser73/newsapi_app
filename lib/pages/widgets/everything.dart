import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapi_app/bloc/news_bloc.dart';

class Everything extends StatelessWidget {
  Everything({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsBloc, NewsState>(
        bloc: context.read<NewsBloc>()..add(LoadingEverythingEvent()),
        builder: ((context, state) {
          if (state is ErrorState) {
            return const Text('Failed to load data.');
          }
          if (state is LoadedEverythingState) {
            return ListView.separated(
              itemCount: state.everythingList[0].articles.length,
              separatorBuilder: ((context, index) => const SizedBox(height: 6)),
              itemBuilder: ((context, index) {
                return Card(
                  child: Row(children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 10, top: 10, bottom: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              state.everythingList[0].articles[index].title,
                              maxLines: 2,
                              textAlign: TextAlign.left,
                              style: Theme.of(context).textTheme.headline1,
                            ),
                            Text(
                              state.everythingList[0].articles[index]
                                  .description,
                              maxLines: 3,
                            ),
                          ],
                        ),
                      ),
                    ),
                    IconButton(
                        onPressed: () {}, icon: const Icon(Icons.favorite)),
                  ]),
                );
              }),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        }));
  }
}
