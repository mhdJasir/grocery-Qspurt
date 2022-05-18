import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'account/AddEditPage.dart';

class appointments extends StatefulWidget {
  @override
  _appointmentsState createState() => _appointmentsState();
}

class _appointmentsState extends State<appointments> {
  Future getData() async {
    var url = 'https://primefixx.com/json/read.php';
    var response = await http.get(url);
    return json.decode(response.body);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('My Appointments'),
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    List list = snapshot.data;
                    return ListTile(
                      title: Text(list[index]['lastname']),
                      subtitle: Text(list[index]['phone']),
                      leading: GestureDetector(
                        child: Icon(Icons.delete),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AddEditPage(
                                list: list,
                                index: index,
                              ),
                            ),
                          );
                        },
                      ),
                      trailing: GestureDetector(
                        child: Icon(Icons.arrow_forward_ios_rounded),
                        onTap: () {
                          setState(() {
                            var url = 'https://primefixx.com/json/delete.php';
                            http.post(url, body: {
                              'id': list[index]['id'],
                            });
                          });
                          debugPrint('delete Clicked');
                        },
                      ),
                    );
                  })
              : SizedBox(
                  height: MediaQuery.of(context).size.height / 1.3,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
        },
      ),
    );
  }
}
