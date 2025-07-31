import 'package:flutter/material.dart';
import '../controllers/personal_controller.dart';
import '../../domain/entities/personal_entity.dart';
import 'personal_detail_page.dart';

class PersonalListPage extends StatefulWidget {
  final PersonalController controller;

  const PersonalListPage({super.key, required this.controller});

  @override
  State<PersonalListPage> createState() => _PersonalListPageState();
}

class _PersonalListPageState extends State<PersonalListPage> {
  late Future<List<Personal>> _futurePersonals;
  List<Personal> _allPersonals = [];
  List<Personal> _filteredPersonals = [];
  bool _isLoading = true;

  String _searchQuery = '';
  String? _selectedSpecialty;

  @override
  void initState() {
    super.initState();
    _futurePersonals = widget.controller.getPersonals();
  }

  void _filterPersonals() {
    setState(() {
      _filteredPersonals = _allPersonals.where((personal) {
        final matchesName = personal.name.toLowerCase().contains(_searchQuery.toLowerCase());
        final matchesSpecialty = _selectedSpecialty == null ||
            personal.specialties.contains(_selectedSpecialty);
        return matchesName && matchesSpecialty;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Catálogo de Personais')),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: 'Buscar por nome',
                prefixIcon: Icon(Icons.search),
              ),
                onChanged: (value) {
                  setState(() {
                    _searchQuery = value;
                  });
                }
            ),
            const SizedBox(height: 8),
            DropdownButton<String>(
              value: _selectedSpecialty,
              hint: const Text('Filtrar por especialidade'),
              isExpanded: true,
              items: [
                const DropdownMenuItem(value: null, child: Text('Selecione a especialidade')),
                ...[
                  'Emagrecimento',
                  'Funcional',
                  'Hipertrofia',
                  'Musculação',
                  'Treinamento Online',
                ].map((spec) => DropdownMenuItem(
                  value: spec,
                  child: Text(spec),
                ))
              ],
                onChanged: (value) {
                  setState(() {
                    _selectedSpecialty = value;
                  });
                }
            ),
            const SizedBox(height: 12),
            Expanded(
              child: FutureBuilder<List<Personal>>(
                future: _futurePersonals,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Erro ao carregar: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('Nenhum personal encontrado.'));
                  }

                  final allPersonals = snapshot.data!;
                  final filtered = allPersonals.where((personal) {
                    final matchesName = personal.name.toLowerCase().contains(_searchQuery.toLowerCase());
                    final matchesSpecialty = _selectedSpecialty == null ||
                        personal.specialties.contains(_selectedSpecialty);
                    return matchesName && matchesSpecialty;
                  }).toList();

                  return ListView.builder(
                    itemCount: filtered.length,
                    itemBuilder: (context, index) {
                      final personal = filtered[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 3,
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(personal.photoUrl),
                          ),
                          title: Text(
                            personal.name,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Especialidades: ${personal.specialties.join(', ')}'),
                              Text('${personal.city}, ${personal.state}'),
                              Text('Nota: ${personal.rating.toStringAsFixed(1)}'),
                            ],
                          ),
                          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => PersonalDetailPage(personal: personal),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
