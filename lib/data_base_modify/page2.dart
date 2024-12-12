import 'package:block/data_base_modify/app.dart';
import 'package:block/data_base_modify/event.dart';
import 'package:block/data_base_modify/filse.dart';
import 'package:block/data_base_modify/note_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class Page2  extends StatelessWidget {

  var titleController = TextEditingController();
  var descController  = TextEditingController();

int? id2;
bool  isUpdate;

Page2({this.id2, this.isUpdate = false});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page2'),
      ),
      body: Column(children: [
        Center(
          child: Text(isUpdate ? 'Update':'Add Note'),
        ),

        SizedBox(
          height: 11,
        ),

        TextField(
          controller:titleController,
        ),

        SizedBox(
          height: 11,
        ),
        TextField(
          controller: descController,
        ),

        Row(children: [
          OutlinedButton(onPressed: (){

            if(isUpdate) {

              context.read<BlocFilse>().add(UpdateNote(
                  updateNoteE:NoteModel(
                      titleM: titleController.text,
                      descM: descController.text,
                      idM: id2),
                   // updateIdE: id2!
              ) );

                      Navigator.pop(context);

                    }else {
              context.read<BlocFilse>().add(AddNote(addnotsE:
              NoteModel(
                  titleM: titleController.text,
                  descM: descController.text)));
              Navigator.pop(context);
            }


            }, child:Text(isUpdate ? 'Update':' Add')),

          SizedBox(
            width: 11,
          ),
          OutlinedButton(onPressed: (){
            Navigator.pop(context);
          }, child: Text('Cancel'),)
        ],)



      ],),
    );
  }
}
