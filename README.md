# My Best Self 🌟

<div align="center">

[![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white)](https://flutter.dev/)
[![Dart](https://img.shields.io/badge/dart-%230175C2.svg?style=for-the-badge&logo=dart&logoColor=white)](https://dart.dev/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=for-the-badge)](https://opensource.org/licenses/MIT)

An app designed to help you become the best version of yourself.

[Features](#features) • [Installation](#installation) • [Usage](#usage) • [Contributing](#contributing) • [License](#license)

</div>

## 🚀 Features

- 🎯 Personal goal setting
- 📊 Habit tracking
- 🔔 Progress rewards
- 🎨 Modern and user-friendly interface
- 💾 Local storage for data persistence
- 🏆 Achievement system to motivate progress

## 🛠 Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/my-best-self.git
   ```

2. Navigate to the project directory:
   ```bash
   cd my-best-self
   ```

3. Install dependencies:
   ```bash
   flutter pub get
   ```

## 🖥 Usage

Ensure Flutter is installed and configured, then run:

```bash
flutter run
```

### Prerequisites

- **Flutter SDK**: [Install Flutter](https://flutter.dev/docs/get-started/install)
- **Android Studio** or **Xcode**: For device emulation

## 📁 Project Structure

```
my_best_self/
├── lib/                         # Application source code
│   ├── core/                    # Core utilities and dependencies
│   │   ├── utils/               # Helper utilities and constants, e.g., color variables
│   │   │   └── colors.dart      # Color variables used across the app
│   │   └── dependency_injection/ # Dependency injection setup
│   ├── data/                    # Data layer (data sources, domain logic)
│   │   ├── datasources/         # Data sources (e.g., API, local storage)
│   │   │   └── local/           # Local data sources
│   │   ├── domain/              # Domain logic and business rules
│   │   │   ├── entities/        # Business entities
│   │   │   ├── repositories/    # Repository interfaces (abstractions)
│   │   │   └── use_cases/       # Application use cases
│   └── presentation/            # Presentation layer (UI)
│   │   ├── controllers/         # State management controllers
│   │   ├── navbar/              # Navigation bar components
│   │   ├── screens/             # Application screens
│   │   ├── views/               # Views for different sections
│   │   └── widgets/             # Reusable UI components
│   └── routes/                  # App route definitions
└── main.dart                    # Application entry point
└── test/                        # Testing folder
│   ├── integration_test/        # Integration tests (test the app as a whole, including interactions between multiple widgets)
│   └── widget_test/             # Widget tests (test individual widgets and their behavior)
```

## 🔧 Dependencies

This project uses the following key dependencies:

- [flutter](https://pub.dev/packages/flutter): sdk: flutter
- [hive](https://pub.dev/packages/hive): ^2.0.0
- [loggy](https://pub.dev/packages/loggy): ^2.0.3
- [path_provider](https://pub.dev/packages/path_provider): ^2.1.4
- [hive_flutter](https://pub.dev/packages/hive_flutter): ^1.0.0
- [cupertino_icons](https://pub.dev/packages/cupertino_icons): ^1.0.8
- [get](https://pub.dev/packages/get): ^4.6.6
- [intl](https://pub.dev/packages/intl): ^0.19.0
- [percent_indicator](https://pub.dev/packages/percent_indicator): ^4.2.3

For a full list of dependencies, please check the `pubspec.yaml` file.

## 🎥 Demostration

For a detailed explanation of the app, watch the following video:

[![Demostration](https://img.youtube.com/vi/ZpfSjgdGgpU/0.jpg)](https://youtu.be/ZpfSjgdGgpU)

## 🤝 Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 📞 Contact

LofoMarin - [@LofoMarin](https://github.com/LofoMarin)

Wilsone24 - [@wilsone24](https://github.com/wilsone24)

rtorresc - [@rtorresc](https://github.com/rtorresc)

Project Link: [https://github.com/wilsone24/my-best-self](https://github.com/wilsone24/My-Best-Self)

---
