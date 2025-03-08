import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:news_c13/core/AssetsManager.dart';
import 'package:news_c13/core/StringsManager.dart';
import 'package:news_c13/core/remote/ApiManager.dart';
import 'package:news_c13/model/CategoryModel.dart';
import 'package:news_c13/ui/NewsList/screen/NewsListWidget.dart';

import '../../categories/screen/CategoriesWidget.dart';
import '../widgets/HomeDrawer.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isShowNewsList = false;
  CategoryModel? selectedCategory;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: HomeDrawer(
        backHome: (){
          selectedCategory = null;
          isShowNewsList = false;
          setState(() {

          });
        },
      ),
      appBar: AppBar(
        title: Text(selectedCategory!=null?
        selectedCategory!.title:StringsManager.home),
        actions: [
          IconButton(onPressed: (){}, icon: SvgPicture.asset(
            AssetsManager.search,
            height:24.h ,
            width: 24.w,
          ))
        ],
      ),
      body: isShowNewsList
          ?NewsListWidget(selectedCategory!)
          :CategoriesWidget(onCategorySelected),
    );
  }

  onCategorySelected(CategoryModel category){
    setState(() {
      isShowNewsList = true;
      selectedCategory = category;
    });

  }
}
