// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'authentication_cubit.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

final class AuthenticationInitial extends AuthenticationState {}

final class SignInWithEmailAndPasswordLoadingState
    extends AuthenticationState {}

final class SignInWithEmailAndPasswordOfflineState
    extends AuthenticationState {}

final class SignInWithEmailAndPasswordSuccessState
    extends AuthenticationState {}

final class SignInWithEmailAndPasswordErrorState extends AuthenticationState {}

final class CreateUserWithEmailAndPasswordLoadingState
    extends AuthenticationState {}

final class CreateUserWithEmailAndPasswordOfflineState
    extends AuthenticationState {}

final class CreateUserWithEmailAndPasswordSuccessState
    extends AuthenticationState {}

final class CreateUserWithEmailAndPasswordErrorState
    extends AuthenticationState {}

final class VerifyPhoneNumberSuccessState extends AuthenticationState {}

final class VerifyPhoneNumberLoadingState extends AuthenticationState {}

final class VerifyPhoneNumberOfflineState extends AuthenticationState {}

final class VerifyCodeSuccessState extends AuthenticationState {}

final class VerifyCodeLoadingState extends AuthenticationState {}

final class VerifyCodeOfflineState extends AuthenticationState {}

final class VerifyCodeErrorState extends AuthenticationState {}

final class SaveUserDataSuccessState extends AuthenticationState {}

final class SaveUserDataErrorState extends AuthenticationState {}

final class SaveUserDataLoadingState extends AuthenticationState {}

final class SaveUserDataOfflineState extends AuthenticationState {}

final class SignOutSuccessState extends AuthenticationState {}

final class SignOutErrorState extends AuthenticationState {}

final class SignOutOfflineState extends AuthenticationState {}

final class SignOutLoadingState extends AuthenticationState {}
