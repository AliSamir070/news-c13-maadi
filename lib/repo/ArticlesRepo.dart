import 'package:news_c13/data/model/ArticlesResponse/ArticlesResponse.dart';

abstract class ArticlesRepo{
  Future<ArticlesResponse> getArticles(String sourceId);
}