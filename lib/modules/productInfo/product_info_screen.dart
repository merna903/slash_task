import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slash_task/cubits/app_cubit.dart';
import 'package:slash_task/cubits/app_states.dart';
import 'package:slash_task/shared/widgets/product_details_widget.dart';

class ProductInfoScreen extends StatelessWidget {
  const ProductInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      builder: (BuildContext context, state) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text(
              'Product details',
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 25,
                  color: Colors.white),
            ),
            backgroundColor: Colors.black,
          ),
          body: Container(
            decoration: const BoxDecoration(
              color: Colors.black,
            ),
            child: ConditionalBuilder(
              condition: AppCubit.get(context).productInfoModel != null,
              fallback: (BuildContext context) => const Center(
                  child: Text('./', style: TextStyle(
                    color: Colors.white,
                    fontSize: 60,
                    fontWeight: FontWeight.w900,
                ),
              )),
              builder: (BuildContext context) => ProductDetails(model: AppCubit.get(context).productInfoModel!),
            ),
          ),
        );
      },
      listener: (BuildContext context, state) {},
    );
  }
}
