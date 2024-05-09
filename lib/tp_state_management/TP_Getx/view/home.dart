import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tp_state_management/TP_Getx/controller/TessbihController.dart';
import 'package:tp_state_management/TP_Getx/view/Resultat.dart';
import 'package:tp_state_management/TP_Getx/view/TessbihButton.dart';

void main() {
  runApp(GetMaterialApp(home: Home()));
}

class Home extends StatelessWidget {
  // Injection
  TessbihController controller = Get.put(TessbihController());

  @override
  Widget build(BuildContext context) {
    print("Home");
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
                  controller.resetCounts();
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
