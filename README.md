# Hacker News App

A modern Hacker News client built with Flutter, showcasing clean architecture, best practices, and a modular approach.

## 📱 Demo

<p align="center">
  <img src=".github/assets/demo.gif" alt="Hacker News App Demo" width="300"/>
</p>

## 📱 Features

- Browse top Hacker News stories
- View story details and comments
- User profiles with karma and submission history
- Dark/Light theme support
- Pull-to-refresh
- Smooth animations
- Error handling and retry mechanisms

## 🛠 Tech Stack

- **State Management**: [Riverpod](https://riverpod.dev/)
- **Navigation**: [go_router](https://pub.dev/packages/go_router)
- **Network**: [Dio](https://pub.dev/packages/dio) + [Retrofit](https://pub.dev/packages/retrofit)
- **Code Generation**: [freezed](https://pub.dev/packages/freezed), [json_serializable](https://pub.dev/packages/json_serializable)
- **Version Management**: [FVM](https://fvm.app/)
- **Monorepo Management**: [Melos](https://melos.invertase.dev/)

## 🚀 Getting Started

### Prerequisites

1. Install Flutter Version Management (FVM):
```bash
dart pub global activate fvm
```

2. Install Melos:
```bash
dart pub global activate melos
```

### Setup

1. Clone the repository:
```bash
git clone https://github.com/yourusername/hacker_news.git
cd hacker_news
```

2. Install Flutter using FVM:
```bash
fvm install
fvm use
```

3. Bootstrap the project with Melos:
```bash
melos bootstrap
```

4. Run code generation:
```bash
melos run generate
```

### Running the App

```bash
fvm flutter run
```

## 📦 Project Structure

```
.
├── app/                    # Main application
│   ├── lib/
│   │   ├── core/          # Core functionality
│   │   ├── features/      # Feature modules
│   │   └── main.dart      # Entry point
│   └── pubspec.yaml
│
├── resources/             # Shared resources
│   ├── api/              # API client package
│   ├── common/           # Common utilities
│   └── values/           # Shared values/constants
│
├── melos.yaml            # Melos configuration
└── README.md
```

## 🔧 Available Melos Commands

- `melos bootstrap`: Set up project dependencies
- `melos run generate`: Run code generation
- `melos run test`: Run all tests
- `melos run analyze`: Run static analysis
- `melos run clean`: Clean all build files

## 🌐 API

This app uses the official [Hacker News API](https://github.com/HackerNews/API). The API client is implemented using Retrofit in the `resources/api` package.

## 🎨 Architecture

The project follows Clean Architecture principles with a modular approach:

- **Feature-first organization**: Each feature is self-contained with its own presentation, domain, and data layers
- **Dependency injection** using Riverpod
- **Separation of concerns** between UI, business logic, and data
- **Reusable components** in shared packages

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
