# Power Consumption Predictor

A modern Flutter application that predicts power consumption based on environmental and time-based factors. The app features a clean, intuitive interface with support for both light and dark themes.

---

##  App Screenshot


---

##  Features
- **Accurate Predictions**: Get power consumption estimates based on multiple input parameters  
- **Beautiful UI**: Clean, modern interface with smooth animations  
- **Dark/Light Theme**: Automatic theme switching based on system settings with manual override  
- **Responsive Design**: Works on phones and tablets of all sizes  
- **Form Validation**: Real-time input validation with helpful error messages  
- **Offline Support**: View previous predictions without an internet connection  

---

##  Prerequisites
- Flutter SDK (latest stable version)  
- Dart SDK (included with Flutter)  
- Android Studio / Xcode (for emulator/simulator)  
- VS Code or Android Studio (recommended IDEs)

---

##  Getting Started

### Clone the repository
```bash
git clone https://github.com/denismitali17/linear_regression
cd power-consumption-app
```

### Install dependencies
```bash
flutter pub get
```

### Run the app
```bash
flutter run
```

---

##  Configuration

###  API Configuration
The app is configured to connect to a local API by default. To change the API endpoint, modify the `baseUrl` in `lib/services/api_service.dart`:

```dart
// For local development (Android emulator)
static const String baseUrl = 'http://10.0.2.2:8002';


// For production
// static const String baseUrl = ;
```

---

###  Environment Variables

Create a `.env` file in the root directory with the following variables:

```
API_BASE_URL=http://10.0.2.2:8002
```

---

##  Project Structure

```
lib/
├── main.dart          # App entry point
├── models/            # Data models
├── providers/         # State management
├── screens/           # App screens
├── services/          # API and business logic
├── theme/             # App theming
└── widgets/           # Reusable UI components
```

---

##  Dependencies

- `provider`: State management  
- `http`: For API calls  
- `intl`: For internationalization  
- `google_fonts`: Custom typography  
- `flutter_svg`: For SVG image support  
- `flutter_dotenv`: Environment variables  

---

##  Building for Production

### Android
```bash
flutter build apk --release
# or
flutter build appbundle --release
```

### iOS
```bash
flutter build ios --release
```


---

### Made with Denis Mitali
