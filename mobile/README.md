# Mobile Application

React Native mobile application using Expo for iOS and Android.

## 📱 Tech Stack

- **Framework**: React Native with Expo
- **Language**: TypeScript
- **Navigation**: React Navigation
- **State Management**: Zustand
- **HTTP Client**: Axios
- **Testing**: Jest & React Testing Library

## 📋 Project Structure

```
mobile/
├── src/
│   ├── screens/          # Screen components
│   ├── components/       # Reusable components
│   ├── services/         # API and business logic
│   ├── store/            # Zustand store
│   ├── navigation/       # Navigation config
│   ├── utils/            # Utility functions
│   ├── types/            # TypeScript types
│   └── App.tsx           # Main entry point
├── assets/               # Images, icons, fonts
├── app.json              # Expo configuration
├── eas.json              # EAS build configuration
├── tsconfig.json         # TypeScript config
└── package.json          # Dependencies

```

## 🚀 Getting Started

### Prerequisites

- Node.js 18+
- Expo CLI: `npm install -g expo-cli`
- iOS: Xcode or EAS Build
- Android: Android Studio or EAS Build

### Installation

```bash
cd mobile
npm install
```

### Development

```bash
npm run dev
# or
expo start
```

**Run on Device:**

- iOS: Press `i` in Terminal
- Android: Press `a` in Terminal
- Web: Press `w` in Terminal

### Building

#### iOS Build

```bash
npm run build:ios
```

#### Android Build

```bash
npm run build:android
```

#### Publish to App Store / Play Store

```bash
npm run submit:ios
npm run submit:android
```

## 📦 Key Features

- ✅ TypeScript support
- ✅ Native module integration ready
- ✅ API client interceptors for JWT auth
- ✅ Secure storage for tokens
- ✅ Push notifications
- ✅ Offline support ready
- ✅ Performance optimized
- ✅ Dark mode support

## 🧪 Testing

```bash
npm run test
npm run test:watch
```

## 📝 Environment Setup

1. Copy `.env.example` to `.env`
2. Update API endpoints
3. Configure third-party services (Firebase, etc.)

## 🔒 Security

- Secure token storage (SecureStore)
- SSL pinning ready
- Encrypted async storage
- Input validation
- XSS protection

## 📚 Resources

- [Expo Documentation](https://docs.expo.dev)
- [React Native Docs](https://reactnative.dev)
- [EAS Build Docs](https://docs.expo.dev/build/introduction/)

## 🤝 Contributing

Follow the project's contribution guidelines and maintain TypeScript strict mode.
