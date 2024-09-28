import 'package:get/get.dart';
import 'package:flutter/material.dart';

class DateTaskController extends GetxController {
  var selectedMonth = DateTime.now().month.obs;
  var selectedDay = DateTime.now().day.obs;

  var tasksByDayAndMonth = <String, List<Widget>>{}.obs;

  List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];

  // Función para obtener la cantidad de días en un mes.
  List<int> generateDaysOfMonth(int month, int year) {
    int lastDay = DateTime(year, month + 1, 0).day;
    return List<int>.generate(lastDay, (index) => index + 1);
  }

  // Función para agregar una tarea al día seleccionado.
  void addTaskForSelectedDay() {
    String key = '${selectedMonth.value}-${selectedDay.value}';
    if (!tasksByDayAndMonth.containsKey(key)) {
      tasksByDayAndMonth[key] = [];
    }

    tasksByDayAndMonth[key]!.add(
      Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Container(
          height: 100,
          alignment: Alignment.center,
          child: const Text(
            'Tarea',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
    tasksByDayAndMonth
        .refresh(); // Refrescar el observable para asegurar que GetX detecte el cambio.
  }

  void nextMonth() {
    if (selectedMonth.value < 12) {
      selectedMonth.value += 1;
    } else {
      selectedMonth.value = 1;
    }
    selectedDay.value = 1; // Reiniciar al primer día del nuevo mes.
  }

  void previousMonth() {
    if (selectedMonth.value > 1) {
      selectedMonth.value -= 1;
    } else {
      selectedMonth.value = 12;
    }
    selectedDay.value = 1; // Reiniciar al primer día del nuevo mes.
  }
}
