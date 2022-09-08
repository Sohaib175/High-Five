import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreServices {
  FirestoreServices(
    this.user,
  );
  User user;
  // User userDisplay;

  // final AuthFirestoreUserVM _authUserVM = Get.find();
  // final AuthFirestoreUserVM _authFirestoreUserVM =
  //     Get.put(AuthFirestoreUserVM());
  savesData() async {
    Map<String, dynamic> data = {
      "name": user.displayName,
      "email": user.email,
      "profileimage": user.photoURL,
      "uid": user.uid,
      "date": DateTime.now()
    };

    DocumentSnapshot userExist =
        await FirebaseFirestore.instance.collection("user").doc(user.uid).get();

    if (userExist.exists) {
      return;
      // print("asdasdasdasd");
    } else {
      await FirebaseFirestore.instance
          .collection("users")
          .doc(user.uid)
          .set(data);
    }
  }

  // getData() async {
  //   // /GET ALL Docs
  //   QuerySnapshot snapshot =
  //       await FirebaseFirestore.instance.collection("users").get();
  // }
}
