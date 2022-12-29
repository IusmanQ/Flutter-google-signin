import 'package:equatable/equatable.dart';

abstract class RegisterEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class RegisterEmailChanged extends RegisterEvent {
  final String email;

  RegisterEmailChanged({this.email});
  @override
  // TODO: implement props
  List<Object> get props => [email];
}

class RegisterPasswordChanged extends RegisterEvent {
  final String password;

  RegisterPasswordChanged({this.password});
  @override
  List<Object> get props => [password];
}

class Submitted extends RegisterEvent {
  final String email;
  final String password;

  Submitted({this.email, this.password});

  @override
  String toString() {
    return 'Submitted { email: $email, password: $password }';
  }
}

class RegisterWithCredentialsPressed extends RegisterEvent {
  final String password;
  final String email;

  RegisterWithCredentialsPressed({this.password, this.email});
  @override
  List<Object> get props => [email, password];
}



