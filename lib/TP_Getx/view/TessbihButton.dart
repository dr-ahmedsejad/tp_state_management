import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tp_state_management/TP_Getx/controller/TessbihController.dart';
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
            Get.find<TessbihController>().incrementCount(label);
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
