import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../cubits/shop_cubit/shop_cubit.dart';
import '../cubits/shop_cubit/shop_state.dart';

import '../theme/body_theme.dart';
import '../theme/fonts.dart';
import 'divide.dart';

class ProductItem extends StatelessWidget {
  final dynamic model;
  final bool? isFav;
  final bool isSearch;

  const ProductItem(
      {required this.model, this.isFav, this.isSearch = false, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = ShopCubit.get(context);
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (model.discount != 0 && isSearch == false)
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
                        "-${model.discount}%",
                        style: titleStyle.copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 8),
                  child: SizedBox(
                    height: 87,
                    width: 137,
                    child: FadeInImage(
                      placeholder: const AssetImage("assets/images/sign.jpg"),
                      image: NetworkImage(
                        model.image,
                      ),
                    ),
                  ),
                ),
                const Divide(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        model.name,
                        style: subTitle,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          if (model.discount != 0 && isSearch == false)
                            Text(
                              "\$${model.oldPrice.round()}",
                              style: subTitle.copyWith(
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                          const Spacer(),
                          Text(
                            "\$${model.price.round()}",
                            style: titleStyle,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    if (isFav != null)
                      IconButton(
                        onPressed: () {
                          cubit.changeFavourites(model.id);
                        },
                        icon: CircleAvatar(
                          backgroundColor: Colors.grey[200],
                          child: Icon(
                            isFav!
                                ? Icons.favorite
                                : Icons.favorite_outline_sharp,
                            color: primaryDeepPurple,
                          ),
                        ),
                      ),
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
                /* const SizedBox(
                  height: 15,
                ) */
              ],
            ),
          ),
        );
      },
    );
  }
}
