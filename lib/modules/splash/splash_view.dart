import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:slash_task/modules/home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  
  @override
  void initState() {
    //to get rid of top and bottom bar
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    super.initState();

    // to move into home page after 2 seconds
    Future.delayed(const Duration(seconds: 2),(){
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => const HomeScreen()
        )
      );
    });
  }

  @override
  void dispose() {
    // to return the top and bottom bar again after we move into home page
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,overlays: SystemUiOverlay.values);
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.black,
        ),
        child:const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('./',style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 40,
              color: Colors.white,
            ),),
            SizedBox(height: 20,),
            Text('Slash',style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 40,
              color: Colors.white,
            ),)
          ],)
      ),
    );
  }
}