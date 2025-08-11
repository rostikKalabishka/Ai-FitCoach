import 'dart:io' show Platform;

import 'package:ai_fit_coach/repositories/ads_repository/ads.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AdsRepository implements AbstractAdsRepository {
  @override
  String get bannerAdUnitId {
    if (Platform.isAndroid) {
      // return 'ca-app-pub-3940256099942544/6300978111';
      return '${dotenv.env['ANDROID_ADS_UNIT_ID']}';
    } else if (Platform.isIOS) {
      //
      return '${dotenv.env['IOS_ADS_UNIT_ID']}';

      // return 'ca-app-pub-3940256099942544/2934735716';
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }

  @override
  String get interstitialAdUnitId {
    if (Platform.isAndroid) {
      return '${dotenv.env['ANDROID_INTERSTITIAL_AD_UNIT_ID']}';
      // return 'ca-app-pub-3940256099942544/1033173712'; // Тестовий ID для Android
    } else if (Platform.isIOS) {
      return '${dotenv.env['IOS_INTERSTITIAL_AD_UNIT_ID']}';
      // return 'ca-app-pub-3940256099942544/4411468910'; // Тестовий ID для iOS
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }

  @override
  String get nativeAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-3940256099942544/2247696110'; // Тестовий ID для Android
    } else if (Platform.isIOS) {
      return 'ca-app-pub-3940256099942544/3986624511'; // Тестовий ID для iOS
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }
}
