import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../provider/provider.dart';

class SliderInfo extends StatelessWidget {
  const SliderInfo({super.key});
  @override
  Widget build(BuildContext context) {
    final styleText = Theme.of(context).textTheme;
    final homeProvider = context.watch<HomeProvider>();
    final size = MediaQuery.sizeOf(context);

    return Column(
      children: [
        SizedBox(
          height: size.height * 0.05,
        ),
        Text(
          homeProvider.game.level,
          style: styleText.bodyLarge!.copyWith(color: _switcCholor(homeProvider.valueSlider).color),
        ),
        Icon(_switcCholor(homeProvider.valueSlider).icon,
          color: _switcCholor(homeProvider.valueSlider).color,
        ),
        const SizedBox(
          height: 5,
        ),
        const Text('Rango de numeros'),
        Text('1 - ${homeProvider.game.numberRange}',
          style: styleText.bodyLarge!.copyWith(color: _switcCholor(homeProvider.valueSlider).color),
        ),
        Slider(
            min: 0,
            max: 3,
            thumbColor:  _switcCholor(homeProvider.valueSlider).color,
            activeColor:  _switcCholor(homeProvider.valueSlider).color,
            divisions: 3,
            value: homeProvider.valueSlider,
            onChanged: (value) {
              homeProvider.valueSlider = value;
              homeProvider.selectLevel();
            }),
      ],
    );
  }

  _LevelInfo _switcCholor(double level) {
    switch (level) {
      case 0:
        return _LevelInfo(color: Colors.green, icon: FontAwesomeIcons.baby);
      case 1:
        return _LevelInfo(color: Colors.amber, icon: FontAwesomeIcons.childCombatant);
      case 2:
        return _LevelInfo(color: Colors.orange, icon: FontAwesomeIcons.personRifle);
      case 3:
        return _LevelInfo(color: Colors.red, icon: FontAwesomeIcons.skull);
      default:
        return _LevelInfo(color: Colors.green, icon: FontAwesomeIcons.baby);
    }
  }
}

class _LevelInfo {
  final Color color;
  final IconData icon;

  _LevelInfo({required this.color, required this.icon});
}
