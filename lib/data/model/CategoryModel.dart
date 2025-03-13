
import 'dart:ui';

class CategoryModel{
  String title;
  String id;
  String imagePath;
  TextDirection textDirection;

  CategoryModel({required this.title , required this.id , this.textDirection = TextDirection.ltr , required this.imagePath});

  static List<CategoryModel> categories = [
    CategoryModel(
        title: "General", id: "general",
        imagePath: "assets/images/general.png"),
    CategoryModel(
        title: "Business", id: "business",
        textDirection: TextDirection.rtl,
        imagePath: "assets/images/business.png"),
    CategoryModel(
        title: "Sports", id: "sports",
        imagePath: "assets/images/sports.png"),
    CategoryModel(
        title: "Technology", id: "technology",
        textDirection: TextDirection.rtl,
        imagePath: "assets/images/technology.png"),
    CategoryModel(
        title: "Health", id: "health",
        imagePath: "assets/images/health.png"),
    CategoryModel(
        title: "Science", id: "science",
        textDirection: TextDirection.rtl,
        imagePath: "assets/images/science.png"),
    CategoryModel(
        title: "Entertainment", id: "entertainment",
        imagePath: "assets/images/entertainment.png")
  ];
}