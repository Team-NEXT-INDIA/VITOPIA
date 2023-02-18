import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:url_launcher/url_launcher.dart';

class GoogleSignInProvider extends ChangeNotifier {
  final googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _user;

  GoogleSignInAccount get user => _user!;
  // Future<void> storeEmail(String email) async {
  //   if (!user.email.endsWith('@vitapstudent.ac.in') ||
  //       !user.email.endsWith('@vitap.ac.in')) {
  //     final prefs = await SharedPreferences.getInstance();
  //     prefs.setString('email', user.email);
  //   } else {
  //     print("Error: email does not belong to a valid domain");
  //   }
  // }
  Future<void> storeEmail(String email) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('email', user.email);
    print("Saved Email");
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

      // if (!user.email.endsWith('@vitapstudent.ac.in') &&
      //     !user.email.endsWith('@vitap.ac.in')) {
      //   await removeEmail();
      //   AwesomeDialog(
      //     context: context,
      //     dialogType: DialogType.warning,
      //     animType: AnimType.bottomSlide,
      //     title: 'INFORMATION',
      //     desc: 'VITopia App Can Only be Accessed Using University Email',
      //     btnCancelText: 'External Participant?',
      //     btnOkText: 'Ok',
      //     btnCancelOnPress: _launchURLLinkedIn,
      //     btnOkOnPress: () {},
      //   )..show();
      //   return;
      // }

      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
      await FirebaseAuth.instance.signInWithCredential(credential);
      Navigator.pushReplacementNamed(context, '/studenthome');
      await storeEmail(user.email);
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

  Future<void> appleLogin(BuildContext context, Function navigate) async {
    _launchURLLinkedIn() async {
      var url = Uri.parse('https://vitopia.vitap.ac.in');
      if (await canLaunchUrl(url)) {
        await launchUrl(url);
      } else {
        throw 'Could not launch $url';
      }
    }

    try {
      final credential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
        webAuthenticationOptions: WebAuthenticationOptions(
          clientId: 'LG9D9YUJ9Z',
          redirectUri:
              Uri.parse('https://signin-4d5e8.firebaseapp.com/__/auth/handler'),
        ),
      );

      final OAuthProvider oAuthProvider = OAuthProvider('apple.com');
      final credentialFirebase = oAuthProvider.credential(
        idToken: credential.identityToken,
        accessToken: credential.authorizationCode,
      );

      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credentialFirebase);

      final User? user = userCredential.user;
      // if (!(user?.email ?? '').endsWith('@vitapstudent.ac.in') &&
      //     !(user?.email ?? '').endsWith('@vitap.ac.in')) {
      //   print('@gmail.com valided');
      //   print(user?.email);
      //   await removeEmail();
      //   AwesomeDialog(
      //     context: context,
      //     dialogType: DialogType.warning,
      //     animType: AnimType.bottomSlide,
      //     title: 'INFORMATION',
      //     desc: 'VITopia App Can Only be Accessed Using University Email',
      //     btnCancelText: 'External Participant?',
      //     btnOkText: 'Ok',
      //     btnCancelOnPress: _launchURLLinkedIn,
      //     btnOkOnPress: () {},
      //   )..show();
      //   return;
      // }
      Navigator.pushReplacementNamed(context, '/studenthome');
      await storeEmail(user?.email ?? "");
      print(user?.displayName ?? "");
      print(user?.email ?? "");

      print(user);
    } on SignInWithAppleAuthorizationException catch (e) {
      print('Failed to sign in with Apple: ${e.toString()}');
      String message = 'Failed to sign in with Apple. Please try again later.';
      if (e.code == AuthorizationErrorCode.canceled) {
        message = 'Sign in with Apple was canceled.';
      }
      final snackBar = SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Text(message),
        action: SnackBarAction(
          label: 'Dismiss',
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } catch (e, s) {
      print(e.toString());
      print(s.toString());
    }
  }

  Future logout(BuildContext context, Function navigate) async {
    try {
      await googleSignIn.disconnect();
      FirebaseAuth.instance.signOut();
      Navigator.pushReplacementNamed(context, '/login');
      await removeEmail();
    } catch (e) {
      final snackBar = SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Text(e.toString()),
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
    }
  }
}
