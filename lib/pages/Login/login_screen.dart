import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:grocery/Constants/Apis.dart';
import 'package:grocery/helpers/Preferences.dart';
import '../../Constants/constants.dart';
import '../../components/already_have_an_account_acheck.dart';
import '../../components/rounded_button.dart';
import '../../components/text_field_container.dart';
import '../../models/Api Model.dart';
import '../../screens/dashboard/dashboard_screen.dart';
import '../Signup/components/background.dart';
import '../Signup/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();

  void initState() {
    super.initState();
    main();
  }

  Future<void> main() async {
    WidgetsFlutterBinding.ensureInitialized();
    var emailText = await Preferences().getUserName();
    print(emailText);
    runApp(MaterialApp(
        debugShowCheckedModeBanner: false,
        home: emailText == null ? LoginScreen() : DashboardScreen()));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Background(
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
      ),
    );
  }

  Future login() async {
    var url = loginUrl;
    var body = {
      "username": user.text,
      "password": pass.text,
    };
    var data = await httpPost(url, body: body);
    Fluttertoast.showToast(msg: data);
    if (data == "Success") {
      WidgetsFlutterBinding.ensureInitialized();
      await Preferences().setUserName(user.text);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DashboardScreen(),
        ),
      );
    }
  }
}
