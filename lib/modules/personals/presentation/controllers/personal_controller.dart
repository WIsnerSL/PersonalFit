import '../../data/models/contact_interest_model.dart';
import '../../domain/entities/personal_entity.dart';
import '../../domain/repositories/personal_repository.dart';


class PersonalController {
  final PersonalRepository repository;

  PersonalController(this.repository);

  Future<List<Personal>> getPersonals({
    String? nameFilter,
    String? specialtyFilter,
  }) async {
    final all = await repository.getAll();
    return all.where((p) {
      final nameMatch = nameFilter == null || p.name.toLowerCase().contains(nameFilter.toLowerCase());
      final specialtyMatch = specialtyFilter == null || p.specialties.contains(specialtyFilter);
      return nameMatch && specialtyMatch;
    }).toList();
  }

  Future<void> sendContactInterest(ContactInterestModel interest) async {
    await repository.sendContactInterest(interest);
  }
}
