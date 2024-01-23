import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swift_buy_/cubits/sign_cubit/sign_state.dart';
import 'package:swift_buy_/helper/dio_helper.dart';

import '../../helper/end_points.dart';

class ShopLoginCubit extends Cubit<ShopLoginState> {
  ShopLoginCubit() : super(ShopLoginInitialState());

  static ShopLoginCubit get(context) => BlocProvider.of(context);

  void userLogin({required String email, required String password}) {
    emit(ShopLoginLoadingState());
    DioHelper.postData(url: LOGIN, data: {
      "email": email,
      "password": password,
    }).then((value) {
      print(value);
      emit(ShopLoginSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(ShopLoginErrorState(error.toString()));
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
