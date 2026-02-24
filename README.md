# 🧙‍♂️ Hogwarts Students Manager

This is my first Flutter application that allows you to manage students at Hogwarts School of Witchcraft and Wizardry with a Supabase Database. The app provides features to view and manage wizards, wands, and houses (full CRUD). It has been developed as a multiplatform app (Android, iOS, PC, macOS).

- **Custom Theme**: A cohesive visual identity using Material 3 ColorScheme.
- **Smooth Transitions**: Implementation of Hero animations for a premium feel.
- **Security**: Use of environment variables for database credentials via dart-define-from-file.
- **Performance**: Optimized with const constructors and efficient Widget tree rebuilding.

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Supabase](https://img.shields.io/badge/Supabase-3ECF8E?style=for-the-badge&logo=supabase&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)
  
## 🚀 Technical Highlights

- **Full CRUD Operations**: Seamlessly managing Wizarding world data with Supabase.
- **Material 3 Design**: Utilizing `fromSeed` theme generation for a consistent UI across platforms.
- **Dynamic Animations**: Custom `Hero` animations between Home and List screens.
- **Clean Architecture**: Decoupled services for Supabase interactions and reusable UI components.

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
5. Create a `config.json` file in the root directory with your Supabase credentials:
   ```json
   {
     "URL_SUPABASE_DB": "your_project_url",
     "KEY_SUPABASE_DB": "your_anon_key"
   }
7. Run the app using the configuration file:
   ```bash
   flutter run --dart-define-from-file=config.json

## Usage

To use the app, follow these steps:

1. Open the app and you will see the home screen.

![Alt Text](https://github.com/SergioLM7/crud_flutter/blob/main/assets/images/homescreen.png "Home screen")

2. Tap on the "Wand" card to view and manage the list of wands.

![Alt Text](https://github.com/SergioLM7/crud_flutter/blob/main/assets/images/wandslist.png "Wands list screen")

3. Tap on the + button to add a new Wand.
4. Tap on the "House" card to view and manage the list of houses.

![Alt Text](https://github.com/SergioLM7/crud_flutter/blob/main/assets/images/houseslist.png "Houses list screen")

5. Tap on the + button to add a new House.
6. Tap on the "Wizard" card to view and manage the list of wizards.

![Alt Text](https://github.com/SergioLM7/crud_flutter/blob/main/assets/images/wizardslist.png "Wizards list screen")

7. Tap on the + button to add a new Wizard.

## Contributing

Contributions are welcome. If you find any issues or have suggestions for improvements, please open an issue or submit a pull request.
