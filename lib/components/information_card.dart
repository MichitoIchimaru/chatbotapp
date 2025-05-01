import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class InformationCard extends StatelessWidget {
  const InformationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      margin: EdgeInsets.all(25),
      color: Colors.white,
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: () {
          debugPrint('Card tapped.');
        },
        child: SizedBox(
          width: double.infinity,
          height: 320,
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: SizedBox(
                  width: double.infinity,
                  height: 200,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(child: Center(child: Text("Card Sample"))),
                      Expanded(
                        child: CircularPercentIndicator(
                          radius: 250 / 4,
                          lineWidth: 10.0,
                          percent: 0.32,
                          center: Text(
                            "Total\n32%",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Color(0xFF535355)),
                          ),
                          linearGradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: <Color>[
                              Color(0xFF1AB600),
                              Color(0xFF6DD400),
                            ],
                          ),
                          rotateLinearGradient: true,
                          circularStrokeCap: CircularStrokeCap.round,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: CircularPercentIndicator(
                      radius: 200 / 4,
                      lineWidth: 10.0,
                      percent: 0.42,
                      center: Text(
                        "Item1\n42%",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Color(0xFF535355)),
                      ),
                      linearGradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: <Color>[Color(0xFF1AB600), Color(0xFF6DD400)],
                      ),
                      rotateLinearGradient: true,
                      circularStrokeCap: CircularStrokeCap.round,
                    ),
                  ),
                  Expanded(
                    child: CircularPercentIndicator(
                      radius: 200 / 4,
                      lineWidth: 10.0,
                      percent: 0.17,
                      center: Text(
                        "Item2\n17%",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Color(0xFF535355)),
                      ),
                      linearGradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: <Color>[Color(0xFFFF0000), Color(0xFFFF8888)],
                      ),
                      rotateLinearGradient: true,
                      circularStrokeCap: CircularStrokeCap.round,
                    ),
                  ),
                  Expanded(
                    child: CircularPercentIndicator(
                      radius: 200 / 4,
                      lineWidth: 10.0,
                      percent: 0.28,
                      center: Text(
                        "Item3\n28%",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Color(0xFF535355)),
                      ),
                      linearGradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: <Color>[Color(0xFFFF0000), Color(0xFFFF8888)],
                      ),
                      rotateLinearGradient: true,
                      circularStrokeCap: CircularStrokeCap.round,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
