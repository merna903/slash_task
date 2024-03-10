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
                color: Colors.white
              ),),
            ) ,
            backgroundColor: Colors.black,
          ),
          body: Container(
            decoration: const BoxDecoration(
              color: Colors.black,
            ),
            child: ConditionalBuilder(
              condition: AppCubit.get(context).homeModel != null,
              fallback: (BuildContext context) => const Center(child: Text('./',style: TextStyle(
                color: Colors.white,
                fontSize: 80,
                fontWeight: FontWeight.w900,
              ),)),
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
    child: Container(
              color: Colors.black,
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics() ,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                childAspectRatio: 0.7,
                ),
                itemBuilder: (BuildContext context, int index) => buildGridProduct(model.data![index], context),
                itemCount: model.data?.length,
              ),
            ),
        );


Widget buildGridProduct(Products model, context) => Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Image(
        height: 150,
        width: 150,
        image: NetworkImage(model.productVariations![0].productVarientImages![0].imagePath??''),
        fit: BoxFit.fill,
      ),
      ),
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(child: Text(
                  "${model.brands!.brandName} - ${model.name}",
                  maxLines: 2,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    height: 1.2,
                  ),
                ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(35),
                  child: Image(
                    height: 35,
                    width: 35,
                    image: NetworkImage(
                      model.brands?.brandLogoImagePath??'',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text(
              'EGP ${model.productVariations![0].price!.round()}',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.end,
            ),
           )
          ],
        ),
      ),
    ],
);
}