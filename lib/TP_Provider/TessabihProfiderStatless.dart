import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TessbihProvider(),
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

class MyHomePage extends StatelessWidget {
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
                  Provider.of<TessbihProvider>(context, listen: false).resetCounts();
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  primary: Colors.grey,
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
            Provider.of<TessbihProvider>(context, listen: false).incrementCount(label);
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

class TessbihProvider with ChangeNotifier {
  int subhanAllahCount = 0;
  int alhamdulillahCount = 0;
  int laIlahaIlaAllahCount = 0;
  int allahuAkbarCount = 0;

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

    notifyListeners();
  }

  void resetCounts() {
    subhanAllahCount = 0;
    alhamdulillahCount = 0;
    laIlahaIlaAllahCount = 0;
    allahuAkbarCount = 0;

    notifyListeners();
  }
}
