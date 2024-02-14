import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import 'package:swift_buy/cubits/shop_cubit/shop_cubit.dart';
import 'package:swift_buy/cubits/shop_cubit/shop_state.dart';

import 'package:swift_buy/theme/body_theme.dart';

import '../methods/methods.dart';

import '../widgets/info_container.dart';
import 'edit_info_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = ShopCubit.get(context);
        return cubit.userModel != null
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          CircleAvatar(
                            backgroundColor: primaryDeepPurple,
                            backgroundImage:
                                NetworkImage(cubit.userModel!.data!.image!),
                            radius: 72,
                          ),
                          CircleAvatar(
                            backgroundColor: primaryDeepPurple,
                            child: const Icon(
                              Icons.edit_outlined,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Stack(
                    alignment: const Alignment(0.8, -0.85),
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 64),
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: primaryDeepPurple, width: 1),
                              borderRadius: BorderRadius.circular(30)),
                          child: Column(
                            children: [
                              InfoContainer(
                                label: 'UserName',
                                content: cubit.userModel!.data!.name!,
                              ),
                              InfoContainer(
                                label: 'Email',
                                content: cubit.userModel!.data!.email!,
                              ),
                              InfoContainer(
                                label: 'Phone',
                                content: cubit.userModel!.data!.phone!,
                              ),
                              const InfoContainer(
                                label: 'Location',
                                content: "Alexandria",
                              ),
                              const SizedBox(
                                height: 10,
                              )
                            ],
                          ),
                          /**/
                        ),
                      ),
                      GestureDetector(
                        onTap: () => animatedNavigateTo(
                            context: context,
                            widget:  EditInfoScreen(userData: cubit.userModel!,),
                            direction: PageTransitionType.rightToLeft,
                            curve: Curves.fastOutSlowIn),
                        child: CircleAvatar(
                          backgroundColor: primaryDeepPurple,
                          radius: 26,
                          child: const Icon(
                            Icons.settings_suggest_outlined,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              )
            : Center(
                child: Image.asset(
                  "assets/images/loading.gif",
                  height: 95,
                  width: 95,
                ),
              );
      },
    );
  }
}
