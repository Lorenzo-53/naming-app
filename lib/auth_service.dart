import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

class AuthService {
  final LocalAuthentication localAuth = LocalAuthentication();

  Future<bool> authenticateLocally() async {
    bool isAuthenticate = false;

    try {
      isAuthenticate = await localAuth.authenticate(
        localizedReason:
            "verify to access this hightech militry grade interface  !!!",
        biometricOnly: false,
        persistAcrossBackgrounding: true,
      );
    } on LocalAuthException catch (e) {
      if (e.code == LocalAuthExceptionCode.noBiometricHardware) {
        Scaffold(
          appBar: AppBar(title: Text("No Biometric Hardware")),
          body: Center(
            child: Text("Your device does not have biometric hardware."),
          ),
        );
      } else if (e.code == LocalAuthExceptionCode.temporaryLockout ||
          e.code == LocalAuthExceptionCode.biometricLockout) {
        Scaffold(
          appBar: AppBar(title: Text(" Biometric is glitching buddy!")),
          body: Center(
            child: Text(
              "Your device's  biometric hardware is not responding efficiently.",
            ),
          ),
        );
      } else {
        Scaffold(
          appBar: AppBar(title: Text("kuch to gadbad haii daya ")),
          body: Center(child: Text("{$e}")),
        );
      }
    } catch (e) {
      isAuthenticate = false;
      print("error ! {$e}");
    }
    return isAuthenticate;
  }
}
