import 'package:flutter/material.dart';

class MonthlyTargetCard extends StatelessWidget {
  const MonthlyTargetCard({super.key});

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
          height: 300,
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: SizedBox(
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [Text("aaa"), Text("aaa")],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
