import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mynote/Model/notes_model.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:mynote/navigation/router.dart';
import 'package:mynote/provider/db_provaider.dart';
import 'package:mynote/views/Screens/details.dart';
import 'package:provider/provider.dart';
class NotesWidget extends StatefulWidget {
   NotesModel notesModel;
   NotesWidget(this.notesModel);
  _NotesWidgetState createState() => _NotesWidgetState();
}

class _NotesWidgetState extends State<NotesWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: InkWell(
        onTap: (){
          AppRouter.NavigateToWidget(DetailsScreen(widget.notesModel));
        },
        child: Container(
          height: 55.2.h,
          width: 339.w,
          decoration: BoxDecoration(
            color: const Color(0xffffffff),
            borderRadius: BorderRadius.circular(5.0),
            boxShadow: [
              BoxShadow(
                color: const Color(0x0d000000),
                offset: Offset(0, 4),
                blurRadius: 9,
              ),
            ],
          ),
          child:Row(
            children: [
              Container(
                height: 55.2.h,
                width: 4.w,
                decoration: BoxDecoration(
                  color: const Color(0xffffd800),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5.0),
                    bottomLeft: Radius.circular(5.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0x45f3e625),
                      offset: Offset(0, 3),
                      blurRadius: 6,
                    ),
                  ],
                ),
              ),
              SizedBox(width: 22.w,),
              Text.rich(
                TextSpan(
                  style: TextStyle(
                    fontFamily: 'Rubik',
                    fontSize: 15.sp,
                    color: const Color(0xffc6c6c8),
                  ),
                  children: [
                    TextSpan(
                      text: widget.notesModel.day,
                    ),
                    TextSpan(
                      text: '\n',
                    ),
                    TextSpan(
                      text: widget.notesModel.mounth,
                      style: TextStyle(
                        fontSize: 11,
                      ),
                    ),

                  ],
                ),
                textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
                textAlign: TextAlign.center,
                softWrap: false,
              ),
              SizedBox(width: 22.w,),
              Text(
                widget.notesModel.title??"not found",
                style: TextStyle(
                  fontFamily: 'Open Sans',
                  fontSize: 14.sp,
                  color: const Color(0xff3930d8),
                  fontWeight: FontWeight.w700,
                ),
                softWrap: false,
              ),
              const Spacer(),
              IconButton( onPressed: () {
                // widget.notesModel!.isLike =! widget.notesModel!.isLike!;
                Provider.of<DbProvaider>(context,listen: false).updateLikeNote(widget.notesModel);


                },

                icon:Icon(Icons.favorite,color:  widget.notesModel.isLike!?Colors.yellow:Color(0xffD9D9D9),) ,),

            ],
          ) ,
        ),
      ),
    ) ;
  }
}
