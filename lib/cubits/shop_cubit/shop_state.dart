import 'package:swift_buy/models/login_model.dart';

import '../../models/favorites_model.dart';

abstract class ShopStates {}

class ShopInitialState extends ShopStates {}

class ShopChangeBottomNavState extends ShopStates {}

class ShopLoadingHomeDataState extends ShopStates {}

class ShopSuccessHomeDataState extends ShopStates {}

class ShopErrorHomeDataState extends ShopStates {}

class ShopSuccessCategoriesState extends ShopStates {}
class ShopLoadingCategoriesState extends ShopStates {}

class ShopErrorCategoriesState extends ShopStates {}

class ShopSuccessCategoriesDetailsState extends ShopStates {}
class ShopLoadingCategoriesDetailsState extends ShopStates {}

class ShopErrorCategoriesDetailsState extends ShopStates {}

class ShopSuccessGetFavState extends ShopStates {}

class ShopLoadingGetFavState extends ShopStates {}

class ShopErrorGetFavState extends ShopStates {}

class ShopSuccessUserDataState extends ShopStates {
  final ShopLoginModel userModel;

  ShopSuccessUserDataState({required this.userModel});
  
}

class ShopLoadingUserDataState extends ShopStates {}

class ShopErrorUserDataState extends ShopStates {}

class ShopSuccessUpdateUserState extends ShopStates {
  final ShopLoginModel userModel;

  ShopSuccessUpdateUserState({required this.userModel});
  
}

class ShopLoadingUpdateUserState extends ShopStates {}

class ShopErrorUpdateUserState extends ShopStates {}

class ShopSuccessChangeFavouritesState extends ShopStates {
  final ChangeFavoritesModel favModel;
  ShopSuccessChangeFavouritesState({required this.favModel});
}

class ShopErrorChangeFavouritesState extends ShopStates {}

class ShopSuccessFavouriteState extends ShopStates {}

class ShopChangeVisibilityState extends ShopStates {}

class ShopRotateState extends ShopStates {}

class ShopReadMoreState extends ShopStates{}
