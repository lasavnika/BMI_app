import 'package:flutter/material.dart';
import 'package:bmi_app/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_app/result_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const InputPage(),
    );
  }
}

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? gender;
  var age = 20;
  var height = 150;
  var weight = 0;

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
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                      onTap: () {
                         //setState(() {
                        gender = Gender.male;
                      },//);},
                      color: gender == Gender.male
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.male_outlined,
                            size: 90,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            'MALE',
                            style: kBodyTextStyle,
                          ),
                        ],
                      )),
                ),
                Expanded(
                  child: ReusableCard(
                      onTap: () {
                        gender = Gender.female;
                      },
                      color: gender == Gender.female
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.female_outlined,
                            size: 90,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            'FEMALE',
                            style: kBodyTextStyle,
                          ),
                        ],
                      )),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              color: kInactiveCardColor,
              onTap: () {},
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text("HEIGHT ", style: kBodyTextStyle),
                  Text(
                    height.toString(),
                    style: kNumberTextStyle,
                  ),
                  Slider(
                      min: 130,
                      max: 220,
                      activeColor: kBottomContainerColor,
                      value: height.toDouble(),
                      onChanged: (value) {
                        setState(() {
                          height = value.round();
                        });
                      })
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                      onTap: () {},
                      color: kInactiveCardColor,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'WEIGHT',
                            style: kBodyTextStyle,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            weight.toString(),
                            style: kNumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RawMaterialButton(
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                                shape: const CircleBorder(),
                                constraints: const BoxConstraints.tightFor(
                                    width: 56.0, height: 56.0),
                                elevation: 10,
                                padding: const EdgeInsets.all(5),
                                fillColor: kBottomContainerColor,
                                child: const Icon(FontAwesomeIcons.plus),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              RawMaterialButton(
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                                shape: const CircleBorder(),
                                constraints: const BoxConstraints.tightFor(
                                    width: 56.0, height: 56.0),
                                elevation: 10,
                                padding: const EdgeInsets.all(5),
                                fillColor: kBottomContainerColor,
                                child: const Icon(FontAwesomeIcons.minus),
                              ),
                            ],
                          ),
                        ],
                      )),
                ),
                Expanded(
                  child: ReusableCard(
                      onTap: () {},
                      color: kInactiveCardColor,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'AGE',
                            style: kBodyTextStyle,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            age.toString(),
                            style: kNumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RawMaterialButton(
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                                shape: const CircleBorder(),
                                constraints: const BoxConstraints.tightFor(
                                    width: 56.0, height: 56.0),
                                elevation: 10,
                                padding: const EdgeInsets.all(5),
                                fillColor: kBottomContainerColor,
                                child: const Icon(FontAwesomeIcons.plus),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              RawMaterialButton(
                                onPressed: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                                shape: const CircleBorder(),
                                constraints: const BoxConstraints.tightFor(
                                    width: 56.0, height: 56.0),
                                elevation: 10,
                                padding: const EdgeInsets.all(5),
                                fillColor: kBottomContainerColor,
                                child: const Icon(FontAwesomeIcons.minus),
                              ),
                            ],
                          ),
                        ],
                      )),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              final heightSquared = height / 100;
              final res = weight / (heightSquared * heightSquared);
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ResultPage(res.round())),
              );
            },
            child: Container(
              height: 80,
              color: kBottomContainerColor,
              child: const Center(
                child: Text(
                  "Calculate my BMI",
                  style: kLargeButtonTextStyle,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ReusableCard extends StatelessWidget {
  final Color color;

  final Function onTap; // the function will change
  final Widget child; // content changes

  const ReusableCard({
    Key? key,
    this.color = kInactiveCardColor,
    required this.onTap,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap(),
        child: Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: color,
                borderRadius: const BorderRadius.all(Radius.circular(10))),
            child: child));
  }
}
