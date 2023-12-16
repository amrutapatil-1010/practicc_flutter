import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_task/user_details_model.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:http/http.dart' as http;

class NameScreenController extends GetxController {
  List<UserDetailsModel> listUserDetails = [];
  TextEditingController tecController = TextEditingController();
  bool isProgress = true;
  @override
  void onInit() {
    getUserDetails();
    super.onInit();
  }

  Future<void> getUserDetails() async {
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      var details = List<UserDetailsModel>.from(
          json.decode(response.body).map((x) => UserDetailsModel.fromJson(x)));

      listUserDetails.addAll(details);
      listUserDetails.sort((a, b) => a.name!.compareTo(b.name!));
      isProgress = false;
      update();
    } else {
      update();
    }
  }
}
