import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/provider.dart';
import '../widgets/widgets.dart';
import 'widgets_page/input_info.dart';
import 'widgets_page/slider_info.dart';
import 'widgets_page/widgets_page.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<HomeProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Adivina el numero'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 10),
        child: ListView(
          children:  [
            const InputInfo(),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ListNumbers(llistNumbers: provider.minorList,title: 'Menor que',),
                ListNumbers(llistNumbers: provider.majorList, title: 'Mayor que'),
                ListNumbers(llistNumbers: provider.answerList,title: 'Historial',
                ),
              ],
            ),
            const SliderInfo()
          ],
        ),
      ),
    floatingActionButton:RestartButton(
      onPressed: 
             (){ provider.resetetGame();}
    ) ,
    );
  }
}
