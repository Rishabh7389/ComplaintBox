import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../constant/helper/helper_service.dart';
import '../widgets/complaint_container.dart';

class YourComplaintsPage extends StatefulWidget {
  const YourComplaintsPage({super.key});

  @override
  State<YourComplaintsPage> createState() => _YourComplaintsPageState();
}

class _YourComplaintsPageState extends State<YourComplaintsPage> {
  HelperService helperService = HelperService();

  String? uid;

  getUserID() async {
    uid = await helperService.getValue("uid").then((value) {
      uid = value;
      log(value.toString());
      return uid;
    });
  }

  @override
  void initState() {
    getUserID();
    log(uid.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Text("your complaints"),
            FutureBuilder(
              future: FirebaseFirestore.instance
                  .collection("user")
                  .doc(uid)
                  .collection('complaints')
                  .get(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text("error");
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.hasData) {
                  var data = snapshot.data!.docs;
                  return ListView.builder(
                      shrinkWrap: true,
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemCount: data.length,
                      itemBuilder: ((context, index) {
                        var compData = data[index];
                        return ComplaintContainer(
                          complaintValue: compData['complaint'],
                          nameValue: compData['name'],
                          regValue: compData['registration'],
                          hostelValue: compData['hostel'],
                          roomValue: compData['room'],
                          mobValue: compData['mobile'],
                          statusvalue: compData['status'],
                        );
                      }));
                }
                return const SizedBox.shrink();
              },
            ),
          ],
        ),
      )),
    );
  }
}
