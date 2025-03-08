import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_c13/core/remote/ApiManager.dart';
import 'package:news_c13/ui/NewsList/widgets/ArticlesViewModel.dart';
import 'package:provider/provider.dart';

import '../../../core/ColorsManager.dart';
import '../../../model/ArticlesResponse/Article.dart';
import '../../../model/SourcesResponse/Sources.dart';
import 'ArticleItem.dart';

class ArticlesList extends StatefulWidget {
  Source source;
  ArticlesList(this.source);

  @override
  State<ArticlesList> createState() => _ArticlesListState();
}

class _ArticlesListState extends State<ArticlesList> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context)=>ArticlesViewModel()..getArticles(widget.source.id!),
        child: Consumer<ArticlesViewModel>(
          builder: (BuildContext context, ArticlesViewModel viewModel, Widget? child) { 
            if(viewModel.showLoading){
              return Center(child: CircularProgressIndicator(),);
            }else if(viewModel.errorMessage!=null){
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(viewModel.errorMessage!),
                  ElevatedButton(onPressed: (){
                    setState(() {

                    });
                  }, child: Text(
                      "Try Again"
                  ))
                ],
              );
            }else if(viewModel.articles.isEmpty){
              return Center(child: Text("No articles found",style: TextStyle(
                  fontSize: 30.sp,
                  fontWeight: FontWeight.w600
              ),),);
            }else {
              return ListView.separated(
                  itemBuilder: (context, index) => ArticleItem(
                    article: viewModel.articles[index],
                  ),
                  separatorBuilder: (context, index) => SizedBox(height: 16.h,),
                  itemCount: viewModel.articles.length
              );
            }
          },
          
        ),
    )

      /*FutureBuilder(
        future: ApiManager.getArticles(widget.source.id!),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            // handle loading
            return Center(child: CircularProgressIndicator(),);
          }
          if(snapshot.hasError){
            // handle exception error
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(snapshot.error.toString(),style: TextStyle(
                    fontSize: 30.sp,
                    color: ColorsManager.textColor
                ),),
                ElevatedButton(onPressed: (){
                  setState(() {

                  });
                }, child: Text(
                    "Try Again"
                ))
              ],
            );

          }
          var response = snapshot.data;
          if(response?.status=="error"){
            // handle server error
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(response?.message??""),
                ElevatedButton(onPressed: (){
                  setState(() {

                  });
                }, child: Text(
                    "Try Again"
                ))
              ],
            );
          }
          List<Article> articles = response?.articles??[];
          if(articles.isEmpty){
            return Center(child: Text("No articles found",style: TextStyle(
              fontSize: 30.sp,
              fontWeight: FontWeight.w600
            ),),);
          }
          return ListView.separated(
              itemBuilder: (context, index) => ArticleItem(
                article: articles[index],
              ),
              separatorBuilder: (context, index) => SizedBox(height: 16.h,),
              itemCount: articles.length
          );
        },
    )*/;
  }
}
