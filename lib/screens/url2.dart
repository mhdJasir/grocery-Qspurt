import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class url2 extends StatelessWidget {
  const url2({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebView(
        initialUrl: "https://attolinfra.com/mobile/addservice.php",
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
