import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swift_buy/cubits/search_cubit/search_cubit.dart';
import 'package:swift_buy/cubits/search_cubit/search_state.dart';

import '../widgets/input_field.dart';
import '../widgets/product_item.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var searchController = TextEditingController();
    return BlocProvider(
      create: (context) => SearchCubit(),
      child: BlocConsumer<SearchCubit, SearchState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = SearchCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: const Text("Search"),
            ),
            body: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  InputField(
                    hint: 'What Are Looking For..',
                    widget: const Icon(Icons.search_outlined),
                    controller: searchController,
                    onChanged: (value) {
                      cubit.search(value);
                    },
                  ),
                  if (state is SearchLoadingState)
                    Center(
                      child: Image.asset(
                        "assets/images/loading.gif",
                        height: 95,
                        width: 95,
                      ),
                    ),
                    if(state is SearchSuccessState)
                    Expanded(
            child: GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 210,
                  childAspectRatio: 0.6,
                  crossAxisSpacing: 1,
                  mainAxisSpacing: 2,
                ),
                physics: const BouncingScrollPhysics(),
                itemCount: cubit.searchModel!.data.products.length,
                itemBuilder: (ctx, index) {
                  return ProductItem(
                    model: cubit.searchModel!.data.products[index],
                    isSearch: true,
                  );
                }),
          ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
