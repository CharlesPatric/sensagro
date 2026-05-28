import 'package:cloud_firestore/cloud_firestore.dart';

class Medicion {
  final double temperatura;
  final double humedadAmbiente;
  final double humedadSuelo;
  final String estado;
  final String lugarId;
  final String dispositivoId;
  final DateTime ts;

  Medicion({
    required this.temperatura,
    required this.humedadAmbiente,
    required this.humedadSuelo,
    required this.estado,
    required this.lugarId,
    required this.dispositivoId,
    required this.ts,
  });

  factory Medicion.fromFirestore(Map<String, dynamic> data) {
    return Medicion(
      temperatura: (data['temperatura'] ?? 0).toDouble(),
      humedadAmbiente: (data['humedadAmbiente'] ?? 0).toDouble(),
      humedadSuelo: (data['humedadSuelo'] ?? 0).toDouble(),
      estado: data['estado'] ?? '',
      dispositivoId: data['dispositivoId'] ?? '',
      lugarId: data['lugarId'] ?? '',
      ts: data['ts'] != null
          ? (data['ts'] as Timestamp).toDate()
          : DateTime.now(),
    );
  }
}
