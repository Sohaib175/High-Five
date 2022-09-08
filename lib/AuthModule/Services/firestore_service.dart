import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:high_five/AuthModule/Model/user_model.dart';

class FirestoreServices {
  FirestoreServices();
  savesData(UserModel user) async {
    Map<String, dynamic> data = {
      "name": user.name,
      "email": user.email,
      "profileImage": user.profileImage,
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
}
