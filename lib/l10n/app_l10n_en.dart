import 'app_l10n.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppL10nEn extends AppL10n {
  AppL10nEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Shopster';

  @override
  String get onboardingSearchingTitle => 'Choose your Product';

  @override
  String get onboardingSearchingSubtitle => 'Welcome to the world of limitless choices - Your perfect product is just a click away!';

  @override
  String get onboardingShoppingTitle => 'Select Payment Method';

  @override
  String get onboardingShoppingSubtitle => 'For seamless transactions, choose your preferred payment path - Your convenience, our priority!';

  @override
  String get onboardingDeliveryTitle => 'Deliver at your Doorstep';

  @override
  String get onboardingDeliverySubtitle => 'From our doorstep to yours, your order is on its way - Swift, secure and contactless delivery!';

  @override
  String get skip => 'Skip';
}
