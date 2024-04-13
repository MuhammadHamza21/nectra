part of 'app_cubit.dart';

class AppState extends Equatable {
  const AppState({
    this.onBoardingState = RequestState.initial,
    this.isDarkState = RequestState.initial,
    this.selectedLangState = RequestState.initial,
    this.changingCurrentIndex = RequestState.initial,
  });
  final RequestState onBoardingState;
  final RequestState isDarkState;
  final RequestState selectedLangState;
  final RequestState changingCurrentIndex;

  @override
  List<Object> get props => [
        onBoardingState,
        isDarkState,
        selectedLangState,
        changingCurrentIndex,
      ];

  AppState copyWith({
    RequestState? onBoardingState,
    RequestState? isDarkState,
    RequestState? selectedLangState,
    RequestState? changingCurrentIndex,
  }) =>
      AppState(
        onBoardingState: onBoardingState ?? this.onBoardingState,
        isDarkState: isDarkState ?? this.isDarkState,
        selectedLangState: selectedLangState ?? this.selectedLangState,
        changingCurrentIndex: changingCurrentIndex ?? this.changingCurrentIndex,
      );
}

final class AppInitial extends AppState {}
