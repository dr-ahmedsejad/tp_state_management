import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TessbihProvider with ChangeNotifier {
  int subhanAllahCount = 0;
  int alhamdulillahCount = 0;
  int laIlahaIlaAllahCount = 0;
  int allahuAkbarCount = 0;

  void incrementCount(String label) {
    if (label == 'سبحان الله') {
      subhanAllahCount++;
    } else if (label == 'الحمد لله') {
      alhamdulillahCount++;
    } else if (label == 'لا إله إلا الله') {
      laIlahaIlaAllahCount++;
    } else if (label == 'الله أكبر') {
      allahuAkbarCount++;
    }

    notifyListeners();
  }

  void resetCounts() {
    subhanAllahCount = 0;
    alhamdulillahCount = 0;
    laIlahaIlaAllahCount = 0;
    allahuAkbarCount = 0;

    notifyListeners();
  }
}