import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:swift_buy_/models/home_model.dart';
import 'package:swift_buy_/theme/body_theme.dart';
import 'package:swift_buy_/theme/fonts.dart';
import 'package:swift_buy_/widgets/divide.dart';

class ProductsBuilder extends StatelessWidget {
  final HomeModel model;

  const ProductsBuilder({required this.model, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: model.data.banners.map((element) {
            return SizedBox(
              width: double.infinity,
              //margin: const EdgeInsets.symmetric(horizontal: 10),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(30)),
                child: Image.network(
                  element.image,
                  fit: BoxFit.fill,
                ),
              ),
            );
          }).toList(),
          options: CarouselOptions(
              height: 200,
              initialPage: 0,
              enlargeCenterPage: true,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 4),
              autoPlayCurve: Curves.easeInOutBack),
        ),
        const SizedBox(
          height: 30,
        ),
        Expanded(
          child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 210,
                childAspectRatio: 0.6,
                crossAxisSpacing: 1,
                mainAxisSpacing: 2,
              ),
              physics: const BouncingScrollPhysics(),
              itemCount: model.data.products.length,
              itemBuilder: (ctx, index) {
                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height:25,
                            width: 50,
                            decoration:BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(70),
                                bottomRight: Radius.circular(70),
                              ),
                              color: primaryDeepPurple
                            ),
                              child: Center(
                                  child: Text(
                                    "-${model.data.products[index].discount}%",
                                    style: titleStyle.copyWith(color: Colors.white),
                                  ),
                              ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Image.network(
                              model.data.products[index].image,
                              height: 87,
                              width: 137,
                              fit: BoxFit.contain,
                            ),
                          ),
                          const Divide(),
                          Text(
                            model.data.products[index].name,
                            style: subTitle,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Row(
                            children: [
                              Text(
                                "\$${model.data.products[index].oldPrice}",
                                style: titleStyle.copyWith(
                                    decoration: TextDecoration.lineThrough),
                              ),
                              const Spacer(),
                              Text(
                                "\$${model.data.products[index].price}",
                                style: titleStyle,
                              ),
                            ],
                          ),

                          const Spacer(),
                           Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const Icon(Icons.favorite_outline_sharp),
                              const Spacer(),
                              Container(
                                height:25,
                                width: 50,
                                decoration:BoxDecoration(
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(70),
                                      bottomRight: Radius.circular(70),
                                    ),
                                    color: primaryDeepPurple
                                ),
                                  child: const Center(
                                      child: Icon(
                                          Icons.add,
                                          color: Colors.white,
                                      ),
                                  ),
                              ),

                            ],
                          ),
                          const SizedBox(height: 25,)
                        ],
                      ),
                    ),
                  ),
                );
              }),
        ),
      ],
    );
  }
}
