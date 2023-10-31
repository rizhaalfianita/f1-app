import 'package:f1_app/app/data/models/F1AllSeason_model.dart';
import 'package:f1_app/app/data/models/f1season_model.dart';
import 'package:f1_app/app/data/services/f1scrapperapi_service.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final allSeasons = <F1AllSeason>[].obs;
  final season = <String, List<F1Season>?>{}.obs;
  final isLoading = true.obs;
  final isLoadingSeason = <String, bool>{}.obs;

  final selectedSeason = "".obs;

  @override
  Future<void> onInit() async {
    fetchF1AllSeason();
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
}
