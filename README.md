# Hogwarts Students Manager

This is my first Flutter application that allows you to manage students at Hogwarts School of Witchcraft and Wizardry with a Supabase Database. The app provides features to view and manage wizards, wands, and houses (full CRUD). It has been developed as a multiplatform app (Android, iOS, PC, macOS).

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

You need to have the following installed on your machine:

- Flutter SDK
- Dart SDK
- Android Studio or Visual Studio Code
- Android SDK / iOS SDK

### Installation

1. Clone the repository: git clone https://github.com/SergioLM7/crud_flutter.git
2. Open the project in your preferred IDE (e.g., Android Studio, Visual Studio Code).
3. Run the following command to get the dependencies: flutter pub get
4. Create your own Supabase DB based on wizard, house and wand models (models directory)
5. Create your own config.json in the root directory of your project to configure the environment variables
6. Build and run the app: flutter run


## Usage

To use the app, follow these steps:

1. Open the app and you will see the home screen.
![](https://github.com/SergioLM7/crud_flutter/assets/images/homescreen.png)

2. Tap on the "Wand" card to view and manage the list of wands.
![](https://github.com/SergioLM7/crud_flutter/assets/images/wandslist.png)

3. Tap on the + button to add a new Wand.
4. Tap on the "House" card to view and manage the list of houses.
![](https://github.com/SergioLM7/crud_flutter/assets/images/houseslist.png)

5. Tap on the + button to add a new House.
6. Tap on the "Wizard" card to view and manage the list of wizards.
![](https://github.com/SergioLM7/crud_flutter/assets/images/wizardslist.png)

7. Tap on the + button to add a new Wizard.

## Contributing

Contributions are welcome. If you find any issues or have suggestions for improvements, please open an issue or submit a pull request.