import 'package:flutter/material.dart';
import 'package:mini_proyecto_01/src/imc_result.dart';

class IMCCalculator extends StatefulWidget {
  const IMCCalculator({Key? key}) : super(key: key);

  @override
  State<IMCCalculator> createState() => _IMCCalculatorState();
}

class _IMCCalculatorState extends State<IMCCalculator> {
  final _pesoController = TextEditingController();
  final _estaturaController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _pesoController.dispose();
    _estaturaController.dispose();
    super.dispose();
  }

  double _calcularIMC(double peso, double estatura) {
    return peso / (estatura * estatura);
  }

  void _calcular() {
    if (_formKey.currentState!.validate()) {
      final peso = double.parse(_pesoController.text);
      final estatura = double.parse(_estaturaController.text);
      final imc = _calcularIMC(peso, estatura);

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => IMCResult(
            imc: imc,
            peso: peso,
            estatura: estatura,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CALCULADORA IMC'),
        backgroundColor: Colors.grey,
        foregroundColor: Colors.black,
      ),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height: 50),
              
              const Text(
                'CALCULA TU IMC',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 50),
              
              TextFormField(
                controller: _pesoController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'PESO (kg)',
                  hintText: '70.5',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'INGRESA PESO';
                  }
                  final peso = double.tryParse(value);
                  if (peso == null || peso <= 0) {
                    return 'PESO INVALIDO';
                  }
                  if (peso > 300) {
                    return 'PESO MUY ALTO';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              
              TextFormField(
                controller: _estaturaController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'ESTATURA (m)',
                  hintText: '1.75',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'INGRESA ESTATURA';
                  }
                  final estatura = double.tryParse(value);
                  if (estatura == null || estatura <= 0) {
                    return 'ESTATURA INVALIDA';
                  }
                  if (estatura > 3) {
                    return 'ESTATURA MUY ALTA';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 50),
              
              ElevatedButton(
                onPressed: _calcular,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey,
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                ),
                child: const Text(
                  'CALCULAR',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              const SizedBox(height: 50),
              
              const Text(
                'IMC = PESO / ESTATURA AL CUADRADO',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
