import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_app_flutter/models/categories_news_model.dart';
import 'package:news_app_flutter/models/news_channel_headlines_model.dart';





class NewsRepository {
  Future<NewsChannelsHeadlinesModels> fetchNewsChannelsApi(
      String channelName) async {
    String url =
        "https://newsapi.org/v2/top-headlines?sources=${channelName}&apiKey=a5339f2495c24180ac2634a6e82c169b";
    print(url);
    final response = await http.get(Uri.parse(url));
    if (kDebugMode) {
      print(response.body);
    }
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);

      return NewsChannelsHeadlinesModels.fromJson(body);
    }
    throw Exception('Failed to load data');
  }

  Future<CategoriesNewsModel> fetchCategoriesNewsApi(String category) async {
    String url =
        "https://newsapi.org/v2/everything?q=${category}&apiKey=a5339f2495c24180ac2634a6e82c169b";
    print(url);
    final response = await http.get(Uri.parse(url));
    if (kDebugMode) {
      print(response.body);
    }
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);

      return CategoriesNewsModel.fromJson(body);
    }
    throw Exception('Failed to load data');
  }
}
