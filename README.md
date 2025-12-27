# Tasty 🍔 - Modern Food Delivery & Ordering App

**Tasty** is a high-performance, feature-rich Food Delivery application built with **Flutter**. It follows a strictly organized **Feature-Based Architecture** and integrates advanced security, configuration, and localization practices to simulate a real-world production environment.

> **Note:** The internal package name is `com.example.yumzy` due to early-stage branding, but the application is fully branded and published as **Tasty**.

---

## 🚀 Key Features

* **Dynamic Product Discovery:** Browse an extensive menu of meals and sandwiches fetched via a RESTful API.
* **Smart Customization:** Add toppings and extra options to your orders with real-time price updates.
* **Cart & Order Management:** Full cart functionality and a detailed **Order History** to track previous meals.
* **User Profile & Security:** Manage personal info, delivery addresses, and payment cards securely.
* **Multilingual Support (Localization):** Fully supports **Arabic** and **English** languages with a seamless user experience.
* **Smart Authentication Flow:** Allows "Guest Browsing," but prompts for Login/Sign-up only when the user decides to checkout.

---

##  Tech Stack & Architecture

This project follows a **Feature-Based Clean Architecture** to ensure scalability and maintainability.

### Tools & Libraries:
* **State Management:** [Bloc / Cubit](https://pub.dev/packages/flutter_bloc) for predictable state logic.
* **Navigation:** [Go_Router](https://pub.dev/packages/go_router) for advanced, declarative routing.
* **Networking:** [Dio](https://pub.dev/packages/dio) with custom interceptors and `ApiService`.
* **Internationalization (i18n):** Powered by the `intl` package for robust **Arabic/English** support.
* **UI & UX Enhancements:**
    * **Skeletonizer:** For modern, shimmer-effect loading states.
    * **Cached Network Image:** Optimized image loading and memory management.
    * **Flutter SVG & Iconsax:** High-quality vector graphics and modern iconography.
* **Security:** * **SSL Pinning:** To secure API communication against MITM attacks.
    * **Flutter Secure Storage:** For encrypted local data storage (Tokens, Payment Info).
* **Firebase Suite:** * **Crashlytics:** For real-time error reporting.
    * **Remote Config:** For dynamic UI updates and configurations.

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
