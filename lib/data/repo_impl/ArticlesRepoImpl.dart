import 'package:news_c13/data/datasource/ArticlesDataSource.dart';
import 'package:news_c13/data/model/ArticlesResponse/ArticlesResponse.dart';
import 'package:news_c13/repo/ArticlesRepo.dart';

class ArticlesRepoImpl extends ArticlesRepo{
  ArticlesDataSource articlesDataSource;
  ArticlesRepoImpl(this.articlesDataSource);
  @override
  Future<ArticlesResponse> getArticles(String sourceId) {
    return articlesDataSource.getArticles(sourceId);
  }

}