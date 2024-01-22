abstract class ShopLogingState {}

class ShopLogingInitialState extends ShopLogingState {}

class ShopLogingLoadingState extends ShopLogingState {}

class ShopLogingSuccessState extends ShopLogingState {}

class ShopLogingErrorState extends ShopLogingState {
  final String error;
 ShopLogingErrorState(this.error);
}
