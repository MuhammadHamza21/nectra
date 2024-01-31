// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:nectar/authentication/domain/usecases/create_user_with_email_and_password.dart';
import 'package:nectar/authentication/domain/usecases/gt_current_user.dart';
import 'package:nectar/authentication/domain/usecases/sign_in_with_email_and_password.dart';
import 'package:nectar/core/error/failures.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit(
    this.signInWithEmailAndPasswordUsecase,
    this.createUserWithEmailAndPasswordUsecase,
    this.getCurrentUserUsecase,
  ) : super(AuthenticationInitial());
  final SignInWithEmailAndPasswordUsecase signInWithEmailAndPasswordUsecase;
  final CreateUserWithEmailAndPasswordUsecase
      createUserWithEmailAndPasswordUsecase;
  final GetCurrentUserUsecase getCurrentUserUsecase;
  static AuthenticationCubit get(BuildContext context) =>
      BlocProvider.of(context);

  UserCredential? userCredentials;
  String userCredentialsMessage = '';
  User? user;

  FutureOr<void> signInWithEmailAndPassword(SignInParams params) async {
    emit(SignInWithEmailAndPasswordLoadingState());
    var result = await signInWithEmailAndPasswordUsecase(params);
    result.fold(
      (l) {
        userCredentialsMessage = l.message;
        if (l is OfflineFailure) {
          emit(SignInWithEmailAndPasswordOfflineState());
        } else if (l is ServerFailure) {
          emit(SignInWithEmailAndPasswordErrorState());
        }
      },
      (r) {
        userCredentials = r;
        print(userCredentials!.user!.displayName);
        emit(SignInWithEmailAndPasswordSuccessState());
      },
    );
  }

  FutureOr<void> createUserWithEmailAndPassword(CreateUserParams params) async {
    emit(CreateUserWithEmailAndPasswordLoadingState());
    var result = await createUserWithEmailAndPasswordUsecase(params);
    result.fold(
      (l) {
        userCredentialsMessage = l.message;
        if (l is OfflineFailure) {
          emit(CreateUserWithEmailAndPasswordOfflineState());
        } else if (l is ServerFailure) {
          emit(CreateUserWithEmailAndPasswordErrorState());
        }
      },
      (r) {
        userCredentials = r;
        emit(CreateUserWithEmailAndPasswordSuccessState());
      },
    );
  }

  void getCurrentUser() {
    user = getCurrentUserUsecase.call();
  }
}
