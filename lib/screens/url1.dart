import 'package:flutter/material.dart';
import 'package:grocery/screens/url2.dart';
import 'package:webview_flutter/webview_flutter.dart';

class url1 extends StatelessWidget {
  const url1({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebView(
        initialUrl: "https://attolinfra.com/mobile/addservicelist.php",
        javascriptMode: JavascriptMode.unrestricted,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Add your onPressed code here!
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => url2()),
          );
        },
        label: const Text('+'),
        backgroundColor: Colors.green,
      ),
    );
  }
}
