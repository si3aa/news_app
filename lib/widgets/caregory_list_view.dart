import 'package:flutter/material.dart';
import 'package:news/models/category_model.dart';
import 'package:news/widgets/category_card.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({
    super.key,
  });
 final List <CategoryModel> categories = const [
   CategoryModel(imageAssetUrl: 'assets/business.avif', categoryName: 'Business'),
   CategoryModel(imageAssetUrl: 'assets/entertaiment.avif', categoryName: 'Entertainment'),
   CategoryModel(imageAssetUrl: 'assets/health.avif', categoryName: 'Health'),
   CategoryModel(imageAssetUrl: 'assets/science.avif', categoryName: 'Science'),
   CategoryModel(imageAssetUrl: 'assets/sports.avif', categoryName: 'Sports'),
   CategoryModel(imageAssetUrl: 'assets/technology.jpeg', categoryName: 'Technology'),
   CategoryModel(imageAssetUrl: 'assets/general.avif', categoryName: 'General'),



 ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 85,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context,index){
          return  CategoryCard(
            category: categories[index],
          );
        }
        ),
    );
  }
}