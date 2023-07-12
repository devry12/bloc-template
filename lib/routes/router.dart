import 'package:bloc_template/bloc/bloc.dart';
import 'package:bloc_template/repository/user_repository.dart';
import 'package:bloc_template/services/auth_service.dart';
import 'package:bloc_template/ui/screens/login/login_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;

final client = http.Client();

final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => BlocProvider(
        create: (context) => LoginBloc(
            userRepository:
                UserRepository(apiService: AuthService(client: client))),
        child: const LoginScreen(),
      ),
    ),
  ],
);
