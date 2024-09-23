import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DateController extends GetxController {
  final _currentDate = DateTime.now().obs;

  String getCurrentDate() => DateFormat('dd/MM/yyyy').format(_currentDate.value);

  String get currentDate => DateFormat('dd/MM/yyyy').format(_currentDate.value);

  void changeDay(int days) => _currentDate.value = _currentDate.value.add(Duration(days: days));
}
