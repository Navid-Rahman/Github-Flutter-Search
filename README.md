# Flutter GitHub Repository Search

A Flutter application that searches GitHub repositories using the keyword **"Flutter"** and displays the top 50 most popular repositories with offline support and detailed views.

---

## Features

### ✅ Core Functionalities

- Fetch top 50 Flutter repositories from GitHub API
- Offline browsing with local data caching
- Repository list with sorting (by stars/last updated)
- Detailed repository view with owner information
- Pull-to-refresh functionality
- Persistent sorting preferences

### ✅ Technical Implementation

- Clean Architecture pattern
- BLoC state management
- Proper error handling
- Offline-first approach
- Responsive design for mobile and tablets

### ✅ Extra Features

- Dark/Light theme switching
- Environment-based configuration
- Shimmer loading effects
- Comprehensive error handling
- Unit tests

---

## Architecture

This project follows Clean Architecture principles with clear separation of concerns:

```
lib/
├── core/                # Core utilities and constants
├── features/
│   ├── repositories/    # Repository feature module
│   │   ├── data/        # Data layer (API, local storage)
│   │   ├── domain/      # Domain layer (entities, use cases)
│   │   └── presentation/# UI layer (BLoC, pages, widgets)
│   └── theme/           # Theme management
├── config/              # App configuration and themes
└── injection_container.dart # Dependency injection
```

---

## Getting Started

### Prerequisites

- Flutter SDK (3.0.0 or higher)
- Dart SDK (2.17.0 or higher)
- Android Studio / VS Code
- Git

### Installation

1. **Clone the repository**

   ```bash
   git clone <your-repo-url>
   cd github_flutter_search
   ```

2. **Install dependencies**

   ```bash
   flutter pub get
   ```

3. **Run the app**

   ```bash
   # Development
   flutter run

   # Production
   flutter run --dart-define=PRODUCTION=true
   ```

---

### Build Commands

```bash
# Android APK
flutter build apk --release

# iOS
flutter build ios --release

# Web
flutter build web
```

---

## Dependencies

### Core Dependencies

- `flutter_bloc` - State management
- `http` - HTTP client for API calls
- `shared_preferences` - Local data persistence
- `connectivity_plus` - Network connectivity check
- `cached_network_image` - Image caching
- `intl` - Date formatting

### Development Dependencies

- `flutter_test` - Testing framework
- `mockito` - Mocking for tests
- `build_runner` - Code generation

---

## API Integration

The app uses GitHub's REST API v3:

- **Endpoint:** `https://api.github.com/search/repositories`
- **Query:** `q=Flutter&sort=stars&order=desc&per_page=50`
- **Rate Limit:** 60 requests per hour (unauthenticated)

---

## Testing

Run tests with:

```bash
flutter test
```

---

## Code Quality

The project maintains high code quality through:

- Clean Architecture principles
- Proper error handling
- Comprehensive documentation
- Unit tests for critical components
- Consistent code formatting

---

## Performance Optimizations

- Image caching for owner avatars
- Lazy loading of repository list
- Offline data caching
- Efficient state management
- Optimized build configurations

---

## Future Enhancements

- GitHub authentication for higher rate limits
- Advanced filtering options
- Repository comparison feature
- Favorite repositories
- Search history

---

## Contributing

1. Fork the repository
2. Create your feature branch:
   ```bash
   git checkout -b feature/amazing-feature
   ```
3. Commit your changes:
   ```bash
   git commit -m 'Add some amazing feature'
   ```
4. Push to the branch:
   ```bash
   git push origin feature/amazing-feature
   ```
5. Open a Pull Request

---

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## Git Commit

```bash
git add .
git commit -m "Complete project integration with theme support and comprehensive README documentation"
```

---

## Final Git Workflow Summary

Here's the complete Git commit history you should have:

```bash
git log --oneline
```

**Expected output:**

```
Complete project integration with theme support and comprehensive README documentation
Implement app flavors, environment configuration, and theme switching functionality
Add comprehensive testing setup and enhanced error handling widgets
Add enhanced UI components: sort functionality and loading shimmer effects
Implement repository pattern with proper error handling and offline support
Setup dependency injection with GetIt service locator
Implement complete UI with repository list, detail pages, and attractive design
Implement BLoC pattern for state management with events, states, and business logic
Implement data layer: models and data sources for remote and local storage
Implement domain layer: entities, repository contracts, and use cases
Add core infrastructure: constants, error handling, and network info
Setup clean architecture folder structure
Add project dependencies for state management, networking, and storage
Initial commit: Flutter project setup
```
