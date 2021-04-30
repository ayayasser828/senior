import 'package:senior/services/auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {


  void getCurrentUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var user = prefs.getString(Auth().auth.currentUser.uid.toString());
    print(user);
  }

  Future<void> setCurrentUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('uid', Auth().auth.currentUser.uid);
    print(prefs.get('uid'));

  }


  Future<void> removeUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try{
      prefs.remove('uid');
      Auth().auth.signOut();
      print("Success");
    } catch (e){
      print(e.toString());
    }
  }

}