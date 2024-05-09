import 'package:flutter/material.dart';

class TessbihCounter with ChangeNotifier {
  int subhanAllahCount = 0;
  int alhamdulillahCount = 0;
  int laIlahaIlaAllahCount = 0;
  int allahuAkbarCount = 0;

  void incrementCount(String label) {
    if (label == 'سبحان الله') {
      subhanAllahCount++;
      print("subhanAllahCount");
    } else if (label == 'الحمد لله') {
      alhamdulillahCount++;
      print("alhamdulillahCount");
    } else if (label == 'لا إله إلا الله') {
      laIlahaIlaAllahCount++;
      print("laIlahaIlaAllahCount");
    } else if (label == 'الله أكبر') {
      allahuAkbarCount++;
      print("allahuAkbarCount");
    }

    notifyListeners();
  }

  void resetCounts() {
    subhanAllahCount = 0;
    alhamdulillahCount = 0;
    laIlahaIlaAllahCount = 0;
    allahuAkbarCount = 0;
    print("Reset");
    notifyListeners();
  }
}
