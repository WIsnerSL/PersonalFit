import '../../data/models/contact_interest_model.dart';
import '../entities/personal_entity.dart';

abstract class PersonalRepository {
  Future<List<Personal>> getAll();

  Future<void> sendContactInterest(ContactInterestModel interest);
}
