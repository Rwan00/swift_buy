import 'package:swift_buy_/models/favorites_model.dart';

abstract class ShopStates{}

class ShopInitialState extends ShopStates{}
class ShopChangeBottomNavState extends ShopStates{}

class ShopLoadingHomeDataState extends ShopStates{}
class ShopSuccessHomeDataState extends ShopStates{}
class ShopErrorHomeDataState extends ShopStates{}

class ShopSuccessCategoriesState extends ShopStates{}
class ShopErrorCategoriesState extends ShopStates{}

class ShopSuccessGetFavState extends ShopStates{}
class ShopErrorGetFavState extends ShopStates{}



class ShopSuccessChangeFavouritesState extends ShopStates{
  final ChangeFavoritesModel favModel;
  ShopSuccessChangeFavouritesState({required this.favModel});
}
class ShopErrorChangeFavouritesState extends ShopStates{}

class ShopSuccessFavouriteState extends ShopStates{}

class ShopChangeVisibilityState extends ShopStates{}

class ShopRotateState extends ShopStates{}