class ContactInterestModel {
  final String personalId;
  final String modality;
  final String frequency;
  final double estimatedPrice;

  ContactInterestModel({
    required this.personalId,
    required this.modality,
    required this.frequency,
    required this.estimatedPrice,
  });

  Map<String, dynamic> toJson() {
    return {
      'personalId': personalId,
      'modality': modality,
      'frequency': frequency,
      //'userName': userName, // Não tem nada nos requisitos falando pra ter um userName
      'estimatedPrice': estimatedPrice,
    };
  }
}
