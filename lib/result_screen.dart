import 'package:bmi_app/constants.dart';
import 'package:bmi_app/main.dart';
import 'package:flutter/material.dart';

enum WeightIndicators {
  underweight,
  normal,
  overweight,
  obesityFirst,
  obesitySecond,
  obesityThird,
}

class ResultPage extends StatelessWidget {
  //ResultPage({Key? key}) : super(key: key);
  const ResultPage(
    this.bmi,
  );

  final int bmi;

  WeightCheck(int bmi) {
    if (bmi < 18.5) {
      return "Your weight is very low.";
    }
    if (bmi >= 18.5 && bmi < 24.9) {
      return "Your weight is normal.";
    } else if (bmi >= 25.0 && bmi < 29.9) {
      return "You are overweight.";
    } else if (bmi >= 30.0 && bmi < 34.9) {
      return "You have obesity class first.";
    } else if (bmi >= 35.0 && bmi < 39.9) {
      return "You have obesity class second.";
    } else if (bmi >= 40) {
      return "You have obesity class third.";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBG,
      appBar: AppBar(
        backgroundColor: kBG,
        title: const Text(
          "BMI Calculator",
          style: kBodyTextStyle,
        ),
      ),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              const SizedBox(
                height: 180,
              ),
              const Text(
                "Your BMI is ",
                style: TextStyle(fontSize: 30, color: kBottomContainerColor),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                bmi.toString(),
                style: kResultTextStyle,
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(40),
                child: Text(
                  WeightCheck(bmi).toString(),
                  style: const TextStyle(
                      fontSize: 25,
                      fontStyle: FontStyle.italic,
                      color: Colors.white),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 264,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(
                context,
              );
            },
            child: Container(
              height: 80,
              color: kBottomContainerColor,
              child: const Center(
                child: Text(
                  "Recalculate my BMI",
                  style: kLargeButtonTextStyle,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
