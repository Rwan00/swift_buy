import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swift_buy_/cubits/shop_cubit/shop_cubit.dart';
import 'package:swift_buy_/cubits/shop_cubit/shop_state.dart';
import 'package:swift_buy_/theme/body_theme.dart';

class ShopLayout extends StatelessWidget {
  const ShopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = ShopCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              "Explore",
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: 50,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.shopping_bag_outlined,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
            leading: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                  width: 70,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: Center(
                      child: Icon(
                    Icons.menu_open_outlined,
                    color: primaryDeepPurple,
                    size: 26,
                  ))),
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
          bottomNavigationBar: BottomAppBar(
            clipBehavior: Clip.hardEdge,
            shape: const CircularNotchedRectangle(),
            notchMargin: 10,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: BottomNavigationBar(
                currentIndex: cubit.currentIndex,
                onTap: (index) {
                  cubit.changeBottom(index);
                },
                elevation: 0,
                items:  cubit.bottomItems,
              ),
            ),
          ),
        );
      },
    );
  }
}
