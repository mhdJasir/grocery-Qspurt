


import 'package:shared_preferences/shared_preferences.dart';

class Preferences {

  setUserName(userName)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('userName', userName);
  }
 Future<String> getUserName()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userName = prefs.getString('userName');
    return userName;
  }
  Future removeUserData()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('userName');
  }
}