import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../helper/dio_helper.dart';
import '../../helper/end_points.dart';

import '../../models/login_model.dart';

import 'register_state.dart';


class ShopRegisterCubit extends Cubit<ShopRegisterState> {
  ShopRegisterCubit() : super(ShopRegisterInitialState());

  static ShopRegisterCubit get(context) => BlocProvider.of(context);
  late ShopLoginModel loginModel;

  void userRegister({
    required String email,
     required String password,
     required String name,
     required String phone,
     }) {
    emit(ShopRegisterLoadingState());
    DioHelper.postData(url: REGISTER, data: {
      "email": email,
      "password": password,
      "name" : name,
      "phone" : phone,
    }).then((value) {
      loginModel = ShopLoginModel.fromJson(value.data);
      print(loginModel.status);
      print(loginModel.message);
      print(loginModel.data?.token);
      print(value);
      emit(ShopRegisterSuccessState(loginModel));
    }).catchError((error){
      print(error.toString());
      emit(ShopRegisterErrorState(error.toString()));
    });
  }

  Widget icon = const Icon(Icons.remove_red_eye_outlined);
  bool showPwd = false;

  void changePasswordVisibility(){
    showPwd = !showPwd;
    icon = showPwd ? const Icon(Icons.visibility_off_outlined) : const Icon(Icons.visibility_outlined);
    emit(ShopChangePasswordVisibility());
  }

  
}
