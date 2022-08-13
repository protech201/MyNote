import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:mynote/navigation/router.dart';

import 'main_screen.dart';

class SplachScreen extends StatefulWidget {
  const SplachScreen({Key? key}) : super(key: key);

  @override
  _SplachScreenState createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplachScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 200.h,),
              Image.asset("assets/image/Group 271.png",height: 104.06.h,width: 148.w,),
              SizedBox(height: 145.h,),
              Text(
                'Made it Simple'.tr(),
                style: TextStyle(
                  fontFamily: 'Open Sans',
                  fontSize: 22.sp,
                  color: const Color(0xff554e8f),
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
                softWrap: false,
              ),
              SizedBox(height: 10.h,),
              SizedBox(
                width: 240.w,
                child: Text(

                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris pellentesque erat in blandit luctus.',
                  style: TextStyle(
                    fontFamily: 'Open Sans',
                    fontSize: 17.sp,
                    color: const Color(0xff82a0b7),
                    height: 1.411764705882353,

                  ),
                  textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 43.h,),
              InkWell(

                onTap: (){
                  AppRouter.NavigateWithReplacemtnToWidget(MainScreen());
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 56.29.h,
                  width: 258.w,
                  decoration: BoxDecoration(
                    color: const Color(0xff3930d8),
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0x8766c81c),
                        offset: Offset(0, 5),
                        blurRadius: 30,
                      ),
                    ],
                  ),
                  child: Text(
                    'Get Started'.tr(),
                    style: TextStyle(
                      fontFamily: 'Open Sans',
                      fontSize: 17.sp,
                      color: const Color(0xfffcfcfc),
                      fontWeight: FontWeight.w600,
                      height: 0.6470588235294118,
                    ),
                    textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
                    textAlign: TextAlign.center,
                    softWrap: false,
                  ),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
