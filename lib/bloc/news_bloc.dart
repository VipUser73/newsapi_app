import 'package:newsapi_app/models/news_model.dart';
import 'package:newsapi_app/repositories/local_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class NewsEvent {}

class LoadingRefreshEvent extends NewsEvent {}

class LoadingNextPageEvent extends NewsEvent {}

class NextPageEvent extends NewsEvent {}

abstract class NewsState {
  final List<Articles> newsList;
  NewsState({this.newsList = const []});
}

class LoadingNewsState extends NewsState {}

class ErrorState extends NewsState {}

class LoadedNewsState extends NewsState {
  LoadedNewsState({required List<Articles> newsList})
      : super(newsList: newsList);
}

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final LocalRepository _localRepository;
  final SelectTab eventTab;
  int currentPage = 1;
  NewsBloc(this._localRepository, this.eventTab) : super(LoadingNewsState()) {
    on<LoadingRefreshEvent>((_, __) {
      currentPage = 1;
      _loadNews();
    });
    on<LoadingNextPageEvent>((_, __) {
      currentPage++;
      _loadNews();
    });
    _loadNews();
  }

  Future<void> _loadNews() async {
    try {
      final result = await _localRepository.getNews(currentPage, eventTab);
      emit(LoadedNewsState(newsList: result));
    } catch (e) {
      emit(ErrorState());
    }
  }
}
