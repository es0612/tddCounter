# CLAUDE.md

全て日本語で回答して。

シンプルなカウンターアプリ
TDDで開発

## Project Overview

This is a SwiftUI iOS application called TddCounter, structured as a standard Xcode project. The app is in early development with basic scaffolding in place.

## Development Commands

### Building and Running
```bash
# Build the project
cd app && xcodebuild -scheme TddCounter -destination 'platform=iOS Simulator,name=iPhone 15' build

# Run tests
cd app && xcodebuild test -scheme TddCounter -destination 'platform=iOS Simulator,name=iPhone 15'

# Run specific test target
cd app && xcodebuild test -scheme TddCounter -destination 'platform=iOS Simulator,name=iPhone 15' -only-testing:TddCounterTests
cd app && xcodebuild test -scheme TddCounter -destination 'platform=iOS Simulator,name=iPhone 15' -only-testing:TddCounterUITests
```

### Testing Framework
The project uses Swift Testing framework (not XCTest). Tests are written using `@Test` attributes and `#expect(...)` assertions.

## Project Structure

- `app/TddCounter/` - Main application source code
  - `TddCounterApp.swift` - App entry point
  - `ContentView.swift` - Main view
- `app/TddCounterTests/` - Unit tests using Swift Testing
- `app/TddCounterUITests/` - UI tests

## Architecture Notes

Standard SwiftUI app architecture with:
- Single WindowGroup scene
- ContentView as the root view
- Swift Testing framework for unit and UI tests