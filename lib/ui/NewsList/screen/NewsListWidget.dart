import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_c13/core/ColorsManager.dart';
import 'package:news_c13/core/remote/ApiManager.dart';
import 'package:news_c13/ui/NewsList/screen/NewsListVIewModel.dart';
import 'package:news_c13/ui/NewsList/widgets/ArticlesList.dart';

import '../../../model/CategoryModel.dart';

class NewsListWidget extends StatefulWidget {
  CategoryModel category;
  NewsListWidget(this.category);

  @override
  State<NewsListWidget> createState() => _NewsListWidgetState();
}

class _NewsListWidgetState extends State<NewsListWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => NewsListViewModel()..getSources(widget.category.id),
        child:BlocBuilder<NewsListViewModel,NewsStates>(
          builder: (context, state) {
            if(state is NewsLoadingState){
              return Center(child: CircularProgressIndicator(),);
            }else if(state is NewsErrorState){
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(state.errorMessage,style: TextStyle(
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
            }else{
              var sources = (state as NewsSuccessState).sources;  
              return DefaultTabController(
                length: sources.length,
                child: Column(
                  children: [
                    TabBar(
                        isScrollable: true,
                        indicatorColor: ColorsManager.textColor,
                        labelStyle: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                            color: ColorsManager.textColor
                        ),
                        unselectedLabelStyle: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: ColorsManager.textColor
                        ),
                        tabAlignment: TabAlignment.start,
                        dividerHeight: 0,
                        tabs: sources.map((source) => Tab(
                          text: source.name,
                        )).toList()
                    ),
                    SizedBox(height: 15.h,),
                    Expanded(child: TabBarView(
                        children: sources.map((source) => ArticlesList(source)).toList()
                    ))
                  ],
                ),
              );
            }
          },
        ) ,
    )


      /*FutureBuilder(
        future: ApiManager.getSources(widget.category.id),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            // loading state
            return Center(child: CircularProgressIndicator(),);
          }else if(snapshot.hasError){
            // error state
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
            // error returns from server
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
          // success state
          var sources = response?.sources??[];
          return DefaultTabController(
          length: sources.length,
          child: Column(
            children: [
              TabBar(
                  isScrollable: true,
                  indicatorColor: ColorsManager.textColor,
                  labelStyle: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                      color: ColorsManager.textColor
                  ),
                  unselectedLabelStyle: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: ColorsManager.textColor
                  ),
                  tabAlignment: TabAlignment.start,
                  dividerHeight: 0,
                  tabs: sources.map((source) => Tab(
                    text: source.name,
                  )).toList()
              ),
              SizedBox(height: 15.h,),
              Expanded(child: TabBarView(
                  children: sources.map((source) => ArticlesList(source)).toList()
              ))
            ],
          ),
          );
        },
    )*/;
  }
}
