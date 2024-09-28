import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_best_self/ui/controllers/date_task_controller.dart';
import 'package:my_best_self/ui/controllers/user_controller.dart';

class HomeHeader extends StatelessWidget {
  HomeHeader({
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
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 28),
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
            const SizedBox(height: 10),
            Column(
              children: [
                Obx(() => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.arrow_back_ios_new_outlined,
                            color: Color(0xFFADA4A5),
                            size: 20,
                          ),
                          onPressed: () {
                            controller.previousMonth();
                          },
                        ),
                        Text(
                          '${controller.months[controller.selectedMonth.value - 1]} ${DateTime.now().year}',
                          style: const TextStyle(
                              fontSize: 18, color: Color(0xFFADA4A5)),
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Color(0xFFADA4A5),
                            size: 20,
                          ),
                          onPressed: () {
                            controller.nextMonth();
                          },
                        ),
                      ],
                    )),
                Obx(() {
                  final daysOfMonth = controller.generateDaysOfMonth(
                      controller.selectedMonth.value, DateTime.now().year);
                  return SizedBox(
                    height: 94,
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
                              width: 73,
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
                                    mainAxisAlignment: MainAxisAlignment.center,
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
