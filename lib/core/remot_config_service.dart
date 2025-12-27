import 'package:firebase_remote_config/firebase_remote_config.dart';

class RemoteConfigService {
  static final FirebaseRemoteConfig _remoteConfig = FirebaseRemoteConfig.instance;

  static Future<void> setupRemoteConfig() async {
//************************** بحدد الوقت اللى الفاير بيز يعمل تشيك هل في ابديت ولا لا ************************
    await _remoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(minutes: 1),
      minimumFetchInterval:  Duration.zero,
    ));
    await _remoteConfig.fetchAndActivate();
  }

  static String getWelcomeMessage() {
    return _remoteConfig.getString('welcome_message');
  }
  static bool showText(){

    return _remoteConfig.getBool('showText');

  }
  static bool currencyy(){
    return _remoteConfig.getBool('currency');
  }
}