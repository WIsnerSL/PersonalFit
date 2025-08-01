import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../domain/entities/personal_entity.dart';
import '../../data/models/personal.dart';
import '../models/contact_interest_model.dart';

abstract class PersonalRemoteDatasource {
  Future<List<Personal>> fetchAll();
  Future<void> sendContactInterest(ContactInterestModel interest);
}

class PersonalRemoteDatasourceImpl implements PersonalRemoteDatasource {
  final String baseUrl = 'http://10.0.2.2:3000';

  @override
  Future<List<Personal>> fetchAll() async {
    final response = await http.get(Uri.parse('$baseUrl/personals'));

    if (response.statusCode == 200) {
      final body = utf8.decode(response.bodyBytes);
      final List<dynamic> jsonList = jsonDecode(body);
      return jsonList.map((json) => PersonalModel.fromJson(json)).toList();
    } else {
      throw Exception('Erro ao buscar os personal trainers');
    }
  }

  @override
  Future<void> sendContactInterest(ContactInterestModel model) async {
    final url = Uri.parse('$baseUrl/contactInterest');
    print('Enviando POST para $url com: ${model.toJson()}');

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(model.toJson()),
    );

    print('Status: ${response.statusCode}');
    print('Body: ${response.body}');

    if (response.statusCode != 201) {
      throw Exception('Erro ao enviar interesse de contato');
    }
  }
}
