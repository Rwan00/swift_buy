import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


import 'cubits/bloc_observer.dart';
import 'cubits/shop_cubit/shop_cubit.dart';
import 'cubits/shop_cubit/shop_state.dart';
import 'helper/cache_helper.dart';
import 'helper/dio_helper.dart';
import 'helper/end_points.dart';
import 'screens/on_boarding.dart';
import 'screens/shop_layout.dart';
import 'screens/sign_screen.dart';
import 'theme/body_theme.dart';
import 'widgets/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  bool onBoarding = CacheHelper.getData(key: "onBoarding") ?? false;
  print(token);
  Widget widget;

  if (onBoarding) {
    token = CacheHelper.getData(key: "token");
    print(token);
     widget = token != null ? const ShopLayout() : const SignScreen();
  } else {
    widget = const OnBoardingScreen();
  }
  runApp( ProviderScope(
    child: MyApp(
      startWidget: widget,
    ),
  ));
}

class MyApp extends StatelessWidget {
  final Widget? startWidget;
  const MyApp({this.startWidget, super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShopCubit()..getHomeData()..getCategoriesData(),
      child: BlocConsumer<ShopCubit, ShopStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: BodyTheme.light,
            home: splashScreen(startWidget),
          );
        },
      ),
    );
  }
}
