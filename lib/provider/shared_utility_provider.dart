import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError();
});

final sharedUtilityProvider = Provider<SharedUtility>((ref) {
  final sharedPrefs = ref.watch(sharedPreferencesProvider);
  return SharedUtility(sharedPreferences: sharedPrefs);
});

class SharedUtility {
  SharedUtility({
    required this.sharedPreferences,
  });

  final SharedPreferences sharedPreferences;

  int loadClubIndex() {
    return sharedPreferences.getInt('clubIndex') ?? 0;
  }

  void setClubIndex({required int index}) {
    sharedPreferences.setInt('clubIndex', index);
  }

  bool isDarkModeEnabled() {
    return sharedPreferences.getBool('isDarkModeEnabled') ?? false;
  }

  void setDarkModeEnabled({required bool isdark}) {
    sharedPreferences.setBool('isDarkModeEnabled', isdark);
  }
}
