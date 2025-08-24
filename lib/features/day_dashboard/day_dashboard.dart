import 'package:flutter/material.dart';

class DayDashboardPage extends StatelessWidget {
  const DayDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Day Dashboard'),
      ),
  body: Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Day Dashboard coming soon'),
        const SizedBox(height: 16),
        Image.asset(
          'assets/demo/grey_ball.png',
          width: 200,
          height: 200,
        ),
      ],
    ),
  ),
  ), ),
    );
  }
}
