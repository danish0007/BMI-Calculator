import 'package:example/Bmi_%20Brain.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'Build_Card.dart';
import 'Card_Content.dart';
import 'constants.dart';
import 'result_page.dart';

enum Gender {
  male,
  female,
}

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  Color malecolor = inactivecolor;
  Color femalecolor = inactivecolor;

  int age = 25;
  int weight = 65;
  int height = 180;

  Color upgradecolor(Gender gender) {
    if (gender == Gender.male) {
      if (malecolor == inactivecolor) {
        malecolor = activecolor;
        femalecolor = inactivecolor;
      } else
        malecolor = inactivecolor;
    } else {
      if (femalecolor == inactivecolor) {
        femalecolor = activecolor;
        malecolor = inactivecolor;
      } else
        femalecolor = inactivecolor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          'BMI  CALCULATOR',
          style: TextStyle(
            fontSize: 30,
            //letterSpacing: 1,
          ),
        )),
      ),
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                  child: GestureDetector(
                onTap: () {
                  setState(() {
                    upgradecolor(Gender.male);
                  });
                },
                child: buildcard(
                  colour: malecolor,
                  cardchild:
                      cardcontent(label: 'MALE', icon: FontAwesomeIcons.mars),
                ),
              )),
              Expanded(
                  child: GestureDetector(
                onTap: () {
                  setState(() {
                    upgradecolor(Gender.female);
                  });
                },
                child: buildcard(
                  colour: femalecolor,
                  cardchild: cardcontent(
                      label: 'FEMALE', icon: FontAwesomeIcons.venus),
                ),
              )),
            ],
          ),
          Expanded(
            child: buildcard(
              colour: Color(0xFF101e33),
              cardchild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Height',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.white, fontSize: Klabelsize.toDouble()),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Center(
                        child: Text(
                          height.toString(),
                          style: TextStyle(
                            fontSize: Knumbersize.toDouble(),
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          ' cm',
                          style: TextStyle(
                            fontSize: Klabelsize.toDouble(),
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                  Slider(
                    value: height.toDouble(),
                    min: 120,
                    max: 220,
                    activeColor: Color(0xFFEB1555),
                    inactiveColor: Color(0xFF8D8E98),
                    onChanged: (double newvalue) {
                      setState(() {
                        height = newvalue.round();
                      });
                    },
                  )
                ],
              ),
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: buildcard(
                    colour: Color(0xFF101e33),
                    cardchild: Column(
                      children: <Widget>[
                        Text(
                          'Weight',
                          style: TextStyle(
                            fontSize: Klabelsize.toDouble(),
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          weight.toString(),
                          style: TextStyle(
                            fontSize: Knumbersize.toDouble(),
                            color: Colors.white,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Roundbutton(
                                icon: FontAwesomeIcons.minus,
                                onpressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                }),
                            SizedBox(
                              width: 15,
                            ),
                            Roundbutton(
                                icon: FontAwesomeIcons.plus,
                                onpressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                }),
                          ],
                        )
                      ],
                    )),
              ),
              Expanded(
                  child: buildcard(
                      colour: Color(0xFF101e33),
                      cardchild: Column(
                        children: <Widget>[
                          Text(
                            'Age',
                            style: TextStyle(
                              fontSize: Klabelsize.toDouble(),
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            age.toString(),
                            style: TextStyle(
                              fontSize: Knumbersize.toDouble(),
                              color: Colors.white,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Roundbutton(
                                  icon: FontAwesomeIcons.minus,
                                  onpressed: () {
                                    setState(() {
                                      age--;
                                    });
                                  }),
                              SizedBox(
                                width: 15,
                              ),
                              Roundbutton(
                                  icon: FontAwesomeIcons.plus,
                                  onpressed: () {
                                    setState(() {
                                      age++;
                                    });
                                  }),
                            ],
                          )
                        ],
                      ))),
            ],
          ),
          GestureDetector(
            onTap: () {
              Bmi_Calculator b = Bmi_Calculator(height: height, weight: weight);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Result_Page(
                            bmi: b.getbmi(),
                            result: b.getresult(),
                            advice: b.getadvice(),
                          )));
            },
            child: Container(
              height: 50,
              margin: EdgeInsets.all(10),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Color(0xFFEB1555),
                  borderRadius: BorderRadius.circular(12)),
              child: Center(
                child: Text(
                  'CALCULATE',
                  style: TextStyle(
                      color: Colors.white, letterSpacing: 1, fontSize: 30),
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}

class Roundbutton extends StatelessWidget {
  Roundbutton({@required this.icon, @required this.onpressed});

  IconData icon;
  Function onpressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onpressed,
      shape: CircleBorder(),
      child: Icon(
        icon,
        color: Colors.white,
      ),
      elevation: 6,
      fillColor: Color(0xFF4C4F5E),
      constraints: BoxConstraints.tightFor(
        height: 56,
        width: 56,
      ),
    );
  }
}
