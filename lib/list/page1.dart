import 'package:block/list/event.dart';
import 'package:block/list/filse.dart';
import 'package:block/list/page2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Page1 extends StatelessWidget {

  List<Map<String, dynamic>> mData1=[];
  @override
  Widget build(BuildContext context) {
    mData1 = context.watch<PCBFisle>().state.mDataS;

    return  Scaffold(
    appBar: AppBar(
        title: Text('Page1'),),
      body: Center(
        child: ListView.builder(
          itemCount: mData1.length,
          itemBuilder: (context, index) =>ListTile(
          title: Text(mData1[index]['title']),
          subtitle: Text(mData1[index]['desc']),
          trailing: SizedBox(
            width: 150,
            child: Row(
              children: [
                OutlinedButton(onPressed: (){
                  context.read<PCBFisle>().add(UpdateNote(
                      idUE: index,
                      mapE: {
                        'title' : 'Putu keleng',
                        'desc'  :  '9678844797'
                      }));
                }, child:Icon(Icons.edit)),

                OutlinedButton(onPressed: (){
                  context.read<PCBFisle>().add(DeletNote(idDE: index));
                }, child:Icon(Icons.delete,color: Colors.red,)),
              ],
            ),
          ),
        ) ,)
      ),

      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) =>Page2(),));
      },child: Text('next'),),
    );

  }
}
