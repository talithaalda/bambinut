import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AuthController {
  FirebaseAuth auth = FirebaseAuth.instance;
  Stream<User> get streamAuthStatus => auth.authStateChanges();
  void login() {}
}
