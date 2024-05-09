import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("MyHomePage");

    // Register the PrayerCounter controller
    TessbihCounter controller = Get.put(TessbihCounter());

    return Scaffold(
      appBar: AppBar(
        title: Text('تسابيح', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.indigo,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Resultat(),
              SizedBox(height: 20),
              TessbihButton('سبحان الله', Colors.green),
              TessbihButton('الحمد لله', Colors.orange),
              TessbihButton('لا إله إلا الله', Colors.blue),
              TessbihButton('الله أكبر', Colors.red),
              SizedBox(height: 5),
              ElevatedButton.icon(
                onPressed: () {
                  Get.find<TessbihCounter>().resetCounts();
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  backgroundColor: Colors.grey,
                ),
                icon: Icon(Icons.refresh, color: Colors.white),
                label: Text(
                  'إبدأ من جديد',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Resultat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var counter = Get.find<TessbihCounter>();

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                'تقدم الورد',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Obx(() => Text('${counter.subhanAllahCount.value}',
                          style: TextStyle(fontSize: 18, color: Colors.green))),
                      Obx(() => Text('${counter.alhamdulillahCount.value}',
                          style: TextStyle(fontSize: 18, color: Colors.orange))),
                      Obx(() => Text('${counter.laIlahaIlaAllahCount.value}',
                          style: TextStyle(fontSize: 18, color: Colors.blue))),
                      Obx(() => Text('${counter.allahuAkbarCount.value}',
                          style: TextStyle(fontSize: 18, color: Colors.red))),
                    ],
                  ),
                  Column(
                    children: [
                      Text('سبحان الله',
                          style: TextStyle(fontSize: 18, color: Colors.black)),
                      Text('الحمد لله',
                          style: TextStyle(fontSize: 18, color: Colors.black)),
                      Text('لا إله إلا الله',
                          style: TextStyle(fontSize: 18, color: Colors.black)),
                      Text('الله أكبر',
                          style: TextStyle(fontSize: 18, color: Colors.black)),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TessbihButton extends StatelessWidget {
  final String label;
  final Color buttonColor;

  TessbihButton(this.label, this.buttonColor);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        ElevatedButton(
          onPressed: () {
            Get.find<TessbihCounter>().incrementCount(label);
          },
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            backgroundColor: buttonColor,
          ),
          child: Text(
            label,
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}

class TessbihCounter extends GetxController {
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
