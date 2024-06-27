import 'package:flutter/foundation.dart';

class ThemeServiceProvider extends ChangeNotifier{
  bool isDarkModeOn=false;

  void toggleTheme(){
    isDarkModeOn=!isDarkModeOn;
    notifyListeners();
  }
}