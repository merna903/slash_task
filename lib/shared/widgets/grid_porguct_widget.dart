import 'package:flutter/material.dart';
import 'package:slash_task/models/home_model.dart';

import '../../cubits/app_cubit.dart';
import '../../modules/productInfo/product_info_screen.dart';

// ignore: must_be_immutable
class GridProduct extends StatelessWidget {
  final Products products;

  const GridProduct({
    super.key,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Container(
                color: Colors.white,
                child: Image(
                  errorBuilder: (context, error, stackTrace) =>
                      const CircleAvatar(
                    radius: 11,
                    backgroundColor: Colors.black,
                    child: Icon(
                      Icons.error_outline_sharp,
                      color: Colors.white,
                    ),
                  ),
                  height: 150,
                  width: 150,
                  image: NetworkImage(products.productVariations![0]
                          .productVarientImages![0].imagePath ??
                      ''),
                ),
              )),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "${products.brands!.brandName} - ${products.name}\n",
                        maxLines: 2,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          height: 1.2,
                        ),
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(28),
                      child: Image(
                        errorBuilder: (context, error, stackTrace) =>
                            const CircleAvatar(
                          radius: 11,
                          backgroundColor: Colors.black,
                          child: Icon(
                            Icons.error_outline_sharp,
                            color: Colors.white,
                          ),
                        ),
                        height: 28,
                        width: 28,
                        image: NetworkImage(
                          products.brands?.brandLogoImagePath ?? '',
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  'EGP ${products.productVariations![0].price!.round()}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      onTap: () {
        AppCubit.get(context).getProductData(products.id);
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const ProductInfoScreen()));
      },
    );
  }
}
