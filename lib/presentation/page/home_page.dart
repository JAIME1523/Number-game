import 'package:flutter/material.dart';

import '../widgets/widgets.dart';
import 'widgets_page/input_info.dart';
import 'widgets_page/slider_info.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adivina el numero'),
   
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 10),
        child: ListView(
          children: const [
            InputInfo(),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ListNumbers(llistNumbers: [],title: 'Menor que',),
                ListNumbers(llistNumbers: [], title: 'Mayor que'),
                ListNumbers(llistNumbers: [],title: 'Historial',
                ),
              ],
            ),
            SliderInfo()
          ],
        ),
      ),
    );
  }
}
