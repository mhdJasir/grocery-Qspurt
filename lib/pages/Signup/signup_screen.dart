import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../components/already_have_an_account_acheck.dart';
import '../../components/rounded_button.dart';
import '../../components/text_field_container.dart';
import '../../Constants/constants.dart';
import '../../screens/dashboard/dashboard_screen.dart';
import '../Login/components/background.dart';
import '../Login/login_screen.dart';


class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}



class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();

}



class _BodyState extends State<Body> {
  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();

  void initState()
  {
    super.initState();
    main();

  }


  Future<void> main() async {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var emailText = prefs.getString('emailText');
    runApp(MaterialApp(home: emailText == null ? SignUpScreen() : DashboardScreen()));
  }


  Future login() async {
    var url = "https://www.primefixx.com/json/login.php";
    var response = await http.post(url, body: {
      "username": user.text,
      "password": pass.text,
    });
    var data = json.decode(response.body);



    if (data == "Success") {
      WidgetsFlutterBinding.ensureInitialized();
      SharedPreferences preferences = await SharedPreferences.getInstance();


      preferences.setString('emailText', user.text);
      Navigator.push(
        context, MaterialPageRoute(builder: (context) => DashboardScreen(),),);
    } else {

      Navigator.push(
        context, MaterialPageRoute(builder: (context) => SignUpScreen(),),);

    }
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Freelancer Registration",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),

            TextFieldContainer(
              child: TextField(


                controller: user,
                cursorColor: kPrimaryColor,
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.account_circle_sharp ,
                    color: kPrimaryColor,
                  ),
                  hintText: "Username",
                  border: InputBorder.none,
                ),

              ),
            ),
            TextFieldContainer(
              child: TextField(


                controller: user,
                cursorColor: kPrimaryColor,
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.mail,
                    color: kPrimaryColor,
                  ),
                  hintText: "Your Email",
                  border: InputBorder.none,
                ),

              ),
            ),
            TextFieldContainer(
              child: TextField(


                controller: user,
                cursorColor: kPrimaryColor,
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.add_location_alt_outlined,
                    color: kPrimaryColor,
                  ),
                  hintText: "Address",
                  border: InputBorder.none,
                ),

              ),
            ),

            TextFieldContainer(
              child: TextField(


                controller: user,
                cursorColor: kPrimaryColor,
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.contact_phone ,
                    color: kPrimaryColor,
                  ),
                  hintText: "Phone number",
                  border: InputBorder.none,
                ),

              ),
            ),
            TextFieldContainer(
              child: TextField(

                controller: pass,

                cursorColor: kPrimaryColor,
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.password,
                    color: kPrimaryColor,
                  ),
                  hintText: "Verify Password",
                  border: InputBorder.none,
                ),

              ),
            ),
            RoundedButton(
              text: "Sign up",
              press: () {
                login();
              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

