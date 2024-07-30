import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_part/presentation/detail_data/bloc.dart';
import 'package:test_part/presentation/detail_data/screen.dart';

import 'core/di/injection.dart';

Future<void> main() async {
  configureInjection();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TestPart',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle.dark,
        ),
      ),
      debugShowCheckedModeBanner: false,
      builder: (context, child) => MediaQuery(
        data: MediaQuery.of(context).copyWith(boldText: false, textScaler: const TextScaler.linear(1)),
        child: child!,
      ),
      home: BlocProvider(
        create: (context) {
          return getIt<DetailPlaceBloc>(param1: 50)..add(const DetailPlaceEvent.init());
        },
        child: const DetailPlaceScreen(),
      ),
    );
  }
}
