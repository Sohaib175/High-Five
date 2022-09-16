import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:high_five/AuthModule/Model/user_model.dart';
import 'package:high_five/AuthModule/Services/firestore_service.dart';
import 'package:high_five/AuthModule/Services/google_signin_service.dart';
import 'package:high_five/utill/get_storage_handler.dart';

class AuthVM extends GetxController {
  // GetStorage getStorage = GetStorage();
  final GoogleSignInServices googleSignInServices = GoogleSignInServices();
  final FirestoreServices firestoreServices = FirestoreServices();
  final GetStorageHandler getStorageHandler = GetStorageHandler();
  RxBool isCreateNew = false.obs;

  static late UserModel userModel;
  signInWithGoogle() async {
    User? user = await googleSignInServices.signInWithGoogle();
    userModel = UserModel(
      userId: user!.uid,
      name: user.displayName!,
      email: user.email!,
      profileImage: user.photoURL!,
    );
    getStorageHandler.setLocaleId(userModel.userId);
    await firestoreServices.saveDataFirebase(userModel);
  }

  signOutGoogle() async {
    googleSignInServices.signOut();
  }
}
