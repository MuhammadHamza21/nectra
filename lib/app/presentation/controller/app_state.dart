part of 'app_cubit.dart';

class AppState extends Equatable {
  const AppState({
    this.onBoardingState = RequestState.initial,
    this.isDarkState = RequestState.initial,
    this.selectedLangState = RequestState.initial,
  });
  final RequestState onBoardingState;
  final RequestState isDarkState;
  final RequestState selectedLangState;

  @override
  List<Object> get props => [
        onBoardingState,
        isDarkState,
        selectedLangState,
      ];

  AppState copyWith(
          {RequestState? onBoardingState,
          RequestState? isDarkState,
          RequestState? selectedLangState}) =>
      AppState(
        onBoardingState: onBoardingState ?? this.onBoardingState,
        isDarkState: isDarkState ?? this.isDarkState,
        selectedLangState: selectedLangState ?? this.selectedLangState,
      );
}

final class AppInitial extends AppState {}
