part of theme_provider;

class ThemeProvider with ChangeNotifier {
  ThemeData? _theme;
  String? _themeName;
  late List<Map<String, ThemeData?>> _themes;
  ThemeProvider(
      {required String defaultThemeName,
      required List<Map<String, ThemeData?>> themes}) {
    _themes = themes;
    _populateSavedTheme(defaultThemeName);
  }

  ThemeData? getTheme() => _theme;

  String? getThemeName() => _themeName;

  void setTheme(String themeName) {
    _setThemeState(themeName);
    ThemeService.saveThemeName(themeName);
    notifyListeners();
  }

  void _setThemeState(String themeName) {
    _themeName = themeName;

    for (Map themeMap in _themes) {
      if (themeMap.keys.first == themeName) {
        _theme = themeMap.values.first;
        break;
      }
    }
  }

  Future<void> _populateSavedTheme(String defaultThemeName) async {
    String? savedTheme = await ThemeService.getSavedTheme(defaultThemeName);
    if (savedTheme != null) {
      _setThemeState(savedTheme);
    } else {
      _setThemeState(defaultThemeName);
    }
    notifyListeners();
  }
}
