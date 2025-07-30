import '../../domain/entities/personal_entity.dart';
import '../../domain/repositories/personal_repository.dart';
import '../datasources/personal_remote_ds.dart';

class PersonalRepositoryImpl implements PersonalRepository {
  final PersonalRemoteDatasource datasource;

  PersonalRepositoryImpl(this.datasource);

  @override
  Future<List<Personal>> getAll() => datasource.fetchAll();
}
