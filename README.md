# Flutter Development Task

This Flutter project consists of three screens:

1. **Login Screen**
2. **Home Screen**
3. **Description Screen**

## Screenshots

![Login Screen](/assets/output%20images/login_screen.jpg)
![Home Screen](/assets/output%20images/individual_meetup_screen.jpg)
![Description Screen](/assets/output%20images/meetup_detail_description_screen.jpg)
![Share Feature](/assets/output%20images/share_feature.jpg)


![Video Demo](/assets/output%20images/vedio_recording.mp4)

## APK Downloads

- [Download Release APK](https://drive.google.com/file/d/15oWriIN6LR2DfEwxhSDm3IdYqkVbM4vr/view?usp=drive_link)
- [Download Debug APK](https://drive.google.com/file/d/1pe3H5djFwR3huzyE7q8QQGPMi0cOMzry/view?usp=drive_link)

## Login Screen

### Description
The Login Screen allows users to log in with their credentials. Users need to enter their email and password, which are validated before allowing submission. Upon successful login, the user is navigated to the Home Screen.

### API Integration
The login functionality is integrated with the API endpoint provided in the task description. The user's email and password are sent to the server in FormData format, with the password converted to SHA256 before sending.

### Validation
- Email validation ensures that the entered email follows a valid format.
- Password validation ensures that the entered password meets the required criteria.

## Home Screen

### Description
The Home Screen displays three images and two scrollable lists of cards and items. Users can scroll through the lists to view more items. Clicking on an item navigates the user to the Description Screen.

### Features
- Three images are displayed statically.
- Two scrollable lists are populated with a minimum of three cards and five items respectively.

## Description Screen

### Description
The Description Screen displays details about a selected item. Additionally, it features a share icon that, when clicked, opens the default mobile share options.

### Features
- Displays details about the selected item.
- Allows users to share the item via the default mobile share options.

## How to Run

1. Clone the repository:

   ```
   git clone <repository_url>
   ```

2. Navigate to the project directory:

   ```
   cd <project_directory>
   ```

3. Install dependencies:

   ```
   flutter pub get
   ```

4. Run the app:

   ```
   flutter run
   ```

## Technologies Used

- Flutter
- Dart

## Packages Used
- cupertino_icons: Provides Cupertino (iOS-style) icons for use in Flutter apps.

- flutter_bloc: Implements the BLoC (Business Logic Component) pattern for managing state in Flutter applications.

- http: Enables making HTTP requests for fetching data from APIs or sending data to servers.

- crypto: Provides cryptographic algorithms for hashing, encryption, and decryption.

- shared_preferences: Offers a persistent storage solution for simple data (such as tokens, user preferences) on the device.

- carousel_slider: Allows for easy implementation of image carousels or sliders in Flutter apps.

- dots_indicator: Provides a customizable indicator for the carousel_slider package, displaying dots to indicate the current position within a carousel.

- share_plus: Facilitates sharing content from Flutter apps to other apps or platforms, such as social media or messaging apps.
