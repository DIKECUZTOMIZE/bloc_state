
import 'package:block/compear/list/bloc_event.dart';
import 'package:block/compear/list/list_filse.dart';
import 'package:block/compear/list/page2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Page12 extends StatelessWidget{

 List<Map<String,dynamic>> page1Note=[];

  @override
  Widget build(BuildContext context) {

  page1Note=  context.watch<ListPC>().state.mDataL;
    return Scaffold(
      appBar: AppBar(
        title: Text('Page1'),
      ),
      body:ListView.builder(

        itemCount:page1Note.length ,
        itemBuilder: (context, index) =>ListTile(

          title:Text('${page1Note[index]['title']}') ,

          subtitle:Text('${page1Note[index]['desc']}') ,

          trailing: SizedBox(
            width: 70,
            child:Row(
              children: [
                InkWell(
                  onTap: () {

                    /// Block:
                     context.read<ListPC>().add(UpdateNote(
                       idE: index,
                       map: {
                         'title'  : 'name',
                         'desc'    : '00'
                       }
                       ));

                    /// Cubit:
                    // context.read<ListPC>().update(map: {
                    //   'title' : 'sanjit keleng',
                    //   'desc'  : '9678844797'
                    // }, updateIdF: index);

                    /// Provider:
                    //   context.read<ListPC>().updateNotes(title:'Putu', desc: 'keleng', nId: index);

                  },child: Icon(Icons.edit),
                ),

                SizedBox(
                  width: 11,
                ),

                InkWell(
                  onTap: () {

                    /// Block
                    context.read<ListPC>().add(DeletNote(deletIdE:index));
                 //   context.watch<ListPC>().state.mDataL;

                    /// Cubit:
                    //BlocProvider.of<ListPC>(context,listen: false).deletNote(deletIdF:index);

                    /// Provider
                  //  context.read<ListPC>().deletNots(deletidF:index);
                  },child: Icon(Icons.delete,color: Colors.red,),
                ),],) ,),) ,),

      floatingActionButton: FloatingActionButton(onPressed:(){
        Navigator.push(context, MaterialPageRoute(builder: (context) => Page22(),));
      },child: Text('Add'), ),
    );}}