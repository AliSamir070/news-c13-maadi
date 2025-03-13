import 'package:news_c13/data/model/SourcesResponse/SourcesResponse.dart';

abstract class SourcesRepo{
  Future<SourcesResponse> getSources(String categoryId);
}

// interface : abstract with no attributes -> all functions are abstract