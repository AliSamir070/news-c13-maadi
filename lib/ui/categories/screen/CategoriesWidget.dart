import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_c13/core/ColorsManager.dart';
import 'package:news_c13/model/CategoryModel.dart';

import '../widgets/CategoryItem.dart';

class CategoriesWidget extends StatelessWidget {
  final void Function(CategoryModel) onCategoryTap;
  const CategoriesWidget(this.onCategoryTap);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.all(15),
      child: Column(
        children: [
          Text('''Good Morning
Here is Some News For You''',style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 24.sp,
            color: ColorsManager.textColor
          ),),
          SizedBox(height: 16.h,),
          Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) => CategoryItem(
                      onCategoryTap:onCategoryTap ,
                      category: CategoryModel.categories[index]
                  ),
                  separatorBuilder: (context, index) => SizedBox(height: 16.h,),
                  itemCount: CategoryModel.categories.length)
          )
        ],
      ),
    );
  }
}
