part of 'store_cubit.dart';

class StoreState extends Equatable {
  const StoreState({
    this.gettingCategoriesState = RequestState.initial,
    this.savingCategoryState = RequestState.initial,
  });
  final RequestState gettingCategoriesState;
  final RequestState savingCategoryState;

  @override
  List<Object> get props => [gettingCategoriesState, savingCategoryState];

  StoreState copyWith({
    RequestState? gettingCategoriesState,
    RequestState? savingCategoryState,
  }) =>
      StoreState(
        gettingCategoriesState:
            gettingCategoriesState ?? this.gettingCategoriesState,
        savingCategoryState: savingCategoryState ?? this.savingCategoryState,
      );
}

final class StoreInitial extends StoreState {}
