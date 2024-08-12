import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app/pages/sign_up/bloc/sign_up_event.dart';
import 'package:ulearning_app/pages/sign_up/bloc/sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(const SignUpState()) {
    on<UsernameEvent>(_onUsernameEvent);
    on<EmailEvent>(_onEmailEvent);
    on<PasswordEvent>(_onPasswordEvent);
    on<ConfirmPasswordEvent>(_onConfirmPasswordEvent);
  }

  void _onUsernameEvent(UsernameEvent event, Emitter<SignUpState> ask) {
    // print("${event.username}");
    ask(state.copyWith(username: event.username));
  }

  void _onEmailEvent(EmailEvent event, Emitter<SignUpState> ask) {
    // print("${event.email}");
    ask(state.copyWith(email: event.email));
  }

  void _onPasswordEvent(PasswordEvent event, Emitter<SignUpState> ask) {
    // print("${event.password}");
    ask(state.copyWith(password: event.password));
  }

  void _onConfirmPasswordEvent(
      ConfirmPasswordEvent event, Emitter<SignUpState> ask) {
    // print("${event.confirmPassword}");
    ask(state.copyWith(confirmPassword: event.confirmPassword));
  }
}
