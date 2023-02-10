import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class GoogleSignInProvider extends ChangeNotifier {
  final googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _user;

  GoogleSignInAccount get user => _user!;
  Future<void> storeEmail(String email) async {
    if (email.endsWith("@vitapstudent.ac.in") ||
        email.endsWith("@vitap.ac.in")) {
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('email', email);
    } else {
      print("Error: email does not belong to a valid domain");
    }
  }

  Future<String> getEmail() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('email') ?? '';
  }

  Future<void> removeEmail() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('email');
  }

  Future googleLogin(BuildContext context, Function navigate) async {
    _launchURLLinkedIn() async {
      var url = Uri.parse('https://vitopia.vitap.ac.in');
      if (await canLaunchUrl(url)) {
        await launchUrl(url);
      } else {
        throw 'Could not launch $url';
      }
    }

    try {
      await googleSignIn.signOut();
      final googleUser = await googleSignIn.signIn();
      if (googleUser == null) return;
      _user = googleUser;

      if (!user.email.endsWith('@vitapstudent.ac.in') &&
          !user.email.endsWith('@vitstudent.ac.in')) {
        await removeEmail();
        AwesomeDialog(
          context: context,
          dialogType: DialogType.warning,
          animType: AnimType.bottomSlide,
          title: 'INFORMATION',
          desc: 'VITopia Can Only be Accessed Using University Email',
          btnCancelText: 'External Participant?',
          btnOkText: 'Ok',
          btnCancelOnPress: _launchURLLinkedIn,
          btnOkOnPress: () {},
        )..show();
        return;
      }

      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
      await FirebaseAuth.instance.signInWithCredential(credential);
      Navigator.pushReplacementNamed(context, '/studenthome');
      await storeEmail(user.email);
      final snackBar = SnackBar(
        content: Text("Logged In Sucessful"),
        behavior: SnackBarBehavior.floating,
        action: SnackBarAction(
          label: 'Dismiss',
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      notifyListeners();
    } catch (e, s) {
      print(e.toString());
      print(s.toString());
      final snackBar = SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Text(s.toString()),
        action: SnackBarAction(
          label: 'Dismiss',
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  Future logout(BuildContext context, Function navigate) async {
    try {
      await googleSignIn.disconnect();
      FirebaseAuth.instance.signOut();
      Navigator.pushReplacementNamed(context, '/login');
      await removeEmail();
      final snackBar = SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Text("Logged Out Sucessful"),
        action: SnackBarAction(
          label: 'Dismiss',
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
      );

      // Find the ScaffoldMessenger in the widget tree
      // and use it to show a SnackBar.
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } catch (e) {
      // handle error here
    }
  }
}
