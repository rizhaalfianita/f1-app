import 'package:f1_app/app/data/dummy/2023.dart';
import 'package:f1_app/app/data/model/f1allseason_model.dart';
import 'package:f1_app/app/data/model/f1season_model.dart';
import 'package:f1_app/app/data/model/f1upcoming_model.dart';
import 'package:f1_app/app/data/service/f1scrapperapi_service.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final allSeasons = <F1AllSeason>[].obs;
  final season = <String, List<F1Season>?>{}.obs;
  final isLoading = true.obs;
  final isLoadingSeason = <String, bool>{}.obs;
  final isLoadingUpcoming = true.obs;
  final selectedSeason = "".obs;
  final upcoming = F1Upcoming().obs;

  final dummyF1Season = dummy2023.map((e) => F1Season.fromJson(e)).toList();

  @override
void onInit() async {
    fetchF1AllSeason();
    fetchF1Upcoming();
    selectedSeason.value = "2023";
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
      print("Error while fetching : ${e}");
    } finally {
      isLoading.value = false;
    }
  }

  void fetchF1Season(String year) async {
    try {
      var season = await F1Service.getSeason(year);
      if (season != null) {
        this.season[year] = season;
      }
    } finally {
      isLoading(false);
    }
  }

  void fetchF1Upcoming() async {
    try {
      isLoadingUpcoming.value = true;
      var res = await F1Service.getUpcoming();
      if (res != null) {
        upcoming.value = res;
      }
    } catch (e) {
      print("Error while fetching : ${e}");
    } finally {
      isLoadingUpcoming.value = false;
    }
  }
}
