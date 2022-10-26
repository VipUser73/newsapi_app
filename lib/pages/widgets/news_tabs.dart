import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapi_app/bloc/news_bloc.dart';
import 'package:newsapi_app/pages/widgets/news_list_widget.dart';
import 'package:newsapi_app/repositories/local_repository.dart';

class NewsTabs extends StatelessWidget {
  final SelectTab eventTab;
  const NewsTabs(this.eventTab, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NewsBloc>(
      create: (context) => NewsBloc(context.read<LocalRepository>(), eventTab),
      child: BlocBuilder<NewsBloc, NewsState>(
        builder: ((context, state) {
          if (state is ErrorState) {
            return const Text('Failed to load data.');
          }
          if (state is LoadedNewsState) {
            return NewsListWidget(state.newsList);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        }),
      ),
    );
  }
}
