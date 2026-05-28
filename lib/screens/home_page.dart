import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final medicionesRef = FirebaseFirestore.instance.collection("mediciones");

  Color estadoColor(String estado) {
    switch (estado) {
      case "CRITICO":
        return Colors.red;

      case "BAJO":
        return Colors.orange;

      default:
        return Colors.green;
    }
  }

  IconData estadoIcon(String estado) {
    switch (estado) {
      case "CRITICO":
        return Icons.warning;

      case "BAJO":
        return Icons.water_drop;

      default:
        return Icons.check_circle;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      appBar: AppBar(
        title: const Text("Agro Monitor"),

        backgroundColor: Colors.green,

        elevation: 0,
      ),

      body: StreamBuilder(
        stream: medicionesRef
            .orderBy("ts", descending: true)
            .limit(1)
            .snapshots(),

        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final docs = snapshot.data!.docs;

          if (docs.isEmpty) {
            return const Center(child: Text("Sin mediciones"));
          }

          final data = docs.first.data();

          final temperatura = data["temperatura"];

          final humedadAmbiente = data["humedadAmbiente"];

          final humedadSuelo = data["humedadSuelo"];

          final estado = data["estado"];

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),

            child: Column(
              children: [
                Card(
                  elevation: 5,

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),

                  child: Padding(
                    padding: const EdgeInsets.all(20),

                    child: Column(
                      children: [
                        Icon(
                          estadoIcon(estado),
                          size: 70,
                          color: estadoColor(estado),
                        ),

                        const SizedBox(height: 10),

                        Text(
                          estado,
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: estadoColor(estado),
                          ),
                        ),

                        const SizedBox(height: 10),

                        const Text(
                          "Estado del cultivo",
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                Row(
                  children: [
                    Expanded(
                      child: infoCard(
                        "Temperatura",
                        "$temperatura °C",
                        Icons.thermostat,
                        Colors.red,
                      ),
                    ),

                    const SizedBox(width: 10),

                    Expanded(
                      child: infoCard(
                        "Humedad Aire",
                        "$humedadAmbiente %",
                        Icons.cloud,
                        Colors.blue,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                infoCard(
                  "Humedad Suelo",
                  "$humedadSuelo %",
                  Icons.water_drop,
                  Colors.green,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget infoCard(String titulo, String valor, IconData icono, Color color) {
    return Card(
      elevation: 4,

      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),

      child: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [
            Icon(icono, size: 40, color: color),

            const SizedBox(height: 10),

            Text(titulo, style: const TextStyle(fontSize: 18)),

            const SizedBox(height: 10),

            Text(
              valor,
              style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
