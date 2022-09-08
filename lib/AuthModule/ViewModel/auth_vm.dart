import 'package:get/get.dart';

// import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:high_five/AuthModule/Model/user_model.dart';
import 'package:high_five/AuthModule/Services/firestore_service.dart';
import 'package:high_five/AuthModule/Services/google_signin_service.dart';
// import 'u';

class AuthVM extends GetxController {
  final GoogleSignInServices _googleSignInServices = GoogleSignInServices();
  final FirestoreServices _firestoreServices = FirestoreServices();
  RxBool isCreateNew = false.obs;

  late UserModel userModel;
  // = UserModel(
  //   userId: "",
  //   name: "",
  //   email: '',
  //   profileImage: '',
  // );

  signInWithGoogle() async {
    User? user = await _googleSignInServices.signInWithGoogle();
    userModel = UserModel(
      userId: user!.uid,
      name: user.displayName!,
      email: user.email!,
      profileImage: user.photoURL!,
    );
    await saveUserToFireStore(userModel);
  }

  saveUserToFireStore(UserModel user) {
    _firestoreServices.savesData(userModel);
  }
}
