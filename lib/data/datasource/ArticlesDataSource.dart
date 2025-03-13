import 'package:news_c13/data/model/ArticlesResponse/ArticlesResponse.dart';

abstract class ArticlesDataSource{
  Future<ArticlesResponse> getArticles(String sourceId);
}