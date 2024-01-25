import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swift_buy_/cubits/shop_cubit/shop_state.dart';
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
}