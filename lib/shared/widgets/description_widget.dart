import 'package:flutter/material.dart';
import 'package:slash_task/models/product_info_model.dart';

import '../../cubits/app_cubit.dart';

class DescriptionWidget extends StatelessWidget {
  const DescriptionWidget({super.key, required this.model});

  final ProductInfo model;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: ExpansionPanelList(
        expandIconColor: Colors.white,
        expansionCallback: (int index, bool isExpanded) {
          AppCubit.get(context).changeIsExpanded();
        },
        children: [
          ExpansionPanel(
            backgroundColor: Colors.grey[900],
            headerBuilder: (BuildContext context, bool isExpanded) {
              return const ListTile(
                title: Text(
                  'Description',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              );
            },
            body: ListTile(
              subtitle: Text(
                "${model.data!.description!}\n",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            isExpanded: AppCubit.get(context).isExpanded,
          )
        ],
      ),
    );
  }
}
