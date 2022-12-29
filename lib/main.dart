
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_signin/Repositories/user_repositories.dart';
import 'package:google_signin/screens/home_screen.dart';
import 'package:google_signin/screens/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'blocs/Authentication/authentication_bloc.dart';
import 'blocs/Authentication/authentication_events.dart';
import 'blocs/Authentication/authentication_state.dart';
import 'blocs/bloc_observer.dart';

void main() async {
  Bloc.observer = SimpleBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final UserRepository userRepository = UserRepository();
  runApp(
    BlocProvider(
      create: (context) => AuthenticationBloc(
        userRepository: userRepository,
      )..add(AppStarted()),
      child: MyApp(
        userRepository: userRepository,
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  final UserRepository _userRepository;

  const MyApp({UserRepository userRepository}) : _userRepository = userRepository;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state) {
            if(state is Uninitialized) {
              return LoginScreen();
            }
            else if(state is Authenticated){
              return HomeScreen(name: state.displayName,);
            }
            else if(state is Unauthenticated){
              return LoginScreen(userRepository: _userRepository);
            }
            return Container(child: Center(child: Text('Hey')));
          }
        ),
      );

    //);
  }

}
