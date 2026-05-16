// lib/data/portfolio_data.dart

class PortfolioData {
  static const String name = 'Bharat Wakade';
  static const String tagline = 'Flutter Developer';
  static const List<String> roles = [
    'Flutter Developer',
    'Mobile App Engineer',
    'Cross-Platform Specialist',
    'Bloc & Riverpod Expert',
    'Clean Architecture Advocate',
  ];
  static const String bio =
      'Proficient Flutter developer with hands-on experience building '
      'user-friendly cross-platform applications for Android and iOS. '
      'Skilled across the full app development lifecycle — from concept to '
      'deployment — with expertise in Bloc/Cubit, Riverpod, Firebase, '
      'Google Maps, WebSockets, and RESTful API integration. '
      'Passionate about clean architecture, scalable codebases, and '
      'delivering seamless user experiences.';

  static const String email = 'bharatwakade012@gmail.com';
  static const String phone = '+91 7020541621';
  static const String github = 'https://github.com/BharatWakade-code/';
  static const String linkedin =
      'https://www.linkedin.com/in/bharat-wakade-8b8007245/';
  static const String twitter = '';

  static const List<Map<String, dynamic>> skills = [
    {
      'category': 'Flutter & Dart',
      'items': [
        {'name': 'Flutter', 'level': 0.95, 'icon': '🐦'},
        {'name': 'Dart', 'level': 0.95, 'icon': '🎯'},
        {'name': 'Bloc / Cubit', 'level': 0.92, 'icon': '⚡'},
        {'name': 'Riverpod', 'level': 0.88, 'icon': '🔵'},
      ]
    },
    {
      'category': 'Backend & Services',
      'items': [
        {'name': 'Firebase', 'level': 0.90, 'icon': '🔥'},
        {'name': 'REST APIs', 'level': 0.92, 'icon': '🌐'},
        {'name': 'WebSocket', 'level': 0.82, 'icon': '📡'},
        {'name': 'Google Maps SDK', 'level': 0.85, 'icon': '🗺️'},
      ]
    },
    {
      'category': 'Tools & Practices',
      'items': [
        {'name': 'Clean Architecture', 'level': 0.90, 'icon': '🏗️'},
        {'name': 'Git & GitHub', 'level': 0.90, 'icon': '🐙'},
        {'name': 'Postman', 'level': 0.85, 'icon': '🛠️'},
        {'name': 'PostHog Analytics', 'level': 0.78, 'icon': '📊'},
      ]
    },
    {
      'category': 'Deployment & Cloud',
      'items': [
        {'name': 'Play Store', 'level': 0.90, 'icon': '▶️'},
        {'name': 'App Store', 'level': 0.85, 'icon': '🍎'},
        {'name': 'AWS (EC2, S3, Lambda)', 'level': 0.75, 'icon': '☁️'},
        {'name': 'Firebase App Distribution', 'level': 0.88, 'icon': '🚀'},
      ]
    },
  ];

  static const List<Map<String, dynamic>> techStack = [
    {'name': 'Flutter', 'color': 0xFF54C5F8},
    {'name': 'Dart', 'color': 0xFF00B4AB},
    {'name': 'Firebase', 'color': 0xFFFFCA28},
    {'name': 'Bloc/Cubit', 'color': 0xFF7B2FBE},
    {'name': 'Riverpod', 'color': 0xFF00D4FF},
    {'name': 'WebSocket', 'color': 0xFF4CAF50},
    {'name': 'Google Maps', 'color': 0xFF4285F4},
    {'name': 'REST API', 'color': 0xFFFF6B6B},
    {'name': 'PostHog', 'color': 0xFFF54E00},
    {'name': 'Git', 'color': 0xFFF05032},
    {'name': 'AWS', 'color': 0xFFFF9900},
    {'name': 'OneSignal', 'color': 0xFFE54B4D},
  ];

  static const List<Map<String, dynamic>> projects = [
    {
      'title': 'OwnPrep',
      'description':
          'A student-focused mobile platform providing a unified space for learning and career preparation. Features a job portal, wishlist management, quizzes, tests, educational videos, and a rich Learn Module with practice exercises.',
      'tech': ['Flutter', 'Firebase', 'Bloc Cubit', 'PostHog', 'REST API'],
      'category': 'EdTech',
      'gradient': [0xFF00D4FF, 0xFF0066FF],
      'emoji': '🎓',
      'github': '',
      'live': 'https://play.google.com/store/apps/details?id=com.ownprep',
      'featured': true,
    },
    {
      'title': 'Chia AI Stories',
      'description':
          'AI-powered storytelling app that generates immersive stories, scenes, and videos from user prompts. Features image generation, scene regeneration, auto-rotating fullscreen video playback, real-time processing updates, and optimized media streaming for a smooth creative experience.',
      'tech': [
        'Flutter',
        'FastAPI',
        'Bloc Cubit',
        'AI Image Generation',
        'Video Streaming',
        'Firebase'
      ],
      'category': 'AI & Entertainment',
      'gradient': [0xFF6A11CB, 0xFF2575FC],
      'emoji': '🎬',
      'github': '',
      'live': '',
      'featured': true,
    },
    {
      'title': 'KrishiWings',
      'description':
          'Agriculture service platform connecting farmers with drone service providers for modern farming solutions. Farmers can search and book nearby providers, while providers can manage and offer their services efficiently. Integrated Google Maps for real-time location tracking and Google Places Autocomplete API for seamless location and service search experience.',
      'tech': [
        'Flutter',
        'REST API',
        'Bloc Cubit',
        'Google Maps',
        'Google Places API',
        'Firebase'
      ],
      'category': 'AgriTech',
      'gradient': [0xFF11998E, 0xFF38EF7D],
      'emoji': '🚁',
      'github': '',
      'live': '',
      'featured': true,
    },
    {
      'title': 'Petrolynk',
      'description':
          'Cross-platform app for fuel and grocery corporations with daily/monthly/yearly sales dashboards, barcode scanning for inventory, and an AI-powered chatbot over WebSocket for querying business insights.',
      'tech': [
        'Flutter',
        'Firebase',
        'Bloc Cubit',
        'WebSocket',
        'barcode_scanner',
        'REST API'
      ],
      'category': 'Enterprise',
      'gradient': [0xFFFF9900, 0xFFFF6B35],
      'emoji': '⛽',
      'github': '',
      'live': 'https://petrolynks.com/',
      'featured': true,
    },
    {
      'title': 'ShineOnCar',
      'description':
          'Dual-app solution: one for car owners to book washing services and another for washers to manage requests. Real-time washer dashboard via WebSocket; first-to-accept booking assignment system.',
      'tech': ['Flutter', 'Firebase', 'WebSocket', 'Bloc Cubit'],
      'category': 'On-Demand Services',
      'gradient': [0xFF4CAF50, 0xFF00BCD4],
      'emoji': '🚗',
      'github': '',
      'live': 'https://apps.apple.com/in/app/shineoncar/id6754560463',
      'featured': true,
    },
    {
      'title': 'MERSI',
      'description':
          'Emergency roadside assistance app for breakdowns and accidents. Integrates Google Maps to display nearby service centers, mechanics, and tow trucks, with OneSignal real-time notifications for service updates.',
      'tech': ['Flutter', 'REST API', 'Bloc Cubit', 'Google Maps', 'OneSignal'],
      'category': 'Automotive',
      'gradient': [0xFFFF6B6B, 0xFF7B2FBE],
      'emoji': '🚨',
      'github': '',
      'live': '',
      'featured': false,
    },
    {
      'title': 'Sisko Comic',
      'description':
          'Social media app for the comic community with real-time Firebase chat, Superhero API integration, user profiles, posts, likes, and FCM push notifications for messages and content updates.',
      'tech': ['Flutter', 'Firebase', 'Bloc/Cubit', 'REST API'],
      'category': 'Social',
      'gradient': [0xFFA259FF, 0xFFFF6B6B],
      'emoji': '🦸',
      'github': '',
      'live': 'https://insta-clone-flax-kappa.vercel.app/',
      'featured': false,
    },
  ];

  static const List<Map<String, dynamic>> experience = [
    {
      'role': 'Flutter Developer',
      'company': 'Betasys AI Pvt Ltd',
      'period': 'Apr 2025 – Present',
      'description':
          'Designing and developing cross-platform mobile apps for Android and iOS with a strong focus on scalability. Implementing Bloc Cubit and Riverpod for clean, modular architecture, integrating FCM push notifications, RESTful APIs, Firebase services, Google Maps SDK, and geofencing features.',
      'highlights': [
        'Bloc Cubit & Riverpod architecture',
        'FCM push notifications',
        'Google Maps & Geofencing',
        'RESTful API integration',
      ],
      'icon': '🚀',
    },
    {
      'role': 'Flutter Developer',
      'company': 'Technobase Solutions Pvt Ltd',
      'period': 'Sep 2024 – Apr 2025',
      'description':
          'Built cross-platform apps for Android and iOS. Migrated app to a refreshed UI theme, integrated Firebase Cloud Messaging, applied Bloc Cubit for clean architecture, and enhanced performance while collaborating with cross-functional teams.',
      'highlights': [
        'Full app UI migration & redesign',
        'Bloc Cubit state management',
        'Firebase FCM integration',
        'Bug fixes & performance tuning',
      ],
      'icon': '⚡',
    },
    {
      'role': 'Flutter Developer',
      'company': 'Thinkersteps Pvt. Ltd.',
      'period': 'Feb 2024 – Sep 2024',
      'description':
          'Designed and developed cross-platform Flutter apps, led a modern UI redesign/migration, implemented Firebase Cloud Messaging with BLoC Cubit architecture, optimized performance, and integrated RESTful APIs for real-time data interactions.',
      'highlights': [
        'Led full UI redesign & migration',
        'BLoC Cubit architecture',
        'RESTful API & Firebase integration',
        'On-schedule quality releases',
      ],
      'icon': '🌱',
    },
  ];

  static const List<Map<String, dynamic>> stats = [
    {'value': '2+', 'label': 'Years Experience', 'icon': '📅'},
    {'value': '5+', 'label': 'Apps Shipped', 'icon': '📱'},
    {'value': '2', 'label': 'Store Deployments', 'icon': '🏪'},
    {'value': '3', 'label': 'Companies Worked', 'icon': '🏢'},
  ];
}
