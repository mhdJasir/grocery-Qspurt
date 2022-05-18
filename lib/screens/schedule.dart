import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'addschedule.dart';

class schedule extends StatelessWidget {
  const schedule({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => addschedule()),
          );
        },
        label: const Text('+'),
        backgroundColor: Colors.pink,
      ),
      body: WebView(
        initialUrl: "https://attolinfra.com/mobile/time.php",
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
