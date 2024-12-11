import 'package:block/database/database_bock.dart';
import 'package:block/database/database_event.dart';
import 'package:block/database/note_model.dart';
import 'package:block/database/page2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Page1 extends StatefulWidget {
  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();


    ///  tow type kuribo pare:
 // context.read<DatabaseBloc>().getInitial();
  context.read<DatabaseBloc>().add(GetInitialNotes());
  }


  List<NoteModel> mData1 = [];

  @override
  Widget build(BuildContext context) {

    /// Galti kia tha
    /// Dutar vhitort kunba watch kuirile hoi jai
 // mData1=  context.watch<DatabaseBloc>().getnotes();
  mData1=  context.watch<DatabaseBloc>().state.mDataS;
    return Scaffold(
      appBar: AppBar(
        title: Text('Page1'),
      ),
      body: mData1.isNotEmpty
          ? ListView.builder(
              itemCount: mData1.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(mData1[index].titleM),
                subtitle: Text(mData1[index].descM),
                trailing: SizedBox(
                  width: 70,
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Page2(
                                  isUpdate: true,
                                  id2: mData1[index].idM,
                                ),
                              ));
                        },
                        child: Icon(Icons.edit),
                      ),
                      SizedBox(
                        height: 11,
                      ),
                      InkWell(
                        onTap: () {
                          context
                              .read<DatabaseBloc>()
                              .add(DeletNote(idDE: mData1[index].idM!));
                        },
                        child: Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          : Center(child: Text('Not add Notes')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Page2(),
              ));
        },
        child: Text('next'),
      ),
    );
  }
}
