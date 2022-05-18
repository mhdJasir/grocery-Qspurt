import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<List<Post>> fetchPost() async {
  final response =
      await http.get(Uri.parse('https://primefixx.com/json/ss.php'));
  if (response.statusCode == 200) {
    // return Post.fromJson(json.decode(response.body));
    return compute(parseList, response.body);
  } else {
    throw Exception("Failed to load the post, try again late");
  }
}

List<Post> parseList(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Post>((json) => Post.fromJson(json)).toList();
}

class Post {
  final String userID;
  final String id;
  final String title;
  final String body;

  Post({this.userID, this.id, this.title, this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
        userID: json['userId'],
        id: json['id'],
        title: json['title'],
        body: json['body']);
  }
}

class MyAppnew extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Services',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: MyHomePagenew(title: 'My Bookings'),
    );
  }
}

class MyHomePagenew extends StatefulWidget {
  MyHomePagenew({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePagenewState createState() => _MyHomePagenewState();
}

class _MyHomePagenewState extends State<MyHomePagenew> {
  final Future<List<Post>> post = fetchPost();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: FutureBuilder<List<Post>>(
            future: post,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                //   // return Text(snapshot.data.);
                return ListView.builder(
                  padding: EdgeInsets.all(10.0),
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, i) {
                    return new Center(
                      child: Card(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            ListTile(
                              leading: Icon(Icons.album),
                              title: Text(snapshot.data[i].userID),
                              subtitle: Text(snapshot.data[i].title),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text(snapshot.data[i].id),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                TextButton(
                                  child: Text(snapshot.data[i].body),
                                  onPressed: () {},
                                ),
                                const SizedBox(width: 8),
                                ElevatedButton(
                                  child: const Text('Complete'),
                                  onPressed: () {},
                                ),
                                const SizedBox(width: 8),
                              ],
                            ),
                            const SizedBox(height: 8),
                          ],
                        ),
                      ),
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return CircularProgressIndicator();
            }),
      ),
    );
  }
}
