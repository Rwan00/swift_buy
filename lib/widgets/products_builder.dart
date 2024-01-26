
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:swift_buy_/models/home_model.dart';

class ProductsBuilder extends StatelessWidget {
  final HomeModel model;
  const ProductsBuilder({required this.model,super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: model.data.banners.map((element) {
            return SizedBox(
              width: double.infinity,
              //margin: const EdgeInsets.symmetric(horizontal: 10),
              child: Image.network(
                element.image,
                fit: BoxFit.fill,
              ),
            );
          }).toList(),
          options: CarouselOptions(
              height: 250,
              initialPage: 0,
              enlargeCenterPage: true,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 4),
            autoPlayCurve: Curves.easeInOutBack
          ),
        ),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
