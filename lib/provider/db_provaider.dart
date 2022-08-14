
import 'package:flutter/cupertino.dart';
import 'package:jiffy/jiffy.dart';
import 'package:mynote/Model/notes_model.dart';
import 'package:mynote/data/db_helper.dart';

import '../navigation/router.dart';
import '../views/Screens/main_screen.dart';

class DbProvaider extends ChangeNotifier{
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  GlobalKey<FormState> addKey = GlobalKey();
  GlobalKey<FormState> detailsKey = GlobalKey();

  DbProvaider(){
    selectAllNotes();
  }

  List<NotesModel> allNotes = [];
  List<NotesModel> faverotNotes = [];

  fillLists(List<NotesModel> list){
    allNotes = list;
    faverotNotes = list.where((element) => element.isLike!).toList();
    notifyListeners();
  }

  selectAllNotes()async{
    List<NotesModel> notes = await DbHelper.dbHelper.selectAllNotes();
    fillLists(notes);
  }

  creatNewNote(NotesModel notesModel)async{
    if(addKey.currentState!.validate()){
      await DbHelper.dbHelper.insertNewNote(notesModel);
      await  selectAllNotes();
      titleController.text="";
      descriptionController.text="";

    }
  }

  updateLikeNote(NotesModel notesModel)async{
    await DbHelper.dbHelper.updateLikeNote(notesModel);
    selectAllNotes();
  }

  updateNote(NotesModel notesModel)async{
    if(detailsKey.currentState!.validate()){
      notesModel.title = titleController.text;
      notesModel.description = descriptionController.text;
      notesModel.hours = Jiffy(DateTime.now()).jm.toString();
      notesModel.day = Jiffy(DateTime.now()).date.toString();
      notesModel.mounth = Jiffy(DateTime.now()).MMM.toString();
      await DbHelper.dbHelper.updateOneNote(notesModel);

      await selectAllNotes();
      titleController.text="";
      descriptionController.text="";

    }
  }

  deletNote(NotesModel notesModel){
    DbHelper.dbHelper.deleteOneNote(notesModel.id!);
    selectAllNotes();
  }

  nullvaliation(String? v){
    if(v == null || v.isEmpty){
      return"هذ الحقل مطلوب";
    }
  }






}