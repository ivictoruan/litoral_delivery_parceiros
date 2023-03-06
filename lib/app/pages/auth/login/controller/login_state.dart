// import 'package:equatable/equatable.dart';
// import 'package:match/match.dart';

// part 'login_state.g.dart';
// @match
// enum LoginStatus {
//   initial,
//   success,
//   login,
//   loginError,
//   error,
// }

// class LoginState extends Equatable {
//   final LoginStatus status;
//   final String? errorMessage;

//   const LoginState(this.errorMessage, {
//     required this.status,
//   });

//   const LoginState.initial() : status = LoginStatus.initial, errorMessage = null;

 

//   @override
//   List<Object?> get props =>[status, errorMessage];

//   LoginState copyWith({
//     LoginStatus? status,
//     String? errorMessage,
//   }) {
//     return LoginState(
//       status: status ?? this.status,
//       errorMessage ?? this.errorMessage,
//     );
//   }
// }