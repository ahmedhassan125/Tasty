# Tasty 🍔 - Modern Food Delivery & Ordering App

**Tasty** is a high-performance, feature-rich Food Delivery application built with **Flutter**. It follows a strictly organized **Feature-Based Architecture** and integrates advanced security and configuration practices to simulate a real-world production environment.

> **Note:** The internal package name is `com.example.yumzy` due to early-stage branding, but the application is fully branded and published as **Tasty**.

---

##  Key Features

* **Dynamic Product Discovery:** Browse an extensive menu of meals and sandwiches fetched via a RESTful API.
* **Smart Customization:** Add toppings and extra options to your orders with real-time price updates.
* **Cart & Order Management:** Full cart functionality and a detailed **Order History** to track previous meals.
* **User Profile & Security:** Manage personal info, delivery addresses, and payment cards securely.
* **Smart Authentication Flow:** Allows "Guest Browsing," but prompts for Login/Sign-up only when the user decides to checkout.
* **Internationalization (i18n):** Full support for **Arabic** and **English** languages.

---

##  Tech Stack & Architecture

This project follows a **Feature-Based Clean Architecture** to ensure scalability and maintainability. Each feature is decoupled into:
- `screens/`: UI layer for the main feature views.
- `widgets/`: Reusable UI components specific to the feature.
- `data/`: Logical layer consisting of:
    - `models/`: Data structures.
    - `repo/`: Data abstraction layer.
    - `cubit/`: State management logic using Bloc/Cubit.

### Tools & Libraries:
* **State Management:** [Bloc / Cubit](https://pub.dev/packages/flutter_bloc) for predictable state transitions.
* **Networking:** [Dio](https://pub.dev/packages/dio) with a customized `DioHelper` and `ApiService` for clean requests.
* **Security:** * **SSL Pinning:** To prevent Man-in-the-Middle (MITM) attacks.
    * **Flutter Secure Storage:** For encrypting sensitive user data like tokens and credit card info.
* **Firebase Integration:**
    * **Crashlytics:** For real-time error reporting and stability tracking.
    * **Remote Config:** For dynamic UI updates and A/B testing without redeploying.
* **Localization:** Built-in multi-language support (AR/EN).

---

## 📂 Project Structure Example
```text
lib/
└── features/
    └── [feature_name]/
        ├── data/
        │   ├── cubit/
        │   ├── models/
        │   └── repo/
        ├── screens/
        └── widgets/
