import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_c13/data/datasource/ArticlesDataSource.dart';
import 'package:news_c13/data/datasource_impl/ArticlesDataSourceImpl.dart';
import 'package:news_c13/data/repo_impl/ArticlesRepoImpl.dart';

import '../../../core/remote/ApiManager.dart';
import '../../../data/model/ArticlesResponse/Article.dart';
import '../../../repo/ArticlesRepo.dart';

class ArticlesViewModel extends Cubit<ArticlesStates>{
  late ArticlesRepo repo;
  ArticlesViewModel():super(ArticlesLoadingState()){
    ApiManager apiManager = ApiManager();
    ArticlesDataSource dataSource = ArticlesApiDataSourceImpl(apiManager);
    repo = ArticlesRepoImpl(dataSource);
    // DI ??
    // creational design patterns
    // singleton
    // factory method
    // builder
  }

  getArticles(String sourceId)async{
   try{
     emit(ArticlesLoadingState());
     var response =  await repo.getArticles(sourceId);
     if(response.status=="error"){
      emit(ArticlesErrorState(response.message!));
     }else{
      if(response.articles?.isNotEmpty??false){
        emit(ArticlesSuccessState(response.articles!));
      }else{
        emit(ArticlesEmptyState());
      }
     }
   }catch(e){
     emit(ArticlesErrorState(e.toString()));
   }
  }
}

abstract class ArticlesStates{}
class ArticlesLoadingState extends ArticlesStates{}
class ArticlesErrorState extends ArticlesStates{
  String error;
  ArticlesErrorState(this.error);
}
class ArticlesSuccessState extends ArticlesStates{
  List<Article> articles;
  ArticlesSuccessState(this.articles);
}
class ArticlesEmptyState extends ArticlesStates{}