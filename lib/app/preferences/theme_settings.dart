import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController extends GetxController {
  RxBool isDarkMode = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadThemeFromPrefs();
  }

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    print(isDarkMode.value);
    saveThemeToPrefs();
  }

  void saveThemeToPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkMode', isDarkMode.value);
  }

  void loadThemeFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isDarkMode.value = prefs.getBool('isDarkMode') ?? false;
    print("PRINTT THEME LOAD: ${isDarkMode.value}");
  }
}
