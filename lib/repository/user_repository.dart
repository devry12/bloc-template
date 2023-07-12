
import 'package:bloc_template/models/users/user_model.dart';
import 'package:bloc_template/services/auth_service.dart';

class UserRepository {
  final AuthService apiService;

  UserRepository({required this.apiService});

  Future<UserModel> loginUser(String email, String password) async {
    try {
      // Panggil metode API untuk login
      final response = await apiService.login(email, password);

      // Lakukan parsing data pengguna dari response
      final userData = response['data'];
      final user = UserModel.fromJson(userData);

      return user;
    } catch (error) {
      throw Exception('Failed to login: $error');
    }
  }
}
