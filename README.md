# Dog Nutrition and Food Finder App 🐾

Welcome to **Dog Nutrition and Food Finder**, a Flutter app designed to help dog owners discover and purchase high-quality dog food and nutrition-related products. Along with a rich shopping experience, it provides educational content to guide users on proper dog nutrition based on breed, age, and dietary needs.

## 📱 Key Features

### User Authentication & Profiles
- User registration and login with email.
- Manage user profiles: update personal information, addresses, and payment methods.

### 🛒 Product Catalog
- Browse a wide range of dog food and nutrition products.
- Filter and sort products by **brand, type, age group**, and more.
- View detailed product descriptions, prices, and customer reviews.

### 🛍️ Shopping Cart
- Add products to the shopping cart for easy purchase.
- Adjust quantities, remove items, and view subtotal and total costs.
- **Proceed to Checkout** button for a seamless shopping experience.

### 📚 Educational Content
- Access articles, videos, and guides on dog nutrition.
- Learn about different **dog breeds**, their **life stages**, dietary needs, and **health tips**.

## ⚙️ Technology Stack

- **Flutter**: Frontend framework for building the UI and app logic.
- **Firebase**: Backend integration for authentication, database, and storage.
  - Firebase Authentication for secure login.
  - Firestore for storing product data, user profiles, and educational content.
  - Firebase Storage for images and media.

## 🚀 Getting Started

1. Clone this repository:

   ```bash
   git clone https://github.com/yourusername/dog-nutrition-app.git
   cd dog-nutrition-app

2. Install dependencies

  ```bash
  flutter pub get

```
3. Configure Firebase:

  Add your Firebase project configuration files (google-services.json for Android and GoogleService-Info.plist for iOS).
  
4. Run the app:

  ```bash
  flutter run
```
## 📂 Folder Structure

lib/
│
├── models/            # Data models for product, user, etc.
├── screens/           # Screens for authentication, catalog, cart, and more
├── services/          # Firebase services for authentication, database access
├── widgets/           # Reusable UI components
└── main.dart          # App entry point
