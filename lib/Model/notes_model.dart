import 'package:mynote/data/db_helper.dart';

class NotesModel{
  int? id;
  String? title;
  String? description;
  bool? isLike;
  String? hours;
  String? day;
  String? mounth;

  NotesModel({required this.title,this.description,required this.hours,required this.day,required this.mounth,this.isLike = false});

  NotesModel.fromMap(Map<String,dynamic> map){
    id = map[DbHelper.noteIdColumName];
    title = map[DbHelper.noteTitleColumName];
    description = map[DbHelper.noteDescriptionColumName];
    hours = map[DbHelper.noteHoursColumName];
    day = map[DbHelper.noteDayColumName];
    mounth = map[DbHelper.noteMounthColumName];
    hours = map[DbHelper.noteHoursColumName];

    isLike = map[DbHelper.noteIsLikeColumName] == 1 ? true : false;
  }

  Map<String,dynamic> toMap(){
    return{
      DbHelper.noteTitleColumName : title,
      DbHelper.noteDescriptionColumName : description,
      DbHelper.noteHoursColumName : hours,
      DbHelper.noteDayColumName : day,
      DbHelper.noteMounthColumName : mounth,
      DbHelper.noteIsLikeColumName : isLike! ? 1 :0,
    };
  }
}