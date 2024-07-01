import 'package:dio/dio.dart';
import 'package:news/models/article_model.dart';

class NewsServices {
  final Dio dio;

  NewsServices(this.dio);

 Future<List<ArticleModel>> getTopHeadlines({required String category}) async {
    try {
  var response = await dio.get(
      'https://newsapi.org/v2/top-headlines?country=us&apiKey=68b1db703dc44c468771fe9ebf3ba7bc&category=$category');
  
  Map<String, dynamic> jsonData = response.data;
  List<dynamic> articles = jsonData['articles'];
  List<ArticleModel> articlesList = [];
  
  for (var article in articles) {
    ArticleModel articleModel = ArticleModel.fromJson(article);
        
  
        articlesList.add(articleModel);
  }
  return articlesList;
}  catch (e) {
  return[];
}
  }
}

//insted of using dynamic datatype for map we can specify datatype of map (String=>point to map's key , dynamic=>point to data)