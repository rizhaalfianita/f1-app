import 'package:cool_dropdown/controllers/dropdown_controller.dart';
import 'package:f1_app/app/data/dummy/2023.dart';
import 'package:f1_app/app/data/models/f1allseason_model.dart';
import 'package:f1_app/app/data/models/f1season_model.dart';
import 'package:f1_app/app/data/models/f1upcoming_model.dart';
import 'package:f1_app/app/data/services/f1scrapperapi_service.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final allSeasons = <F1AllSeason>[].obs;
  final RxMap<String, List<F1Season>?> season = <String, List<F1Season>?>{}.obs;
  final isLoading = true.obs;
  final isLoadingSeason = true.obs;
  final isLoadingUpcoming = true.obs;
  final dropdownController = DropdownController().obs;
  final selectedSeason = "2023".obs;
  final upcoming = F1Upcoming().obs;
  final targetDate = DateTime.now().obs;

  final dummyF1Season = dummy2023.map((e) => F1Season.fromJson(e)).toList();
  final isLightTheme = true.obs;

  final PersistentTabController navbarController =
      PersistentTabController(initialIndex: 0);

  @override
  Future<void> onInit() async {
    print("init home controller");
    await fetchF1AllSeason();
    print("fetching F1AllSeason done");
    await fetchF1Upcoming();
    print("fetching upcoming done");
    SharedPreferences prefs = await _prefs;
    isLightTheme.value = prefs.getBool("isLightTheme") ?? true;
    super.onInit();
  }

  Future<void> fetchF1AllSeason() async {
    try {
      isLoading.value = true;
      var res = await F1Service.getAllSeason();
      if (res != null) {
        allSeasons.value = res;
        print(allSeasons.toString());
        isLoading.value = false;
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error while fetching : $e");
      }
    }
  }

  void fetchF1Season(String year) async {
    try {
      isLoadingSeason.value = true;
      print("fetching season $year");
      var season = await F1Service.getSeason(year);
      if (season != null) {
        this.season[year] = season;
        for (var element in season) {
          print(element.country);
        }
        isLoadingSeason.value = false;
      }
    } catch (e) {
      print("Error while fetching : $e");
    }
  }

  Future<void> fetchF1Upcoming() async {
    try {
      isLoadingUpcoming.value = true;
      var res = await F1Service.getUpcoming();
      if (res != null) {
        upcoming.value = res;
        print(upcoming.toString());
        isLoadingUpcoming.value = false;
        targetDate.value =
            DateFormat('dd MMMM y', 'en_US').parse(upcoming.value.date!);
        print("TARGET DATE ${targetDate.value}");
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error while fetching : $e");
      }
    }
  }

  Future<void> changeTheme() async {
    final SharedPreferences prefs = await _prefs;
    isLightTheme.value = !isLightTheme.value;
    prefs.setBool("isLightTheme", isLightTheme.value);
  }
}
