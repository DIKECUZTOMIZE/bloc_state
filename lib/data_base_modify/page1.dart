import 'package:block/data_base_modify/app.dart';
import 'package:block/data_base_modify/event.dart';
import 'package:block/data_base_modify/filse.dart';
import 'package:block/data_base_modify/note_model.dart';
import 'package:block/data_base_modify/page2.dart';
import 'package:block/data_base_modify/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Page1 extends StatefulWidget {
  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  List<NoteModel> mData1 = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<BlocFilse>().getInitialNotes();
  }
  // @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page1'),
      ),
      body: getAccNotesAll(),

      // context.watch<BlocFilse>().state
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

  // BlocState state
  Widget getAccNotesAll() {

    /// Type Problm hoi asil : Eror provider dekhai asil consolt
    return BlocBuilder<BlocFilse,BlocState>(builder: (_, state) {
      if (state is LoadingState) {
        return Center(child: CircularProgressIndicator());
      } else if (state is ErorrState) {
        return Center(child: Text('${state.erorrMess}'));
      } else if (state is LoadedState) {
        mData1 = state.mDataS;
        return mData1.isNotEmpty
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
                                     id2: mData1[index].idM,
                                      isUpdate: true),
                                ));
                          },
                          child: Icon(Icons.edit),
                        ),
                        SizedBox(
                          width: 11,
                        ),
                        InkWell(
                          onTap: () {
                            context
                                .read<BlocFilse>()
                                .add(DeletNote(deletIdE: mData1[index].idM!));
                          },
                          child: Icon(Icons.delete,color: Colors.red,),
                        )
                      ],
                    ),
                  ),
                ),
              )
            : Center(child: Text('Not Add Note'));
      } else {
        return Container();
      }
    });
  }
}
