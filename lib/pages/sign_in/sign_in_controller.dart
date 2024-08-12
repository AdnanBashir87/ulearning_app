import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app/common/entities/entities.dart';
import 'package:ulearning_app/common/values/constant.dart';
import 'package:ulearning_app/common/widgets/toast.dart';
import 'package:ulearning_app/common/routes/route_names.dart';
import 'package:ulearning_app/global.dart';

import 'bloc/sign_in_bloc.dart';

class SignInController {
  final BuildContext context;

  const SignInController(this.context);

  Future<void> handleSignIn(String type) async {
    try {
      if (type == "email") {
        final state = context.read<SignInBloc>().state;
        String emailAddress = state.email;
        String password = state.password;
        if (emailAddress.isEmpty) {
          toastInfo(msg: "email is required!");
        }
        if (password.isEmpty) {
          toastInfo(msg: "password is required");
        }
        try {
          final credential =
              await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: emailAddress,
            password: password,
          );
          if (credential.user == null) {
            toastInfo(msg: "User does not exists");
          }
          if (!credential.user!.emailVerified) {
            toastInfo(msg: "Please verify your email account!");
          }
          var user = credential.user;
          if (user != null) {
            String? displayName = user.displayName;
            String? email = user.email;
            String? id = user.uid;
            String? photoUrl = user.photoURL;

            LoginRequestEntity loginRequestEntity = LoginRequestEntity();
            loginRequestEntity.avatar = photoUrl;
            loginRequestEntity.name = displayName;
            loginRequestEntity.open_id = id;
            loginRequestEntity.email = email;
            loginRequestEntity.type = 1;

            Global.storageService
                .setString(AppConstants.STORAGE_USER_TOKEN_KEY, "12345678");
            Navigator.of(context).pushNamedAndRemoveUntil(
              AppRoutes.APPLICATION_PAGE,
              (route) => false,
            );
          } else {
            toastInfo(msg: "currently you are not a user!");
          }
        } on FirebaseAuthException catch (e) {
          if (e.code == "invalid-credential") {
            toastInfo(msg: "Something went wrong! Please try again.");
          } else if (e.code == "too-many-requests") {
            toastInfo(msg: "Too many attempts! Please try again later!");
          } else if (e.code == "user-not-found") {
            toastInfo(msg: "Email not found ");
          } else if (e.code == "invalid-email") {
            toastInfo(msg: "Please enter valid email");
          }
        }
      }
    } catch (e) {
      print(e);
    }
  }
}
