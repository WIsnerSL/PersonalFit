import '../../domain/entities/personal_entity.dart';
import '../../domain/repositories/personal_repository.dart';
import '../../data/models/contact_interest_model.dart';
import '../datasources/personal_remote_ds.dart';

class PersonalRepositoryImpl implements PersonalRepository {
  final PersonalRemoteDatasource datasource;

  PersonalRepositoryImpl(this.datasource);

  @override
  Future<List<Personal>> getAll() => datasource.fetchAll();

  @override
  Future<void> sendContactInterest(ContactInterestModel model) {
    return datasource.sendContactInterest(model);
  }

}
