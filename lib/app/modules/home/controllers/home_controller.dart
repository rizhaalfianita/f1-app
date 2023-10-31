import 'package:f1_app/app/data/models/F1AllSeason_model.dart';
import 'package:f1_app/app/data/models/f1season_model.dart';
import 'package:f1_app/app/data/services/f1scrapperapi_service.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var allSeasons = <F1AllSeason>[].obs;
  var season = <String, List<F1Season>?>{}.obs;
  var isLoading = true.obs;
  var isLoadingSeason = <String, bool>{}.obs;

  @override
  void onInit() {
    fetchF1AllSeason();
    super.onInit();
  }

  void fetchF1AllSeason() async {
    try {
      isLoading(true);
      var allSeasons = await F1Service.getAllSeason();
      if (allSeasons != null) {
        this.allSeasons.value = allSeasons;
      }
    } finally {
      isLoading(false);
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
