import 'package:cool_dropdown/controllers/dropdown_controller.dart';
import 'package:f1_app/app/data/dummy/2023.dart';
import 'package:f1_app/app/data/models/f1allseason_model.dart';
import 'package:f1_app/app/data/models/f1season_model.dart';
import 'package:f1_app/app/data/models/f1upcoming_model.dart';
import 'package:f1_app/app/data/services/f1scrapperapi_service.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final allSeasons = <F1AllSeason>[].obs;
  final RxMap<String, List<F1Season>?> season = <String, List<F1Season>?>{}.obs;
  final isLoading = true.obs;
  final isLoadingSeason = <String, bool>{}.obs;
  final isLoadingUpcoming = true.obs;
  final dropdownController = DropdownController().obs;
  final selectedTab = 0.obs;
  final selectedSeason = "".obs;
  final upcoming = F1Upcoming().obs;

  final dummyF1Season = dummy2023.map((e) => F1Season.fromJson(e)).toList();

  @override
  void onInit() async {
    fetchF1AllSeason();
    super.onInit();
  }

  void fetchF1AllSeason() async {
    try {
      isLoading.value = true;
      var res = await F1Service.getAllSeason();
      if (res != null) {
        allSeasons.value = res;
        print(allSeasons.toString());
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error while fetching : ${e}");
      }
    } finally {
      isLoading.value = false;
    }
  }

  void fetchF1Season(String year) async {
    try {
      print("fetching season ${year}");
      isLoadingUpcoming.value = true;
      var season = await F1Service.getSeason(year);
      if (season != null) {
        this.season[year] = season;
        for (var element in season) {
          print(element.country);
        }
      }
    } finally {
      isLoading(false);
    }
  }
}
