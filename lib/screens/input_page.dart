import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/components/ReuseableCard.dart';
import 'package:bmi_calculator/screens/results_page.dart';
import 'package:flutter/material.dart';

import '../components/bottom_button.dart';
import '../components/icon_textcard.dart';
import '../components/round_button.dart';
import '../constants.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int height = 180;
  int weight = 60;
  int age = 18;
  void ageCheck() {
    age == 0 ? age = 18 : age;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReuseableCard(
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      cardChild: icon_textcard(
                        icon: Icons.male,
                        label: 'MALE',
                      ),
                      colour: selectedGender == Gender.male
                          ? kActiveCardcolor
                          : kInactiveCardcolor),
                ),
                Expanded(
                  child: ReuseableCard(
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      cardChild:
                          icon_textcard(icon: Icons.female, label: 'FEMALE'),
                      colour: selectedGender == Gender.female
                          ? kActiveCardcolor
                          : kInactiveCardcolor),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReuseableCard(
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'HEIGHT',
                      style: kLabelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: kNumberstyle,
                        ),
                        Text(
                          'cm',
                          style: kLabelTextStyle,
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                          inactiveTrackColor: Colors.grey,
                          activeTrackColor: Colors.white,
                          thumbColor: Colors.pink,
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 15),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 25),
                          overlayColor: Color(0x29EB1555)),
                      child: Slider(
                          value: height.toDouble(),
                          min: kMinheight.toDouble(),
                          max: kMaxheight.toDouble(),
                          onChanged: (double newValue) {
                            setState(() {
                              height = newValue.round();
                            });
                          }),
                    ),
                  ],
                ),
                colour: kActiveCardcolor),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReuseableCard(
                    colour: kActiveCardcolor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberstyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundButton(
                              icon: Icons.remove,
                              onTap: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(width: 10),
                            RoundButton(
                              icon: Icons.add,
                              onTap: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReuseableCard(
                    colour: kActiveCardcolor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberstyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundButton(
                              icon: Icons.remove,
                              onTap: () {
                                setState(() {
                                  age--;
                                  ageCheck();
                                });
                              },
                            ),
                            SizedBox(width: 10),
                            RoundButton(
                              icon: Icons.add,
                              onTap: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Bottombutton(
            onTap: () {
              CalculatorBrain calc =
                  CalculatorBrain(height: height, weight: weight);
              calc.getResult();
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultsPage(
                          bmiresult: calc.getResult(),
                          title: calc.getTitle(),
                          statement: calc.getStatement())));
            },
            buttonTitle: 'CALCULATE BMI',
          ),
        ],
      ),
    );
  }
}
