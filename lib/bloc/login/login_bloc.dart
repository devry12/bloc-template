
import 'package:bloc_template/bloc/login/login_event.dart';
import 'package:bloc_template/bloc/login/login_state.dart';
import 'package:bloc_template/repository/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository userRepository;

  LoginBloc({required this.userRepository}) : super(LoginInitial()) {
    on<LoginButtonPressed>(_onLoginButtonPressed);
    on<LoginAnotherButtonPressed>(_onLoginAnotherButtonPressed);
  }

  void _onLoginButtonPressed(LoginButtonPressed event, Emitter<LoginState> emit) async {
    // emit(LoginLoading());

    try {
      print("ini event email : ${event.email} dan password : ${event.password}");
      // Panggil metode login dari UserRepository atau ApiService
      // Contoh: final response = await userRepository.login(event.email, event.password);

      // Jika login berhasil, kirim event LoginSuccess dengan data yang diperlukan
      // emit(LoginSuccess());

    } catch (error) {
      // Jika terjadi kesalahan, kirim event LoginFailure dengan pesan error
      emit(LoginFailure(error.toString()));
    }
  }
  void _onLoginAnotherButtonPressed(LoginAnotherButtonPressed event, Emitter<LoginState> emit) async {
    // emit(LoginLoading());

    try {
      print("ini another event email : ${event.email} dan password : ${event.password}");
      // Panggil metode login dari UserRepository atau ApiService
      // Contoh: final response = await userRepository.login(event.email, event.password);

      // Jika login berhasil, kirim event LoginSuccess dengan data yang diperlukan
      // emit(LoginSuccess());

    } catch (error) {
      // Jika terjadi kesalahan, kirim event LoginFailure dengan pesan error
      emit(LoginFailure(error.toString()));
    }
  }
}