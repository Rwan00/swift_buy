import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swift_buy/cubits/shop_cubit/shop_cubit.dart';
import 'package:swift_buy/cubits/shop_cubit/shop_state.dart';
import 'package:swift_buy/theme/fonts.dart';
import 'package:swift_buy/widgets/my_btn.dart';

import '../theme/body_theme.dart';
import '../widgets/curve_painter.dart';

class ProductDetails extends StatelessWidget {
  final dynamic model;
  final bool? isFav;
  final bool isSearch;
  const ProductDetails(
      {required this.model, this.isFav, this.isSearch = false, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = ShopCubit.get(context);
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: const Text(
              "Swift Buy",
            ),
            backgroundColor: Colors.white,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.name,
                    style: heading.copyWith(fontSize: 24),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Row(
                    children: [
                      Text(
                        "\$${model.price.round()}",
                        style: heading.copyWith(fontSize: 24),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      if (model.discount != 0 && isSearch == false)
                        Text(
                          "\$${model.oldPrice.round()}",
                          style: titleStyle.copyWith(
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                    ],
                  ),
                  Center(
                    child: SizedBox(
                      height: 272,
                      width: 220,
                      child: FadeInImage(
                        placeholder: const AssetImage("assets/images/sign.jpg"),
                        image: NetworkImage(
                          model.image,
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: CustomPaint(
                      size: Size(MediaQuery.of(context).size.width,
                          50), // Dynamic width
                      painter: CurvePainter(),
                    ),
                  ),
                  imagesList(),
                  const SizedBox(height: 24,),
                  Column(
                          children: <Widget>[
                            Text(
                              
                              model.description,
                              maxLines:cubit.flag? 3 : null,
                              overflow:cubit.flag? TextOverflow.ellipsis : null,
                              style: subTitle,
                            ),
                            InkWell(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Text(
                                    cubit.flag ? "Show More.." : "Show Less",
                                    style: titleStyle,
                                  ),
                                ],
                              ),
                              onTap: () {
                                cubit.readMore();
                              },
                            ),
                          ],
                        ),
                  const SizedBox(
                    height: 58,
                  ),
                  Row(
                    children: [
                      if (isFav != null)
                        CircleAvatar(
                          radius: 24,
                          backgroundColor: Colors.grey[200],
                          child: Icon(
                            isFav!
                                ? Icons.favorite
                                : Icons.favorite_outline_sharp,
                            color: primaryDeepPurple,
                          ),
                        ),
                      const Spacer(),
                      SizedBox(
                        width: 200,
                        height: 50,
                        child: AppBtn(label: "Add To Cart", onPressed: () {}),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  SingleChildScrollView imagesList() {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        child: Row(
          children: List.generate(
            model.images.length,
            (index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                height: 90,
                width: 90,
                child: FadeInImage(
                  placeholder: const AssetImage("assets/images/sign.jpg"),
                  image: NetworkImage(
                    model.images[index],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
