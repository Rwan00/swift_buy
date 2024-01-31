import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swift_buy_/cubits/shop_cubit/shop_cubit.dart';
import 'package:swift_buy_/cubits/shop_cubit/shop_state.dart';

import 'package:swift_buy_/theme/body_theme.dart';
import 'package:swift_buy_/theme/fonts.dart';



class BottomSheetBody extends StatelessWidget {
  const BottomSheetBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = ShopCubit.get(context);
        var model = cubit.categoriesModel?.data.dataModel;
        return ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: model!.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                shadowColor: lightPurple,
                elevation: 10,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      SizedBox(
                        height: 87,
                        width: 137,
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(30)),
                          child: FadeInImage(
                            placeholder:
                                const AssetImage("assets/images/sign.jpg"),
                            image: NetworkImage(
                              model[index].image
                                ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        model[index].name,
                        style: titleStyle,
                      ),
                      const Spacer(),
                      const Icon(Icons.arrow_forward_ios)
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
