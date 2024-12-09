Here’s the updated **README.md** file with the inclusion of the **Provider** package:

# Country's App

A Flutter application that displays a list of countries fetched from an API. The app allows users to mark countries as favorites, view them in a separate list, and delete countries from their favorites. Data is managed efficiently using the **Provider** package and persisted with **Shared Preferences**.

---

## Features

- **Country List**: Fetch and display a list of countries using an API.
- **Mark as Favorite**: Add a country to the favorites list.
- **View Favorites**: View all the countries marked as favorites.
- **Delete Favorites**: Remove countries from the favorites list.
- **Persistent Data**: Store and retrieve favorite countries using Shared Preferences.
- **State Management**: Manage app state (favorites, API data) with the `Provider` package for better performance and scalability.

---

## Packages Used

- [**http**](https://pub.dev/packages/http): For making API calls to fetch country data.
- [**shared_preferences**](https://pub.dev/packages/shared_preferences): For saving and retrieving user preferences (favorites).
- [**provider**](https://pub.dev/packages/provider): For state management.

---

## How It Works

1. **Fetch Countries**: The app fetches a list of countries from a REST API using the `http` package.
2. **State Management with Provider**:
   - The `Provider` package is used to manage state efficiently across the app.
   - A `CountryProvider` class holds the list of countries and favorites.
   - UI components listen to updates from the `Provider` for seamless reactivity.
3. **Mark as Favorite**: Users can mark a country as a favorite by tapping the "Add to Favorites" button.
4. **Persist Data**: Favorites are stored locally using the `shared_preferences` package, ensuring data is retained even after the app is closed.
5. **Delete Favorites**: Users can remove a country from the favorites list, which updates the stored data and reflects instantly in the UI.

---

## API Integration

The app fetches country data from an external API. Replace the base URL in the source code with the desired API endpoint. Example:
```dart
const String apiUrl = "https://restcountries.com/v3.1/all";
```

### Screenshots 📷


<div align="left">
   
<img src= "https://github.com/Zimil-Patel/country_explore/blob/main/snaps/snap1.png" height = 590 width = 300> &nbsp;&nbsp;&nbsp;&nbsp; <img src= "https://github.com/Zimil-Patel/country_explore/blob/main/snaps/snap2.png" height = 590 width = 300> &nbsp;&nbsp;&nbsp;&nbsp; <img src= "https://github.com/Zimil-Patel/country_explore/blob/main/snaps/snap3.png" height = 590 width = 300> &nbsp;&nbsp;&nbsp;&nbsp;

   
</div>

### Video Preview 🎥




