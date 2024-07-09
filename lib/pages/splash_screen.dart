import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isFontSize = false;
  bool _position = false;

  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 500), () {
      setState(() {
        _position = true;
      });
      Timer(const Duration(milliseconds: 500), () {
        setState(() {
          _isFontSize = true;
        });
      });
    });
    Timer(const Duration(seconds: 4), () {
       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeScreen()),);
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange.shade50,
      body: SafeArea(
        child: Transform.rotate(
          angle: -10 * (pi / 180),
          child: Center(
            child: Stack(
              alignment: Alignment.center,
              children: [

                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: _isFontSize ? 80 : 0, vertical: _isFontSize ? 40 : 0,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), bottomRight: Radius.circular(20),),
                    color: Colors.deepOrange.shade100,
                  ),
                  child: AnimatedDefaultTextStyle(
                    duration: const Duration(milliseconds: 500),
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: _isFontSize ? 18 : 0,
                      color: Colors.white,
                      shadows: const [
                        Shadow(
                          color: Colors.black,
                          blurRadius: 2,
                          offset: Offset(2, 2),
                        ),
                      ],
                    ),
                    curve: Curves.elasticOut,
                    child: Text("Portfolio"),
                  ),
                ),
                AnimatedPadding(
                  curve: Curves.linear,
                  padding: EdgeInsets.only(bottom: _position ? 45 : 20),
                  duration: const Duration(milliseconds: 500),
                  child: Text(
                    "Akshay Panika",
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.deepOrange.shade100,
                      shadows: const [
                        Shadow(
                          color: Colors.black,
                          blurRadius: 2,
                          offset: Offset(2, 2),
                        ),
                      ],
                    ),
                  ),
                ),
                AnimatedPadding(
                  curve: Curves.linear,
                  padding: EdgeInsets.only(top: _position ? 45 : 20),
                  duration: const Duration(milliseconds: 500),
                  child: Text(
                    "Flutter Developer",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.deepOrange.shade100,
                      shadows: const [
                        Shadow(
                          color: Colors.black,
                          blurRadius: 2,
                          offset: Offset(2, 2),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
