// lib/data/portfolio_data.dart

class PortfolioData {
  static const String name = 'Alex Chen';
  static const String tagline = 'Flutter Developer';
  static const List<String> roles = [
    'Flutter Developer',
    'Mobile App Engineer',
    'Cross-Platform Specialist',
    'UI/UX Enthusiast',
    'Dart Wizard',
  ];
  static const String bio =
      'Passionate Flutter developer with 4+ years of experience crafting beautiful, '
      'performant cross-platform applications. I specialize in building pixel-perfect '
      'UIs with smooth animations, clean architecture, and scalable state management. '
      'When I\'m not writing Dart code, I\'m exploring new Flutter packages, '
      'contributing to open source, or creating content about mobile development.';

  static const String email = 'alex.chen@flutter.dev';
  static const String github = 'https://github.com/alexchen';
  static const String linkedin = 'https://linkedin.com/in/alexchen';
  static const String twitter = 'https://twitter.com/alexchen_dev';

  static const List<Map<String, dynamic>> skills = [
    {
      'category': 'Core',
      'items': [
        {'name': 'Flutter', 'level': 0.95, 'icon': '🐦'},
        {'name': 'Dart', 'level': 0.95, 'icon': '🎯'},
        {'name': 'State Management', 'level': 0.90, 'icon': '⚡'},
        {'name': 'UI/UX Design', 'level': 0.85, 'icon': '🎨'},
      ]
    },
    {
      'category': 'Backend & Services',
      'items': [
        {'name': 'Firebase', 'level': 0.88, 'icon': '🔥'},
        {'name': 'REST APIs', 'level': 0.90, 'icon': '🌐'},
        {'name': 'GraphQL', 'level': 0.75, 'icon': '📡'},
        {'name': 'Supabase', 'level': 0.80, 'icon': '⚡'},
      ]
    },
    {
      'category': 'Tools & Practices',
      'items': [
        {'name': 'Git & GitHub', 'level': 0.92, 'icon': '🐙'},
        {'name': 'CI/CD', 'level': 0.80, 'icon': '🔄'},
        {'name': 'Testing', 'level': 0.85, 'icon': '✅'},
        {'name': 'Clean Architecture', 'level': 0.88, 'icon': '🏗️'},
      ]
    },
  ];

  static const List<Map<String, dynamic>> techStack = [
    {'name': 'Flutter', 'color': 0xFF54C5F8},
    {'name': 'Dart', 'color': 0xFF00B4AB},
    {'name': 'Firebase', 'color': 0xFFFFCA28},
    {'name': 'Riverpod', 'color': 0xFF00D4FF},
    {'name': 'BLoC', 'color': 0xFF7B2FBE},
    {'name': 'GetX', 'color': 0xFF4CAF50},
    {'name': 'Supabase', 'color': 0xFF3ECF8E},
    {'name': 'REST API', 'color': 0xFFFF6B6B},
    {'name': 'GraphQL', 'color': 0xFFE535AB},
    {'name': 'Git', 'color': 0xFFF05032},
    {'name': 'Figma', 'color': 0xFFA259FF},
    {'name': 'VS Code', 'color': 0xFF007ACC},
  ];

  static const List<Map<String, dynamic>> projects = [
    {
      'title': 'EcoTrack',
      'description':
          'A beautiful sustainability app helping users track their carbon footprint with gorgeous data visualizations, gamification, and AI-powered insights.',
      'tech': ['Flutter', 'Firebase', 'Riverpod', 'ML Kit'],
      'category': 'Mobile App',
      'gradient': [0xFF00D4FF, 0xFF0066FF],
      'emoji': '🌿',
      'github': 'https://github.com/alexchen/ecotrack',
      'live': 'https://ecotrack.app',
      'featured': true,
    },
    {
      'title': 'FinFlow',
      'description':
          'Personal finance management app with real-time bank sync, intelligent categorization, budgeting tools, and beautiful chart analytics.',
      'tech': ['Flutter', 'Supabase', 'BLoC', 'Plaid API'],
      'category': 'Finance',
      'gradient': [0xFF4CAF50, 0xFF087F23],
      'emoji': '💰',
      'github': 'https://github.com/alexchen/finflow',
      'live': null,
      'featured': true,
    },
    {
      'title': 'ChatSphere',
      'description':
          'Real-time messaging platform with end-to-end encryption, voice messages, group chats, and beautiful animated UI components.',
      'tech': ['Flutter', 'Firebase', 'WebRTC', 'GetX'],
      'category': 'Social',
      'gradient': [0xFF7B2FBE, 0xFFFF6B6B],
      'emoji': '💬',
      'github': 'https://github.com/alexchen/chatsphere',
      'live': 'https://chatsphere.io',
      'featured': true,
    },
    {
      'title': 'MediCare+',
      'description':
          'Healthcare companion app for appointment scheduling, medication reminders, health records management, and telemedicine integration.',
      'tech': ['Flutter', 'Firebase', 'Riverpod', 'HealthKit'],
      'category': 'Healthcare',
      'gradient': [0xFFFF6B6B, 0xFFFF8E53],
      'emoji': '🏥',
      'github': 'https://github.com/alexchen/medicare',
      'live': null,
      'featured': false,
    },
    {
      'title': 'ArtVault',
      'description':
          'NFT marketplace and digital art gallery with stunning animations, AR preview features, and seamless Web3 wallet integration.',
      'tech': ['Flutter', 'Web3', 'IPFS', 'Ethereum'],
      'category': 'Web3',
      'gradient': [0xFFA259FF, 0xFF00D4FF],
      'emoji': '🎨',
      'github': 'https://github.com/alexchen/artvault',
      'live': 'https://artvault.io',
      'featured': false,
    },
    {
      'title': 'FitQuest',
      'description':
          'Gamified fitness app with workout tracking, AI form correction via camera, social challenges, and achievement system.',
      'tech': ['Flutter', 'TensorFlow Lite', 'Firebase', 'BLoC'],
      'category': 'Health & Fitness',
      'gradient': [0xFFFF6B35, 0xFFFFD700],
      'emoji': '💪',
      'github': 'https://github.com/alexchen/fitquest',
      'live': 'https://fitquest.app',
      'featured': false,
    },
  ];

  static const List<Map<String, dynamic>> experience = [
    {
      'role': 'Senior Flutter Developer',
      'company': 'TechVision Labs',
      'period': '2022 – Present',
      'description':
          'Led Flutter development for 3 flagship mobile apps with 500K+ combined downloads. Architected scalable solutions using Clean Architecture & Riverpod. Mentored a team of 4 junior developers.',
      'highlights': [
        'Reduced app startup time by 40%',
        '500K+ active users',
        'Led team of 4 devs',
        '99.9% crash-free sessions',
      ],
      'icon': '🚀',
    },
    {
      'role': 'Flutter Developer',
      'company': 'StartupHub Inc.',
      'period': '2021 – 2022',
      'description':
          'Built cross-platform mobile applications from scratch using Flutter & Firebase. Implemented complex UI animations and integrated payment gateways, push notifications, and analytics.',
      'highlights': [
        'Delivered 5 apps in 12 months',
        'Stripe & PayPal integration',
        'Custom animation system',
        '4.8★ App Store rating',
      ],
      'icon': '⚡',
    },
    {
      'role': 'Mobile Developer (Intern → Junior)',
      'company': 'AppCraft Studio',
      'period': '2019 – 2021',
      'description':
          'Started as an intern and grew to Junior Developer. Worked on both React Native and Flutter projects, gaining expertise in mobile app development patterns.',
      'highlights': [
        'Promoted after 6 months',
        'Migrated RN app to Flutter',
        'Implemented CI/CD pipeline',
        '2 published Play Store apps',
      ],
      'icon': '🌱',
    },
  ];

  static const List<Map<String, dynamic>> stats = [
    {'value': '4+', 'label': 'Years Experience', 'icon': '📅'},
    {'value': '25+', 'label': 'Apps Shipped', 'icon': '📱'},
    {'value': '500K+', 'label': 'App Users', 'icon': '👥'},
    {'value': '15+', 'label': 'Open Source Repos', 'icon': '🐙'},
  ];
}
