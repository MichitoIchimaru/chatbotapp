import 'package:flutter/material.dart';
import '../components/monthly_target_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: const Column(children: [MonthlyTargetCard()]),
      ),
      backgroundColor: Colors.grey,
    );
  }
}
