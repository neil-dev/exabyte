import 'package:exabyte/widgets/main_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';


import './providers/event_data.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    return ChangeNotifierProvider(
      create: (_) => Events(),
      child: MaterialApp(
        title: 'Exabyte',
        theme: ThemeData(
          backgroundColor: Colors.black,
          appBarTheme: AppBarTheme(
            color: Colors.grey[850],
            textTheme: ThemeData.dark().textTheme.copyWith(
                  title: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
          ),
          textTheme: TextTheme(
            title: TextStyle(
              fontFamily: 'Montserrat',
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            caption: TextStyle(
              fontFamily: 'Caviar Dreams',
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            body1: TextStyle(
              color: Colors.white,
              fontFamily: 'Product Sans',
            ),
            subtitle: TextStyle(
              fontFamily: 'Caviar Dreams',
              color: Colors.white70,
            ),
          ),
        ),
        home: MainDrawer(),
      ),
    );
  }
}
