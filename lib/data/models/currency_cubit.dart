import 'package:flutter_bloc/flutter_bloc.dart';

import '../api_provider.dart';
import 'country_model.dart';
import 'currency_state.dart';
import 'forms_status.dart';
import 'network_response.dart';


class CurrenciesCubit extends Cubit<CurrencyState> {
  CurrenciesCubit()
      : super(
          CurrencyState(
            formsStatus: FormsStatus.pure,
            statusText: "",
            currencies: [],
          ),
        ) {
    //fetchCurrencies();
  }

  fetchCurrencies() async {
    emit(state.copyWith(formsStatus: FormsStatus.loading));
    NetworkResponse response = await ApiProvider.getCurrencies();
    if (response.errorText.isEmpty) {
      emit(
        state.copyWith(
          currencies: response.data as List<CountryModel>,
          formsStatus: FormsStatus.success,
        ),
      );
    } else {
      emit(state.copyWith(
        statusText: response.errorText,
        formsStatus: FormsStatus.error,
      ));
    }
  }
}
