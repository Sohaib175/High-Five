import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:high_five/AuthModule/Model/user_model.dart';

class FirestoreServices {
  FirestoreServices();
  // User user;
  // User userDisplay;

  // final AuthFirestoreUserVM _authUserVM = Get.find();
  // final AuthFirestoreUserVM _authFirestoreUserVM =
  //     Get.put(AuthFirestoreUserVM());
  savesData(
    UserModel user,
    //   {
    //   required String name,
    //   required String email,
    //   required String photoURL,
    //   required String userId,
    // }
  ) async {
    Map<String, dynamic> data = {
      "name": user.name,
      "email": user.email,
      "profileimage": user.profileImage,
      "uid": user.userId,
    };

    DocumentSnapshot userExist = await FirebaseFirestore.instance
        .collection("user")
        .doc(user.userId)
        .get();

    if (userExist.exists) {
      return;
    } else {
      await FirebaseFirestore.instance
          .collection("users")
          .doc(user.userId)
          .set(data);
    }
  }

  // getData() async {
  //   // /GET ALL Docs
  //   QuerySnapshot snapshot =
  //       await FirebaseFirestore.instance.collection("users").get();
  // }
}
