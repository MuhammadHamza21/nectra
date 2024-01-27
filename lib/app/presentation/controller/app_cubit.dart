// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:nectar/app/domain/usecases/get_saved_data.dart';
import 'package:nectar/app/domain/usecases/save_data.dart';
import 'package:nectar/core/constants/app_constants.dart';
import 'package:nectar/core/utils/enums/enums.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  final SaveDataUsecase saveDataUsecase;
  final GetSavedDataUsecase getSavedDataUsecase;
  AppCubit(
    this.saveDataUsecase,
    this.getSavedDataUsecase,
  ) : super(AppInitial());
  static AppCubit get(context) => BlocProvider.of(context);
  bool isGoToOnBoarding = true;
  String onBoardingMessage = "";
  bool isDark = false;
  String isDarkMessage = "";
  String selectedLang = "";
  String selectedLangMessage = "";

  FutureOr<void> getOnBoarding() async {
    emit(state.copyWith(onBoardingState: RequestState.loading));
    var result = await getSavedDataUsecase(AppConstants.onBoarding);
    result.fold(
      (l) {
        onBoardingMessage = l.message;
        emit(state.copyWith(onBoardingState: RequestState.error));
      },
      (r) {
        isGoToOnBoarding = r ?? true;
        emit(state.copyWith(onBoardingState: RequestState.loaded));
      },
    );
  }

  FutureOr<void> saveOnBoarding() async {
    isGoToOnBoarding = false;
    emit(state.copyWith(onBoardingState: RequestState.loading));
    var result = await saveDataUsecase(SaveDataParams(
      key: AppConstants.onBoarding,
      value: isGoToOnBoarding,
    ));
    result.fold(
      (l) {
        onBoardingMessage = l.message;
        emit(state.copyWith(onBoardingState: RequestState.error));
      },
      (r) {
        emit(state.copyWith(onBoardingState: RequestState.loaded));
      },
    );
  }

  FutureOr<void> getSelectedLang() async {
    emit(state.copyWith(selectedLangState: RequestState.loading));
    var langResult = await getSavedDataUsecase(AppConstants.selectedLang);
    langResult.fold(
      (l) {
        selectedLangMessage = l.message;
        emit(state.copyWith(selectedLangState: RequestState.error));
      },
      (r) {
        selectedLang = r ?? "en";
        emit(state.copyWith(selectedLangState: RequestState.loaded));
      },
    );
  }

  FutureOr<void> saveSelectedLang(String lang) async {
    selectedLang = lang;
    emit(state.copyWith(selectedLangState: RequestState.loading));
    var result = await saveDataUsecase(
        SaveDataParams(key: AppConstants.selectedLang, value: selectedLang));
    result.fold(
      (l) {
        selectedLangMessage = l.message;
        emit(state.copyWith(selectedLangState: RequestState.error));
      },
      (r) {
        emit(state.copyWith(selectedLangState: RequestState.loaded));
      },
    );
  }

  FutureOr<void> getTheme() async {
    emit(state.copyWith(isDarkState: RequestState.loading));
    var result = await getSavedDataUsecase(AppConstants.theme);
    result.fold(
      (l) {
        isDarkMessage = l.message;
        emit(state.copyWith(isDarkState: RequestState.error));
      },
      (r) {
        isDark = r ?? false;
        emit(state.copyWith(isDarkState: RequestState.loaded));
      },
    );
  }

  FutureOr<void> changeTheme() async {
    isDark = !isDark;
    emit(state.copyWith(isDarkState: RequestState.loading));
    var result = await saveDataUsecase(
      SaveDataParams(key: AppConstants.theme, value: isDark),
    );
    result.fold(
      (l) {
        isDarkMessage = l.message;
        emit(state.copyWith(isDarkState: RequestState.error));
      },
      (r) {
        emit(state.copyWith(isDarkState: RequestState.loaded));
      },
    );
  }
}
