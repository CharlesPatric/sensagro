import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sensagro/screens/home_page.dart';

import '../providers/theme_provider.dart';
import 'package:sensagro/screens/about_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Inventario'),

        actions: [
          IconButton(
            icon: Icon(
              themeProvider.isDarkMode ? Icons.light_mode : Icons.dark_mode,
            ),
            onPressed: () {
              themeProvider.toggleTheme();
            },
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [
            _menuCard(context, "Sensores", Icons.inventory, Colors.blue, () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => HomePage()),
              );
            }),

            const SizedBox(height: 15),

            _menuCard(context, "Reportes", Icons.bar_chart, Colors.green),

            const SizedBox(height: 15),

            _menuCard(context, "Quiénes Somos", Icons.info, Colors.orange, () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const AboutScreen()),
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _menuCard(
    BuildContext context,
    String titulo,
    IconData icono,
    Color color, [
    VoidCallback? onTap,
  ]) {
    return InkWell(
      onTap: onTap,

      child: Card(
        elevation: 5,

        child: Container(
          width: double.infinity,
          height: 100,

          padding: const EdgeInsets.all(20),

          child: Row(
            children: [
              Icon(icono, size: 40, color: color),

              SizedBox(width: 20),

              Text(
                titulo,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
