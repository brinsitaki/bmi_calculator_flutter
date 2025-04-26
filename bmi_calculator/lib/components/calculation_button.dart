import 'package:bmi_calculator/screens/home_screen.dart';
import 'package:bmi_calculator/screens/result_screen.dart';
import 'package:flutter/material.dart';

class CalculationButton extends StatelessWidget {
  final int? height;
  final int? weight;
  final String textButton;
  const CalculationButton({
    super.key,
    this.height,
    this.weight,
    required this.textButton,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.pink,
      borderRadius: BorderRadius.circular(2.0),
      child: InkWell(
        onTap: () {
          if (textButton == "Calculate Your BMI") {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) =>
                    ResultScreen(height: height!, weight: weight!),
              ),
            );
          } else {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => HomeScreen(),
              ),
            );
          }
        },
        borderRadius: BorderRadius.circular(2.0),
        splashColor: Colors.white.withValues(alpha: 0.3),
        hoverColor: Colors.white.withValues(alpha: 0.1),
        child: SizedBox(
          width: MediaQuery.of(context).size.width - 16,
          height: 60.0,
          child: Center(
            child: Text(
              textButton,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
