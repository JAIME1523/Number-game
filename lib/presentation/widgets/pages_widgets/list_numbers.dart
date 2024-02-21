import 'package:flutter/material.dart';

import '../../../infreestructure/model/model.dart';

class ListNumbers extends StatelessWidget {
  const ListNumbers({
    super.key,
    required this.llistNumbers,
    required this.title,
  });

  final List<NumberModel> llistNumbers;
  final String title;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final colors = Theme.of(context).colorScheme;
    return Container(
      height: size.height * 0.35,
      width: (size.width - 40) * 0.30,
      decoration: BoxDecoration(
        color: colors.onInverseSurface,
        boxShadow: const [
        BoxShadow(
          color: Color.fromARGB(255, 141, 141, 141),
          offset: Offset(7, 7),
          blurRadius: 6,
        ),
        
      ], borderRadius: BorderRadius.circular(15)),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Text(title),
            ...llistNumbers.map((answer) => Container(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  width: (size.width - 40) * 0.2,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: colors.secondaryContainer),
                  child: Center(
                    child: Text(
                      '${answer.number}',
                      style: TextStyle(
                          fontSize: 20,
                          color: answer.isCorrect == null
                              ? null
                              : answer.isCorrect!
                                  ? Colors.green
                                  : Colors.red),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
