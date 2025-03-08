import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news_c13/core/ColorsManager.dart';

class HomeDrawer extends StatefulWidget {
  final void Function() backHome;
  const HomeDrawer({required this.backHome});

  @override
  State<HomeDrawer> createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  String selectedTheme = "light";
  String selectedLanguage = "en";
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: ColorsManager.textColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.zero
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            color: Colors.white,
            height: 166.h,
            alignment: Alignment.center,
            width: double.infinity,
            child:Text(
              "News App",
              style: TextStyle(
                fontSize: 24.sp,
                color: ColorsManager.textColor,
                fontWeight: FontWeight.w700
              ),
            ) ,
          ),
          Padding(
            padding: REdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                InkWell(
                  onTap: (){
                    // back to home
                    widget.backHome();
                    Navigator.pop(context);
                  },
                  child: Row(children: [
                    SvgPicture.asset("assets/images/Home 1.svg",height: 24.h,width: 24.w,),
                    SizedBox(width: 8.w,),
                    Text("Go To Home",style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20.sp,
                       color: Colors.white
                    ),)
                  ],),
                ),
                SizedBox(height: 24.h,),
                Divider(),
                SizedBox(height: 24.h,),
                Row(children: [
                  SvgPicture.asset("assets/images/roller-paint-brush.svg",height: 24.h,width: 24.w,),
                  SizedBox(width: 8.w,),
                  Text("Theme",style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20.sp,
                      color: Colors.white
                  ),)
                ],),
                SizedBox(height: 8.h,),

                InputDecorator(

                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.r),
                      borderSide: BorderSide(
                        color: Colors.white
                      )
                    )
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                        value: selectedTheme,
                        borderRadius: BorderRadius.circular(16.r),
                        isExpanded: true,
                        iconEnabledColor: Colors.white,
                        iconDisabledColor: Colors.white,
                        dropdownColor: ColorsManager.textColor,
                        hint: Text(
                          "choose theme",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 20.sp,
                              color: Colors.white
                          ),
                        ),
                        style: TextStyle(
                          color: Colors.white
                        ),
                        items: [
                          DropdownMenuItem(
                              value: "light",
                              child: Text("Light")
                          ),
                          DropdownMenuItem(
                              value: "dark",
                              child: Text("Dark")
                          ),
                        ],
                        onChanged: (value) {
                          setState(() {
                            selectedTheme = value!;
                          });
                        },
                    ),
                  ),
                ),
                SizedBox(height: 24.h,),
                Divider(),
                SizedBox(height: 24.h,),
                Row(children: [
                  SvgPicture.asset("assets/images/globe-alt.svg",height: 24.h,width: 24.w,),
                  SizedBox(width: 8.w,),
                  Text("Language",style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20.sp,
                      color: Colors.white
                  ),)
                ],),
                SizedBox(height: 8.h,),

                InputDecorator(

                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.r),
                          borderSide: BorderSide(
                              color: Colors.white
                          )
                      )
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: selectedLanguage,
                      borderRadius: BorderRadius.circular(16.r),
                      isExpanded: true,
                      iconEnabledColor: Colors.white,
                      iconDisabledColor: Colors.white,
                      dropdownColor: ColorsManager.textColor,
                      hint: Text(
                        "choose language",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 20.sp,
                            color: Colors.white
                        ),
                      ),
                      style: TextStyle(
                          color: Colors.white
                      ),
                      items: [
                        DropdownMenuItem(
                            value: "en",
                            child: Text("English")
                        ),
                        DropdownMenuItem(
                            value: "ar",
                            child: Text("Arabic")
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          selectedLanguage = value!;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
