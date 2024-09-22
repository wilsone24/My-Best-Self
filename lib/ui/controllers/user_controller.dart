import 'package:get/get.dart';

class UserController extends GetxController {
  var userName = '';

  String getUserName() {
    return userName;
  }

  void setUserName(String name) {
    userName = name;
  }
}
