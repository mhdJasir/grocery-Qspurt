import 'package:flutter/material.dart';
import 'package:grocery/helpers/Preferences.dart';
import 'package:grocery/screens/account/privacypolicy.dart';
import 'package:grocery/screens/account/support.dart';
import 'package:grocery/screens/account/wallet.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../common_widgets/app_text.dart';
import '../../pages/Login/login_screen.dart';
import '../../styles/colors.dart';
import 'editprofile.dart';

class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              ListTile(
                leading:
                    SizedBox(width: 65, height: 65, child: getImageHeader()),
                title: AppText(
                  text: "Deepak",
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                subtitle: AppText(
                  text: "Freelancer",
                  color: Color(0xff7C7C7C),
                  fontWeight: FontWeight.normal,
                  fontSize: 12,
                ),
              ),
              Divider(),
              ListTile(
                  leading: Icon(Icons.person),
                  title: Text('Edit Profile'),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ProfilePage()));
                  }),
              Divider(),
              ListTile(
                  leading: Icon(Icons.privacy_tip),
                  title: Text('Privacy Policy'),
                  onTap: () {
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => new PrivacyPolicy()));
                  }),
              Divider(),
              ListTile(
                  leading: Icon(Icons.wallet_giftcard),
                  title: Text('Wallet'),
                  onTap: () {
                    Navigator.push(context,
                        new MaterialPageRoute(builder: (context) => wallet()));
                  }),
              Divider(),
              ListTile(
                  leading: Icon(Icons.support),
                  title: Text('Support'),
                  onTap: () {
                    Navigator.push(context,
                        new MaterialPageRoute(builder: (context) => support()));
                  }),
              Divider(),
              SizedBox(
                height: 20,
              ),
              ListTile(
                  leading: Icon(Icons.logout),
                  title: Text('Logout'),
                  onTap: () {
                    logoutNew(context);
                  }),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }

  Future logoutNew(context) async {
    await Preferences().removeUserData();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LoginScreen(),
      ),
    );
  }
}

Widget getImageHeader() {
  String imagePath = "assets/images/account_image.jpg";
  return CircleAvatar(
    radius: 5.0,
    backgroundImage: AssetImage(imagePath),
    backgroundColor: AppColors.primaryColor.withOpacity(0.7),
  );
}
