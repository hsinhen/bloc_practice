import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hen_bloc_practice/features/user/user_state.dart';

class UserFormCubit extends Cubit<UserForm> {
  UserFormCubit() : super(const UserForm());

  void updateName(String name) => emit(state.copyWith(name: name));
  void updateEmail(String email) => emit(state.copyWith(email: email));
  void updatePhone(String phone) => emit(state.copyWith(phone: phone));
  void updateAddress(String address) => emit(state.copyWith(address: address));
  void updateGender(String gender) => emit(state.copyWith(gender: gender));
}
