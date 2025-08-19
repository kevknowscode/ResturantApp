# Restaurant App

A SwiftUI-based restaurant application demonstrating modern iOS development patterns.

## Features

- Menu browsing with category filtering
- Shopping cart with real-time updates
- Location search with multi-level navigation
- Automatic tax calculation
- Dark mode support
- Responsive UI design

## Technical Implementation

**SwiftUI Components:**
- `NavigationStack` - Modern iOS 16+ navigation
- `TabView` - Tab-based navigation structure
- `List` - Dynamic data presentation
- `Sheet` - Modal presentations with nested navigation
- `TextField` - User input handling
- `Button` - Interactive elements with custom styling
- `LinearGradient` - Dynamic background theming
- `ZStack/VStack/HStack` - Flexible layout system

**State Management:**
- `@State` - Local view state
- `@Binding` - Two-way data binding
- `@Observable` - iOS 17+ observable pattern
- `@Environment(\.colorScheme)` - System appearance integration

**Architecture Patterns:**
- MVVM architecture with ViewModels
- Dependency injection with `LocalFileDataDecoder`
- Protocol-based data handling
- Reactive data flow with real-time filtering

**Advanced Features:**
- Multi-layered sheet presentation
- Environment-aware UI adaptation
- Custom button and list styling
- Functional programming for data filtering
- Error handling with graceful fallbacks