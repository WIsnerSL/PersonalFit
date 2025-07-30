import 'package:flutter/material.dart';
import '../../domain/entities/personal_entity.dart';
import 'personal_simulation_page.dart';


class PersonalDetailPage extends StatelessWidget {
  final Personal personal;

  const PersonalDetailPage({super.key, required this.personal});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detalhes do Personal')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(personal.photoUrl),
            ),
            const SizedBox(height: 16),
            Text(
              personal.name,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Text('${personal.city}, ${personal.state}',
                style: const TextStyle(color: Colors.grey)),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.star, color: Colors.amber),
                const SizedBox(width: 4),
                Text('${personal.rating}',
                    style: const TextStyle(fontSize: 16)),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              personal.bio,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Especialidades',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 4,
              children: personal.specialties
                  .map((spec) => Chip(label: Text(spec)))
                  .toList(),
            ),

            const SizedBox(height: 24),
            ListTile(
              leading: const Icon(Icons.attach_money),
              title: const Text('Preço médio por mês'),
              subtitle:
              Text('R\$ ${personal.price.toStringAsFixed(2)}'),
            ),
            ListTile(
              leading: const Icon(Icons.phone),
              title: const Text('WhatsApp'),
              subtitle: Text('+55 ${personal.whatsapp}'),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              icon: const Icon(Icons.message),
              label: const Text('Falar no WhatsApp'),
              onPressed: () {
                final url = Uri.parse('https://wa.me/55${personal.whatsapp}');

              },
              style: ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(45)),
            ),
            const SizedBox(height: 12),
            OutlinedButton(
              child: const Text('Quero contratar'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => PersonalSimulationPage(personal: personal),
                  ),
                );
              },
              style: OutlinedButton.styleFrom(minimumSize: const Size.fromHeight(45)),
            ),
          ],
        ),
      ),
    );
  }
}
