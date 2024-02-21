import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../widgets/widgets.dart';


class InputInfo extends StatelessWidget {
  const InputInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final styleText = Theme.of(context).textTheme;

    final size = MediaQuery.sizeOf(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          width: size.width * 0.35,
          child: CustomInputField(
            labelText: 'Numero',
            keyboardType: TextInputType.number,
            inputFormatters: [
              LengthLimitingTextInputFormatter(6),
              FilteringTextInputFormatter.digitsOnly
            ],
         
          ),
        ),
        Column(
          children: [
            Text(
              'Intentos',
              style: styleText.bodyLarge,
            ),
            Text('5',
                style: styleText.bodyLarge!.copyWith(fontSize: 25))
          ],
        )
      ],
    );
  }
}
