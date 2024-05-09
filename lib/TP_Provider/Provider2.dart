import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tp_state_management/TP_Provider/TessbihCounter.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TessbihCounter(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    print("MyHomePage");
    return Scaffold(
      appBar: AppBar(
        title: Text('تسابيح', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.indigo,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Consumer<TessbihCounter>(
            builder: (context, counter, _) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 20),
                  buildIncrementColumn(
                    counter.subhanAllahCount,
                    counter.alhamdulillahCount,
                    counter.laIlahaIlaAllahCount,
                    counter.allahuAkbarCount,
                  ),
                  SizedBox(height: 20),
                  buildExpressionColumn(
                    'سبحان الله',
                    counter.subhanAllahCount,
                    Colors.green,
                    counter,
                  ),
                  buildExpressionColumn(
                    'الحمد لله',
                    counter.alhamdulillahCount,
                    Colors.orange,
                    counter,
                  ),
                  buildExpressionColumn(
                    'لا إله إلا الله',
                    counter.laIlahaIlaAllahCount,
                    Colors.blue,
                    counter,
                  ),
                  buildExpressionColumn(
                    'الله أكبر',
                    counter.allahuAkbarCount,
                    Colors.red,
                    counter,
                  ),
                  SizedBox(height: 5),
                  ElevatedButton.icon(
                    onPressed: () {
                      counter.resetCounts();
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
              );
            },
          ),
        ),
      ),
    );
  }

  Widget buildExpressionColumn(
      String label,
      int count,
      Color buttonColor,
      TessbihCounter counter,
      ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        ElevatedButton(
          onPressed: () {
            counter.incrementCount(label);
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

  Widget buildIncrementColumn(
      int subhan,
      int alhamd,
      int laIlahailaAllah,
      int allahuAkbar,
      ) {
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
}

