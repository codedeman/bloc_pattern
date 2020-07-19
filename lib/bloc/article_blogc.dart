import 'package:bloc/bloc.dart';
import 'package:blogc_pattern/bloc/article_state.dart';
import 'package:blogc_pattern/models/article.dart';
import 'package:flutter/cupertino.dart';

import 'aricle_event.dart';
import 'package:blogc_pattern/services/article_repository.dart';

class ArticleBloc extends Bloc<ArticleEvent,ArticleState> {
  ArticlesRespository repository;
  ArticleBloc({@required this.repository});

  @override
  // TODO: implement initialState
  ArticleState get initialState => ArticleInitialState();

  @override
  Stream<ArticleState> mapEventToState(ArticleEvent event) async* {
    // TODO: implement mapEventToState
    if (event is  FetchArticelEvent){
      yield ArticleLoadingState();
      try {
        List<Articles> articles = await repository.getArticles();
        yield ArticleLoadedState(articles: articles);
      } catch (e) {
        yield ArticleErrorState(message: e.toString());
  }

    }
  }


}

