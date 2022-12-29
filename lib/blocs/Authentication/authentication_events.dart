import 'package:equatable/equatable.dart';

class AuthenticationEvent extends Equatable {
  @override
  AuthenticationEvent([List props = const []]) : super(props);
}

class AppStarted extends AuthenticationEvent {
  @override
  String toString() => 'App Started';
}

class LoggedIn extends AuthenticationEvent {
  @override
  String toString() => 'Logged In';
}

class LoggedOut extends AuthenticationEvent {
  @override
  String toString()=> 'Logged Out';
}