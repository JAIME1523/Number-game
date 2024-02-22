import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../provider/provider.dart';
import '../../widgets/widgets.dart';

class InputInfo extends StatelessWidget {
  const InputInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final styleText = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;

    final provider = context.watch<HomeProvider>();
    final size = MediaQuery.sizeOf(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          width: size.width * 0.35,
          child: CustomInputField(
            controller: provider.answerController,
            labelText: 'Numero',
            keyboardType: TextInputType.number,
            inputFormatters: [
              LengthLimitingTextInputFormatter(6),
              FilteringTextInputFormatter.digitsOnly
            ],
            onSubmitted: (value) {
              provider.checkAnswer(value);
            },
          ),
        ),
        Column(
          children: [
            Text(
              'Intentos',
              style: styleText.bodyLarge,
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                const Icon(
                  Icons.favorite,
                  size: 50,
                  color: Colors.red,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text('${provider.game.maxChance}',
                      style: styleText.bodyLarge!.copyWith(
                          fontSize: 20, color: colors.secondaryContainer)),
                ),
              ],
            )
          ],
        )
      ],
    );
  }
}
