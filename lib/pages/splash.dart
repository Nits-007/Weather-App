import 'dart:async';
import 'package:flutter/material.dart';
import 'package:weatherapp/pages/home.dart';

class SplashScreen extends StatefulWidget{
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>{
  @override
  void initState(){
    super.initState() ;
    Timer(const Duration(seconds: 2) ,() {
      Navigator.pushReplacement(context, 
      MaterialPageRoute(builder: (context) => const Home())) ;
     }) ;
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/weather.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Climate Cast',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 20), 
                CircularProgressIndicator(
                  color: Colors.black, 
                ),
              ],
            ),
          ),
        ),
    ) ;
  }
}