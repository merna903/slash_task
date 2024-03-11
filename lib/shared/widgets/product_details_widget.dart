import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:slash_task/models/product_info_model.dart';
import 'package:slash_task/shared/widgets/description_widget.dart';
import 'package:slash_task/shared/widgets/variation_widget.dart';

import '../../cubits/app_cubit.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key, required this.model});

  final ProductInfo model;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Container(
        padding: const EdgeInsets.all(10),
        color: Colors.black,
        child: Column(
          children: [
            const SizedBox(height: 50,),
            SizedBox(
              height: 280,
              child: PageView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: List.generate(
                  model.data!.variations![model.data!.variations!.indexWhere((item) => item.id == AppCubit.get(context).variationId) == -1 ? 0
                          : model.data!.variations!.indexWhere((item) => item.id == AppCubit.get(context).variationId)].productVarientImages!.length,
                  (index) => Container(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Container(
                        decoration: const BoxDecoration(color: Colors.white),
                        child: Image(
                          errorBuilder: (context, error, stackTrace) =>
                              const CircleAvatar(
                                  radius: 80,
                                  backgroundColor: Colors.black,
                                  child: Icon(
                                    Icons.error_outline_sharp,
                                    color: Colors.white,
                                  ),
                                ),
                          height: 270,
                          width: 280,
                          image: NetworkImage(model.data!.variations![model.data!.variations!.indexWhere((item) => item.id == AppCubit.get(context).variationId) == -1 ? 0
                                  : model.data!.variations!.indexWhere((item) => item.id == AppCubit.get(context).variationId)].productVarientImages![index].imagePath!),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 50,),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  model.data!.variations![model.data!.variations!.indexWhere((item) =>
                  item.id == AppCubit.get(context).variationId) == -1 ? 0 :
                    model.data!.variations!.indexWhere((item) => item.id == AppCubit.get(context).variationId)].productVarientImages!.length,
                  (index) => GestureDetector(
                    onTap: () {
                      AppCubit.get(context).changeImage(model.data!.variations![model.data!.variations!.indexWhere((item) => item.id == AppCubit.get(context).variationId) == -1 ? 0
                              : model.data!.variations!.indexWhere((item) => item.id == AppCubit.get(context).variationId)].productVarientImages![index].imagePath!);},
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Image(
                            errorBuilder: (context, error, stackTrace) =>
                                const CircleAvatar(
                                  radius: 6,
                                  backgroundColor: Colors.black,
                                  child: Icon(
                                    Icons.error_outline_sharp,
                                    color: Colors.white,
                                  ),
                                ),
                            height: 40,
                            width: 50,
                            image: NetworkImage(model.data!.variations![model.data!.variations!.indexWhere((item) => item.id == AppCubit.get(context).variationId) == -1 ? 0
                                    : model.data!.variations!.indexWhere((item) => item.id == AppCubit.get(context).variationId)].productVarientImages![index].imagePath!),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 50,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      model.data!.name!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 15,),
                    Text(
                      "EGP ${model.data!.variations![model.data!.variations!.indexWhere((item) => item.id == AppCubit.get(context).variationId) == -1 ? 0 :
                        model.data!.variations!.indexWhere((item) => item.id == AppCubit.get(context).variationId)].price}",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(40),
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
                        height: 40,
                        width: 40,
                        image: NetworkImage(
                          model.data!.brandImage ?? '',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      model.data!.brandName!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            if (model.data?.avaiableProperties != null)
              Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    if (model.data!.avaiableProperties!.indexWhere((item) => item.property == 'Size') != -1)
                      VariationBuilder(
                          name: 'Select Size',
                          model: model,
                          id: model.data!.avaiableProperties!.indexWhere((item) => item.property == 'Size')),
                    const SizedBox(height: 20,),
                    if (model.data!.avaiableProperties!.indexWhere((item) => item.property == 'Color') != -1)
                      Column(
                        children: [
                          const Text(
                            'Select Color',
                            style: TextStyle(
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
                                model.data!.avaiableProperties![model.data!.avaiableProperties!.indexWhere((item) => item.property == 'Color')].values!.length,
                                (index) => GestureDetector(
                                    onTap: () {
                                      AppCubit.get(context).variationChanged(
                                          model.data!.avaiableProperties![model.data!.avaiableProperties!.indexWhere((item) => item.property == 'Color')].values![index].id!);
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 6),
                                      child: CircleAvatar(
                                        radius: 28,
                                        backgroundColor: Colors.lightGreenAccent,
                                        child: CircleAvatar(
                                          radius: 25,
                                          backgroundColor: HexColor(model.data!.avaiableProperties![model.data!.avaiableProperties!.indexWhere((item) => item.property == 'Color')].values![index].value!),
                                        ),
                                      ),
                                    )),
                              ),
                            ),
                          ),
                        ],
                      ),
                    const SizedBox(
                      height: 20,
                    ),
                    if (model.data!.avaiableProperties!.indexWhere((item) => item.property == 'Materials') != -1)
                      VariationBuilder(
                          name: 'Select Material',
                          model: model,
                          id: model.data!.avaiableProperties!.indexWhere((item) => item.property == 'Materials')),
                  ],
                ),
              ),
            const SizedBox(height: 30,),
            DescriptionWidget(model: model),
          ],
        ),
      ),
    );
  }
}
