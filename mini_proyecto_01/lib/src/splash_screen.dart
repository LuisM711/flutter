import 'package:flutter/material.dart';
import 'package:mini_proyecto_01/src/imc_calculator.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToCalculator();
  }

  _navigateToCalculator() async {
    await Future.delayed(const Duration(seconds: 2), () {});
    if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const IMCCalculator()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.calculate,
              size: 100,
              color: Colors.black,
            ),
            const SizedBox(height: 20),
            const Text(
              'CALCULADORA IMC',
              style: TextStyle(
                fontSize: 24,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 50),
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
