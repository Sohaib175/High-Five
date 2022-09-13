import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_storage/get_storage.dart';
import 'package:high_five/AuthModule/Model/user_model.dart';
import 'package:high_five/AuthModule/Services/firestore_service.dart';
import 'package:high_five/AuthModule/Services/google_signin_service.dart';

class AuthVM extends GetxController {
  // final GoogleSignInServices _googleSignInServices = GoogleSignInServices();
  // SplashVM splashVM = SplashVM();
  GetStorage getStorage = GetStorage();
  final FirestoreServices _firestoreServices = FirestoreServices();
  RxBool isCreateNew = false.obs;

  static late UserModel currentUserModel;

  signInWithGoogle() async {
    User? user = await GoogleSignInServices.signInWithGoogle();
    currentUserModel = UserModel(
      userId: user!.uid,
      name: user.displayName!,
      email: user.email!,
      profileImage: user.photoURL!,
    );
    await getStorage.write('userId', currentUserModel.userId);
    await _firestoreServices.savesData(currentUserModel);
    print(getStorage.read('userId'));
  }

  signOutGoogle() async {
    GoogleSignInServices.signOut();
  }
}
