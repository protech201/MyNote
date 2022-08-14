import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mynote/Model/notes_model.dart';
import 'package:mynote/navigation/router.dart';
import 'package:mynote/provider/db_provaider.dart';
import 'package:mynote/views/Screens/Home_Screen.dart';
import 'package:mynote/views/Screens/main_screen.dart';
import 'package:jiffy/jiffy.dart';
import 'package:provider/provider.dart';


class DetailsScreen extends StatelessWidget {
  NotesModel notesModel;
  DetailsScreen(this.notesModel);



  @override
  Widget build(BuildContext context) {
    return Consumer<DbProvaider>(
      builder: (context,provider,x) {
        provider.titleController.text = notesModel.title!;
        provider.descriptionController.text = notesModel.description!;

        return Scaffold(
          appBar: AppBar(
            title: Text('Note details'.tr()),
            centerTitle: true,
            backgroundColor: Color(0xff3930D8),
            leading: IconButton(onPressed: (){
              AppRouter.popraoter();
              provider.titleController.text="";
              provider.descriptionController.text="";
            }, icon: Icon(Icons.arrow_back_outlined)),
            actions: [
              IconButton(
                  onPressed: ()  async {
                    await provider.updateNote(notesModel);
                    AppRouter.popraoter();
                    },
                  icon: Icon(Icons.done)),
            ],
            elevation: 5,
          ),
          body: Padding(
            padding: const EdgeInsets.only(left: 32,right: 32),
            child: Form(
              key: provider.detailsKey,
              child: Column(
                children: [
                  Row(
                    children: [
                      Text.rich(
                        TextSpan(
                          style: TextStyle(
                            fontFamily: 'Open Sans',
                            fontSize: 15.sp,
                            color: const Color(0xffcecece),
                          ),
                          children: [
                            TextSpan(
                              text: notesModel.hours,
                            ),
                            TextSpan(
                                text: ", "
                            ),
                            TextSpan(
                              text: (notesModel.day),

                            ),
                            TextSpan(
                              text: (" "),

                            ),
                            TextSpan(
                              text: notesModel.mounth,

                            ),

                          ],
                        ),
                        textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
                        textAlign: TextAlign.center,
                        softWrap: false,


                      ),
                      const Spacer(),
                      IconButton(onPressed: (){
                        provider.deletNote(notesModel);
                        AppRouter.popraoter();

                      },
                          icon: Icon(Icons.delete))
                    ],
                  ),
                  TextFormField(
                    validator: (x) => provider.nullvaliation(x),
                    // maxLength: 255,
                    controller: provider.titleController,
                    style: TextStyle(
                      letterSpacing: 1,
                      fontFamily: 'Open Sans',
                      fontSize: 25.sp,
                      color:  Colors.black,
                      fontWeight: FontWeight.bold,
                      height: 1.411764705882353,
                    ),
                      decoration: InputDecoration.collapsed(
                        hintText: 'Title'.tr(),
                        hintStyle: TextStyle(
                          fontFamily: 'Open Sans',
                          fontSize: 25.sp,
                          color:  Colors.grey,
                          fontWeight: FontWeight.bold,
                          height: 1.411764705882353,
                        )
                    )
                    //           (notesModel.title == null)
        //               ?InputDecoration.collapsed(
        // hintText: 'Title',
        // hintStyle: TextStyle(
        // fontFamily: 'Open Sans',
        // fontSize: 25.sp,
        // color:  Colors.grey,
        // fontWeight: FontWeight.bold,
        // height: 1.411764705882353,
        // )
        // )
        //               :InputDecoration.collapsed(
        //               hintText: notesModel.title,
        //               hintStyle: TextStyle(
        //                 letterSpacing: 1,
        //                 fontFamily: 'Open Sans',
        //                 fontSize: 25.sp,
        //                 color:  Colors.black,
        //                 fontWeight: FontWeight.bold,
        //                 height: 1.411764705882353,
        //               ),
        //           ),
                  ),
                  SizedBox(height: 40.h,),
                  Expanded(
                    child: TextFormField(
                      validator: (x) => provider.nullvaliation(x),
                      controller: provider.descriptionController,
                      keyboardType: TextInputType.multiline,
                      maxLines: 10,
                      // maxLength: 255,
                      style: TextStyle(
                        letterSpacing: 1,

                        fontFamily: 'Open Sans',
                        fontSize: 20.sp,
                        color: Colors.black,
                        height: 1.411764705882353,
                      ),

                      decoration:  InputDecoration.collapsed(
                        hintText: 'Type Something....'.tr(),
                        hintStyle: TextStyle(
                          fontFamily: 'Open Sans',
                          fontSize: 20.sp,
                          color: const Color(0xff82a0b7),
                          height: 1.411764705882353,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}



