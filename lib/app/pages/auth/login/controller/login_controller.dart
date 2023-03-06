// import 'dart:developer';

// import 'package:bloc/bloc.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// import '../../../../core/exceptions/unauthorized_exception.dart';
// import '../../../../models/auth_model.dart';
// import '../../../../repositories/auth/auth_repository.dart';
// import 'login_state.dart';

// class LoginController extends Cubit<LoginState> {
//   final AuthRepository _authRepository;

//   LoginController(this._authRepository) : super(const LoginState.initial());

//   Future<void> login(String email, String password) async {
//     try {
//       emit(state.copyWith(status: LoginStatus.login));
//       final AuthModel authModel = await _authRepository.login(email, password);
//       emit(state.copyWith(status: LoginStatus.success));
//       final sp = await SharedPreferences.getInstance();
//       sp.setString("accessToken", authModel.accessToken);
//       sp.setString("refreshToken", authModel.refreshToken);
//     } on UnauthorizedException catch (e, s) {
//       log("Login e senha inválidos!", error: e, stackTrace: s);
//       emit(
//         state.copyWith(
//           status: LoginStatus.loginError,
//           errorMessage: "Login ou senha inválidos!",
//         ),
//       );
//     } catch (e, s) {
//       log("Erro ao registrar usuário", error: e, stackTrace: s);
//       emit(
//         state.copyWith(
//           status: LoginStatus.error,
//           errorMessage: "Erro ao realizar login!",
//         ),
//       );
//     }
//   }
// }
