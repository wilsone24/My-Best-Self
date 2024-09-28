import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_best_self/ui/controllers/date_task_controller.dart';
import 'package:my_best_self/ui/controllers/user_controller.dart';

class HomeHeader2 extends StatelessWidget {
  HomeHeader2({
    super.key,
    required this.screenHeight,
    required this.userController,
  });

  final double screenHeight;
  final UserController userController;
  final DateTaskController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        height: screenHeight * 0.27,
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3) // cambios
          )
        ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 25),
            Column(
              children: [
                const Center(
                    child: Text(
                  "Today",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 27),
                )),
                Center(
                    child: Obx(() => Text(
                          "Hi ${userController.userName}!",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        )))
              ],
            ),
            const SizedBox(height: 14),
            Column(
              children: [
                Obx(() => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.arrow_left),
                          onPressed: () {
                            controller.previousMonth();
                          },
                        ),
                        Text(
                          '${controller.months[controller.selectedMonth.value - 1]} ${DateTime.now().year}',
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                          icon: const Icon(Icons.arrow_right),
                          onPressed: () {
                            controller.nextMonth();
                          },
                        ),
                      ],
                    )),
                const SizedBox(height: 15),
                Obx(() {
                  final daysOfMonth = controller.generateDaysOfMonth(
                      controller.selectedMonth.value, DateTime.now().year);
                  return SizedBox(
                    height: 80,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: daysOfMonth.length,
                      itemBuilder: (context, index) {
                        final day = daysOfMonth[index];
                        return GestureDetector(
                          onTap: () {
                            controller.selectedDay.value = day;
                          },
                          child: Obx(() {
                            final isSelected =
                                controller.selectedDay.value == day;
                            return Container(
                              margin: const EdgeInsets.symmetric(horizontal: 5),
                              child: Card(
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                color: isSelected
                                    ? const Color(0xFF74B7BB)
                                    : const Color(0xFFF0F0F0),
                                child: Container(
                                  width: 60,
                                  padding: const EdgeInsets.all(8.0),
                                  alignment: Alignment.center,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        day.toString(),
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: isSelected
                                              ? Colors.white
                                              : const Color(0xFF7B6F72),
                                        ),
                                      ),
                                      Text(
                                        _getDayOfWeek(day,
                                            controller.selectedMonth.value),
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: isSelected
                                              ? Colors.white70
                                              : Colors.black54,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                        );
                      },
                    ),
                  );
                }),
                const SizedBox(height: 20),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _getDayOfWeek(int day, int month) {
    final date = DateTime(DateTime.now().year, month, day);
    return ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'][date.weekday % 7];
  }
}
