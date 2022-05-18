import 'package:flutter/material.dart';

class wallet extends StatefulWidget {
  const wallet({Key key}) : super(key: key);

  @override
  _walletState createState() => _walletState();
}

class _walletState extends State<wallet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(
        child: Text('wallet'),
      ),
    );
  }
}
