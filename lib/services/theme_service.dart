part of theme_provider;

class ThemeService {
  static Future<bool> saveThemeName(String themeName) async {
    final prefs = await SharedPreferences.getInstance();
    return await prefs.setString("app_theme", themeName);
  }

  static Future<String?> getSavedTheme(String defaultThemeName) async {
    final prefs = await SharedPreferences.getInstance();
    String? savedName = prefs.getString("app_theme");
    if (savedName != null) {
      return savedName;
    } else {
      return null;
    }
  }
}
