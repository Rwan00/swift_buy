import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swift_buy/cubits/shop_cubit/shop_cubit.dart';
import 'package:swift_buy/cubits/shop_cubit/shop_state.dart';

import '../widgets/product_item.dart';

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
            body: state is ShopLoadingCategoriesDetailsState
                ? Center(
                    child: Image.asset(
                    "assets/images/loading.gif",
                    height: 95,
                    width: 95,
                  ))
                : ConditionalBuilder(
                    condition: model != null,
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
                          return ProductItem(
                            model: model[index],
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
