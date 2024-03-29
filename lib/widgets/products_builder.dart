import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import 'package:swift_buy/screens/search_screen.dart';
import 'package:swift_buy/theme/fonts.dart';

import '../cubits/shop_cubit/shop_cubit.dart';
import '../cubits/shop_cubit/shop_state.dart';
import '../methods/methods.dart';
import '../models/home_model.dart';
import '../screens/product_details.dart';
import '../theme/body_theme.dart';
import 'bottom_sheet_body.dart';
import 'product_item.dart';

class ProductsBuilder extends StatelessWidget {
  final HomeModel model;

  const ProductsBuilder({required this.model, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(listener: (context, state) {
      if (state is ShopSuccessChangeFavouritesState) {
        if (!state.favModel.status) {
          buildSnackBar(
            context: context,
            text: state.favModel.message,
            clr: const Color.fromARGB(255, 92, 1, 1),
          );
        } else {
          buildSnackBar(
              context: context,
              text: state.favModel.message,
              clr: primaryDeepPurple);
        }
      }
    }, builder: (context, state) {
      var cubit = ShopCubit.get(context);
      return Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "Hello,${cubit.userModel!.data!.name}!",
                    style: heading.copyWith(fontSize: 24),
                  ),
                ),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AnimatedOpacity(
                    opacity: (cubit.visible == true ? 0 : 1),
                    duration: const Duration(seconds: 2),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: GestureDetector(
                            onTap: () {
                              animatedNavigateTo(
                                context: context,
                                widget: const SearchScreen(),
                                direction: PageTransitionType.bottomToTop,
                                curve: Curves.linear,
                              );
                            },
                            child: CircleAvatar(
                              backgroundColor: primaryDeepPurple,
                              radius: 16,
                              child: const Center(
                                child: Icon(
                                  Icons.search,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                  backgroundColor: Colors.grey[300],
                                  context: context,
                                  builder: (context) {
                                    return const BottomSheetBody();
                                  });
                            },
                            child: CircleAvatar(
                              backgroundColor: primaryDeepPurple,
                              radius: 16,
                              child: const Center(
                                child: Icon(
                                  Icons.category_outlined,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      cubit.changeVisibility();
                      cubit.rotate();
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: TweenAnimationBuilder<double>(
                        curve: Curves.easeInCubic,
                        duration: const Duration(seconds: 1),
                        tween: Tween(begin: 0, end: cubit.angle),
                        builder: (_, angle, child) => Transform.rotate(
                          angle: angle,
                          child: child,
                        ),
                        child: CircleAvatar(
                          backgroundColor: primaryDeepPurple,
                          radius: 16,
                          child: const Center(
                            child: Icon(
                              Icons.more_vert,
                              color: Colors.white,
                              size: 24,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
          CarouselSlider(
            items: model.data.banners.map((element) {
              return SizedBox(
                width: double.infinity,
                //margin: const EdgeInsets.symmetric(horizontal: 10),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                  child: FadeInImage(
                    placeholder: const AssetImage("assets/images/sign.jpg"),
                    image: NetworkImage(
                      element.image,
                    ),
                  ),
                ),
              );
            }).toList(),
            options: CarouselOptions(
                height: 200,
                initialPage: 0,
                enlargeCenterPage: true,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 4),
                autoPlayCurve: Curves.easeInOutBack),
          ),
          const SizedBox(
            height: 32,
          ),
          Expanded(
            child: GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 210,
                  childAspectRatio: 0.61,
                  crossAxisSpacing: 0.6,
                  mainAxisSpacing: 0.6,
                ),
                physics: const BouncingScrollPhysics(),
                itemCount: model.data.products.length,
                itemBuilder: (ctx, index) {
                  return GestureDetector(
                    onTap: () {
                      animatedNavigateTo(
                        context: ctx,
                        widget: ProductDetails(
                          model: model.data.products[index],
                          isFav:
                              cubit.favorites[model.data.products[index].id]!,
                        ),
                        direction: PageTransitionType.leftToRight,
                        curve: Curves.easeInExpo,
                      );
                    },
                    child: ProductItem(
                      model: model.data.products[index],
                      isFav: cubit.favorites[model.data.products[index].id]!,
                    ),
                  );
                }),
          ),
        ],
      );
    });
  }
}
