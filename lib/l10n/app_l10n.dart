import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_l10n_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppL10n
/// returned by `AppL10n.of(context)`.
///
/// Applications need to include `AppL10n.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_l10n.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppL10n.localizationsDelegates,
///   supportedLocales: AppL10n.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppL10n.supportedLocales
/// property.
abstract class AppL10n {
  AppL10n(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppL10n of(BuildContext context) {
    return Localizations.of<AppL10n>(context, AppL10n)!;
  }

  static const LocalizationsDelegate<AppL10n> delegate = _AppL10nDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en')
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Shopster'**
  String get appTitle;

  /// No description provided for @onboardingSearchingTitle.
  ///
  /// In en, this message translates to:
  /// **'Choose your Product'**
  String get onboardingSearchingTitle;

  /// No description provided for @onboardingSearchingSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Welcome to the world of limitless choices - Your perfect product is just a click away!'**
  String get onboardingSearchingSubtitle;

  /// No description provided for @onboardingShoppingTitle.
  ///
  /// In en, this message translates to:
  /// **'Select Payment Method'**
  String get onboardingShoppingTitle;

  /// No description provided for @onboardingShoppingSubtitle.
  ///
  /// In en, this message translates to:
  /// **'For seamless transactions, choose your preferred payment path - Your convenience, our priority!'**
  String get onboardingShoppingSubtitle;

  /// No description provided for @onboardingDeliveryTitle.
  ///
  /// In en, this message translates to:
  /// **'Deliver at your Doorstep'**
  String get onboardingDeliveryTitle;

  /// No description provided for @onboardingDeliverySubtitle.
  ///
  /// In en, this message translates to:
  /// **'From our doorstep to yours, your order is on its way - Swift, secure and contactless delivery!'**
  String get onboardingDeliverySubtitle;

  /// No description provided for @onboardingSkip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get onboardingSkip;

  /// No description provided for @signInTitle.
  ///
  /// In en, this message translates to:
  /// **'Welcome Back'**
  String get signInTitle;

  /// No description provided for @signInSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Discover limitless choices and unmatched convenience'**
  String get signInSubtitle;

  /// No description provided for @signInEmail.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get signInEmail;

  /// No description provided for @signInEnterEmail.
  ///
  /// In en, this message translates to:
  /// **'Enter your email'**
  String get signInEnterEmail;

  /// No description provided for @signInPassword.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get signInPassword;

  /// No description provided for @signInEnterPassword.
  ///
  /// In en, this message translates to:
  /// **'Enter your password'**
  String get signInEnterPassword;

  /// No description provided for @signInAction.
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get signInAction;

  /// No description provided for @signInRememberMe.
  ///
  /// In en, this message translates to:
  /// **'Remember me'**
  String get signInRememberMe;

  /// No description provided for @signInForgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password?'**
  String get signInForgotPassword;

  /// No description provided for @signInResetPassword.
  ///
  /// In en, this message translates to:
  /// **'Reset Password'**
  String get signInResetPassword;

  /// No description provided for @signInResetPasswordSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Don\'t worry, we got you covered, enter your email and we will send you a link to reset your password'**
  String get signInResetPasswordSubtitle;

  /// No description provided for @signInForgotPasswordSubmit.
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get signInForgotPasswordSubmit;

  /// No description provided for @signInVerifyEmailTitle.
  ///
  /// In en, this message translates to:
  /// **'Password Reset email sent'**
  String get signInVerifyEmailTitle;

  /// No description provided for @signInVerifyEmailSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Your account security is our priority. Please check your email for a password reset link.'**
  String get signInVerifyEmailSubtitle;

  /// No description provided for @signInOrDivider.
  ///
  /// In en, this message translates to:
  /// **'or Sign In with'**
  String get signInOrDivider;

  /// No description provided for @signUpTitle.
  ///
  /// In en, this message translates to:
  /// **'Let\'s create your Account'**
  String get signUpTitle;

  /// No description provided for @signUpName.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get signUpName;

  /// No description provided for @signUpEnterName.
  ///
  /// In en, this message translates to:
  /// **'Enter your full name'**
  String get signUpEnterName;

  /// No description provided for @signUpPhone.
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get signUpPhone;

  /// No description provided for @signUpEnterPhone.
  ///
  /// In en, this message translates to:
  /// **'Enter your phone'**
  String get signUpEnterPhone;

  /// No description provided for @signUpIAgree.
  ///
  /// In en, this message translates to:
  /// **'I agree to'**
  String get signUpIAgree;

  /// No description provided for @signUpTermsAndConditions.
  ///
  /// In en, this message translates to:
  /// **'Terms and Privacy Policy'**
  String get signUpTermsAndConditions;

  /// No description provided for @signUpAction.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get signUpAction;

  /// No description provided for @signUpOrDivider.
  ///
  /// In en, this message translates to:
  /// **'or Sign Up with'**
  String get signUpOrDivider;

  /// No description provided for @signUpVerifyEmailTitle.
  ///
  /// In en, this message translates to:
  /// **'Verify your Email'**
  String get signUpVerifyEmailTitle;

  /// No description provided for @signUpVerifyEmailSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Your account has been created successfully. Please verify your email address to complete the registration process.'**
  String get signUpVerifyEmailSubtitle;

  /// No description provided for @signUpVerifyContinue.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get signUpVerifyContinue;

  /// No description provided for @signUpVerifyResendEmail.
  ///
  /// In en, this message translates to:
  /// **'Resend Email'**
  String get signUpVerifyResendEmail;

  /// No description provided for @signUpSuccessTitle.
  ///
  /// In en, this message translates to:
  /// **'Your Account has been successfully created'**
  String get signUpSuccessTitle;

  /// No description provided for @signUpSuccessSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Your Account has been successfully created'**
  String get signUpSuccessSubtitle;
}

class _AppL10nDelegate extends LocalizationsDelegate<AppL10n> {
  const _AppL10nDelegate();

  @override
  Future<AppL10n> load(Locale locale) {
    return SynchronousFuture<AppL10n>(lookupAppL10n(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppL10nDelegate old) => false;
}

AppL10n lookupAppL10n(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppL10nEn();
  }

  throw FlutterError(
    'AppL10n.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
