import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:high_five/AuthModule/Model/user_model.dart';

class InboxServices {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  newChatService({required String email, required UserModel usermodel}) async {
    QuerySnapshot querySnapshot = await firebaseFirestore
        .collection("users")
        .where("email", isEqualTo: email)
        .get();
    if (querySnapshot.docs.isNotEmpty) {
      DocumentSnapshot documentSnapshot = querySnapshot.docs.first;
      await firebaseFirestore
          .collection("chat")
          .doc(DateTime.now().millisecondsSinceEpoch.toString())
          .set(
        {
          documentSnapshot.id: {
            'email': documentSnapshot.get('email'),
            'name': documentSnapshot.get('name'),
            'profileImage': documentSnapshot.get('profileImage'),
          },
          usermodel.userId: {
            'email': usermodel.email,
            'name': usermodel.name,
            'profileImage': usermodel.profileImage
          },
          "userIds": {usermodel.userId: true, documentSnapshot.id: true},
        },
      );
    }
  }
}
