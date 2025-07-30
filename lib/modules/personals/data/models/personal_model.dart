import '../../domain/entities/personal_entity.dart';

class PersonalModel extends Personal {
  PersonalModel({
    required super.id,
    required super.name,
    required super.age,
    required super.photoUrl,
    required super.city,
    required super.state,
    required super.bio,
    required super.specialties,
    required super.rating,
    required super.whatsapp,
    required super.price,
  });

  factory PersonalModel.fromJson(Map<String, dynamic> json) {
    return PersonalModel(
      id: json['id'],
      name: json['name'],
      age: json['age'],
      photoUrl: json['photoUrl'],
      city: json['city'],
      state: json['state'],
      bio: json['bio'],
      specialties: List<String>.from(json['specialties']),
      rating: (json['rating'] as num).toDouble(),
      whatsapp: json['whatsapp'],
      price: (json['price'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'age': age,
    'photoUrl': photoUrl,
    'city': city,
    'state': state,
    'bio': bio,
    'specialties': specialties,
    'rating': rating,
    'whatsapp': whatsapp,
    'price': price,
  };
}
