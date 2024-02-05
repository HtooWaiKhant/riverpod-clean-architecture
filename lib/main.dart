import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:travel_riverpod/features/trip/data/models/trip_model.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  //Initialize hive and open the box
  await Hive.initFlutter(await getApplicationDocumentsDirectory().path);
  await Hive.openBox<TripModel>('trips');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: const MainScreen(),
    );
  }
}
