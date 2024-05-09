// import 'package:flutter/material.dart';
//
// Widget TessbihButton(String label, int count, Color buttonColor) {
//   return Column(
//     mainAxisAlignment: MainAxisAlignment.end,
//     crossAxisAlignment: CrossAxisAlignment.end,
//     children: [
//       ElevatedButton(
//         onPressed: () {
//           setState(() {
//             if (label == 'سبحان الله') {
//               subhanAllahCount++;
//             } else if (label == 'الحمد لله') {
//               alhamdulillahCount++;
//             } else if (label == 'لا إله إلا الله') {
//               laIlahaIlaAllahCount++;
//             } else if (label == 'الله أكبر') {
//               allahuAkbarCount++;
//             }
//           });
//         },
//         style: ElevatedButton.styleFrom(
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(10.0),
//             ),
//             padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
//             backgroundColor: buttonColor
//         ),
//         child: Text(
//           label,
//           style: TextStyle(fontSize: 18, color: Colors.white),
//         ),
//       ),
//       SizedBox(height: 10),
//     ],
//   );
// }