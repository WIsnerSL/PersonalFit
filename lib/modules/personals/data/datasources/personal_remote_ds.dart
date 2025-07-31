import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../domain/entities/personal_entity.dart';
import '../../data/models/personal.dart';

abstract class PersonalRemoteDatasource {
  Future<List<Personal>> fetchAll();
}

class PersonalRemoteDatasourceImpl implements PersonalRemoteDatasource {
  final String baseUrl = 'http://10.0.2.2:3000'; // 

  @override
  Future<List<Personal>> fetchAll() async {
    final response = await http.get(Uri.parse('$baseUrl/personals'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = jsonDecode(response.body);
      return jsonList.map((json) => PersonalModel.fromJson(json)).toList();
    } else {
      throw Exception('Erro ao buscar os personal trainers');
    }
  }
}
