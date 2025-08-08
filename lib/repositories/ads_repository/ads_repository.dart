import 'dart:io' show Platform;

import 'package:ai_fit_coach/repositories/ads_repository/ads.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AdsRepository implements AbstractAdsRepository {
  @override
  String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-3940256099942544/6300978111';
      // return '${dotenv.env['ANDROID_ADS_UNIT_ID']}';
    } else if (Platform.isIOS) {
      //
      //return '${dotenv.env['IOS_ADS_UNIT_ID']}';

      return 'ca-app-pub-3940256099942544/2934735716';
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }
}
