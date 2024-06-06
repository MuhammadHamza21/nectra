part of 'store_cubit.dart';

class StoreState extends Equatable {
  const StoreState({
    this.gettingCategoriesState = RequestState.initial,
  });
  final RequestState gettingCategoriesState;

  @override
  List<Object> get props => [gettingCategoriesState];

  StoreState copyWith({RequestState? gettingCategoriesState}) => StoreState(
        gettingCategoriesState:
            gettingCategoriesState ?? this.gettingCategoriesState,
      );
}

final class StoreInitial extends StoreState {}
