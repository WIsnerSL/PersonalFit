import '../entities/personal_entity.dart';

abstract class PersonalRepository {
  Future<List<Personal>> getAll();
}
