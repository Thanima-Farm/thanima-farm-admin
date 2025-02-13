📌 Getting Started
The entry point of this project is [main.dart].

🏛 Architecture Pattern: BLoC (Business Logic Component)
    This application follows the BLoC pattern for state management to ensure a clear separation of concerns and predictable state transitions.

        Model → Handles data structures and interacts with external services (APIs, databases).
        View → Displays the UI and listens for state changes.
        BLoC (Business Logic Component) → Manages application state and business logic.
        Events → Represent user interactions or triggers that affect state.
        State → Represents different UI conditions based on BLoC responses.

📂 Project Structure
    We have followed a modular and scalable project structure, ensuring code readability, maintainability, and reusability.


📌 File Naming Conventions
✅ Use this format:
    ✔ user_data_bloc.dart (lowercase words separated by underscores)

🚫 Avoid these formats:
    ✘ userDataBloc.dart (CamelCase)
    ✘ UserDataBloc.dart (PascalCase)
    ✘ LOGINBLOC.dart (All uppercase)
    ✘ User_Data_Bloc.dart (Underscore with uppercase words)

📌 Variable & Method Naming Conventions
    ✅ Use camelCase:
    ✔ getUserData()
    ✔ fetchUserProfile()
    ✔ emitLoadingState()

🚫 Avoid:
    ✘ get_user_data() (Snake case)
    ✘ GETUSERDATA() (All uppercase)
    ✘ Get_User_Data() (Pascal with underscores)

📂 Folder & File Structure (BLoC Architecture)
    lib
    ├── blocs         # Stores BLoC logic for state management
    │    ├── user_bloc
    │    │    ├── user_bloc.dart      # Manages business logic
    │    │    ├── user_event.dart     # Defines user-related events
    │    │    ├── user_state.dart     # Defines states for UI updates
    ├── models        # Data models sourced from APIs, databases, or user input
    ├── repositories  # API calls, Firebase, local storage, and data-fetching logic
    ├── services      # Handles interactions between repositories and other app layers
    ├── utils         # Constants, helpers, enums, validators, reusable methods
    ├── views         # UI components, screens, and widgets
    ├── widgets       # Reusable UI components
    ├── app.dart      # Theme setup & route management
    ├── main.dart     # App entry point, initializes BLoCs & dependencies

📌 Detailed Breakdown of Key Directories

1️⃣ main.dart (Entry Point)
    Initializes Firebase, analytics, crash reporting, and dependency injection.
    Registers BLoCs using BlocProvider to manage state.

2️⃣ app.dart
    Defines themes, navigation routes, and app-wide configurations.

3️⃣ blocs/ (State Management Layer)
    Each feature has its own BLoC folder containing:

        feature_bloc.dart → Contains the business logic.
        feature_event.dart → Defines the events (e.g., FetchDataEvent).
        feature_state.dart → Defines the UI states (e.g., LoadingState, LoadedState, ErrorState).

    Example: User BLoC
        blocs
        ├── user_bloc
        │    ├── user_bloc.dart      # Handles business logic
        │    ├── user_event.dart     # Defines user-related events
        │    ├── user_state.dart     # Defines UI states

4️⃣ models/ (Data Layer)
    Contains data models that interact with APIs, local databases, or user input.

5️⃣ repositories/ (Data Fetching Layer)
    Manages API requests, Firebase, local storage, and data processing.
    Acts as a bridge between BLoC and external data sources.

6️⃣ services/ (Backend & External Services)
    Handles interactions with repositories, Firebase, shared preferences, and other backend services.

7️⃣ utils/ (Utility Functions)
    Stores constants, enums, helpers, validators, and common utility functions.

8️⃣ views/ (UI Layer)
    Contains screens and sub-widgets for different app sections.

9️⃣ widgets/ (Reusable Components)
    Contains reusable UI elements like buttons, cards, dialogs, loaders.

🚀 Why Use This Structure?
    ✅ Scalability → New features can be added without affecting existing logic.
    ✅ Maintainability → Clearly defined layers improve debugging.
    ✅ Reusability → Modular BLoCs and widgets reduce redundant code.
    ✅ Predictability → State transitions are easy to track.
    ✅ Separation of Concerns → UI, logic, and data remain independent.