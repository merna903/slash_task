import 'package:flutter/material.dart';
import 'package:slash_task/models/home_model.dart';
import 'package:slash_task/shared/widgets/grid_porguct_widget.dart';

// ignore: must_be_immutable
class HomeBuilder extends StatelessWidget {
  final Home homeModel;

  const HomeBuilder({super.key, required this.homeModel});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Container(
        color: Colors.black,
        child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            childAspectRatio: 0.755,
          ),
          itemBuilder: (BuildContext context, int index) => GridProduct(
            products: homeModel.data![index],
          ),
          itemCount: homeModel.data!.length,
        ),
      ),
    );
  }
}
