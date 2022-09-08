import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:high_five/AuthModule/Model/user_model.dart';

class InboxServices {
  Future<bool> createInboxService(String email, UserModel usermodel) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    try {
      QuerySnapshot querySnapshot = await firebaseFirestore
          .collection("users")
          .where("email", isEqualTo: email)
          .get();
      if (querySnapshot.docs.isNotEmpty) {
        DocumentSnapshot documentSnapshot = querySnapshot.docs.first;
        // print(documentSnapshot.get('name'));

        await firebaseFirestore
            .collection("chat")
            .doc(DateTime.now().millisecondsSinceEpoch.toString())
            .set(
          {
            documentSnapshot.id: {
              'email': documentSnapshot.get('email'),
              'name': documentSnapshot.get('name'),
              'profileImage': documentSnapshot.get('profileImage')
            },
            usermodel.userId: {
              'email': usermodel.email,
              'name': usermodel.name,
              'profileImage': usermodel.profileImage
            },
            "userIds": {
              documentSnapshot.get('uid'): true,
              usermodel.userId: true
            },
          },
        );
        return true;
      } else {
        print("No user FOund");
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }
}
