import 'package:flutter/material.dart';

Widget Resultat(
    int subhan, int alhamd, int laIlahailaAllah, int allahuAkbar) {
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
                    Text('$subhan',
                        style: TextStyle(fontSize: 18, color: Colors.green)),
                    Text('$alhamd',
                        style: TextStyle(fontSize: 18, color: Colors.orange)),
                    Text('$laIlahailaAllah',
                        style: TextStyle(fontSize: 18, color: Colors.blue)),
                    Text('$allahuAkbar',
                        style: TextStyle(fontSize: 18, color: Colors.red)),
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