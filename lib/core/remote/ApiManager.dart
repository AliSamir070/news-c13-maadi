import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_c13/core/remote/ApiConstants.dart';
import 'package:news_c13/model/ArticlesResponse/ArticlesResponse.dart';
import 'package:news_c13/model/SourcesResponse/SourcesResponse.dart';
class ApiManager{

  static Future<SourcesResponse?> getSources(String category)async{
    Uri uri = Uri.https(baseUrl,"/v2/top-headlines/sources",{
      "apiKey":apiKey,
      "category":category
    });
    var response = await http.get(uri);
    Map<String,dynamic> json = jsonDecode(response.body);
    SourcesResponse sourcesResponse = SourcesResponse.fromJson(json);
    return sourcesResponse;
  }

  static Future<ArticlesResponse> getArticles(String source)async{
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