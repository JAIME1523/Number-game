
import 'package:flutter/material.dart';


class SliderInfo extends StatelessWidget {
  const SliderInfo({super.key});
  @override
  Widget build(BuildContext context) {
    final styleText = Theme.of(context).textTheme;
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Text('5', style: styleText.bodyLarge!.copyWith(color: _switcCholor(1)),),
        Slider(
            min: 0,
            max: 3,
            divisions: 3,
            value: 0,
            onChanged: (value) {
            }),
      ],
    );
  }

  _switcCholor(double level){
      switch (level) {
        case 0:
          return Colors.green;
           case 1:
          return Colors.amber;
           case 2:
          return Colors.orange;
           case 3:
          return Colors.red;
        default:
         return const Color.fromARGB(255, 85, 6, 0);
      }
  }
}
