import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swift_buy/models/login_model.dart';

import '../../helper/dio_helper.dart';
import '../../helper/end_points.dart';
import '../../models/categories_model.dart';
import '../../models/category_details_model.dart';
import '../../models/favorites_model.dart';
import '../../models/get_fav_model.dart';
import '../../models/home_model.dart';
import '../../screens/favourites_screen.dart';
import '../../screens/home_screen.dart';
import '../../screens/notification_screen.dart';
import '../../screens/profile_screen.dart';
import 'shop_state.dart';

class ShopCubit extends Cubit<ShopStates> {
  ShopCubit() : super(ShopInitialState());
  static ShopCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Map<String, dynamic>> bottomScreen = [
    {
      "page": const HomeScreen(),
      "title": "Explore",
    },
    {
      "page": const FavouriteScreen(),
      "title": "Favourite",
    },
    {
      "page": const NotificationScreen(),
      "title": "Notifications",
    },
    {
      "page": const ProfileScreen(),
      "title": "My Profile",
    },
  ];

  final scaffoldKey = GlobalKey<ScaffoldState>();

  void changeBottom(int index) {
    currentIndex = index;
    emit(ShopChangeBottomNavState());
  }

  List<BottomNavigationBarItem> bottomItems = const [
    BottomNavigationBarItem(
        icon: Icon(
          Icons.home_outlined,
          size: 26,
        ),
        label: ''),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.favorite_border,
          size: 26,
        ),
        label: ''),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.notifications_none_outlined,
          size: 26,
        ),
        label: ''),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.person_outline_sharp,
          size: 26,
        ),
        label: ''),
  ];

  HomeModel? homeModel;
  Map<int, bool> favorites = {};
  bool allFalse = true;

  void getHomeData() {
    emit(ShopLoadingHomeDataState());
    DioHelper.getData(
      url: HOME,
      token: token,
    ).then((value) {
      homeModel = HomeModel.fromJson(value.data);
      // print(homeModel?.data.banners[0].image);
      // print(homeModel?.status);

      homeModel?.data.products.forEach((element) {
        favorites.addAll({element.id: element.isFav});
      });
      // print(favorites.toString());
      for (var value in favorites.values) {
        if (value != false) {
          allFalse = false;
          break;
        } else {
          allFalse = true;
        }
      }
      emit(ShopSuccessHomeDataState());
    }).catchError((error) {
      print(error.toString());
      emit(ShopErrorHomeDataState());
    });
  }

  CategoriesModel? categoriesModel;
  void getCategoriesData() {
    emit(ShopLoadingCategoriesState());
    DioHelper.getData(
            url:  CATEGORIES , token: token)
        .then((value) {
      categoriesModel = CategoriesModel.fromJson(value.data);
      // print(categoriesModel?.data.dataModel);
      emit(ShopSuccessCategoriesState());
    }).catchError((error) {
      print(error);
      emit(ShopErrorCategoriesState());
    });
  }

  GetCatDetailsModel? categoriesDetailsModel;
  void getCategoriesDetailsData(int id) {
    emit(ShopLoadingCategoriesDetailsState());
    DioHelper.getData(
            url:  "$CATEGORIES/$id" , token: token)
        .then((value) {
      categoriesDetailsModel = GetCatDetailsModel.fromJson(value.data);
      // print(categoriesModel?.data.dataModel);
      emit(ShopSuccessCategoriesDetailsState());
    }).catchError((error) {
      print(error);
      emit(ShopErrorCategoriesDetailsState());
    });
  }

  ChangeFavoritesModel? favModel;
  void changeFavourites(int productId) {
    favorites[productId] = !favorites[productId]!;

    emit(ShopSuccessFavouriteState());
    DioHelper.postData(
      url: FAVORITES,
      data: {
        "product_id": productId,
      },
      token: token,
    ).then((value) {
      favModel = ChangeFavoritesModel.fromJson(value.data);
      // print(value.data);
      if (!favModel!.status) {
        favorites[productId] = !favorites[productId]!;
      } else {
        getFavData();
      }
      for (var value in favorites.values) {
        if (value != false) {
          allFalse = false;
          break;
        } else {
          allFalse = true;
        }
      }
      emit(ShopSuccessChangeFavouritesState(favModel: favModel!));
    }).catchError((error) {
      favorites[productId] = !favorites[productId]!;
      print(error.toString());
      emit(ShopErrorChangeFavouritesState());
    });
  }

  GetFavModel? getFavModel;

  void getFavData() {
    emit(ShopLoadingGetFavState());
    DioHelper.getData(url: FAVORITES, token: token).then((value) {
      getFavModel = GetFavModel.fromJson(value.data);

      emit(ShopSuccessGetFavState());
    }).catchError((error) {
      print(error);
      emit(ShopErrorGetFavState());
    });
  }

  ShopLoginModel? userModel;

  void getUserData() {
    emit(ShopLoadingUserDataState());
    DioHelper.getData(url: PROFILE, token: token).then((value) {
      userModel = ShopLoginModel.fromJson(value.data);
      print("UserName = ${userModel?.data?.name}");
      emit(ShopSuccessUserDataState(userModel: userModel!));
    }).catchError((error) {
      print("UserName = ${userModel?.status}");
      print(error);
      emit(ShopErrorUserDataState());
    });
  }

  void updateUserData({
    required String name,
    required String email,
    required String phone,
  }) {
    emit(ShopLoadingUpdateUserState());
    DioHelper.putData(
      url: UPDATE_PROFILE,
      token: token,
      data: {
        "name": name,
        "email": email,
        "phone": phone,
      },
    ).then((value) {
      userModel = ShopLoginModel.fromJson(value.data);
      print("UserName = ${userModel?.data?.name}");
      emit(ShopSuccessUpdateUserState(userModel: userModel!));
    }).catchError((error) {
      print("UserName = ${userModel?.status}");
      print(error);
      emit(ShopErrorUpdateUserState());
    });
  }



  bool visible = true;

  void changeVisibility() {
    visible = !visible;
    emit(ShopChangeVisibilityState());
  }

  bool isTapped = false;
  double angle = 0;
  void rotate() {
    isTapped = !isTapped;
    angle = isTapped ? 4.71238898038469 : 0;
    emit(ShopRotateState());
  }

  bool flag = true;
  void readMore() {
    flag = !flag;
    emit(ShopReadMoreState());
  }
}
