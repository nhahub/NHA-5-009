/// All user-facing copy lives here. Swap this file for a localization
/// solution (intl / easy_localization) later without touching any screen.
class AppStrings {
  AppStrings._();

  static const appName = 'EchoSign';
  static const tagline = 'Communication without limits.';
  static const subtitle = 'Real-Time Sign Language to Speech & Text';
  static const heroDescription =
      'Translate between Arabic Sign Language and text easily using artificial intelligence.';

  // Nav labels
  static const navHome = 'Home';
  static const navSignToText = 'Sign to Text';
  static const navTextToSign = 'Text to Sign';
  static const navHistory = 'History';
  static const navSettings = 'Settings';

  // Home cards
  static const signToTextTitle = 'Sign → Text';
  static const signToTextDesc = 'Use your camera to translate Arabic Sign Language into text.';
  static const signToTextCta = 'Start Translating';
  static const signToTextBadge = 'Live Camera Detection';

  static const textToSignTitle = 'Text → Sign';
  static const textToSignDesc = 'Enter Arabic text and see its translation into sign.';
  static const textToSignCta = 'Get Started';
  static const textToSignBadge = 'Animated Sign Avatar';

  static const howItWorksTitle = 'How EchoSign Works';
  static const step1Title = 'Show the Sign';
  static const step1Desc =
      'Position yourself naturally in front of your camera and perform standard Arabic Sign Language gestures.';
  static const step2Title = 'AI Recognizes It';
  static const step2Desc =
      'Intelligent neural vision instantly tracks hand joints, finger positions, and facial spatial landmarks in real-time.';
  static const step3Title = 'Get the Translation';
  static const step3Desc =
      'Clear, grammatically synthesized Arabic text and audio translation stream immediately for seamless conversation.';
}
