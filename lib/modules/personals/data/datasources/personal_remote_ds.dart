import '../models/personal_model.dart';

abstract class PersonalRemoteDatasource {
  Future<List<PersonalModel>> fetchAll();
}

class PersonalRemoteDatasourceImpl implements PersonalRemoteDatasource {
  @override
  Future<List<PersonalModel>> fetchAll() async {
    await Future.delayed(const Duration(seconds: 1));

    return [
      PersonalModel(
        id: '1',
        name: 'Amanda Costa',
        age: 28,
        bio: 'Especialista em emagrecimento feminino.',
        specialties: ['Emagrecimento', 'Funcional'],
        rating: 4.8,
        city: 'Goiânia',
        state: 'GO',
        photoUrl: 'https://randomuser.me/api/portraits/women/1.jpg',
        whatsapp: '62988888888',
        price: 100.0,
      ),
      PersonalModel(
        id: '2',
        name: 'Carlos Eduardo',
        age: 35,
        bio: 'Focado em hipertrofia masculina e treinos intensivos.',
        specialties: ['Hipertrofia', 'Musculação'],
        rating: 4.6,
        city: 'São Paulo',
        state: 'SP',
        photoUrl: 'https://randomuser.me/api/portraits/men/2.jpg',
        whatsapp: '11998765432',
        price: 120.0,
      ),
      PersonalModel(
        id: '3',
        name: 'Juliana Ferreira',
        age: 31,
        bio: 'Atendimento online e personalizado para mulheres.',
        specialties: ['Treinamento Online', 'Funcional', 'Emagrecimento'],
        rating: 4.9,
        city: 'Belo Horizonte',
        state: 'MG',
        photoUrl: 'https://randomuser.me/api/portraits/women/3.jpg',
        whatsapp: '31991234567',
        price: 90.0,
      ),
    ];
  }
}
