import 'package:flutter/material.dart';

class WethaerView extends StatelessWidget {
  const WethaerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Text('Sohag, Egypt',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
            ),
        const Text('update: 12:00 PM',
            style: TextStyle(
              fontSize: 16,
            ),
            ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(
              'assets/images/clear.png',
              height: 100,
              width: 100,
            ),
            const Text("17°",
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                )),
            const Column(
              children: [
                 Text('max: 20°',
                    style: TextStyle(
                      fontSize: 16,
                    ),),
                 Text('min: 15°',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                    ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
