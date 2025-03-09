import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/remote/ApiManager.dart';
import '../../../model/ArticlesResponse/Article.dart';

class ArticlesViewModel extends Cubit<ArticlesStates>{
  ArticlesViewModel():super(ArticlesLoadingState());

  getArticles(String sourceId)async{
   try{
     emit(ArticlesLoadingState());
     var response =  await ApiManager.getArticles(sourceId);
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