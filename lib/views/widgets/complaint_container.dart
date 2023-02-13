// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class ComplaintContainer extends StatelessWidget {
  final nameValue;
  final regValue;
  final hostelValue;
  final roomValue;
  final mobValue;
  final complaintValue;
  const ComplaintContainer({
    super.key,
    this.nameValue,
    this.regValue,
    this.hostelValue,
    this.roomValue,
    this.mobValue,
    this.complaintValue,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        width: 350,
        decoration: BoxDecoration(
            color: Colors.black38, borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    "Name",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  const VerticalDivider(
                    color: Colors.white,
                    thickness: 2,
                  ),
                  Text(
                    nameValue,
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    "Registration Number",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  const VerticalDivider(
                    color: Colors.white,
                    thickness: 2,
                  ),
                  Text(
                    regValue,
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    "Hostel Name",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  const VerticalDivider(
                    color: Colors.white,
                    thickness: 2,
                  ),
                  Text(
                    hostelValue,
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    "Room Number",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  const VerticalDivider(
                    color: Colors.white,
                    thickness: 3,
                  ),
                  Text(
                    roomValue,
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    "Mobile Number",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  const VerticalDivider(
                    color: Colors.white,
                    thickness: 2,
                  ),
                  Text(
                    mobValue,
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    "Complaint",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  const VerticalDivider(
                    color: Colors.white,
                    thickness: 2,
                  ),
                  Text(
                    complaintValue,
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
