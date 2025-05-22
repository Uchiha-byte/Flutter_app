class AppConstants {
  // App Info
  static const String appName = 'Nikah Min Sunnati';
  static const String appTagline = 'Largest Muslim Matrimonial Website';
  static const String appDescription = 'Find your perfect Muslim Brides & Grooms';
  static const String helpLine = '91-7386000026';

  // Contact Info
  static const String address = 'Pillar No 35, Mehdipatnam, Hyderabad';
  static const String website = 'https://nikahminsunnati.com';
  static const String email = 'info@nikahminsunnati.com';
  static const String phone = '+91-7386000026';

  // Package Plans
  static const List<Map<String, dynamic>> packagePlans = [
    {
      'name': 'SILVER PLAN',
      'duration': '30 Days',
      'price': 'Rs50',
      'features': [
        '2 Express Interests',
        '3 Gallery Photo Upload',
        '0 Contact Info View',
        'Show Auto Profile Match',
      ],
    },
    {
      'name': 'GOLD PLAN',
      'duration': '365 Days',
      'price': 'Rs100',
      'features': [
        '12 Express Interests',
        '10 Gallery Photo Upload',
        '12 Contact Info View',
        'Show Auto Profile Match',
      ],
    },
    {
      'name': 'DIAMOND PLAN',
      'duration': '365 Days',
      'price': 'Rs199',
      'features': [
        '25 Express Interests',
        '10 Gallery Photo Upload',
        '365 Contact Info View',
        'Show Auto Profile Match',
      ],
    },
  ];

  // How It Works Steps
  static const List<Map<String, String>> howItWorksSteps = [
    {
      'title': 'Sign up',
      'description': 'Register for free & put up your Profile',
    },
    {
      'title': 'Connect',
      'description': 'Select & Connect with Matches you like',
    },
    {
      'title': 'Interact',
      'description': 'Become a Premium Member & Start a Conversation',
    },
  ];

  // Features
  static const List<String> features = [
    'Best Matches',
    'Verified Profiles',
    '100% Privacy',
  ];

  // On Behalf Options
  static const List<String> onBehalfOptions = [
    'Self',
    'Son',
    'Daughter',
    'Brother',
    'Sister',
    'Relative',
  ];

  // Gender Options
  static const List<String> genderOptions = [
    'Male',
    'Female',
  ];

  // Asset Paths
  static const String logoPath = 'assets/images/logo.png';
  static const String backgroundImagePath = 'assets/images/background.png';
  static const String premiumIconPath = 'assets/images/premium_icon.png';
  static const String verifiedIconPath = 'assets/images/verified_icon.png';
  static const String privacyIconPath = 'assets/images/privacy_icon.png';
} 