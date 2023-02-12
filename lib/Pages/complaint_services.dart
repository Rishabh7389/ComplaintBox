import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ComplaintServices {
  String? uid;
  CollectionReference complaints =
      FirebaseFirestore.instance.collection("user");

//   Future<void> addcomplaints(String name, String registration_no,
//       String hostel_name, String room_no, String mobile_no, String complaint) {
//     return complaints
//         .add({
//           "name": name,
//           "registration": registration_no,
//           "hostel": hostel_name,
//           "room": room_no,
//           "mobile": mobile_no,
//           "complaint": complaint,
//         })
//         .then((value) => log("complaint added $value"))
//         .catchError((error) => log("faild to add $error"));
//   }
// }

  Future saveuserdata(String full_name, String email) async {
    return await complaints.doc(uid).set(
        {"fullNmae": full_name, "Complaints": [], "email": email, "uid": uid});
  }

  Future signupuser(String email, String password, String full_name) async {
    User user = (await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password))
        .user!;
    if (user != null) {
      saveuserdata(full_name, email);
    }
  }
}
