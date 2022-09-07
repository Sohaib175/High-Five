import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInService {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  //  = GoogleSignIn(
  //   scopes: <String>[],
  // );

  // onSignIn() async {
  //   try {
  //     // await googleSignIn.signOut();
  //     final googleUser = await googleSignIn.signIn();
  //     // handling the exception when cancel sign in
  //     if (googleUser == null) return null;
  //     // Obtain the auth details from the request
  //     final GoogleSignInAuthentication googleAuth =
  //         await googleUser.authentication;
  //     // Create a new credential
  //     final credential = GoogleAuthProvider.credential(
  //       accessToken: googleAuth.accessToken,
  //       idToken: googleAuth.idToken,
  //     );
  //     return await FirebaseAuth.instance.signInWithCredential(credential);
  //   } on Exception catch (exception) {
  //     print(exception);
  //   }
  // }

  Future<UserCredential?> onSignInNew() async {
    // Trigger the authentication flow
    try {
      bool isSignedIn = GoogleSignIn().isSignedIn() as bool;
      if (isSignedIn) {
        print(isSignedIn);
      } else {
        print(isSignedIn);
      }
      GoogleSignIn().signOut();
      final GoogleSignInAccount? googleUser = await (GoogleSignIn().signIn());

      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;

      // Create a new credential
      final GoogleAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      ) as GoogleAuthCredential;

      // Once signed in, return the UserCredential

      return await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      print(e);
      return null;
    }
  }

  onGoogleLogout() async {
    googleSignIn.disconnect();
    googleSignIn.signOut();
  }
}
