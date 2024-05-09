
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tp_state_management/tp_bloc/bloc/tessbih_bloc.dart';
import 'package:tp_state_management/tp_bloc/bloc/tessbih_events.dart';
import 'package:tp_state_management/tp_bloc/bloc/tessbih_states.dart';

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

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('MyHomePage build');
    return BlocProvider(
      create: (context) => TessbihBloc(),
      child: TessbihPage(),
    );
  }
}

class TessbihPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('TessbihPage build');
   // final TessbihBloc counterBloc = BlocProvider.of<TessbihBloc>(context);
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
              BlocBuilder<TessbihBloc, TessbihState>(
                builder: (context, state) {
                  if (state is TessbihCounters) {
                    return Resultat(
                      state.subhanAllahCount,
                      state.alhamdulillahCount,
                      state.laIlahaIlaAllahCount,
                      state.allahuAkbarCount,
                    );
                  } else if (state is TessbihReset) {
                    return Resultat(0, 0, 0, 0);
                  }
                  return Container(); // Placeholder, you can replace with a loading indicator
                },
              ),
              SizedBox(height: 20),
              TessbihButton('سبحان الله', Colors.green,context),
              TessbihButton('الحمد لله', Colors.orange,context),
              TessbihButton('لا إله إلا الله', Colors.blue,context),
              TessbihButton('الله أكبر', Colors.red,context),
              SizedBox(height: 5),
              ElevatedButton.icon(
                onPressed: () {
                  BlocProvider.of<TessbihBloc>(context).add(ResetTasbeeh());
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

  Widget TessbihButton(String label, Color buttonColor, BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        ElevatedButton(
          onPressed: () {
            if (label == 'سبحان الله') {
              BlocProvider.of<TessbihBloc>(context).add(IncrementSubhanAllah());
            } else if (label == 'الحمد لله') {
              BlocProvider.of<TessbihBloc>(context).add(IncrementAlhamdulillah());
            } else if (label == 'لا إله إلا الله') {
              BlocProvider.of<TessbihBloc>(context).add(IncrementLaIlahaIlaAllah());
            } else if (label == 'الله أكبر') {
              BlocProvider.of<TessbihBloc>(context).add(IncrementAllahuAkbar());
            }
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

  Widget Resultat(
      int subhanAllah,
      int alhamdulillah,
      int laIlahailAllah,
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
                      Text('$subhanAllah',
                          style: TextStyle(fontSize: 18, color: Colors.green)),
                      Text('$alhamdulillah',
                          style: TextStyle(fontSize: 18, color: Colors.orange)),
                      Text('$laIlahailAllah',
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
