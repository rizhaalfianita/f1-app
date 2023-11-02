import 'package:f1_app/app/modules/home/controllers/home_controller.dart';
import 'package:f1_app/app/notifications/local_notifications.dart';
import 'package:f1_app/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class EventTracker extends GetView<HomeController> {
  const EventTracker({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      height: 140,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFF171717),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Obx(
              () => controller.isLoadingUpcoming.value
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(
                          color: f1RedColor,
                        ),
                      ],
                    )
                  : Row(
        children: [
          Expanded(
            flex: 1,
            child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Upcoming",
                          style: bodyMedium(white, FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Text(
                          controller.upcoming.value.date!,
                          style: bodySmall(white, FontWeight.normal),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            Image.network(
                              controller.upcoming.value.image!,
                              width: 50,
                              height: 50,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  controller.upcoming.value.title!
                                      .split(" ")[0],
                                  style: customTextStyle(
                                      16, white, FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 6,
                                ),
                                Text(
                                  controller.upcoming.value.title!
                                      .split(" ")[1],
                                  style: TextStyle(
                                      fontSize: 16,
                                      foreground: Paint()
                                        ..style = PaintingStyle.stroke
                                        ..strokeWidth = 1.0
                                        ..color = white),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
            ),
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              decoration: BoxDecoration(
                color: const Color(0xFF1F754C),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  Text(
                    "PRACTICE 1",
                    style: bodySmall(white, FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Container(
                    height: 1,
                    width: double.infinity,
                    color: white,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TimerCountdown(
                      format: CountDownTimerFormat.daysHoursMinutes,
                      endTime: DateTime.now().add(controller.targetDate.value
                          .difference(DateTime.now())),
                      daysDescription: "DAYS",
                      hoursDescription: "HRS",
                      minutesDescription: "MINS",
                      timeTextStyle:
                          customTextStyle(14, white, FontWeight.normal),
                      colonsTextStyle:
                          customTextStyle(18, white, FontWeight.bold),
                      descriptionTextStyle: GoogleFonts.titilliumWeb(
                          fontSize: 8,
                          color: white,
                          fontWeight: FontWeight.bold),
                      onTick: (Duration duration) async {
                        final now = DateTime.now();
                        if (now.hour == 21 &&
                            now.minute == 16 &&
                            now.second == 00) {
                          LocalNotifications.showSimpleNotification(
                              title: "Upcoming Race",
                              body:
                                  "${controller.targetDate.value.difference(DateTime.now()).inDays} days left!",
                              payload: "This is sample data");
                        }
                      },
                      onEnd: () {
                        Future.delayed(const Duration(milliseconds: 100), () {
                          Get.dialog(
                            GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child: const AlertDialog(
                                title: Text('Timer'),
                                content: Text(
                                  'Time is up!',
                                ),
                                
                              ),
                            ),
                          );
                        });
                      }),
                ],
              ),
            ),
          )
        ],
      ),
      )
    );
  }
}

Widget eventTrackerCount(String number, label) {
  return Column(
    children: [
      Text(
        number,
        style: customTextStyle(18, white, FontWeight.bold),
      ),
      const SizedBox(
        height: 3,
      ),
      Text(
        label,
        style: GoogleFonts.titilliumWeb(
            fontSize: 8, color: white, fontWeight: FontWeight.bold),
      )
    ],
  );
}
