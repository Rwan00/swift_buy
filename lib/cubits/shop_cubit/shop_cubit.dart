

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swift_buy_/cubits/shop_cubit/shop_state.dart';
import 'package:swift_buy_/helper/dio_helper.dart';
import 'package:swift_buy_/helper/end_points.dart';
import 'package:swift_buy_/models/home_model.dart';
import 'package:swift_buy_/screens/favourites_screen.dart';
import 'package:swift_buy_/screens/home_screen.dart';
import 'package:swift_buy_/screens/notification_screen.dart';
import 'package:swift_buy_/screens/profile_screen.dart';

import '../../models/categories_model.dart';
import '../../models/favorites_model.dart';

class ShopCubit extends Cubit<ShopStates>{
  ShopCubit():super(ShopInitialState());
  static ShopCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> bottomScreen = [
    const HomeScreen(),
    const FavouriteScreen(),
    const NotificationScreen(),
    const ProfileScreen(),
  ];



  void changeBottom(int index){
    currentIndex = index;
    emit(ShopChangeBottomNavState());
  }

  List<BottomNavigationBarItem> bottomItems = const [
    BottomNavigationBarItem(
        icon: Icon(
          Icons.home_outlined,
          size: 24,
        ),
        label: ''),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.favorite_border,
          size: 24,
        ),
        label: ''),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.notifications_none_outlined,
          size: 24,
        ),
        label: ''),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.person_outline_sharp,
          size: 24,
        ),
        label: ''),
  ];


  HomeModel? homeModel;
  Map<int,bool> favorites = {};

  void getHomeData(){

    emit(ShopLoadingHomeDataState());
    DioHelper.getData(
        url: HOME,
      token: token,
    ).then((value) {
      homeModel = HomeModel.fromJson(value.data);
      print(homeModel?.data.banners[0].image);
      print(homeModel?.status);

      homeModel?.data.products.forEach((element) {
        favorites.addAll({
          element.id:element.isFav
        });
      });
      print(favorites.toString());
      emit(ShopSuccessHomeDataState());
    }).catchError((error){
      print(error.toString());
      emit(ShopErrorHomeDataState());
    });
  }

  CategoriesModel? categoriesModel;
  void getCategoriesData(){
    DioHelper.getData(
        url: CATEGORIES,
      token: token
    ).then((value) {
      categoriesModel = CategoriesModel.fromJson(value.data);
      print(categoriesModel?.data.dataModel);
      emit(ShopSuccessCategoriesState());
    }).catchError((error){
      print(error);
      emit(ShopErrorCategoriesState());
    });
  }


  ChangeFavoritesModel? favModel;
  void changeFavourites(int productId){
    favorites[productId] = !favorites[productId]!;
    emit(ShopSuccessFavouriteState());
    DioHelper.postData(
        url: FAVORITES,
        data: {
          "product_id":productId,
        },
      token: token,
    ).then((value) {
      favModel = ChangeFavoritesModel.fromJson(value.data);
      print(value.data);
      if(!favModel!.status){
        favorites[productId] = !favorites[productId]!;
      }
      emit(ShopSuccessChangeFavouritesState(favModel: favModel!));
    }).catchError((error){
      favorites[productId] = !favorites[productId]!;
      print(error.toString());
      emit(ShopErrorChangeFavouritesState());
    });
  }

  bool visible = true;

  void changeVisibility(){
    visible = !visible;
    emit(ShopChangeVisibilityState());
  }


  bool isTapped = false;
  double angle =  0;
  void rotate(){
    isTapped = !isTapped;
    angle = isTapped ?4.71238898038469: 0;
    emit(ShopRotateState());
  }
}