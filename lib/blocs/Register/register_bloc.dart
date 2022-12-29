
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_signin/Repositories/user_repositories.dart';
import 'package:google_signin/Utils/validators.dart';
import 'package:google_signin/blocs/Register/register_events.dart';
import 'package:google_signin/blocs/Register/register_state.dart';


class RegisterBloc extends Bloc<RegisterEvent, RegisterState>{
  final UserRepository _userRepository;
  RegisterBloc({UserRepository userRepository}) : _userRepository = userRepository, super(RegisterState.initial());

  @override
  Stream<RegisterState> mapEventToState(RegisterEvent event) async* {
    if(event is RegisterEmailChanged) {
      yield* _mapRegisterEmailChangedtoState(event.email);
    }
    else if (event is RegisterPasswordChanged) {
      yield* _mapRegisterPasswordChangedtoState(event.password);
    }
    else if(event is RegisterWithCredentialsPressed){
      yield* _mapRegisterWithCredentialsPressedtoState(email: event.email, password: event.password);
    }
  }

  Stream<RegisterState> _mapRegisterEmailChangedtoState(String email) async* {
    yield state.update(
        isEmailValid: Validators.isValidEmail(email)
    );
  }

  Stream<RegisterState> _mapRegisterPasswordChangedtoState(String password) async* {
    yield state.update(
        isPasswordValid: Validators.isValidPassword(password)
    );
  }

  Stream<RegisterState> _mapRegisterWithCredentialsPressedtoState({String email, String password}) async* {
    yield RegisterState.loading();
    try {
      await _userRepository.SignUpWithCredentials(email: email, password: password);
      yield RegisterState.success();
    }
    catch(e) {
      RegisterState.failure();
    }
  }

}
