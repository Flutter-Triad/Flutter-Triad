# Flutter Triad

![Flutter Triad Logo](https://flutter-triad.actit.ps/assets/img/logo.svg)

Flutter Triad is a clean architecture-based Flutter template designed to accelerate app development by providing a structured and organized project foundation. Whether you're building a new app or refactoring an existing one, Flutter Triad simplifies the development process, making it more efficient and maintainable.

## Table of Contents

- [Features](#features)
- [Getting Started](#getting-started)
    - [Prerequisites](#prerequisites)
    - [Installation](#installation)
- [Project Structure](#project-structure)
- [State Management](#state-management)
- [Networking](#networking)
- [Error Handling](#error-handling)
- [Contributing](#contributing)
- [License](#license)
- [Contact](#contact)

## Features

- **Clean Architecture**: Flutter Triad follows a clean architecture pattern, separating the project into data, domain, and presentation layers. This promotes maintainability, scalability, and testability.

- **State Management**: Choose your preferred state management solution, whether it's the built-in `Provider`, `GetX`, `Riverpod`, or any other state management library. Flutter Triad provides flexibility.

- **Networking**: Simplify API requests using Retrofit and Dio. Use generated code to interact with your APIs efficiently.

- **Error Handling**: Enjoy a built-in error handling system that seamlessly integrates with Dio, making it easy to handle errors throughout your app.

- **Custom Code Generator**: Boost productivity with a custom code generator that automates the creation of feature-specific files and directories. Say goodbye to repetitive tasks.

- **Responsive UI**: Flutter Triad includes `flutter_screenutil` for responsive UI design, making it easy to adapt your app to various screen sizes.

- **Localization**: Use the `easy_localization` library to add multilingual support to your app with ease.

- **Caching**: Implement data caching effortlessly with `flutter_cache_manager` and `path_provider`.

- **Animations**: Enhance your app's user experience with animations using the `lottie` library.

- **Custom UI Components**: Flutter Triad provides custom UI components and widgets to jumpstart your development.

- **Navigation**: Implement persistent bottom navigation and smooth transitions between screens with `persistent_bottom_nav_bar_v2`.

## Getting Started

### Prerequisites

Before you begin, ensure you have met the following requirements:

- **Flutter**: Make sure you have Flutter installed on your machine. If not, you can [install Flutter here](https://flutter.dev/docs/get-started/install).

- **Dart**: Flutter requires the Dart programming language. [Install Dart here](https://dart.dev/get-dart).

### Installation

To get started with Flutter Triad, follow these steps:

1. Clone the repository:

    ```bash
   git clone https://github.com/your-username/Flutter-Triad.git
    ```
    Replace your-username with your GitHub username or the repository URL.

2. Navigate to the project directory:

    ```bash
   cd Flutter-Triad
    ```
   
3. Fetch the project dependencies:

    ```bash
   flutter pub get
    ```
   
4. Run the app:

   ```bash
   flutter run 
   ```
   
This will launch the app on your default emulator or connected device.

5. If you're using models with the `@JsonSerializable()` annotation, generate the necessary serialization code by running:
- If you're using the Flutter SDK directly:
  ```
  flutter pub run build_runner build --delete-conflicting-outputs
  ```
- If you're using the Flutter Version Manager (FVM):
  ```
  fvm flutter pub run build_runner build --delete-conflicting-outputs
  ```
Running the App
To launch the app on your default emulator or connected device, use the following command:
   ```bash
   flutter run 
   ```
## New Feature 
For create a new feature use this commands:
   ```bash
   dart command_file_path -f feature_name -n dart_file_name.dart 
   ```

   // Ex: 
   ```bash
   dart lib/core/commands/custom_command.dart -f product -n product.dart 
   ```

# Project Structure
Flutter Triad follows a clean architecture pattern, organizing the project into the following layers:

- **data**: Contains data-related logic, including data sources, repositories, and models.
- **domain**: Contains the core business logic, including use cases and entities.
- **presentation**: Contains the UI-related logic, including views, controllers, and presenters.

This structure promotes separation of concerns, making your codebase more maintainable and testable.

# State Management
Flutter Triad is flexible when it comes to state management. You can choose your preferred state management solution, such as Provider, GetX, or Riverpod. The project is designed to work seamlessly with your choice.

# Networking
Simplify API requests with Retrofit and Dio. Use code generation to create network-related files, reducing boilerplate code. Retrofit and Dio integration makes working with APIs efficient and straightforward.

# Error Handling
Flutter Triad includes a built-in error handling system that seamlessly integrates with Dio. Handle errors gracefully and provide a smooth user experience even when things go wrong.

# Contributing
We welcome contributions to enhance Flutter Triad. To contribute, please follow these steps:

1. Fork the repository on GitHub.
2. Create a new branch with a descriptive name for your feature or bug fix.
3. Make the necessary changes and additions.
4. Commit and push your changes to your forked repository.
5. Submit a pull request, explaining the changes made and their purpose.

# License
Flutter Triad is released under the MIT License.

# Contact
If you have any questions, suggestions, or feedback, please feel free to reach out to our team at mohanned@ait.ps.

**Thank you for choosing Flutter Triad. We hope it streamlines your app development and helps you create amazing Flutter apps!**
