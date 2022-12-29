import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoginEmailChanged extends LoginEvent {
  final String email;

  LoginEmailChanged({this.email});
@override
  // TODO: implement props
  List<Object> get props => [email];
}

class LoginPasswordChanged extends LoginEvent {
  final String password;

  LoginPasswordChanged({this.password});
  @override
  List<Object> get props => [password];
}

class Submitted extends LoginEvent {
  final String email;
  final String password;

  Submitted({this.email, this.password});

  @override
  String toString() {
    return 'Submitted { email: $email, password: $password }';
  }
}

class LoginWithCredentialsPressed extends LoginEvent {
  final String password;
  final String email;

  LoginWithCredentialsPressed({this.password, this.email});
  @override
  List<Object> get props => [email, password];
}


class LoginWithMagicLink extends LoginEvent {
  final String email;

  LoginWithMagicLink({this.email});
  @override
  List<Object> get props => [email];
}



class LoginWithGooglePressed extends LoginEvent {
  @override
  String toString() => 'LoginWithGooglePressed';
}

