import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import 'package:swift_buy/cubits/shop_cubit/shop_cubit.dart';
import 'package:swift_buy/cubits/shop_cubit/shop_state.dart';

import '../methods/methods.dart';
import '../widgets/product_item.dart';
import 'product_details.dart';

class CategoriesScreen extends StatelessWidget {
  final String title;
  const CategoriesScreen({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = ShopCubit.get(context);
          var model = cubit.categoriesDetailsModel?.data.products;
          print("product ${cubit.categoriesDetailsModel?.data.products}");
          return Scaffold(
            appBar: AppBar(
              title: Text(title),
            ),
            body: ConditionalBuilder(
                    condition: state is! ShopLoadingCategoriesDetailsState,
                    builder: (context) => GridView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 210,
                          childAspectRatio: 0.6,
                          crossAxisSpacing: 1,
                          mainAxisSpacing: 2,
                        ),
                        physics: const BouncingScrollPhysics(),
                        itemCount: model!.length,
                        itemBuilder: (ctx, index) {
                          return GestureDetector(
                            onTap: (){
                                animatedNavigateTo(
                        context: ctx,
                        widget: ProductDetails(
                          model: model[index],
                          isFav:
                              cubit.favorites[model[index].id]!,
                        ),
                        direction: PageTransitionType.leftToRight,
                        curve: Curves.easeInExpo,
                      );
                            },
                            child: ProductItem(
                              model: model[index],
                               isFav:
                              cubit.favorites[model[index].id]!,
                            ),
                          );
                        }),
                    fallback: (context) => Center(
                        child: Image.asset(
                      "assets/images/loading.gif",
                      height: 95,
                      width: 95,
                    )),
                  ),
          );
        });
  }
}
