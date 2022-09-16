import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:high_five/AuthModule/Model/user_model.dart';
import 'package:high_five/AuthModule/Services/firestore_service.dart';
import 'package:high_five/AuthModule/Services/google_signin_service.dart';
import 'package:high_five/utill/get_storage_handler.dart';

class AuthVM extends GetxController {
  final GoogleSignInServices googleSignInServices = GoogleSignInServices();
  final FirestoreServices firestoreServices = FirestoreServices();
  final GetStorageHandler getStorageHandler = GetStorageHandler();
  RxBool isCreateNew = false.obs;

  ///Todo: Have to remove this variable
  static UserModel userModel =
      UserModel(userId: "", name: "", email: "", profileImage: "");
  Rx<UserModel> userInfo =
      UserModel(userId: "", name: "", email: "", profileImage: "").obs;

  signInWithGoogle() async {
    var user = await googleSignInServices.signInWithGoogle();
    if (user != null) {
      userInfo.value = UserModel(
        userId: user.uid,
        name: user.displayName!,
        email: user.email!,
        profileImage: user.photoURL!,
      );
      await getStorageHandler.setUserId(userInfo.value.userId);
      await firestoreServices.saveDataFirebase(userInfo.value);
    }
  }

  signOutGoogle() async {
    googleSignInServices.signOut();
  }
}
