import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_with_cubit/cubits/cubit_pin.dart';
import 'package:pin_code_with_cubit/screens/pin_screen.dart';
import 'data/local/storage/shared_pref.dart';
import 'data/models/currency_cubit.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  StorageRepository.instance;

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CheckCubit()),
        BlocProvider(create: (_) => CurrenciesCubit()..fetchCurrencies()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const PinCodeWidget(),
    );
  }
}
