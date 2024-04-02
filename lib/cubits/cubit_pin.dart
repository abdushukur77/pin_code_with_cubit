import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_with_cubit/screens/country/currencies_screen.dart';
import 'package:pin_code_with_cubit/screens/home_screen.dart';

import '../data/local/storage/shared_pref.dart';

class CheckCubit extends Cubit<String> {
  CheckCubit() : super("");

  void createPassword(String pinCode) {
    if (StorageRepository.getString(key: "pin_code").isEmpty) {
      StorageRepository.setString(
        key: "pin_code",
        value: pinCode,
      );
    }
  }

  void toVerifyPinCode(String againPinCode, BuildContext context) {
    if (StorageRepository.getString(key: "pin_code") == againPinCode) {
      StorageRepository.setBool(
        key: "saved",
        value: true,
      );
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => const ApiScreen(),
      //   ),
      // );
    } else {
      StorageRepository.setBool(
        key: "saved",
        value: false,
      );
    }
  }

  void toCheckPinCode(String pinCode, BuildContext context) {
    if (StorageRepository.getString(key: "pin_code") == pinCode) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => CurrenciesScreen(),
        ),
      );
    }else{
      if (StorageRepository.getString(key: "pin_code").isNotEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                backgroundColor:Colors.red,
                content: Text('Kiritilgan pin code xato'))
        );

      }
    }
  }
}