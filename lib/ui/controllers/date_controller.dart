import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DateController extends GetxController {
  var currentDate = DateTime.now().obs;

  String getCurrentDate() {
    return DateFormat('dd/MM/yyyy').format(currentDate.value);
  }

  void changeDay(int days) {
    currentDate.value = currentDate.value.add(Duration(days: days));
  }
}
