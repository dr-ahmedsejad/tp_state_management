import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tp_state_management/TP_Provider/viewModel/TessbihProvider.dart';

class Resultat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var counter = Provider.of<TessbihProvider>(context);
    print("build provider");

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
                      Text('${counter.subhanAllahCount}',
                          style: TextStyle(fontSize: 18, color: Colors.green)),
                      Text('${counter.alhamdulillahCount}',
                          style: TextStyle(fontSize: 18, color: Colors.orange)),
                      Text('${counter.laIlahaIlaAllahCount}',
                          style: TextStyle(fontSize: 18, color: Colors.blue)),
                      Text('${counter.allahuAkbarCount}',
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
}