import 'package:f1_app/app/data/models/f1season_model.dart';
import 'package:f1_app/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget raceResultItem(F1Season f1season) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SizedBox(
        height: 24,
      ),
      Text(
        "Race details",
        style: bodyLarge(softBlack, FontWeight.bold),
      ),
      const SizedBox(
        height: 10,
      ),
      Text(
        f1season.race!.date!,
        style: bodyMedium(softBlack, FontWeight.normal),
      ),
      const SizedBox(
        height: 6,
      ),
      Text(
        f1season.race!.circuit!,
        style: GoogleFonts.titilliumWeb(
            color: lightGrey, fontSize: 14, height: 1.5),
        overflow: TextOverflow.clip,
      ),
      ListView.builder(
        itemCount: f1season.race!.raceResult!.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return f1season.race!.raceResult!.isEmpty
              ? Center(
                  child: Text(
                  "coming soon",
                  style: customTextStyle(20, softBlack, FontWeight.normal),
                ))
              : Column(
                  children: [
                    Card(
                      child: Container(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              f1season.race!.raceResult![index].pos!,
                              style: customTextStyle(
                                  20.0,
                                  index == 0 ? f1RedColor : softBlack,
                                  FontWeight.bold),
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    f1season.race!.raceResult![index].driver!,
                                    style: bodyMedium(
                                        softBlack, FontWeight.normal),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    f1season.race!.raceResult![index].car!,
                                    style: bodyMedium(
                                        softBlack, FontWeight.normal),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            f1season.race!.raceResult![index]
                                                .timeRetired!,
                                            style: bodySmall(
                                                softBlack, FontWeight.normal),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            "Time/Retired",
                                            style: bodySmall(
                                                lightGrey, FontWeight.normal),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        "+${f1season.race!.raceResult![index].pTS!} pts",
                                        style: bodySmall(
                                            softBlack, FontWeight.bold),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                  ],
                );
        },
      )
    ],
  );
}
