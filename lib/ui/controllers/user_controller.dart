import 'package:get/get.dart';

class UserController extends GetxController {
  final _userName = ''.obs;

  String get userName => _userName.value;

  void setUserName(String name) => _userName.value = name;
}
