// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nectar/core/error/failures.dart';

import 'package:nectar/core/utils/enums/enums.dart';
import 'package:nectar/store/domain/entities/category.dart';
import 'package:nectar/store/domain/usecases/get_categories.dart';

part 'store_state.dart';

class StoreCubit extends Cubit<StoreState> {
  StoreCubit(
    this.getCategoriesUsecase,
  ) : super(StoreInitial());
  static StoreCubit get(BuildContext context) => BlocProvider.of(context);
  final GetCategoriesUsecase getCategoriesUsecase;

  List<Category> categoriesList = [];
  String categoriesMessage = '';

  FutureOr<void> getCategories({String parentId = "0"}) async {
    emit(state.copyWith(gettingCategoriesState: RequestState.loading));
    var result = await getCategoriesUsecase(parentId);
    result.fold(
      (l) {
        categoriesMessage = l.message;
        if (l is ServerFailure) {
          emit(state.copyWith(gettingCategoriesState: RequestState.error));
        } else if (l is OfflineFailure) {
          emit(state.copyWith(gettingCategoriesState: RequestState.offline));
        }
      },
      (r) {
        categoriesList = r;
        log(r.toString());
        emit(state.copyWith(gettingCategoriesState: RequestState.loaded));
      },
    );
  }
}
