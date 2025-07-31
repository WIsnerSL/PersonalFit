import '../../domain/entities/personal_entity.dart';

class PersonalModel extends Personal {
  PersonalModel({
  required String id,
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
      photoUrl: json['photoUrl'],
      specialties: List<String>.from(json['specialties']),
      bio: json['bio'],
      city: json['city'],
      state: json['state'],
      price: (json['price'] as num).toDouble(),
      rating: (json['rating'] as num).toDouble(),
      whatsapp: json['whatsapp'].toString(),
    );
  }

  Personal toEntity() => this;
}
