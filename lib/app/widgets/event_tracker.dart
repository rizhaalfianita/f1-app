import 'package:f1_app/constant.dart';
import 'package:flutter/material.dart';

Widget eventTracker() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
    height: 130,
    width: double.infinity,
    decoration: BoxDecoration(
      color: const Color(0xFF171717),
      borderRadius: BorderRadius.circular(8),
    ),
    child: Row(
      children: [
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Upcoming",
                style: bodySmall(white, FontWeight.bold),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                "28-30 October",
                style: bodySmall(white, FontWeight.normal),
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Image.asset(
                    "assets/images/sample_track.png",
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
                        "MEXICO",
                        style: customTextStyle(16, white, FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Text(
                        "2023",
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
                  "PRACTICE 3",
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    eventTrackerCount("00", "DAYS"),
                    const SizedBox(
                      width: 5,
                    ),
                    eventTrackerCount("08", "HRS"),
                    const SizedBox(
                      width: 5,
                    ),
                    eventTrackerCount("43", "MINS"),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    ),
  );
}

Widget eventTrackerCount(String number, label) {
  return Column(
    children: [
      Text(
        number,
        style: customTextStyle(18, white, FontWeight.normal),
      ),
      const SizedBox(
        height: 3,
      ),
      Text(
        label,
        style: customTextStyle(8, white, FontWeight.normal),
      )
    ],
  );
}
