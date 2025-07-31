import '../../domain/entities/personal_entity.dart';

class PersonalModel extends Personal {
  PersonalModel({
  required String id,
    required int age,
    required String name,
    required String photoUrl,
    required List<String> specialties,
    required String bio,
    required String city,
    required String state,
    required double price,
    required double rating,
    required String whatsapp,
  }) : super(
    id: id,
    age: age,
    name: name,
    photoUrl: photoUrl,
    specialties: specialties,
    bio: bio,
    city: city,
    state: state,
    price: price,
    rating: rating,
    whatsapp: whatsapp,
  );



  factory PersonalModel.fromJson(Map<String, dynamic> json) {
    return PersonalModel(
      id: json['id'],
      name: json['name'],
      age: json['age'],
      photoUrl: json['photoUrl'],
      specialties: List<String>.from(json['specialties']),
      bio: json['bio'],
      city: json['city'],
      state: json['state'],
      price: (json['price'] as num).toDouble(),
      rating: (json['rating'] as num).toDouble(),
      whatsapp: json['whatsapp'],
    );
  }

  Personal toEntity() => this;
}
