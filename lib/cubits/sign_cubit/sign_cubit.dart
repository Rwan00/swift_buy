import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swift_buy_/cubits/sign_cubit/sign_state.dart';
import 'package:swift_buy_/helper/dio_helper.dart';

import '../../helper/end_points.dart';

class ShopLoginCubit extends Cubit<ShopLogingState> {
  ShopLoginCubit() : super(ShopLogingInitialState());

  static ShopLoginCubit get(context) => BlocProvider.of(context);

  void userLogin({required String email, required String password}) {
    emit(ShopLogingLoadingState());
    DioHelper.postData(url: LOGIN, data: {
      "email": email,
      "password": password,
    }).then((value) {
      print(value);
      emit(ShopLogingSuccessState());
    }).catchError((error){
      emit(ShopLogingErrorState(error.toString()));
    });
  }
}
