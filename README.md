
# Scientific Calculator

A scientific calculator built using Flutter. This calculator supports basic arithmetic operations, trigonometric functions, logarithmic functions, and more.

## Features

- Basic arithmetic operations: addition, subtraction, multiplication, and division.
- Trigonometric functions: sine, cosine, tangent.
- Logarithmic functions.
- Square root and percentage calculations.
- Dynamic evaluation of expressions.
- Displays the last evaluated expression and result when the `=` button is pressed with an empty input.

## Screenshots

![Calculator Screenshot](assets/screenshots/calculator_screenshot.png)

## Getting Started

### Prerequisites

- [Flutter](https://flutter.dev/docs/get-started/install) installed on your machine.

### Installation

1. Clone the repository:

```sh
git clone https://github.com/tonylloyd2/scientific_calculator.git
cd scientific_calculator
```

### Install dependencies:

```
flutter pub get
```

### Run the app:

```
flutter run
```


## Project Structure

```
scientific_calculator/
  ├── android/
  ├── assets/
  │   ├── icons/
  │   │   ├── icon_48x48.png
  │   │   ├── icon_72x72.png
  │   │   ├── icon_96x96.png
  │   │   ├── icon_144x144.png
  │   │   ├── icon_192x192.png
  │   │   ├── icon_512x512.png
  │   └── screenshots/
  │       └── calculator_screenshot.png
  ├── ios/
  ├── lib/
  │   └── main.dart
  ├── pubspec.yaml
  └── README.md
```



## Usage

* Use the buttons to input expressions.
* The result is dynamically evaluated and displayed as you type.
* Press `=` to evaluate the expression. If the input is empty, the last evaluated expression and result are displayed.
* Use the `CLEAR` button to reset the calculator.
* Use the `⌫` button to delete the last character.

## Customization

### Changing the App Icon

1. Prepare your icon images in various sizes (48x48, 72x72, 96x96, 144x144, 192x192, 512x512).
2. Place the icon images in the `assets/icons` directory.
3. Update the [`pubspec.yaml`](vscode-file://vscode-app/usr/share/code/resources/app/out/vs/code/electron-sandbox/workbench/workbench.html "/home/cyberpunkmania/Documents/GitHub/calculator_app/pubspec.yaml") file to include the asset paths:


```
flutter:
  assets:
    - assets/icons/
```



4. Replace the default icons in the [`android/app/src/main/res`](vscode-file://vscode-app/usr/share/code/resources/app/out/vs/code/electron-sandbox/workbench/workbench.html "/home/cyberpunkmania/Documents/GitHub/calculator_app/android/app/src/main/res") and [`ios/Runner/Assets.xcassets/AppIcon.appiconset`](vscode-file://vscode-app/usr/share/code/resources/app/out/vs/code/electron-sandbox/workbench/workbench.html "/home/cyberpunkmania/Documents/GitHub/calculator_app/ios/Runner/Assets.xcassets/AppIcon.appiconset") directories with your icon images.

### Removing the Debug Banner

To remove the debug banner, set the `debugShowCheckedModeBanner` property of the `MaterialApp` widget to `false` in the [`main.dart`](vscode-file://vscode-app/usr/share/code/resources/app/out/vs/code/electron-sandbox/workbench/workbench.html "/home/cyberpunkmania/Documents/GitHub/calculator_app/lib/main.dart") file:

```
MaterialApp(
  title: 'Scientific Calculator',
  theme: ThemeData(
    primarySwatch: Colors.blue,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  ),
  home: CalculatorHome(),
  debugShowCheckedModeBanner: false, // Remove the debug banner
);
```



## Contributing

Contributions are welcome! Please fork the repository and submit a pull request.

## License

This project is licensed under the MIT License - see the [`LICENSE`](vscode-file://vscode-app/usr/share/code/resources/app/out/vs/code/electron-sandbox/workbench/workbench.html "/home/cyberpunkmania/Documents/GitHub/calculator_app/LICENSE") file for details.

## Contact

GitHub: [tonylloyd2](vscode-file://vscode-app/usr/share/code/resources/app/out/vs/code/electron-sandbox/workbench/workbench.html "https://github.com/tonylloyd2")
