import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app/pages/sign_in/bloc/sign_in_event.dart';
import 'package:ulearning_app/pages/sign_in/bloc/sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(const SignInState()) {
    on<EmailEvent>(_onEmailEvent);
    on<PasswordEvent>(_onPasswordEvent);
  }

  void _onEmailEvent(EmailEvent event, Emitter<SignInState> ask) {
    // print("email is ${event.email}");
    ask(state.copyWith(email: event.email));
  }

  void _onPasswordEvent(PasswordEvent event, Emitter<SignInState> ask) {
    // print("email is ${event.password}");
    ask(state.copyWith(password: event.password));
  }
}
