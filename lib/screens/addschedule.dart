import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main()
{
  runApp(addschedule());
}

class addschedule extends StatelessWidget {
  const addschedule({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp
      (
      debugShowCheckedModeBanner: false,
      // ignore: prefer_const_constructors
      home: Scaffold
        (


        // ignore: prefer_const_constructors
        body: WebView
          (
          initialUrl: "https://attolinfra.com/mobile/index.php",
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}