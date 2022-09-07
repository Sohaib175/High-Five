import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreService {
  FirestoreService(
    this.userStore,
  );
  User userStore;
  // User userDisplay;

  // final AuthFirestoreUserVM _authUserVM = Get.find();
  // final AuthFirestoreUserVM _authFirestoreUserVM =
  //     Get.put(AuthFirestoreUserVM());
  savesData() async {
    Map<String, dynamic> data = {
      "name": userStore!.displayName,
      "email": userStore!.email,
      "profileimage": userStore!.photoURL,
      "uid": userStore!.uid,
      "date": DateTime.now()
    };

    DocumentSnapshot userExist = await FirebaseFirestore.instance
        .collection("user")
        .doc(userStore!.uid)
        .get();

    if (userExist.exists) {
      print("asdasdasdasd");
    } else {
      await FirebaseFirestore.instance
          .collection("users")
          .doc(userStore!.uid)
          .set(data);
    }
  }

  getData() async {
    // /GET ALL Docs
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection("users").get();

    print(snapshot.size);
    print(snapshot.docs);
  }
}
