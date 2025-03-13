import 'package:news_c13/core/remote/ApiManager.dart';
import 'package:news_c13/data/datasource/SourcesDataSource.dart';
import 'package:news_c13/data/model/SourcesResponse/SourcesResponse.dart';

class SourcesApiDataSourceImpl extends SourcesDataSource{
  ApiManager apiManager;
  SourcesApiDataSourceImpl(this.apiManager);        // constructor injection  - DI
  @override
  Future<SourcesResponse> getSources(String categoryId) {
    return apiManager.getSources(categoryId);
  }

}