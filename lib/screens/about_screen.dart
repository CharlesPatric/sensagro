import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Quiénes Somos')),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Text(
              'Aplicativo para ver sensores',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 20),

            Text(
              'Aplicación desarrollada en Flutter para la gestión de sensores.',
              style: TextStyle(fontSize: 16),
            ),

            SizedBox(height: 20),

            Text('Versión 1.0.0'),
          ],
        ),
      ),
    );
  }
}
