import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapi_app/models/theme.dart';
import 'package:newsapi_app/pages/home_page.dart';
import 'package:newsapi_app/repositories/local_repository.dart';
import 'package:newsapi_app/services/news_api.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final LocalRepository _localRepository = LocalRepository(NewsApi());

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _localRepository,
      child: MaterialApp(
        theme: themeData,
        home: const HomePage(),
      ),
    );
  }
}
