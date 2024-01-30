import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swift_buy_/cubits/shop_cubit/shop_cubit.dart';
import 'package:swift_buy_/cubits/shop_cubit/shop_state.dart';

import '../widgets/products_builder.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopStates>(

      listener: (context,state){},
        builder: (context,state){
          var cubit = ShopCubit.get(context);
        return ConditionalBuilder(
            condition: cubit.homeModel != null && cubit.categoriesModel != null,
            builder: (context) =>  ProductsBuilder(model: cubit.homeModel!,),
            fallback: (context)=> const Center(child: CircularProgressIndicator(),)
        );
        },
        );
  }


}
