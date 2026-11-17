import 'package:bookai_store/features/auth/data/model/auth_params.dart';
import 'package:bookai_store/features/auth/data/repo/auth_repo.dart';
import 'package:bookai_store/features/auth/presentation/cubit/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthCubitInitial());
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  Future<void> login() async {
    emit(AuthCubitLoading());
    var response = await AuthRepo.login(
      AuthParams(
        email: emailController.text,
        password: passwordController.text,
      ),
    );
    if (response != null) {
      emit(AuthCubitSuccess());
    } else {
      emit(AuthCubitError("Invalid Credentials"));
    }
  }

  Future<void> register() async {
    emit(AuthCubitLoading());
    var response = await AuthRepo.register(
      AuthParams(
        name: nameController.text,
        email: emailController.text,
        password: passwordController.text,
        passwordConfirmation: confirmPasswordController.text,
      ),
    );
    if (response != null) {
      emit(AuthCubitSuccess());
    } else {
      emit(AuthCubitError("Invalid Credentials"));
    }
  }
}
