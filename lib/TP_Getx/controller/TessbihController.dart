import 'package:get/get.dart';

class TessbihController extends GetxController {
  var subhanAllahCount = 0.obs;
  var alhamdulillahCount = 0.obs;
  var laIlahaIlaAllahCount = 0.obs;
  var allahuAkbarCount = 0.obs;

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
  }

  void resetCounts() {
    subhanAllahCount.value = 0;
    alhamdulillahCount.value = 0;
    laIlahaIlaAllahCount.value = 0;
    allahuAkbarCount.value = 0;
  }
}