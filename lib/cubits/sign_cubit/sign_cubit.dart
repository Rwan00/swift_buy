import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../helper/dio_helper.dart';
import '../../helper/end_points.dart';
import '../../models/login_model.dart';
import '../../widgets/login_widget.dart';
import '../../widgets/register_widget.dart';
import 'sign_state.dart';

class ShopLoginCubit extends Cubit<ShopLoginState> {
  ShopLoginCubit() : super(ShopLoginInitialState());

  static ShopLoginCubit get(context) => BlocProvider.of(context);
  late ShopLoginModel loginModel;

  void userLogin({required String email, required String password}) {
    emit(ShopLoginLoadingState());
    DioHelper.postData(url: LOGIN, data: {
      "email": email,
      "password": password,
    }).then((value) {
      loginModel = ShopLoginModel.fromJson(value.data);
      print(loginModel.status);
      print(loginModel.message);
      print(loginModel.data?.token);
      print(value);
      emit(ShopLoginSuccessState(loginModel));
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

  String form = "Login";

  Widget renderWidget() {
    return form == "Login"
        ? LoginWidget(
      onPressed: updateWidget,
    )
        : RegisterWidget(
      onPressed: updateWidget,
    );
  }

  void updateWidget() {
    form = form == "Login" ? "Register" : "Login";
    emit(ShopUpdateWidgets());
  }
}
