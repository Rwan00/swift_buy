import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import 'package:swift_buy/cubits/shop_cubit/shop_cubit.dart';
import 'package:swift_buy/cubits/shop_cubit/shop_state.dart';

import 'package:swift_buy/theme/body_theme.dart';
import 'package:swift_buy/widgets/info_body.dart';

import '../methods/methods.dart';

import 'Edit_info_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        //var cubit = ShopCubit.get(context);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
             Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    const CircleAvatar(
                      backgroundImage: AssetImage("assets/images/kk.jpg"),
                      radius: 72,
                    ),
                    CircleAvatar(
                      backgroundColor: primaryDeepPurple,
                      child: const Icon(Icons.edit_outlined,color: Colors.white,),
                    )
                  ],
                ),
              ),
            ),
        
            Stack(
              alignment: const Alignment(0.8,-0.85),
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 64),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        border: Border.all(color: primaryDeepPurple,width: 1),
                        borderRadius: BorderRadius.circular(30)
                    ),
                    child:  const InfoBody(),
                    /**/
                  ),
                ),
                GestureDetector(
                  onTap:()=> animatedNavigateTo(context: context, widget: const EditInfoScreen(), direction: PageTransitionType.rightToLeft, curve: Curves.fastOutSlowIn),
                  child: CircleAvatar(
                    backgroundColor: primaryDeepPurple,
                    radius: 26,
                    child: const Icon(Icons.settings_suggest_outlined,color: Colors.white,),
                  ),
                )
              ],
            )
          ],
        );
      },
    );
  }
}
