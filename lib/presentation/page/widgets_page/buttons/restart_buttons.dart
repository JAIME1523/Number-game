import 'package:flutter/material.dart';

class RestartButton extends StatelessWidget {
  const RestartButton({
    super.key,
    this.onPressed,
  });
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (_) => AlertDialog(
                    title: const Text('Alerta !!!!'),
                    content: const Text('Seguro que desa reinicar el progreso'),
                    actions: [
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context, true);
                          },
                          child: const Text(
                            'Si',
                            style: TextStyle(color: Colors.red),
                          )),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('No')),
                    ],
                  )).then((value) {
            if (value != null) {
              onPressed!();
            }
          });
        },
        icon: const Icon(Icons.restart_alt_outlined));
  }
}
