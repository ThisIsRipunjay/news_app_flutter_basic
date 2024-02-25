import 'package:news_app_flutter/models/categories_news_model.dart';
import 'package:news_app_flutter/models/news_channel_headlines_model.dart';

import '../repository/news_repository.dart';

class NewsViewModel {
  final _rep = NewsRepository();

  Future<NewsChannelsHeadlinesModels> fetchNewsChannelsApi(String channelName) async {
    final response = await _rep.fetchNewsChannelsApi(channelName);
    return response;
  }

  Future<CategoriesNewsModel> fetchCategoriesNewsApi(String category) async {
    final response = await _rep.fetchCategoriesNewsApi(category);
    return response;
  }
}
