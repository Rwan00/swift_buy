import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swift_buy/theme/fonts.dart';

import '../cubits/shop_cubit/shop_cubit.dart';
import '../cubits/shop_cubit/shop_state.dart';
import '../widgets/product_item.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopStates>(

      listener: (context,state){},
      builder: (context,state){
        var cubit = ShopCubit.get(context);
        return cubit.allFalse?
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
             //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/images/empty.png",height: 120,width: 120,),
              Text("Start Add To Your Favourites List",style: subTitle,)
            ],
          ),
        ):
        ConditionalBuilder(
            condition: state is !ShopLoadingGetFavState,
            builder:(context)=>GridView.builder(

                padding: const EdgeInsets.symmetric(horizontal: 5),
                gridDelegate:
                const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 210,
                  childAspectRatio: 0.6,
                  crossAxisSpacing: 1,
                  mainAxisSpacing: 2,
                ),
                physics: const BouncingScrollPhysics(),
                itemCount: cubit.getFavModel?.data.dataModel.length,

                itemBuilder: (ctx, index) {
                  var favModel = cubit.getFavModel?.data
                      .dataModel[index].product;
                  return
                    ProductItem(
                      model: favModel,isFav:cubit.favorites[favModel?.id]!,);
                }),
            fallback: (context)=>const Center(child:CircularProgressIndicator() ,)
        );
      },
    );
  }
}
