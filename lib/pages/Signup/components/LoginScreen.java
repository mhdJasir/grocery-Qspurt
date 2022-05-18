import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:grocery_app/pages/Login/components/background.dart';
import 'package:grocery_app/pages/Signup/signup_screen.dart';
import 'package:grocery_app/components/already_have_an_account_acheck.dart';
import 'package:grocery_app/components/rounded_button.dart';
import 'package:grocery_app/components/rounded_input_field.dart';
import 'package:grocery_app/components/rounded_password_field.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grocery_app/screens/home/home_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:grocery_app/screens/dashboard/dashboard_screen.dart';
import 'package:grocery_app/components/text_field_container.dart';
import 'package:grocery_app/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LoginScreen extends StatelessWidget {
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
        print("asdasdasd");
        print(emailText);
        runApp(MaterialApp(home: emailText == null ? LoginScreen() : DashboardScreen()));
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


            print("123123123123");



            Navigator.push(

                    context, MaterialPageRoute(builder: (context) => DashboardScreen(),),);
        } else {

            Navigator.push(
                    context, MaterialPageRoute(builder: (context) => LoginScreen(),),);

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
                "Freelancer Login",
                style: TextStyle(fontWeight: FontWeight.bold),
            ),
        SizedBox(height: size.height * 0.03),

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

                controller: pass,

                cursorColor: kPrimaryColor,
                decoration: InputDecoration(
                icon: Icon(
                Icons.password,
                color: kPrimaryColor,
                  ),
        hintText: "Password",
                border: InputBorder.none,
                ),

              ),
            ),
        RoundedButton(
                text: "LOGIN",
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
            return SignUpScreen();
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

