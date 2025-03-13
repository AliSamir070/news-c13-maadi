import 'package:news_c13/data/model/SourcesResponse/SourcesResponse.dart';

abstract class SourcesDataSource{
  Future<SourcesResponse> getSources(String categoryId);
}