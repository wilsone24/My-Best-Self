import 'package:get/get.dart';

class IdController extends GetxController {
  final _id = 0.obs;
  int get id => _id.value;
  void increment() => _id.value++;
}
