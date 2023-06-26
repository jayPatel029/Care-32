
import 'package:flutter/material.dart';
import 'package:simple_animation_progress_bar/simple_animation_progress_bar.dart';
import 'package:dental_minor/pages/pages.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent[700],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Image.asset('asset/logo32.png'),
            ),
            SizedBox(
              height: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(height: 350),
                SimpleAnimationProgressBar(
                    ratio: 1,
                    width: 350,
                    height: 10,
                    direction: Axis.horizontal,
                    backgroundColor: Colors.grey,
                    foregrondColor: Colors.white,
                    duration: Duration(seconds: 5),
                    borderRadius: BorderRadius.circular(10),
                    curve: Curves.fastLinearToSlowEaseIn),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
