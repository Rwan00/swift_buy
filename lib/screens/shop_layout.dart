import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../cubits/shop_cubit/shop_cubit.dart';
import '../cubits/shop_cubit/shop_state.dart';
import '../helper/end_points.dart';
import '../theme/body_theme.dart';


class ShopLayout extends StatelessWidget {
  const ShopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    print(token);
    return BlocProvider(
      create: (context) => ShopCubit()..getHomeData()..getCategoriesData()..getFavData(),
      child: BlocConsumer<ShopCubit, ShopStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = ShopCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                "Explore",
              ),
              actions: const [
                Padding(
                  padding: EdgeInsets.all(10.0),

                ),
              ],
              leading: Padding(
                padding: const EdgeInsets.all(12.0),
                child:  SvgPicture.asset(
                  "assets/images/drawer.svg",
                  height: 18,
                  width: 25,
                  colorFilter:  ColorFilter.mode(
                      sPurple, BlendMode.srcATop),
                ),
              ),
            ),
            body: cubit.bottomScreen[cubit.currentIndex],
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: FloatingActionButton(
              backgroundColor: primaryDeepPurple,
              onPressed: () {},
              child: const Icon(Icons.shopping_bag_outlined),
            ),
            bottomNavigationBar: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30), topLeft: Radius.circular(30)),
                boxShadow: [
                  BoxShadow(color: Colors.black12, spreadRadius: 0, blurRadius: 10),
                ],
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
                child: BottomAppBar(
                  padding: EdgeInsets.all(8),
                  clipBehavior: Clip.hardEdge,
                  shape: const CircularNotchedRectangle(),
                  notchMargin: 8,
                  child: BottomNavigationBar(
                    currentIndex: cubit.currentIndex,
                    onTap: (index) {
                      cubit.changeBottom(index);
                    },
                    elevation: 0,
                    items: cubit.bottomItems,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
