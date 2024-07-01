import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news/models/article_model.dart';
import 'package:news/services/news_services.dart';
import 'package:news/widgets/newsListView.dart';

class NewsListViewBuilder extends StatefulWidget {
  const NewsListViewBuilder({super.key, required this.category});
 final String category;
  @override
  State<NewsListViewBuilder> createState() => _NewsListViewBuilderState();
}

class _NewsListViewBuilderState extends State<NewsListViewBuilder> {
  var future;
  @override
  void initState() {
    super.initState();
    future = NewsServices(Dio()).getTopHeadlines(
      category: widget.category
    );

  }


  @override
  Widget build(BuildContext context) {
    return FutureBuilder <List<ArticleModel>>(
      future: future ,
      builder: (context, snapShot) {
        if (snapShot.hasData) {
          return NewsListView(
            articles: snapShot.data!,
          );
        } else if (snapShot.hasError) {
          return const SliverToBoxAdapter(
            child: Text('Oops there was an error,try later'),
          );
        } else {
          return const SliverToBoxAdapter(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
