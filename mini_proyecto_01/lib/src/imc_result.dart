import 'package:flutter/material.dart';

class IMCResult extends StatelessWidget {
  final double imc;
  final double peso;
  final double estatura;

  const IMCResult({
    Key? key,
    required this.imc,
    required this.peso,
    required this.estatura,
  }) : super(key: key);

  String _getClasificacion(double imc) {
    if (imc < 18) {
      return 'Peso Bajo';
    } else if (imc >= 18 && imc <= 24.9) {
      return 'Normal';
    } else if (imc >= 25 && imc <= 26.9) {
      return 'Sobrepeso';
    } else if (imc >= 27 && imc <= 29.9) {
      return 'Obesidad Grado I';
    } else if (imc >= 30 && imc <= 39.9) {
      return 'Obesidad Grado II';
    } else {
      return 'Obesidad Grado III';
    }
  }

  String _getDescripcion(double imc) {
    if (imc < 18) {
      return 'Necesario valorar signos de desnutrición';
    } else if (imc >= 18 && imc <= 24.9) {
      return 'Mantén una dieta equilibrada y ejercicio regular';
    } else if (imc >= 25 && imc <= 26.9) {
      return 'Considera ajustar tu alimentación y aumentar la actividad física';
    } else if (imc >= 27 && imc <= 29.9) {
      return 'Riesgo relativo para desarrollar enfermedades cardiovasculares';
    } else if (imc >= 30 && imc <= 39.9) {
      return 'Riesgo relativo muy alto para el desarrollo de enfermedades cardiovasculares';
    } else {
      return 'Riesgo relativo extremadamente alto para el desarrollo de enfermedades';
    }
  }

  Color _getColorClasificacion(double imc) {
    if (imc < 18) {
      return Colors.blue;
    } else if (imc >= 18 && imc <= 24.9) {
      return Colors.green;
    } else if (imc >= 25 && imc <= 26.9) {
      return Colors.orange;
    } else if (imc >= 27 && imc <= 29.9) {
      return Colors.deepOrange;
    } else if (imc >= 30 && imc <= 39.9) {
      return Colors.red;
    } else {
      return Colors.purple;
    }
  }

  IconData _getIconClasificacion(double imc) {
    if (imc < 18) {
      return Icons.trending_down;
    } else if (imc >= 18 && imc <= 24.9) {
      return Icons.check_circle;
    } else if (imc >= 25 && imc <= 26.9) {
      return Icons.warning;
    } else if (imc >= 27 && imc <= 29.9) {
      return Icons.error;
    } else if (imc >= 30 && imc <= 39.9) {
      return Icons.dangerous;
    } else {
      return Icons.warning_amber_rounded;
    }
  }

  @override
  Widget build(BuildContext context) {
    final clasificacion = _getClasificacion(imc);
    final descripcion = _getDescripcion(imc);
    final color = _getColorClasificacion(imc);
    final icono = _getIconClasificacion(imc);

    return Scaffold(
      appBar: AppBar(
        title: const Text('RESULTADO IMC'),
        backgroundColor: color,
        foregroundColor: Colors.white,
      ),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 50),
            
            Icon(
              icono,
              size: 80,
              color: color,
            ),
            const SizedBox(height: 30),
            
            Text(
              'TU IMC ES:',
              style: TextStyle(
                fontSize: 20,
                color: color,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            
            Text(
              imc.toStringAsFixed(1),
              style: TextStyle(
                fontSize: 60,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            const SizedBox(height: 20),
            
            Text(
              clasificacion.toUpperCase(),
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            const SizedBox(height: 30),
            
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                border: Border.all(color: Colors.black),
              ),
              child: Text(
                descripcion.toUpperCase(),
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 30),
            
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                border: Border.all(color: Colors.grey),
              ),
              child: Column(
                children: [
                  Text(
                    'DATOS INGRESADOS:',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: color,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'PESO: ${peso.toStringAsFixed(1)} kg',
                    style: const TextStyle(fontSize: 14),
                  ),
                  Text(
                    'ESTATURA: ${estatura.toStringAsFixed(2)} m',
                    style: const TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),
            
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: color,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
              ),
              child: const Text(
                'CALCULAR OTRO',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
