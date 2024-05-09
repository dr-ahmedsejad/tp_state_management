import 'package:flutter/material.dart';
import 'package:tp_state_management/TP_stetState/Resultat.dart';
void main() {
  runApp(MyApp());
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
  int subhanAllahCount = 0;
  int alhamdulillahCount = 0;
  int laIlahaIlaAllahCount = 0;
  int allahuAkbarCount = 0;

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
              Resultat(subhanAllahCount, alhamdulillahCount,
                  laIlahaIlaAllahCount, allahuAkbarCount),
              SizedBox(height: 20),
              TessbihButton(
                  'سبحان الله', subhanAllahCount, Colors.green),
              TessbihButton(
                  'الحمد لله', alhamdulillahCount, Colors.orange),
              TessbihButton(
                  'لا إله إلا الله', laIlahaIlaAllahCount, Colors.blue),
              TessbihButton('الله أكبر', allahuAkbarCount, Colors.red),
              SizedBox(height: 5),
              ElevatedButton.icon(
                onPressed: () {
                  setState(() {
                    // Réinitialiser tous les compteurs à zéro
                    subhanAllahCount = 0;
                    alhamdulillahCount = 0;
                    laIlahaIlaAllahCount = 0;
                    allahuAkbarCount = 0;
                  });
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  primary: Colors.grey, // Couleur du bouton
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

  Widget TessbihButton(String label, int count, Color buttonColor) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        ElevatedButton(
          onPressed: () {
            setState(() {
              if (label == 'سبحان الله') {
                subhanAllahCount++;
              } else if (label == 'الحمد لله') {
                alhamdulillahCount++;
              } else if (label == 'لا إله إلا الله') {
                laIlahaIlaAllahCount++;
              } else if (label == 'الله أكبر') {
                allahuAkbarCount++;
              }
            });
          },
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              backgroundColor: buttonColor
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
