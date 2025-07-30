import 'package:flutter/material.dart';
import '../../domain/entities/personal_entity.dart';

class PersonalSimulationPage extends StatefulWidget {
  final Personal personal;

  const PersonalSimulationPage({super.key, required this.personal});

  @override
  State<PersonalSimulationPage> createState() => _PersonalSimulationPageState();
}

class _PersonalSimulationPageState extends State<PersonalSimulationPage> {
  String? selectedModality;
  String? selectedFrequency;
  final frequencies = ['1x', '2x', '3x', '4x', '5x'];
  final modalities = ['Online', 'Presencial'];

  double calculateEstimatedPrice() {
    if (selectedFrequency == null) return 0.0;
    final sessions = int.parse(selectedFrequency!.replaceAll('x', ''));
    return sessions * widget.personal.price;
  }

  void sendContactInterest() {
    final estimated = calculateEstimatedPrice();
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Interesse enviado!'),
        content: Text('Você demonstrou interesse em contratar ${widget.personal.name} '
            'para aulas $selectedModality com frequência de $selectedFrequency por semana. '
            'Valor estimado: R\$ ${estimated.toStringAsFixed(2)}'),
        actions: [
          TextButton(
            onPressed: () => Navigator.popUntil(context, (route) => route.isFirst),
            child: const Text('Fechar'),
          ),
        ],

      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Simular Contratação')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Personal: ${widget.personal.name}', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 16),

            const Text('Modalidade'),
            DropdownButton<String>(
              value: selectedModality,
              hint: const Text('Selecione a modalidade'),
              isExpanded: true,
              items: modalities.map((modality) {
                return DropdownMenuItem(
                  value: modality,
                  child: Text(modality),
                );
              }).toList(),
              onChanged: (value) {
                setState(() => selectedModality = value);
              },
            ),

            const SizedBox(height: 16),
            const Text('Frequência'),
            DropdownButton<String>(
              value: selectedFrequency,
              hint: const Text('Selecione a frequência'),
              isExpanded: true,
              items: frequencies.map((freq) {
                return DropdownMenuItem(
                  value: freq,
                  child: Text('$freq por semana'),
                );
              }).toList(),
              onChanged: (value) {
                setState(() => selectedFrequency = value);
              },
            ),

            const SizedBox(height: 24),
            if (selectedFrequency != null)
              Text(
                'Valor estimado por mês: R\$ ${calculateEstimatedPrice().toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),

            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: selectedFrequency != null && selectedModality != null
                    ? sendContactInterest
                    : null,
                child: const Text('Confirmar Interesse'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
