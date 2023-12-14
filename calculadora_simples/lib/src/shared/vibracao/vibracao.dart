import 'package:vibration/vibration.dart';

class Vibracao {
  static Future<void> vibrar({int duracaoMS = 500}) async {
    var possuiVibracao = await Vibration.hasVibrator();

    if (possuiVibracao != null && possuiVibracao) {
      Vibration.vibrate(duration: duracaoMS);
    }
  }
}
