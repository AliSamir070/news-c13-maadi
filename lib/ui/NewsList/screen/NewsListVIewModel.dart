import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_c13/core/remote/ApiManager.dart';
import 'package:news_c13/data/repo_impl/SourcesRepoImpl.dart';

import '../../../data/model/SourcesResponse/Sources.dart';
import '../../../repo/SourcesRepo.dart';


class NewsListViewModel extends Cubit<NewsStates>{
  SourcesRepo sourcesRepo;
  NewsListViewModel(this.sourcesRepo):super(NewsLoadingState());
  
  getSources(String categoryId)async{
    try{
      // handle loading logic
      emit(NewsLoadingState());
      var response = await sourcesRepo.getSources(categoryId);
      if(response?.status=="error"){
        // handle server error
        emit(NewsErrorState(response!.message!));
      }else{
        // handle success sources list
        emit(NewsSuccessState(response?.sources??[]));
      }
    }catch(e){
      // handle exception error
      emit(NewsErrorState(e.toString()));
    }
  }

}

abstract class NewsStates{}
class NewsLoadingState extends NewsStates{}
class NewsErrorState extends NewsStates{
  String errorMessage;
  NewsErrorState(this.errorMessage);
}
class NewsSuccessState extends NewsStates{
  List<Source> sources;
  NewsSuccessState(this.sources);
}