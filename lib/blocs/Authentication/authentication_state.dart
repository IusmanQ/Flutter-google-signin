import 'package:equatable/equatable.dart';

abstract class AuthenticationState extends Equatable {
  @override
  // TODO: implement props
  AuthenticationState([List props = const []]) : super(props);
}

class Uninitialized extends AuthenticationState {
  @override
  String toString() => 'Uninitialized';
}

class Authenticated extends AuthenticationState {
  final String displayName;

  Authenticated(this.displayName) : super([displayName]);
  @override
  String toString() => 'Authenticated {displayName: $displayName}';
}

class Unauthenticated extends AuthenticationState {
  @override
  String toString() => 'Unauthenticated';
}