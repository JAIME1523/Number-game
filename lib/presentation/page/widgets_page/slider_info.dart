
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/provider.dart';


class SliderInfo extends StatelessWidget {
  const SliderInfo({super.key});
  @override
  Widget build(BuildContext context) {
    final styleText = Theme.of(context).textTheme;
    final homeProvider = context.watch<HomeProvider>();

    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Text(homeProvider.game.level, style: styleText.bodyLarge!.copyWith(color: _switcCholor(homeProvider.valueSlider)),),
        Slider(
            min: 0,
            max: 3,
            divisions: 3,
             value: homeProvider.valueSlider,
            onChangeEnd: (value) => homeProvider.selectLevel(),
            onChanged: (value) {
              homeProvider.valueSlider = value;
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
