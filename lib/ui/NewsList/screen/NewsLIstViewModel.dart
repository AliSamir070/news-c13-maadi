import 'package:flutter/material.dart';
import 'package:news_c13/core/remote/ApiManager.dart';

import '../../../model/SourcesResponse/Sources.dart';

class NewsListViewModel extends ChangeNotifier{
  List<Source> sources = [];
  String? errorMessage;
  bool showLoading = false;
  getSources(String categoryId)async{
    try{
      showLoading = true;
      var response = await ApiManager.getSources(categoryId);
      if(response?.status == "error"){
        // handle error from server
        errorMessage = response?.message;
      }else{
        // handle success state
        sources = response?.sources??[];
      }
      showLoading = false;
    }catch(e){
      errorMessage = e.toString();
      showLoading = false;
    }
    notifyListeners();
  }
}