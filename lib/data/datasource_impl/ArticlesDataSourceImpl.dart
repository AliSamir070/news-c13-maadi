import 'package:news_c13/core/remote/ApiManager.dart';
import 'package:news_c13/data/datasource/ArticlesDataSource.dart';
import 'package:news_c13/data/model/ArticlesResponse/ArticlesResponse.dart';

class ArticlesApiDataSourceImpl extends ArticlesDataSource{
  ApiManager apiManager;
  ArticlesApiDataSourceImpl(this.apiManager);
  @override
  Future<ArticlesResponse> getArticles(String sourceId) {
    return apiManager.getArticles(sourceId);
  }

}