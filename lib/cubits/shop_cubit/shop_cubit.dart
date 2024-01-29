

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

  void getHomeData(){

    emit(ShopLoadingHomeDataState());
    DioHelper.getData(
        url: HOME,
      token: token,
    ).then((value) {
      homeModel = HomeModel.fromJson(value.data);
      print(homeModel?.data.banners[0].image);
      print(homeModel?.status);
      emit(ShopSuccessHomeDataState());
    }).catchError((error){
      print(error.toString());
      emit(ShopErrorHomeDataState());
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