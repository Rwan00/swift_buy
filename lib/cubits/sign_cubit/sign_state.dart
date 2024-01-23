abstract class ShopLoginState {}

class ShopLoginInitialState extends ShopLoginState {}

class ShopLoginLoadingState extends ShopLoginState {}

class ShopLoginSuccessState extends ShopLoginState {}

class ShopLoginErrorState extends ShopLoginState {
  final String error;
 ShopLoginErrorState(this.error);
}

class ShopChangePasswordVisibility extends ShopLoginState{}
