A Flutter-based Reel-style video gallery app where users can pick videos from their device, and the app will maintain a queue of video paths in local storage using SharedPreferences. Each video also keeps track of its likes count, ensuring persistence across app restarts. The app also features a Lottie-powered splash screen for a smooth entry animation.

✨ Features

📂 Video Selection: Pick videos directly from your gallery using image_picker.

📌 Queue System: Store videos in a FIFO-style queue inside SharedPreferences for persistent storage.

❤️ Like System: Each video has its own like count, which updates instantly and is saved in local storage.

🎬 Reel Style Playback: Videos are displayed in a PageView builder with full-screen aspect ratio.

🌟 Animated Splash Screen: Beautiful Lottie animation plays on app launch.

🔄 Persistent State: Queue and like counts are restored even after closing the app.

🛠️ Tech Stack

Flutter (Dart)

SharedPreferences (local storage)

Image Picker (to choose videos from gallery)

Lottie (for splash screen animations)

PageView (for reel-style video browsing)


📁 Folder Architecture Overview

android / ios / linux / macos / web / windows
Platform-specific code for building and running your Flutter app on each target.

assets/animations
Stores static assets like Lottie animations (splash.json) or other media files.

lib/
Core Flutter app code:

data/videoqueue.dart → Handles video queue management and local storage logic.

widget/ → Contains UI components and screens:

uihelper.dart → Utility functions/widgets for UI. // inside wigets

// outside widget folder 
homescreen.dart → Main screen showing the reel-style video gallery.

main.dart → Entry point of the app.

splashscreen.dart → Lottie-powered splash screen.

build/
Auto-generated folder for compiled app files.

test/
Contains unit/widget tests for your app.

.idea, .gitignore, .metadata, analysis_options.yaml, devtools_options.yaml
Configuration and IDE-related files.


How to Run The Project
1.Open your Flutter project directory in a terminal or within your code editor (e.g., Visual Studio Code).
2.Connect a physical device or start an emulator, then run flutter devices to confirm it is recognized by Flutter.
3.Navigate to the project's root directory and enter flutter run to build and launch your app on the selected device.
4.Use hot reload and observe logs in the terminal for quick development and debugging
