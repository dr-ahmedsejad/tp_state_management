import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tp_state_management/TP_Getx/controller/TessbihController.dart';

class Resultat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var controller = Get.find<TessbihController>();

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
                      Obx(() => Text('${controller.subhanAllahCount.value}',
                          style: TextStyle(fontSize: 18, color: Colors.green))),
                      Obx(() => Text('${controller.alhamdulillahCount.value}',
                          style: TextStyle(fontSize: 18, color: Colors.orange))),
                      Obx(() => Text('${controller.laIlahaIlaAllahCount.value}',
                          style: TextStyle(fontSize: 18, color: Colors.blue))),
                      Obx(() => Text('${controller.allahuAkbarCount.value}',
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