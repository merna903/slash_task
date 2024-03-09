import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slash_task/cubits/app_cubit.dart';
import 'package:slash_task/cubits/app_states.dart';
import 'package:slash_task/models/home_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
     builder: (BuildContext context, state) 
     { 
      return Scaffold(
          appBar: AppBar(
            title: Container(
              alignment: Alignment.center,
              child: const Text('Slash.',style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 45,
              ),),
            ) ,
            backgroundColor: Colors.black,
          ),
          body: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.black,
            ),
            child: ConditionalBuilder(
              condition: AppCubit.get(context).homeModel != null,
              fallback: (BuildContext context) => const Center(child: Text('./')),
              builder: (BuildContext context) => ListView.separated(
              itemBuilder: (BuildContext context, int index) => homeBuilder(AppCubit.get(context).homeModel!,context),
              separatorBuilder: (BuildContext context, int index) => const Divider(),
              itemCount: 20 ,
              ),
            ),
          ),
        );
      }, 
      listener: (BuildContext context, state) 
      { 

       },
    );
  }


  
  Widget homeBuilder(Home model, context) => SingleChildScrollView(
    physics: const BouncingScrollPhysics(),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
              Container(
                color: Colors.black,
                child: GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics() ,
                  crossAxisCount: 2,
                  mainAxisSpacing: 1.0,
                  crossAxisSpacing: 1.0,
                  childAspectRatio: 1/1.6,
                  children:
                  List.generate(
                      model.data!.length,
                      (index) => buildGridProduct(model.data![index], context)
                  ),
                ),
              ),
            ],
          ),
        );


Widget buildGridProduct(Products model, context) => Container(
  clipBehavior: Clip.hardEdge,
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Image(
        image: NetworkImage(model.productVariations![0].productVarientImages![0].imagePath??''),
        fit: BoxFit.cover,
      ),
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${model.brands!.brandName} - ${model.name}",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 14,
                    height: 1.2,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  'EGP ${model.productVariations![0].price!.round()}',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                const Spacer(),
                CircleAvatar(
                  radius: 15.0,
                  child: Image(
                    image: NetworkImage(
                      model.brands!.brandLogoImagePath??'',
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ],
  ),
);
}