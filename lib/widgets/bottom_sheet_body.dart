import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import 'package:swift_buy/methods/methods.dart';
import 'package:swift_buy/screens/categories_screen.dart';

import '../cubits/shop_cubit/shop_cubit.dart';
import '../cubits/shop_cubit/shop_state.dart';
import '../theme/body_theme.dart';
import '../theme/fonts.dart';

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
              child: GestureDetector(
                onTap: () {
                  cubit.getCategoriesDetailsData(model[index].id);
                  animatedNavigateTo(
                    context: context,
                    widget:  CategoriesScreen(title: model[index].name,),
                    direction: PageTransitionType.rightToLeft,
                    curve: Curves.bounceIn,
                  );
                },
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
                              image: NetworkImage(model[index].image),
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
                        CircleAvatar(
                          backgroundColor: Colors.grey[300],
                          child: Icon(
                            Icons.arrow_forward_ios,
                            color: primaryDeepPurple,
                          ),
                        ),
                      ],
                    ),
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
