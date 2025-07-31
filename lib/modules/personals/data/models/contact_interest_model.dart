class ContactInterestModel {
  final String personalId;
  final String modality;
  final String frequency;
  final String userName;
  final double estimatedPrice;

  ContactInterestModel({
    required this.personalId,
    required this.modality,
    required this.frequency,
    required this.userName,
    required this.estimatedPrice,
  });

  Map<String, dynamic> toJson() {
    return {
      'personalId': personalId,
      'modality': modality,
      'frequency': frequency,
      // 'userName': userName, // Nos requisitos não tem registro pro "userName"
      'estimatedPrice': estimatedPrice,
    };
  }
}
