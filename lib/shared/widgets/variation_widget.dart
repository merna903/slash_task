import 'package:flutter/material.dart';
import 'package:slash_task/cubits/app_cubit.dart';
import 'package:slash_task/models/product_info_model.dart';

class VariationBuilder extends StatelessWidget {
  const VariationBuilder(
      {super.key, required this.name, required this.model, required this.id});

  final String name;
  final ProductInfo model;
  final int id;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              model.data!.avaiableProperties![id].values!.length,
              (index) => GestureDetector(
                onTap: () {
                  AppCubit.get(context).variationChanged(
                      model.data!.avaiableProperties![id].values![index].id!);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Text(model
                          .data!.avaiableProperties![id].values![index].value!),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
