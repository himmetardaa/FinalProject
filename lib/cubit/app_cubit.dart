import 'package:flutter_bloc/flutter_bloc.dart';
import 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit(AppState initialState) : super(initialState);

  changeLanguage({required String language}) {
    final newState = AppState(
      language: language,
      darkMode: state.darkMode,
    );

    emit(newState);
  }

  changeDarkMode({required bool darkMode}) {
    final newState = AppState(
      language: state.language,
      darkMode: darkMode,
    );
    emit(newState);
  }
}
