import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:high_five/AuthModule/Model/user_model.dart';
import 'package:high_five/AuthModule/Services/firestore_service.dart';
import 'package:high_five/AuthModule/Services/google_signin_service.dart';

class AuthVM extends GetxController {
  // final GoogleSignInServices _googleSignInServices = GoogleSignInServices();
  final FirestoreServices _firestoreServices = FirestoreServices();
  RxBool isCreateNew = false.obs;

  static late UserModel userModel;
  // = UserModel(
  //   userId: "",
  //   name: "",
  //   email: '',
  //   profileImage: '',
  // );

  signInWithGoogle() async {
    User? user = await GoogleSignInServices.signInWithGoogle();
    userModel = UserModel(
      userId: user!.uid,
      name: user.displayName!,
      email: user.email!,
      profileImage: user.photoURL!,
    );
    _firestoreServices.savesData(userModel);
  }

  signOutGoogle() async {
    GoogleSignInServices.signOut();
  }
}
