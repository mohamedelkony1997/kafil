import 'package:kafil/Models/countryModel.dart';

class CountryState {
  final List<CountryModel> countries;
  final int currentPage;
  final int totalPages;
  final bool isLoading;

  CountryState({
    required this.countries,
    required this.currentPage,
    required this.totalPages,
    required this.isLoading,
  });

  CountryState copyWith({
    List<CountryModel>? countries,
    int? currentPage,
    int? totalPages,
    bool? isLoading,
  }) {
    return CountryState(
      countries: countries ?? this.countries,
      currentPage: currentPage ?? this.currentPage,
      totalPages: totalPages ?? this.totalPages,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
