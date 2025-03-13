import 'package:news_c13/data/datasource/SourcesDataSource.dart';
import 'package:news_c13/data/datasource_impl/SourcesApiDataSourceImpl.dart';
import 'package:news_c13/data/model/SourcesResponse/SourcesResponse.dart';
import 'package:news_c13/repo/SourcesRepo.dart';

class SourcesRepoImpl extends SourcesRepo{
  SourcesDataSource sourcesDataSource;
  SourcesRepoImpl(this.sourcesDataSource);
  @override
  Future<SourcesResponse> getSources(String categoryId) {
    return sourcesDataSource.getSources(categoryId);
  }

}