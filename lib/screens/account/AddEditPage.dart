import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../service.dart';

class AddEditPage extends StatefulWidget {
  final List list;
  final int index;
  AddEditPage({this.list,this.index});
  @override
  _AddEditPageState createState() => _AddEditPageState();
}

class _AddEditPageState extends State<AddEditPage> {

  TextEditingController firstName = TextEditingController();


  bool editMode = false;


  addUpdateData(){
    if(editMode){
      var url = 'https://primefixx.com/json/edit.php';
      http.post(url,body: {
        'id' : widget.list[widget.index]['id'],
        'fistname' : firstName.text,

      });
    }else{
      var url = 'https://primefixx.com/json/add.php';
      http.post(url,body: {
        'fistname' : firstName.text,

      });
    }

  }


  @override
  void initState() {
    super.initState();
    if(widget.index != null){
      editMode = true;
      firstName.text = widget.list[widget.index]['fistname'];

    }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(editMode ? 'Update' :'Add Data'),),
      body: ListView(
        children: <Widget>[

          Padding(

            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: firstName,
              decoration: InputDecoration(
                labelText: 'Enter Reason',
              ),
            ),
          ),




          Padding(padding: EdgeInsets.all(8),
            child: RaisedButton(
              onPressed: (){
                setState(() {
                  addUpdateData();
                });
                Navigator.push(context, MaterialPageRoute(builder: (context) => appointments(),),);
                debugPrint('Clicked RaisedButton Button');
              },
              color: Colors.blueGrey,
              child: Text(editMode ? 'Update' :'Cancel',style: TextStyle(color: Colors.white),),
            ),
          ),
        ],
      ),
    );
  }
}
