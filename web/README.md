# Web Frontend Application

Modern React web application with TypeScript, Vite, and Tailwind CSS.

## 🌐 Tech Stack

- **Framework**: React 18
- **Language**: TypeScript
- **Build Tool**: Vite
- **Routing**: React Router v6
- **State Management**: Zustand
- **HTTP Client**: Axios
- **Styling**: Tailwind CSS
- **Testing**: Vitest & React Testing Library
- **Query**: TanStack React Query

## 📋 Project Structure

```
web/
├── src/
│   ├── pages/            # Page components
│   ├── components/       # Reusable components
│   │   ├── common/       # Shared components
│   │   ├── layouts/      # Layout components
│   │   └── forms/        # Form components
│   ├── services/         # API services
│   ├── store/            # Zustand stores
│   ├── hooks/            # Custom hooks
│   ├── utils/            # Utility functions
│   ├── types/            # TypeScript types
│   ├── styles/           # Global styles
│   ├── App.tsx           # Main component
│   └── main.tsx          # Entry point
├── public/               # Static assets
├── vite.config.ts        # Vite configuration
├── tsconfig.json         # TypeScript config
└── package.json          # Dependencies
```

## 🚀 Getting Started

### Prerequisites

- Node.js 18+
- npm or yarn

### Installation

```bash
cd web
npm install
```

### Development

```bash
npm run dev
# Opens http://localhost:3000
```

### Build

```bash
npm run build
npm run preview
```

## 🎨 Features

- ✅ Vite for ultra-fast HMR
- ✅ TypeScript strict mode
- ✅ Tailwind CSS with dark mode
- ✅ Responsive design
- ✅ PWA ready
- ✅ API integration with Axios
- ✅ Zustand for state management
- ✅ React Query for data fetching
- ✅ Comprehensive testing setup
- ✅ ESLint & Prettier configured

## 📦 Available Scripts

```bash
# Development
npm run dev          # Start dev server
npm run build        # Build for production
npm run preview      # Preview production build

# Quality
npm run lint         # Run ESLint
npm run format       # Format with Prettier
npm run type-check   # TypeScript type checking

# Testing
npm run test         # Run tests
npm run test:ui      # Run tests with UI
npm run test:coverage # Generate coverage report
```

## 📝 Environment Variables

Create `.env.local`:

```
VITE_API_URL=http://localhost:3000
VITE_WS_URL=ws://localhost:3000
VITE_APP_TITLE=Enterprise App
```

## 🧪 Testing

```bash
npm run test
npm run test:coverage
```

## 🔒 Security

- CSRF protection
- XSS prevention
- Content Security Policy header ready
- Secure API communication
- Input validation
- Output encoding

## 📚 Resources

- [React Documentation](https://react.dev)
- [Vite Documentation](https://vitejs.dev)
- [Tailwind CSS](https://tailwindcss.com)
- [TypeScript Handbook](https://www.typescriptlang.org)

## 🤝 Contributing

Follow ESLint rules and maintain TypeScript strict mode. Run `npm run format` before committing.
