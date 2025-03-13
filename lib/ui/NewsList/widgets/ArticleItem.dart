import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_c13/core/ColorsManager.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../../data/model/ArticlesResponse/Article.dart';
class ArticleItem extends StatelessWidget {
  final Article article;
  const ArticleItem({required this.article});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        showDialog(context: context, builder: (context) => AlertDialog(

          backgroundColor: ColorsManager.textColor,
          contentPadding: REdgeInsets.all(8),
          insetPadding: REdgeInsets.all(16),
          alignment: Alignment.bottomCenter,
          content: Container(
            width: ScreenUtil().screenWidth,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(8.r),

                    child: CachedNetworkImage(
                      imageUrl: article.urlToImage??"",
                      height: 220.h,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                      errorWidget:(context, url, error) => Icon(
                        Icons.error,
                        size: 40.sp,
                      ) ,
                    )
                ),
                SizedBox(height: 8.h,),
                Text(article.description??"",
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp

                ),),
                SizedBox(height: 8.h,),
                ElevatedButton(onPressed: (){

                },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white
                    ),
                    child: Text(
                  "View Full Article",
                  style: TextStyle(
                    color: ColorsManager.textColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700
                  ),
                ))
              ],
            ),
          ),
        ),);
      },
      child: Container(
        padding: REdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: ColorsManager.textColor
          ),
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.r),

              child: CachedNetworkImage(
                  imageUrl: article.urlToImage??"",
                  height: 220.h,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                  errorWidget:(context, url, error) => Icon(
                    Icons.error,
                    size: 40.sp,
                  ) ,
              )
            ),
            SizedBox(height: 10.h,),
            Text(
                article.title??"",
                maxLines: 2,
               overflow: TextOverflow.ellipsis,
               style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16.sp,
                  color: ColorsManager.textColor
                ),
            ),
            SizedBox(height: 10.h,),
            Row(
              children: [
                Expanded(
                    flex: 4,
                    child: Text("By : ${article.author}",
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: ColorsManager.authorColor
                    ),
                    )),
                Expanded(
                    flex: 2,
                    child: Text(
                        DateTime.now().difference(DateTime.parse(article.publishedAt??"")).inDays<2
                            ? timeago.format(DateTime.parse(article.publishedAt??""))
                            :article.publishedAt??"",
                        textAlign: TextAlign.end,
                        style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: ColorsManager.authorColor
                ))),
              ],
            )
          ],
        ),
      ),
    );
  }
}
