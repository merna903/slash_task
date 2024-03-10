
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slash_task/cubits/app_states.dart';
import 'package:slash_task/models/home_model.dart';
import 'package:slash_task/models/product_info_model.dart';
import 'package:slash_task/shared/network/end_points.dart';
import 'package:slash_task/shared/network/remote/dio_helper.dart';

class AppCubit extends Cubit<AppStates>
{
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  Home? homeModel;
  void getHomeData() async
  {
    homeModel = null;
    emit(AppLoadingHomeDataState());
    await DioHelper.getData(
      url: home,
    ).then((value){
      homeModel = Home.fromJson(value.data);
      emit(AppSuccessHomeDataState());
    }).catchError((error){
      debugPrint(error.toString());
      emit(AppErrorHomeDataState(error.toString()));
    });
  }

  ProductInfo? productInfoModel;
  void getProductData() async
  {
    productInfoModel = null;
    emit(AppLoadingProductDataState());
    await DioHelper.getData(
      url: product,
    ).then((value) {
      productInfoModel = ProductInfo.fromJson(value.data);
      emit(AppSuccessProductDataState());
    }).catchError((error){
      emit(AppErrorProductDataState(error.toString()));
    });
  }
}