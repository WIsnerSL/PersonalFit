import '../../data/models/contact_interest_model.dart';


abstract class ContactInterestRepository {
  Future<void> send(ContactInterestModel interest);
}
