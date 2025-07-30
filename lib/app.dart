import 'package:flutter/material.dart';
import 'modules/personals/data/datasources/personal_remote_ds.dart';
import 'modules/personals/data/repositories/personal_repository_impl.dart';
import 'modules/personals/domain/repositories/personal_repository.dart';
import 'modules/personals/presentation/controllers/personal_controller.dart';
import 'modules/personals/presentation/pages/personal_list_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final datasource = PersonalRemoteDatasourceImpl();
    final PersonalRepository repository = PersonalRepositoryImpl(datasource);
    final controller = PersonalController(repository);


    return MaterialApp(
      title: 'Personal Fit',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: PersonalListPage(controller: controller),
    );
  }
}
