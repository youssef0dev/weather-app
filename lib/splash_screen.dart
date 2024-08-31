import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/pages/home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin{
  @override
  void initState(){
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(const Duration(seconds: 3), (){
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const HomePage()));
    });
  }

  @override
  void dispose(){
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: SystemUiOverlay.values);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [Colors.blue, Colors.pink],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft
          )
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Weather App',
              style: TextStyle(
                color: Colors.white,
                fontSize: 35
              ),
            )
          ],
        ),
      ),
    );
  }
}
