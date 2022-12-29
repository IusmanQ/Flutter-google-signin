
import 'package:bloc/bloc.dart';
import 'package:google_signin/Repositories/user_repositories.dart';
import 'package:google_signin/blocs/Authentication/authentication_events.dart';
import 'package:google_signin/blocs/Authentication/authentication_state.dart';
class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository _userRepository;

  AuthenticationBloc({UserRepository userRepository}):
        _userRepository = userRepository,
        super(Uninitialized());
  @override
  // TODO: implement initialState
  AuthenticationState get initialState => Uninitialized();

  @override
  Stream<AuthenticationState> mapEventToState(AuthenticationEvent event) async* {
    if(event is AppStarted) {
      yield* _mapAppStartedtoState();
    }
    else if (event is LoggedIn) {
      yield* _mapLoggedInState();
    }
    else if(event is LoggedOut) {
      yield* _mapLoggedOutState();
    }
  }

  Stream<AuthenticationState> _mapAppStartedtoState() async* {
    try{
      final isSignedIn = await _userRepository.isSignedin();
      if(isSignedIn) {
        final String name = await _userRepository.getUser();
        yield Authenticated(name);
      }
      else {
        yield Unauthenticated();
      }
    }
    catch(e){
      yield Unauthenticated();
    }

  }

  Stream<AuthenticationState> _mapLoggedInState() async* {
    yield Authenticated(await _userRepository.getUser());

  }

  Stream<AuthenticationState> _mapLoggedOutState() async* {
    yield Unauthenticated();
    _userRepository.SignOut();

  }

}