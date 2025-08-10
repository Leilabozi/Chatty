# Chatty

**Chatty** is a simple chat application that enables users to sign up, log in, and exchange messages in real-time using Firebase Authentication and Firebase Firestore for data storage.

## Required Features

The following **required** functionality is completed:

- [x] Users can create an account and sign in using Firebase Authentication  
- [x] Users can log in and log out securely  
- [x] Real-time chat messages are stored and retrieved using Firebase Firestore  
- [x] User sessions persist after app is closed and relaunched  


## Video Walkthrough

<div>
    <a href="https://www.loom.com/share/6a6199c4784c4afa8470842b6837ec80">
    </a>
    <a href="https://www.loom.com/share/6a6199c4784c4afa8470842b6837ec80">
      <img style="max-width:300px;" src="https://cdn.loom.com/sessions/thumbnails/6a6199c4784c4afa8470842b6837ec80-2ab03816a481d131-full-play.gif">
    </a>
  </div>

## Notes

- The app uses Firebase SDKs to handle all authentication and database operations, so a working internet connection is required.  
- The app currently supports email/password sign-in method only.  
- This version does not yet support multimedia messaging (images, videos).  

## Setup & Installation

1. Clone the repository  
2. Run `pod install` to install Firebase dependencies  
3. Configure your Firebase project and add the `GoogleService-Info.plist` file to the project  
4. Open `Chatty.xcworkspace` and build the app in Xcode  
5. Ensure your Firebase Authentication and Firestore databases are properly set up  

## License

MIT License 
