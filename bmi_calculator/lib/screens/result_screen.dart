import 'package:bmi_calculator/components/calculation_button.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatefulWidget {
  final int height;
  final int weight;
  const ResultScreen({super.key, required this.height, required this.weight});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  late String evaluation;
  late double bmi;
  late String range;
  late Color evaluationColor;
  late String motivationalMessage;

  @override
  void initState() {
    super.initState();

    bmi = widget.weight / ((widget.height / 100) * (widget.height / 100));
    if (bmi <= 18.5) {
      evaluation = "Underweight";
      range = "< 18.5";
      evaluationColor = Colors.orange;
      motivationalMessage = "Gain strength !";
    } else if ((bmi > 18.5) && (bmi <= 24.9)) {
      evaluation = "Normal";
      range = "18.5 - 24.9";
      evaluationColor = Colors.green;
      motivationalMessage = "Stay consistent !";
    } else if ((bmi >= 25) && (bmi <= 29.9)) {
      evaluation = "Overweight";
      range = "25 - 29.9";
      evaluationColor = Colors.yellow;
      motivationalMessage = "Keep improving !";
    } else if (bmi >= 30) {
      evaluation = "Obesity";
      range = "≥ 30";
      evaluationColor = Colors.red;
      motivationalMessage = "Start today !";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0c1135),
      appBar: AppBar(
        backgroundColor: const Color(0xFF111638),
        automaticallyImplyLeading: false,
        title: const Text(
          "BMI calculator",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            const Spacer(),
            Image.asset(
              "images/success.png",
              width: 100.0,
            ),
            Container(
              color: const Color(0xFF151a3c),
              width: MediaQuery.of(context).size.width - 16,
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "You result is",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    evaluation,
                    style: TextStyle(
                      color: evaluationColor,
                      fontSize: 24.0,
                    ),
                  ),
                  Text(
                    bmi.toStringAsFixed(2),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 80.0,
                    ),
                  ),
                  Text(
                    "$evaluation BMI range : ",
                    style: const TextStyle(
                      color: Color(0XFF8C8D97),
                      fontSize: 18.0,
                    ),
                  ),
                  Text(
                    "$range kg/m2",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                    ),
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  Text(
                    evaluation == "Normal"
                        ? "You have a normal body weight"
                        : "You have an ${evaluation.toLowerCase()} body weight",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    motivationalMessage,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            CalculationButton(
              textButton: "Re-Calculate Your BMI",
            ),
            const SizedBox(
              height: 4.0,
            ),
          ],
        ),
      ),
    );
  }
}
