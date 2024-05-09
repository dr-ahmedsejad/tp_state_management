import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tp_state_management/TP_Provider_opt/viewModel/TessbihProvider.dart';

class Resultat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   // var counter = Provider.of<TessbihProvider>(context);
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
                      Selector<TessbihProvider, int>(
                        selector: (context, Tessbih) => Tessbih.subhanAllahCount,
                        builder: (context, subhanAllahCount,child){
                          print("Selector subhanAllah");
                          return Text('${subhanAllahCount}',
                            style: TextStyle(fontSize: 18, color: Colors.green));
                      },
                     ),
                      Selector<TessbihProvider, int>(
                        selector: (context, Tessbih) => Tessbih.alhamdulillahCount,
                        builder: (context, alhamdulillahCount,child){
                          print("Selector alhamdulillah");
                          return Text('${alhamdulillahCount}',
                              style: TextStyle(fontSize: 18, color: Colors.orange));
                        },
                      ),
                      Selector<TessbihProvider, int>(
                        selector: (context, Tessbih) => Tessbih.laIlahaIlaAllahCount,
                        builder: (context, laIlahaIlaAllahCount,child){
                          print("Selector laIlahaIlaAllah");
                          return Text('${laIlahaIlaAllahCount}',
                              style: TextStyle(fontSize: 18, color: Colors.blue));
                        },
                      ),
                      Selector<TessbihProvider, int>(
                        selector: (context, Tessbih) => Tessbih.allahuAkbarCount,
                        builder: (context, allahuAkbarCount,child){
                          print("Selector allahuAkbar");
                          return Text('${allahuAkbarCount}',
                              style: TextStyle(fontSize: 18, color: Colors.red));
                        },
                      ),
                      // Text('${counter.alhamdulillahCount}',
                      //     style: TextStyle(fontSize: 18, color: Colors.orange)),
                      // Text('${counter.laIlahaIlaAllahCount}',
                      //     style: TextStyle(fontSize: 18, color: Colors.blue)),
                      // Text('${counter.allahuAkbarCount}',
                      //     style: TextStyle(fontSize: 18, color: Colors.red)),
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