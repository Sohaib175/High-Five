import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInServices {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  // final AuthVM authVM = Get.find();
  // Future<UserCredential?> onSignInNew() async {
  //   // Trigger the authentication flow
  //   try {
  //     // bool isSignedIn = await GoogleSignIn().isSignedIn();
  //     // if (isSignedIn) {
  //     //   print(isSignedIn);
  //     //   await GoogleSignIn().signOut();
  //     // } else {
  //     //   print(isSignedIn);
  //     // }
  //     final GoogleSignInAccount? googleUser = await (googleSignIn.signIn());
  //     final GoogleSignInAuthentication googleAuth =
  //         await googleUser!.authentication;
  //     // Create a new credential
  //     final GoogleAuthCredential credential = GoogleAuthProvider.credential(
  //       accessToken: googleAuth.accessToken,
  //       idToken: googleAuth.idToken,
  //     ) as GoogleAuthCredential;
  //     // Once signed in, return the UserCredential
  //     return await FirebaseAuth.instance.signInWithCredential(credential);
  //   } catch (e) {
  //     print(e);
  //     return null;
  //   }
  // }

  Future<User?> signInWithGoogle() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    // User? user;

    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();
    User? user;
    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      try {
        final UserCredential userCredential =
            await auth.signInWithCredential(credential);

        user = userCredential.user;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'account-exists-with-different-credential') {
          // TODO: Account Exist
        } else if (e.code == 'invalid-credential') {
          // TODO: Invalid Credentials

        }
      } catch (e) {
        // TODO: Other Exceptions
      }
    }

    return user;
  }

  Future<void> signOut() async {
    try {
      await googleSignIn.signOut();
      await googleSignIn.disconnect();
      // await FirebaseAuth.instance.signOut();
    } catch (e) {
      // TODO: Error Signing out
    }
  }
}
