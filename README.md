# Flutter IPTV App TVPro 📺

A cross-platform IPTV streaming application built using **Flutter**, following the **MVC (Model-View-Controller)** architectural pattern. It fetches a list of streams via API and displays them in a user-friendly interface. Tapping a channel opens a full-screen HLS video player.

---

## ✨ Features

- MVC structured Flutter app.
- Fetches IPTV streams from REST API.
- Displays logo, name, and quality.
- Opens a full-screen video player on tap.
- Supports HLS (`.m3u8`) video playback.
- Lightweight and responsive UI (mobile & web supported).
- CORS-safe video loading with `better_player`.

---

## 🧱 Project Structure

```
lib/
├── controllers/
│   └── stream_controller.dart       # Handles stream data fetching and logic
├── models/
│   └── stream_model.dart            # Model class for IPTV stream item
├── views/
│   ├── stream_list_view.dart        # Displays list of stream tiles
│   └── video_player_view.dart       # Opens selected stream in player
├── services/
│   └── stream_service.dart          # Handles API requests
├── main.dart                        # App entry point and route setup
```

---

## 🧪 API Data Format

The API should return JSON in this format:

```json
[
  {
    "channel": "BBCOne.uk",
    "feed": "EastMidlandsHD",
    "url": "http://stream-url.m3u8",
    "referrer": "http://example.com/",
    "user_agent": "CustomAgent/1.0",
    "quality": "720p"
  }
]
```

---

## 🧰 Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  http: ^0.14.0
  better_player: ^0.0.84
```

> Note: Web support requires fixing or replacing `better_player`. Consider alternatives like `video_player` or platform channels if issues persist.

---

## 🛠 Setup Instructions

1. Clone the repo:
   ```bash
   git clone https://github.com/yourusername/flutter-iptv-app.git
   cd flutter-iptv-app
   ```

2. Install packages:
   ```bash
   flutter pub get
   ```

3. Run on device/web:
   ```bash
   flutter run -d chrome
   ```

---

## ⚙️ Configuration

Change your API URL in `stream_service.dart`:
```dart
const apiUrl = 'https://your-api-url.com/streams';
```

---

## 🧠 Credits

Developed by [Your Name](https://github.com/yourusername)  
Powered by Flutter ❤️

---

## 📄 License

This project is open source under the [MIT License](LICENSE).
