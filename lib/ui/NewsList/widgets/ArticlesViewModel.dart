import 'package:flutter/material.dart';
import 'package:news_c13/core/remote/ApiManager.dart';
import 'package:news_c13/model/ArticlesResponse/Article.dart';

class ArticlesViewModel extends ChangeNotifier{
  List<Article> articles = [];
  String? errorMessage;
  bool showLoading = false;
  getArticles(String sourceId)async{
    try{
      showLoading = true;
      var response = await ApiManager.getArticles(sourceId);
      if(response.status == "error"){
        // handle error server
        errorMessage = response.message;
      }else{
        // handle success state
        articles = response.articles??[];
      }
      showLoading = false;
    }catch(e){
      // handle exception error
      errorMessage = e.toString();
      showLoading = false;
    }
    notifyListeners();
  }
}