import 'package:block/database/database_bock.dart';
import 'package:block/database/database_event.dart';
import 'package:block/database/note_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Page2 extends StatelessWidget {
  var titleController = TextEditingController();
  var descController = TextEditingController();

  bool isUpdate;
  int? id2;
  Page2({this.id2, this.isUpdate = false});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('Page2'),
        ),
        body: Column(
          children: [
            Center(child: Text(isUpdate ? 'Update Note' : 'Add Note')),
            SizedBox(
              height: 11,
            ),
            TextField(
              controller: titleController,
            ),
            SizedBox(
              height: 11,
            ),
            TextField(
              controller: descController,
            ),
            SizedBox(
              height: 11,
            ),
            Row(
              children: [
                OutlinedButton(
                    onPressed: () {
                      if (isUpdate) {
                        context.read<DatabaseBloc>().add(UpadteNote(
                            idUE: id2!,
                            titleUE: titleController.text,
                            descUE: descController.text));
                        Navigator.pop(context);
                      } else {
                        context.read<DatabaseBloc>().add(AddNote(
                            newNote: NoteModel(
                                titleM: titleController.text,
                                descM: descController.text)));
                        Navigator.pop(context);
                      }
                    },
                    child: Text(isUpdate ? 'Update' : 'Add')),
                SizedBox(
                  width: 11,
                ),
                OutlinedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('cancel'))
              ],
            )
          ],
        ));
  }
}
