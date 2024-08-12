import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app/common/widgets/toast.dart';
import 'package:ulearning_app/pages/sign_up/bloc/sign_up_bloc.dart';

class SignUpController {
  final BuildContext context;

  const SignUpController(this.context);

  Future<void> handleSignUp() async {
    try {
      final state = context.read<SignUpBloc>().state;
      String username = state.username;
      String emailAddress = state.email;
      String password = state.password;
      String confirmPassword = state.confirmPassword;
      if (username.isEmpty) {
        toastInfo(msg: "Username is required!");
      }
      if (emailAddress.isEmpty) {
        toastInfo(msg: "Email is required!");
      }
      if (password.isEmpty) {
        toastInfo(msg: "Password is required!");
      }
      if (confirmPassword.isEmpty) {
        toastInfo(msg: "Passwords do not match!");
      }

      try {
        final credentials =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailAddress,
          password: password,
        );

        if (credentials.user != null) {
          await credentials.user?.sendEmailVerification();
          await credentials.user?.updateDisplayName(username);
          toastInfo(
              msg:
                  "An email has been sent to your registered email. Check you email to verify it.");
          Navigator.of(context).pop();
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == "email-already-exists") {
          toastInfo(msg: "This email already exists.");
        } else if (e.code == "invalid-email") {
          toastInfo(msg: "Please enter valid email");
        }
      }
    } catch (e) {
      print(e);
    }
  }
}
