import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter_application_1/constant/helper/helper_service.dart';

class ComplaintServices {
  HelperService helperService = HelperService();
  String? uid;
  ComplaintServices({this.uid});
  CollectionReference complaints =
      FirebaseFirestore.instance.collection("user");

  Future saveuserdata(String fullName, String email) async {
    return await complaints.doc(uid).set(
        {"fullNmae": fullName, "Complaints": [], "email": email, "uid": uid});
  }

  Future createComplaint(
      complaint, regisration, name, mobile, hostel, room) async {
    final uid = await helperService.getValue("uid");
    try {
      complaints.doc(uid).collection("Complaints").add({
        "complaint": complaints,
        "hostel": hostel,
        "mobile": mobile,
        "room": room,
        "name": name,
        "registration": regisration
      });
    } catch (e) {
      log(e.toString());
    }
  }

  Future gettingUserData(String email) async {
    QuerySnapshot snapshot =
        await complaints.where("email", isEqualTo: email).get();
    return snapshot;
  }
}
