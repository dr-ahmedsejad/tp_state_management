import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tp_state_management/TP_Provider_opt/viewModel/TessbihProvider.dart';
import 'package:tp_state_management/TP_Provider_opt/view/TessbihButton.dart';
import 'package:tp_state_management/TP_Provider_opt/view/Resultat.dart';
import 'package:tp_state_management/TP_Provider_opt/view/Resultat2.dart';


void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TessbihProvider(),
      child: MaterialApp(home:  Home()),
    ),
  );
}

class Home extends StatelessWidget {
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
                  print("Reset");
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