import 'dart:convert';

import 'package:example/servises.dart';
import 'package:get/get.dart';

class DropdownDataController extends GetxController with StateMixin {
  List<String> countrys = [];
  @override
  void onInit() {
    super.onInit();
    Services.getCountyList().then(
        (value) => countrys = value.map((e) => e.name.toString()).toList());
  }
}
