import 'package:flutter/material.dart';
import 'package:ai_fit_coach/generated/l10n.dart';

class SettingsData {
  // Static constants for placeholders
  static const String appName = 'AI FitCoach';
  static const String contactEmail = 'support@aifitcoach.com';
  static const String companyAddress =
      '123 Fitness Street, Health City, Country';
  static const String effectiveDate = '2025-07-02';
  static const String lastUpdatedDate = '2025-07-02';

  // Map of section keys to their respective translation keys (camelCase)
  static const Map<String, List<String>> _sectionKeys = {
    'privacyPolicy': [
      'privacyPolicyEffectiveDate',
      'privacyPolicyLastUpdated',
      'privacyPolicyIntro',
      'privacyPolicyAgreement',
    ],
    'informationWeCollect': [
      'infoCollectTitle',
      'infoCollectDescription',
      'infoCollectPersonalData',
      'infoCollectPersonalDataDescription',
      'infoCollectRegisterAccount',
      'infoCollectSupport',
      'infoCollectUsageData',
      'infoCollectUsageDataDescription',
      'infoCollectDeviceInfo',
      'infoCollectLogInfo',
      'infoCollectUsageStats',
      'infoCollectLocationData',
    ],
    'howWeUseInfo': [
      'howWeUseInfoTitle',
      'howWeUseInfoDescription',
      'howWeUseInfoProvideApp',
      'howWeUseInfoImproveApp',
      'howWeUseInfoNotifications',
      'howWeUseInfoSupport',
      'howWeUseInfoAnalytics',
    ],
    'sharingInfo': [
      'sharingInfoTitle',
      'sharingInfoDescription',
      'sharingInfoServiceProviders',
      'sharingInfoLegalRequirements',
      'sharingInfoBusinessTransfers',
    ],
    'thirdPartyServices': [
      'thirdPartyServicesEmpty',
      'thirdPartyServicesTitle',
      'thirdPartyServicesDescription',
    ],
    'dataSecurity': [
      'dataSecurityTitle',
      'dataSecurityDescription',
    ],
    'yourRights': [
      'yourRightsTitle',
      'yourRightsDescription',
      'yourRightsAccessData',
      'yourRightsDeleteData',
      'yourRightsWithdrawConsent',
      'yourRightsContact',
    ],
    'childrenPrivacy': [
      'childrenPrivacyTitle',
      'childrenPrivacyDescription',
    ],
    'changesToPolicy': [
      'changesToPolicyTitle',
      'changesToPolicyDescription',
    ],
    'contactUs': [
      'contactUsTitle',
      'contactUsDescription',
      'contactUsEmail',
      'contactUsAddress',
    ],
    'rateUs': [
      'rateUsDescription',
    ],
    'rateUsHowItWorks': [
      'rateUsHowItWorksTitle',
      'rateUsHowItWorksDescription',
      'rateUsHowItWorksRedirect',
      'rateUsHowItWorksNoData',
    ],
    'rateUsDataCollection': [
      'rateUsDataCollectionTitle',
      'rateUsDataCollectionNoData',
      'rateUsDataCollectionStorePolicy',
    ],
    'rateUsWhyItMatters': [
      'rateUsWhyItMattersTitle',
      'rateUsWhyItMattersDescription',
      'rateUsWhyItMattersDiscovery',
      'rateUsWhyItMattersFeedback',
      'rateUsWhyItMattersDevelopment',
    ],
    'rateUsContact': [
      'rateUsContactTitle',
      'rateUsContactDescription',
      'rateUsContactEmail',
    ],
    'deleteAccount': [
      'deleteAccountDescription',
    ],
    'deleteAccountHowTo': [
      'deleteAccountHowToTitle',
      'deleteAccountHowToDescription',
      'deleteAccountHowToOption',
      'deleteAccountHowToEmail',
    ],
    'deleteAccountWhatHappens': [
      'deleteAccountWhatHappensTitle',
      'deleteAccountWhatHappensDescription',
      'deleteAccountWhatHappensDeleteData',
      'deleteAccountWhatHappensAnonymizedData',
    ],
    'deleteAccountRetention': [
      'deleteAccountRetentionTitle',
      'deleteAccountRetentionDescription',
      'deleteAccountRetentionLegal',
      'deleteAccountRetentionDisputes',
    ],
    'deleteAccountHelp': [
      'deleteAccountHelpTitle',
      'deleteAccountHelpDescription',
      'deleteAccountHelpEmail',
    ],
  };

  static List<String> getTranslatedSection(
      BuildContext context, String sectionKey) {
    final s = S.of(context);
    final keys = _sectionKeys[sectionKey] ?? [];
    return keys.map((key) {
      String text;
      switch (key) {
        case 'privacyPolicyEffectiveDate':
          text = s.privacyPolicyEffectiveDate(effectiveDate);
          break;
        case 'privacyPolicyLastUpdated':
          text = s.privacyPolicyLastUpdated(lastUpdatedDate);
          break;
        case 'privacyPolicyIntro':
          text = s.privacyPolicyIntro(appName);
          break;
        case 'privacyPolicyAgreement':
          text = s.privacyPolicyAgreement;
          break;
        case 'infoCollectTitle':
          text = s.infoCollectTitle;
          break;
        case 'infoCollectDescription':
          text = s.infoCollectDescription;
          break;
        case 'infoCollectPersonalData':
          text = s.infoCollectPersonalData;
          break;
        case 'infoCollectPersonalDataDescription':
          text = s.infoCollectPersonalDataDescription;
          break;
        case 'infoCollectRegisterAccount':
          text = s.infoCollectRegisterAccount;
          break;
        case 'infoCollectSupport':
          text = s.infoCollectSupport;
          break;
        case 'infoCollectUsageData':
          text = s.infoCollectUsageData;
          break;
        case 'infoCollectUsageDataDescription':
          text = s.infoCollectUsageDataDescription;
          break;
        case 'infoCollectDeviceInfo':
          text = s.infoCollectDeviceInfo;
          break;
        case 'infoCollectLogInfo':
          text = s.infoCollectLogInfo;
          break;
        case 'infoCollectUsageStats':
          text = s.infoCollectUsageStats;
          break;
        case 'infoCollectLocationData':
          text = s.infoCollectLocationData;
          break;
        case 'howWeUseInfoTitle':
          text = s.howWeUseInfoTitle;
          break;
        case 'howWeUseInfoDescription':
          text = s.howWeUseInfoDescription;
          break;
        case 'howWeUseInfoProvideApp':
          text = s.howWeUseInfoProvideApp;
          break;
        case 'howWeUseInfoImproveApp':
          text = s.howWeUseInfoImproveApp;
          break;
        case 'howWeUseInfoNotifications':
          text = s.howWeUseInfoNotifications;
          break;
        case 'howWeUseInfoSupport':
          text = s.howWeUseInfoSupport;
          break;
        case 'howWeUseInfoAnalytics':
          text = s.howWeUseInfoAnalytics;
          break;
        case 'sharingInfoTitle':
          text = s.sharingInfoTitle;
          break;
        case 'sharingInfoDescription':
          text = s.sharingInfoDescription;
          break;
        case 'sharingInfoServiceProviders':
          text = s.sharingInfoServiceProviders;
          break;
        case 'sharingInfoLegalRequirements':
          text = s.sharingInfoLegalRequirements;
          break;
        case 'sharingInfoBusinessTransfers':
          text = s.sharingInfoBusinessTransfers;
          break;
        case 'thirdPartyServicesEmpty':
          text = ''; // Handle empty string in text4
          break;
        case 'thirdPartyServicesTitle':
          text = s.thirdPartyServicesTitle;
          break;
        case 'thirdPartyServicesDescription':
          text = s.thirdPartyServicesDescription;
          break;
        case 'dataSecurityTitle':
          text = s.dataSecurityTitle;
          break;
        case 'dataSecurityDescription':
          text = s.dataSecurityDescription;
          break;
        case 'yourRightsTitle':
          text = s.yourRightsTitle;
          break;
        case 'yourRightsDescription':
          text = s.yourRightsDescription;
          break;
        case 'yourRightsAccessData':
          text = s.yourRightsAccessData;
          break;
        case 'yourRightsDeleteData':
          text = s.yourRightsDeleteData;
          break;
        case 'yourRightsWithdrawConsent':
          text = s.yourRightsWithdrawConsent;
          break;
        case 'yourRightsContact':
          text = s.yourRightsContact(contactEmail);
          break;
        case 'childrenPrivacyTitle':
          text = s.childrenPrivacyTitle;
          break;
        case 'childrenPrivacyDescription':
          text = s.childrenPrivacyDescription;
          break;
        case 'changesToPolicyTitle':
          text = s.changesToPolicyTitle;
          break;
        case 'changesToPolicyDescription':
          text = s.changesToPolicyDescription;
          break;
        case 'contactUsTitle':
          text = s.contactUsTitle;
          break;
        case 'contactUsDescription':
          text = s.contactUsDescription;
          break;
        case 'contactUsEmail':
          text = s.contactUsEmail(contactEmail);
          break;
        case 'contactUsAddress':
          text = s.contactUsAddress(companyAddress);
          break;
        case 'rateUsDescription':
          text = s.rateUsDescription;
          break;
        case 'rateUsHowItWorksTitle':
          text = s.rateUsHowItWorksTitle;
          break;
        case 'rateUsHowItWorksDescription':
          text = s.rateUsHowItWorksDescription;
          break;
        case 'rateUsHowItWorksRedirect':
          text = s.rateUsHowItWorksRedirect;
          break;
        case 'rateUsHowItWorksNoData':
          text = s.rateUsHowItWorksNoData;
          break;
        case 'rateUsDataCollectionTitle':
          text = s.rateUsDataCollectionTitle;
          break;
        case 'rateUsDataCollectionNoData':
          text = s.rateUsDataCollectionNoData;
          break;
        case 'rateUsDataCollectionStorePolicy':
          text = s.rateUsDataCollectionStorePolicy;
          break;
        case 'rateUsWhyItMattersTitle':
          text = s.rateUsWhyItMattersTitle;
          break;
        case 'rateUsWhyItMattersDescription':
          text = s.rateUsWhyItMattersDescription;
          break;
        case 'rateUsWhyItMattersDiscovery':
          text = s.rateUsWhyItMattersDiscovery;
          break;
        case 'rateUsWhyItMattersFeedback':
          text = s.rateUsWhyItMattersFeedback;
          break;
        case 'rateUsWhyItMattersDevelopment':
          text = s.rateUsWhyItMattersDevelopment;
          break;
        case 'rateUsContactTitle':
          text = s.rateUsContactTitle;
          break;
        case 'rateUsContactDescription':
          text = s.rateUsContactDescription;
          break;
        case 'rateUsContactEmail':
          text = s.rateUsContactEmail(contactEmail);
          break;
        case 'deleteAccountDescription':
          text = s.deleteAccountDescription;
          break;
        case 'deleteAccountHowToTitle':
          text = s.deleteAccountHowToTitle;
          break;
        case 'deleteAccountHowToDescription':
          text = s.deleteAccountHowToDescription;
          break;
        case 'deleteAccountHowToOption':
          text = s.deleteAccountHowToOption;
          break;
        case 'deleteAccountHowToEmail':
          text = s.deleteAccountHowToEmail(contactEmail);
          break;
        case 'deleteAccountWhatHappensTitle':
          text = s.deleteAccountWhatHappensTitle;
          break;
        case 'deleteAccountWhatHappensDescription':
          text = s.deleteAccountWhatHappensDescription;
          break;
        case 'deleteAccountWhatHappensDeleteData':
          text = s.deleteAccountWhatHappensDeleteData;
          break;
        case 'deleteAccountWhatHappensAnonymizedData':
          text = s.deleteAccountWhatHappensAnonymizedData;
          break;
        case 'deleteAccountRetentionTitle':
          text = s.deleteAccountRetentionTitle;
          break;
        case 'deleteAccountRetentionDescription':
          text = s.deleteAccountRetentionDescription;
          break;
        case 'deleteAccountRetentionLegal':
          text = s.deleteAccountRetentionLegal;
          break;
        case 'deleteAccountRetentionDisputes':
          text = s.deleteAccountRetentionDisputes;
          break;
        case 'deleteAccountHelpTitle':
          text = s.deleteAccountHelpTitle;
          break;
        case 'deleteAccountHelpDescription':
          text = s.deleteAccountHelpDescription;
          break;
        case 'deleteAccountHelpEmail':
          text = s.deleteAccountHelpEmail(contactEmail);
          break;
        default:
          text = '';
      }
      return text;
    }).toList();
  }

  // Modified buildSection to use translated strings
  static List<Widget> buildSection(
      BuildContext context, ThemeData theme, String sectionKey) {
    final texts = getTranslatedSection(context, sectionKey);
    return [
      const SizedBox(height: 16),
      ...texts.map(
        (text) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          child: Text(
            text,
            style: theme.textTheme.headlineMedium,
          ),
        ),
      ),
      const SizedBox(height: 16),
    ];
  }
}
