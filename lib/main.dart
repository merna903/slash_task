import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slash_task/cubits/app_cubit.dart';
import 'package:slash_task/cubits/app_states.dart';
import 'package:slash_task/modules/splash/splash_view.dart';
import 'package:slash_task/shared/blocObserver.dart';
import 'package:slash_task/shared/network/remote/dio_helper.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => AppCubit()..getHomeData())
      ], 
      child: BlocConsumer<AppCubit,AppStates>(
        builder: (context, state)
        {
          return MaterialApp(
            theme: ThemeData(fontFamily: 'Noyh'),
            debugShowCheckedModeBanner: false,
            home:const SplashScreen(),
          );
        },
        listener: (context, Object? state){},
    )
  );
  }
}
