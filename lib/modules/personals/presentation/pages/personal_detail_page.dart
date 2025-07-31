import 'package:flutter/material.dart';
import 'package:personal_fit/modules/personals/presentation/pages/personal_simulation_page.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../../data/datasources/personal_remote_ds.dart';
import '../../data/repositories/personal_repository_impl.dart';
import '../../domain/entities/personal_entity.dart';
import '../controllers/personal_controller.dart';



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
              onPressed: () async {
                final phone = personal.whatsapp.replaceAll(RegExp(r'\D'), '');
                final uri = Uri.parse('https://api.whatsapp.com/send?phone=55$phone');

                try {
                  await launchUrl(uri, mode: LaunchMode.externalApplication);
                } catch (e) {
                  print('Erro ao tentar abrir WhatsApp: $e');
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Não foi possível abrir o WhatsApp')),
                  );
                }
              },
              style: ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(45)),
            ),



            const SizedBox(height: 12),
            OutlinedButton(
              child: const Text('Quero contratar'),
              onPressed: () {
                final controller = PersonalController(
                  PersonalRepositoryImpl(
                    PersonalRemoteDatasourceImpl(),
                  ),
                );

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => PersonalSimulationPage(
                      personal: personal,
                      controller: controller,
                    ),
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
