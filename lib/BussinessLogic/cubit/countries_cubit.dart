import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafil/BussinessLogic/cubit/countries_state.dart';
import 'package:kafil/Models/countryModel.dart';
import 'package:kafil/Repositery/CountryRepositery.dart';

class CountryCubit extends Cubit<CountryState> {
  CountryCubit() : super(CountryState(countries: [], currentPage: 1, totalPages: 1, isLoading: false));

  void getCountries({int? page}) async {
    try {
      emit(state.copyWith(isLoading: true));

      final data = await CountryRepository().getCountries(currentPage: page ?? state.currentPage);
      final List<CountryModel> countries = data['data'].map<CountryModel>((item) => CountryModel.fromJson(item)).toList();
      final pagination = data['pagination'];

      emit(state.copyWith(
        countries: countries,
        currentPage: pagination['currentPage'],
        totalPages: pagination['totalPages'],
      ));
    } catch (e) {
      // Handle error if needed
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }
}
