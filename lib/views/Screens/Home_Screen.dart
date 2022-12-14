import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:mynote/provider/db_provaider.dart';
import 'package:mynote/views/widgets/notes_widget.dart';
import 'package:provider/provider.dart';


class HomeScreen extends StatefulWidget {



  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {



  @override
  Widget build(BuildContext context) {
    return Consumer<DbProvaider>(
        builder: (BuildContext context, provaider, x) {
          return Scaffold(
            body: SingleChildScrollView(
              child: SafeArea(
                child:Column(
                  children: [
                    // Stack(
                    //   children: [
                    //     Container(
                    //       height: 90.h,
                    //       width: 375.w,
                    //       color: const Color(0xff3930d8),
                    //     ),
                    //     Row(
                    //       mainAxisAlignment: (context.locale.toString()=='en')
                    //           ?MainAxisAlignment.start
                    //           :MainAxisAlignment.end,
                    //       children: [
                    //         Image.asset("assets/image/Scroll Group 3.png",height: 90.h,),
                    //       ],
                    //     ),
                    //     Row(
                    //       mainAxisAlignment: (context.locale.toString()=='en')
                    //           ?MainAxisAlignment.end
                    //           :MainAxisAlignment.start,
                    //       children: [
                    //         Image.asset("assets/image/Scroll Group 2.png")
                    //       ],
                    //     ),
                    //     Padding(
                    //       padding:(context.locale.toString()=='en')
                    //           ? const EdgeInsets.only(left: 18, top: 30, )
                    //           :const EdgeInsets.only(right: 18, top: 30, ),
                    //       child: Row(
                    //         children: [
                    //           SizedBox(
                    //             width: 239.w,
                    //             height: 40.h,
                    //             child: TextField(
                    //               decoration: InputDecoration(
                    //                 filled: true,
                    //                 fillColor: Colors.grey.shade200,
                    //                 contentPadding: EdgeInsets.all(1.h),
                    //                 hintText: "Search Your Notes".tr(),
                    //
                    //                 prefixIcon: Icon(Icons.search,color: Colors.black54,),
                    //                 enabledBorder: OutlineInputBorder(
                    //                   borderRadius: BorderRadius.all(Radius.circular(5)),
                    //                   borderSide: BorderSide(color: Colors.black12),
                    //                 ),
                    //                 focusedBorder: OutlineInputBorder(
                    //                   borderRadius: BorderRadius.all(Radius.circular(5)),
                    //                   borderSide: BorderSide(color: Colors.black12),
                    //                 ),
                    //
                    //
                    //               ),
                    //
                    //             ),
                    //           ),
                    //           SizedBox(width: 66.w,),
                    //             IconButton(onPressed: () async {
                    //               if(await context.locale.toString()=="ar"){
                    //                 await context.setLocale(Locale('en'));
                    //
                    //               }else{
                    //                 await context.setLocale(Locale('ar'));
                    //               }
                    //               MainScreen();
                    //               // AppRouter.NavigateWithReplacemtnToWidget(MainScreen());
                    //
                    //
                    //             }, icon: Icon(Icons.language))
                    //
                    //
                    //         ],
                    //       ),
                    //     )
                    //
                    //
                    //   ],
                    // ),
                    Padding(
                      padding: (context.locale.toString()=='en')
                          ?const EdgeInsets.only(left: 18,top: 11)
                          :EdgeInsets.only(right: 18,top: 11),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Home'.tr(),

                            style: TextStyle(
                              fontFamily: 'Open Sans',
                              fontSize: 18.sp,
                              color: const Color(0xff8b87b3),
                              fontWeight: FontWeight.w600,
                            ),
                            softWrap: false,
                          ),

                        ],
                      ),
                    ),


                    if (provaider.allNotes.isEmpty)
                      // Expanded(
                      //   child: Column(
                      //     mainAxisAlignment: MainAxisAlignment.center,
                      //     children: [
                      //       Image.asset("assets/image/Group 12.png"),
                      //       SizedBox(height: 67.h,),
                      //       Text(
                      //         'No Notes :(',
                      //         style: TextStyle(
                      //           fontFamily: 'Open Sans',
                      //           fontSize: 22.sp,
                      //           color: const Color(0xff554e8f),
                      //           fontWeight: FontWeight.w600,
                      //         ),
                      //         textAlign: TextAlign.center,
                      //         softWrap: false,
                      //       ),
                      //       SizedBox(height: 11.h,),
                      //
                      //       Text(
                      //         'You have no task to do.',
                      //         style: TextStyle(
                      //           fontFamily: 'Open Sans',
                      //           fontSize: 17.sp,
                      //           color: const Color(0xff82a0b7),
                      //           height: 1.411764705882353,
                      //         ),
                      //         textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
                      //         textAlign: TextAlign.center,
                      //       )
                      //     ],
                      //   ),
                      // )

                      SizedBox(
                        height: 620.h,

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Lottie.asset('assets/animations/53207-empty-file.json'),
                          ],
                        ),
                      )
                    else Padding(
                      padding: const EdgeInsets.all(18),
                      child: SizedBox(
                        height: 555.h,
                        child: ListView.builder(
                            itemCount: provaider.allNotes.length,
                            itemBuilder: (context,index){
                              return NotesWidget(provaider.allNotes[index]);
                            }),
                      ),
                    ),


                  ],
                ),
              ),
            ),

          );
        },
    );
  }
}
