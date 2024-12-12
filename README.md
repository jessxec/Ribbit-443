# Ribbit: A Language Visualization App

Ribbit is a language learning app designed to help users improve their pronunciation through **pitch contour visualization** and **dynamic feedback**. The app leverages  speech recognition techniques, user-friendly visualizations, and a gamified learning experience to make learning Chinese engaging and effective.

Contributors: Jessie Chen, Tracy Yang, Jack Sun, Jorge Urias

---
# Users
Ribbit targets English-speaking learners of Chinese who are focused on improving their pronunciation rather than for users who are new to Chinese. These users likely already have a foundational understanding of Chinese vocabulary and grammar but struggle with mastering the tonal system and the subtleties of proper pronunciation. Ribbit addresses their needs by providing tailored practice with tones and intonation through English-based explanations and analogies. Our app is designed for motivated learners who seek to refine their spoken Chinese for effective communication, whether for personal, academic, or professional goals.

---

## Features

- **Pitch Contour Visualization**: Feedback on pronunciation accuracy using pitch contour graphs.
- **Gamified Learning**: Stars and badges to reward accurate pronunciation and encourage continued learning.
- **Dynamic Feedback**: Personalized feedback based on user performance, comparing user pitch to native speaker samples.
- **Modular Lessons**: Lessons structured into progressive modules, each focusing on specific language aspects and theme. Here's a short overview of the modules provided in the current version:
    1. Foundations Island
    2. Navigating Through the Airport
    3. Sunny Day at the Beach
    4. Ordering at a Cafe
    5. Let's Go Camping
- **Audio Processing API**: A custom external API for analyzing user audio input and extracting pitch values for feedback.
- **Firebase Integration**: Used to store user data and track learning progress across modules.

---

## Technologies Used

### Frontend
- **Swift**: iOS development for smoother user experience.

### Backend
- **Firebase**: For storing user data, managing authentication, and tracking progress.
- **Python**: Custom-built audio processing API for pitch analysis and feedback. Voice analysis done on Python Anywhere: https://www.pythonanywhere.com/user/JackSun815/shares/4d1ea9279ea74aef80b725b27afebc0b/
  

### Tools
- **Montreal Forced Aligner**: Used to align user audio with phoneme targets for accurate pronunciation analysis.
- **Parselmouth**: Integrated into the backend for audio pitch analysis.

---

## Installation

### Prerequisites
- **Xcode** (latest version) for running the app on an iOS device or simulator.
- **Python 3.11** with the necessary libraries for running the backend API.

### Steps
1. Clone the repository:
   ```bash
   git clone [https://github.com/yourusername/your-repo-name.git](https://github.com/jessxec/Ribbit-443.git)
   cd your-repo-name
   ```
2. Install the required Python dependencies for the backend:
   ```bash
   pip install -r requirements.txt
   ```
3. Set up Firebase for your app:
   - Add your `GoogleService-Info.plist` file to the Xcode project.
4. Run the backend API:
   ```bash
   python api.py
   ```
5. Build and run the app on Xcode:
   - Open the `.xcodeproj` file in Xcode.
   - Build and run the app on a simulator or connected iOS device.

---

## How It Works

1. **User Recording**: Users record their pronunciation of words or sentences.
2. **Audio Processing**:
   - Audio is uploaded to a custom API for pitch extraction.
   - The API compares user pitch with native speaker samples.
3. **Feedback & Visualization**:
   - Real-time pitch contours are displayed alongside target contours.
   - Users receive feedback based on tone accuracy, pitch flatness, and more.
4. **Progress Tracking**:
   - Firebase tracks user performance, stars, and badges for motivation.

---

## API Details

### Endpoints
#### `/process_audio`
- **Method**: POST
- **Parameters**:
  - `audio`: User audio file (e.g., `.wav` or `.mp3`).
  - `sample_pitch`: JSON array of target pitch values.
- **Response**:
  - `pitch_values`: Normalized pitch values from user audio.
  - `feedback`: Detailed feedback on pronunciation.

---
## Testing
In our project, we included two folders for testing purposes: **RibbitTests** and **RibbitUITests**. Those were the default folders when the project was first created. While these folders were set up to accommodate formal unit and UI tests, we opted for a more hands-on approach during development. Instead of writing automated tests, our team tested the app iteratively as we implemented its features. Each team member randomly navigated through the app, interacting with various components and functionality to ensure that everything looked and performed as intended (figma as reference for UI) after each commit (and throughout). During our user tests, we also tested for functionality by having the user navigate through the app. This informal testing process allowed us to identify and address issues in real time, contributing to a stable and user-friendly application.

Additionally, one of the largest contributing factors for low coverage is also due to the View files. Since we were not required to test the View files, the coverage for these iles is generally low. Our app also relied on user audio tracking which may result in asynchronous wait times, so testing posed as a challenge. We did add safe guards for specific features. For example, we have a transcription service that tests that users are not only hitting the required pitches but that they are also saying the correct words. In addition, we also included print statements in the console to test different functionality including pitch values, files/ data being uploaded correctly. 

---
## Additional Notes
This section is to inform users on potentional mishaps and design/ implementation decisions when using this app.

### Views
In the Views folder, there is another folder called Basics. All pages in this folder is hard coded because the modules and lessons follow another format. For maximum time efficiency, we decided that it was better to hard code this part. Some features such as the interactive table was left unimplemented because it was not considered as part of the MVP which gave us time to focus on other parts of the app. 

On the profile page, there is a section called accuracy tracker. This shows the user's accurracy for each tone based on the modules/ lessons that the user has completed. This feature is designed to give users insight into their performance and progress in mastering Chinese tones. However, the accuracy values are currently hard-coded, as we did not implement backend integration or dynamic data tracking in the interest of time. The streaks values are also harded for the same reasons but theoretically, it keeps track of the days a user was active/ using the app. The gear icon on the profile header is just an image and doesn't actually take you anywhere. However, that is where FAQs and other settings are but again due to the interest of time, we didn't implement this feature.

### Pitch inaccuracy
We do understand that our method of implementation for determining an "accurate" pitch range for users is subjected to errors/ loopholes. Pitch values for native speakers vary and we tried to account for that when we determined an acceptable pitch range. While we did try to place as many safeguards and account for tone variability for different users, it is not extensive given our timeframe and scope of the project. 


### Potential loading problems
When multiple users are building the app, modules may not show up for all users. This is because everytime you build the app, it populates firebase and gets rid of fields. This may only occur if you are modifying the code but commenting out the piece of code in the RibbitApp.swift file that populates the database should solve this issue.

Sometimes when clicking on an audio recording, there may be a delay of a few seconds. Please be patient. 
