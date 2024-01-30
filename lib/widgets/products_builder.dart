import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swift_buy_/cubits/shop_cubit/shop_cubit.dart';
import 'package:swift_buy_/cubits/shop_cubit/shop_state.dart';
import 'package:swift_buy_/models/home_model.dart';
import 'package:swift_buy_/theme/body_theme.dart';
import 'package:swift_buy_/theme/fonts.dart';
import 'package:swift_buy_/widgets/divide.dart';

import 'bottom_sheet_body.dart';

class ProductsBuilder extends StatelessWidget {
  final HomeModel model;

  const ProductsBuilder({required this.model, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = ShopCubit.get(context);
          return Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CarouselSlider(
                items: model.data.banners.map((element) {
                  return SizedBox(
                    width: double.infinity,
                    //margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(30)),
                      child: FadeInImage(
                          placeholder:
                              const AssetImage("assets/images/sign.jpg"),
                          image: NetworkImage(
                            element.image,
                          )),
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
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    AnimatedOpacity(
                      opacity: (cubit.visible == true ? 0 : 1),
                      duration: const Duration(seconds: 2),
                      child: Row(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: CircleAvatar(
                              backgroundColor: primaryDeepPurple,
                              radius: 22,
                              child: const Center(
                                child: Icon(
                                  Icons.search,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: GestureDetector(
                              onTap: () {
                                showModalBottomSheet(
                                    context: context,
                                    builder: (context) {
                                      return BottomSheetBody();
                                    });
                              },
                              child: CircleAvatar(
                                backgroundColor: primaryDeepPurple,
                                radius: 22,
                                child: const Center(
                                  child: Icon(
                                    Icons.category_outlined,
                                    color: Colors.white,
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
                            radius: 25,
                            child: const Center(
                              child: Icon(
                                Icons.more_vert,
                                color: Colors.white,
                                size: 35,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: GridView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 210,
                      childAspectRatio: 0.6,
                      crossAxisSpacing: 1,
                      mainAxisSpacing: 2,
                    ),
                    physics: const BouncingScrollPhysics(),
                    itemCount: model.data.products.length,
                    itemBuilder: (ctx, index) {
                      return Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 25,
                                  width: 50,
                                  decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(70),
                                        bottomRight: Radius.circular(70),
                                      ),
                                      color: primaryDeepPurple),
                                  child: Center(
                                    child: Text(
                                      "-${model.data.products[index].discount}%",
                                      style: titleStyle.copyWith(
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: SizedBox(
                                    height: 87,
                                    width: 137,
                                    child: FadeInImage(
                                      placeholder: const AssetImage(
                                          "assets/images/sign.jpg"),
                                      image: NetworkImage(
                                        model.data.products[index].image,
                                      ),
                                    ),
                                  ),
                                ),
                                const Divide(),
                                Text(
                                  model.data.products[index].name,
                                  style: subTitle,
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "\$${model.data.products[index].oldPrice.round()}",
                                      style: subTitle.copyWith(
                                        decoration: TextDecoration.lineThrough,
                                      ),
                                    ),
                                    const Spacer(),
                                    Text(
                                      "\$${model.data.products[index].price.round()}",
                                      style: titleStyle,
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    const Icon(Icons.favorite_outline_sharp),
                                    const Spacer(),
                                    Container(
                                      height: 25,
                                      width: 50,
                                      decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(70),
                                            bottomRight: Radius.circular(70),
                                          ),
                                          color: primaryDeepPurple),
                                      child: const Center(
                                        child: Icon(
                                          Icons.add,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 15,
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ],
          );
        });
  }
}
