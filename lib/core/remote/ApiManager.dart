import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_c13/core/remote/ApiConstants.dart';

import '../../data/model/ArticlesResponse/ArticlesResponse.dart';
import '../../data/model/SourcesResponse/SourcesResponse.dart';

class ApiManager{

  Future<SourcesResponse> getSources(String category,String language)async{
    Uri uri = Uri.https(baseUrl,"/v2/top-headlines/sources",{
      "apiKey":apiKey,
      "category":category,
      "language":language
    });
    var response = await http.get(uri);
    Map<String,dynamic> json = jsonDecode(response.body);
    SourcesResponse sourcesResponse = SourcesResponse.fromJson(json);
    return sourcesResponse;
  }

  Future<ArticlesResponse> getArticles(String source)async{
    // ?sources=
    Uri url = Uri.https(baseUrl,"/v2/everything",{
      "apiKey":apiKey,
      "sources":source
    });
    var response = await http.get(url);
    Map<String,dynamic> json = jsonDecode(response.body);
    ArticlesResponse articlesResponse = ArticlesResponse.fromJson(json);
    return articlesResponse;
  }
}