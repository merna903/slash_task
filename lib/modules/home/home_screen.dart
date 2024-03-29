import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slash_task/cubits/app_cubit.dart';
import 'package:slash_task/cubits/app_states.dart';
import 'package:slash_task/shared/widgets/home_builder_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      builder: (BuildContext context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Slash.',
              style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 45,
                  color: Colors.white),
            ),
            backgroundColor: Colors.black,
          ),
          body: Container(
            padding: const EdgeInsets.only(top: 40),
            decoration: const BoxDecoration(
              color: Colors.black,
            ),
            child: ConditionalBuilder(
                condition: AppCubit.get(context).homeModel != null,
                fallback: (BuildContext context) => const Center(
                        child: Text(
                      './',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 60,
                        fontWeight: FontWeight.w900,
                      ),
                    )),
                builder: (BuildContext context) =>
                    HomeBuilder(homeModel: AppCubit.get(context).homeModel!)),
          ),
        );
      },
      listener: (BuildContext context, state) {},
    );
  }
}
