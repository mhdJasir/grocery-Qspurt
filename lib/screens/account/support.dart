import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Support extends StatelessWidget {
  const Support({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
    );
  }
}

class support extends StatefulWidget {
  const support({Key key}) : super(key: key);

  @override
  _supportState createState() => _supportState();
}

class _supportState extends State<support> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Support'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
        child: new Column(
          children: [
            new Text('Phone : +91 9742993504 '),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => launch("https://wa.me/+91 9742993504"),
        label: const Text('Chat'),
        icon: const Icon(Icons.navigation),
        backgroundColor: Colors.green,
      ),
    );
  }
}
