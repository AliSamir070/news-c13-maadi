import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_c13/core/ColorsManager.dart';
import 'package:news_c13/model/CategoryModel.dart';

class CategoryItem extends StatelessWidget {
  final CategoryModel category;
  final void Function(CategoryModel) onCategoryTap;
  const CategoryItem({required this.category,required this.onCategoryTap});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: category.textDirection,
      child: Container(
        clipBehavior: Clip.antiAlias,
        width: double.infinity,
        height: 198.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24.r),
          color: ColorsManager.textColor
        ),
        child: Row(
          children: [
            Image.asset(category.imagePath,
                width: 170.w,
                height:198.h ,
                fit: BoxFit.cover),
            Expanded(
              child: Padding(
                padding: REdgeInsets.symmetric(vertical: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(category.title,style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 28.sp
                    ),),
                    ElevatedButton(
                        onPressed: (){

                          // show newslistwidget on home screen body
                          onCategoryTap(category);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey,
                          padding: EdgeInsets.zero
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: REdgeInsetsDirectional.only(
                                start: 16
                              ),
                              child: Text("View All",style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 24.sp,
                                  color: ColorsManager.textColor
                              ),),
                            ),
                            CircleAvatar(
                              radius: 30.r,
                              backgroundColor: Colors.white,
                              child: Icon(
                                Icons.arrow_forward_ios,
                                color: ColorsManager.textColor,
                              ),
                            )
                          ],
                        ))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
