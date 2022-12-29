
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_signin/Repositories/user_repositories.dart';
import 'package:google_signin/Utils/validators.dart';

import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState>{
  final UserRepository _userRepository;
  LoginBloc({UserRepository userRepository}) : _userRepository = userRepository, super(LoginState.initial());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if(event is LoginEmailChanged) {
      yield* _mapLoginEmailChangedtoState(event.email);
    }
    else if (event is LoginPasswordChanged) {
      yield* _mapLoginPasswordChangedtoState(event.password);
    }
    else if(event is LoginWithCredentialsPressed){
      yield* _mapLoginWithCredentialsPressedtoState(email: event.email, password: event.password);
    }
    else if (event is LoginWithGooglePressed) {
      yield* _mapLoginWithGooglePressedToState();
    }
    else if (event is LoginWithMagicLink) {
      yield* _mapLoginWithMagicLinktoState();
    }
  }

  Stream<LoginState> _mapLoginEmailChangedtoState(String email) async* {
    yield state.update(
      isEmailValid: Validators.isValidEmail(email)
    );
  }

  Stream<LoginState> _mapLoginPasswordChangedtoState(String password) async* {
    yield state.update(
        isPasswordValid: Validators.isValidPassword(password)
    );
  }

  Stream<LoginState> _mapLoginWithGooglePressedToState() async* {
    try {
      await _userRepository.signInWithGoogle();
      yield LoginState.success();
    } catch (_) {
      yield LoginState.failure();
    }
  }

  Stream<LoginState> _mapLoginWithCredentialsPressedtoState({String email, String password}) async* {
    yield LoginState.loading();
    try {
      await _userRepository.SignInWithCredentials(email, password);
      yield LoginState.success();
    }
    catch(e) {
      LoginState.failure();
    }
  }

  Stream<LoginState> _mapLoginWithMagicLinktoState({String email}) async* {
    yield LoginState.loading();
    try {
      await _userRepository.SignInWithLink(email);
      yield LoginState.success();
    }
    catch(e) {
      LoginState.failure();
    }
  }

}
