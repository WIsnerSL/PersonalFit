import 'package:flutter/material.dart';

import 'modules/personals/data/datasources/personal_remote_ds.dart';
import 'modules/personals/data/repositories/personal_repository_impl.dart';
import 'modules/personals/domain/entities/personal_entity.dart';
import 'modules/personals/presentation/controllers/personal_controller.dart';
import 'modules/personals/presentation/pages/personal_list_page.dart';

void main() {
  runApp(const PersonalFitApp());
}

class PersonalFitApp extends StatelessWidget {
  const PersonalFitApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Injeção manual de dependências (sem usar pacote externo ainda)
    final datasource = PersonalRemoteDatasourceImpl();
    final repository = PersonalRepositoryImpl(datasource);
    final controller = PersonalController(repository);

    return MaterialApp(
      title: 'Personal Fit',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: PersonalListPage(controller: controller),
    );
  }
}
