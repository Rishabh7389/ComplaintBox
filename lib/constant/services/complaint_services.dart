import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter_application_1/constant/helper/helper_service.dart';

class ComplaintServices {
  HelperService helperService = HelperService();
  String? uid;

  ComplaintServices({this.uid});
  CollectionReference user = FirebaseFirestore.instance.collection("user");
  CollectionReference complaints =
      FirebaseFirestore.instance.collection("complaints");

  Future saveuserdata(
      String fullName, String email, bool isAdmin, String registration) async {
    return await user.doc(uid).set({
      "fullName": fullName,
      "complaints": [],
      "email": email,
      "uid": uid,
      "isAdmin": isAdmin,
      "registration": registration
    });
  }

  Future<bool> createComplaint(String complaint, String regisration,
      String name, String mobile, String hostel, String room, status) async {
    var userid = await helperService.getValue("uid");
    try {
      await user
          .doc("u9kHbadGrwRMESFBuD0Zb5Z9Oho2")
          .collection("complaints")
          .add({
        "complaint": complaint,
        "hostel": hostel,
        "mobile": mobile,
        "room": room,
        "name": name,
        "registration": regisration,
        "status": status
      }).then((value) => log(value.toString()));
      await user.doc(userid).collection("complaints").add({
        "complaint": complaint,
        "hostel": hostel,
        "mobile": mobile,
        "room": room,
        "name": name,
        "registration": regisration,
        "status": status
      });
      return true;
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  Future gettingUserData(String email) async {
    QuerySnapshot snapshot =
        await complaints.where("email", isEqualTo: email).get();
    return snapshot;
  }
}
