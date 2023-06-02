import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:grocery_app/consts/firebase_consts.dart';
import 'package:grocery_app/screens/btm_bar.dart';
import 'package:grocery_app/services/global_methods.dart';
import 'package:grocery_app/widgets/text_widget.dart';

class GoogleButton extends StatelessWidget {
  GoogleButton({super.key});

  bool isLoading = false;
  Future<void> googleSignIn(context) async {
    final googleSignIn = GoogleSignIn();
    final googleAccount = await googleSignIn.signIn();
    if (googleAccount != null) {
      final googleAuth = await googleAccount.authentication;
      if (googleAuth.accessToken != null && googleAuth.idToken != null) {
        try {
          await authInstance.signInWithCredential(GoogleAuthProvider.credential(
              idToken: googleAuth.idToken,
              accessToken: googleAuth.accessToken));
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const BottomBarScreen()));
        } on FirebaseException catch (error) {
          GlobalMethods()
              .errorDialog(subtitle: '$error.message', context: context);
        } catch (error) {
          GlobalMethods()
              .errorDialog(subtitle: '$error.message', context: context);
        } finally {}
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.lightBlue[50],
      child: InkWell(
        onTap: () {
          googleSignIn(context);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/google.png',
              width: 40.0,
            ),
            const SizedBox(
              height: 10,
            ),
            TextWidget(
                text: 'Sign in with google', color: Colors.black, textSize: 18),
          ],
        ),
      ),
    );
  }
}
