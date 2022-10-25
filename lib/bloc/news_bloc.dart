import 'package:newsapi_app/models/news_model.dart';
import 'package:newsapi_app/repositories/local_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class NewsEvent {}

class LoadingTopHeadlinesEvent extends NewsEvent {}

class LoadingEverythingEvent extends NewsEvent {}

abstract class NewsState {
  final List<NewsModel> topHeadlinesList;
  final List<NewsModel> everythingList;
  NewsState({this.everythingList = const [], this.topHeadlinesList = const []});
}

class LoadingNewsState extends NewsState {}

class ErrorState extends NewsState {}

class LoadedTopHeadlinesState extends NewsState {
  LoadedTopHeadlinesState({required List<NewsModel> topHeadlinesList})
      : super(topHeadlinesList: topHeadlinesList);
}

class LoadedEverythingState extends NewsState {
  LoadedEverythingState({required List<NewsModel> everythingList})
      : super(everythingList: everythingList);
}

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc(this._localRepository) : super(LoadingNewsState()) {
    on<LoadingTopHeadlinesEvent>(_loadTopHeadlinesEvent);
    on<LoadingEverythingEvent>(_loadEverythingEvent);
  }
  final LocalRepository _localRepository;

  void _loadTopHeadlinesEvent(
      LoadingTopHeadlinesEvent event, Emitter<NewsState> emit) async {
    try {
      await _localRepository.getTopHeadlines();
      emit(LoadedTopHeadlinesState(
          topHeadlinesList: _localRepository.topHeadlinesList));
    } catch (error) {
      emit(ErrorState());
    }
  }

  void _loadEverythingEvent(
      LoadingEverythingEvent event, Emitter<NewsState> emit) async {
    try {
      await _localRepository.getEverything();
      emit(LoadedEverythingState(
          everythingList: _localRepository.everythingList));
    } catch (error) {
      emit(ErrorState());
    }
  }
}
