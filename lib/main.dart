import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swift_buy_/cubits/shop_cubit/shop_cubit.dart';
import 'package:swift_buy_/cubits/shop_cubit/shop_state.dart';
import 'package:swift_buy_/cubits/sign_cubit/sign_cubit.dart';
import 'package:swift_buy_/cubits/sign_cubit/sign_state.dart';
import 'package:swift_buy_/helper/cache_helper.dart';
import 'package:swift_buy_/models/onboarding_model.dart';
import 'package:swift_buy_/screens/shop_layout.dart';
import 'package:swift_buy_/screens/on_boarding.dart';
import 'package:swift_buy_/screens/sign_screen.dart';
import 'cubits/bloc_observer.dart';
import 'helper/dio_helper.dart';
import 'theme/body_theme.dart';
import 'widgets/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  bool onBoarding = CacheHelper.getData(key: "onBoarding") ?? false;
  String? token = CacheHelper.getData(key: "token");
  Widget widget;

  if (onBoarding) {
    widget = token != null ? const ShopLayout() : const SignScreen();
  } else {
    widget = const OnBoardingScreen();
  }
  runApp(MyApp(
    startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {
  final Widget? startWidget;
  const MyApp({this.startWidget, super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShopCubit(),
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
