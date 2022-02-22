# FoodFast
<div>IIITB Canteen  App</div>
<h1>Setting up Project</h1>
It’s all about (the) IDE
The next step in your Flutter application development is to install an IDE (Integrated Development Environment). In theory, IDE is not needed and you can use only the SDK and any text editor for development. However, IDEs provide features like syntax highlighting, code completion, and debugger which are very helpful during the development process. In this tutorial, we will use Android Studio.

Flutter also provides official plugins for IntelliJ and Visual Studio Code. In case of Android Studio and IntelliJ, don’t forget to restart the IDE to activate the newly installed plugins (this is not needed for VS Code). Note that only stable versions of IDEs are supported, the Flutter plugin may not function properly on Beta, Canary, or EAP (Early Access Preview) builds.

Now it’s time to create a new project. On the welcome screen, choose Start a new Flutter Project and select Flutter Application on the next screen.

<img src = "READMEResources/img-1.jfif"/>

On a next screen you’ll need to provide the Flutter SDK path and basic project details.
<img src = "READMEResources/img-2.jfif"/>

Finally, set your domain name for the package. It’s important for package name to be unique (for signing and publishing purposes). If you don’t own a domain, use com.github.<your login> . Leave the other options set to default values and confirm by clicking Finish.
 
 <img src = "READMEResources/img-3.jfif"/>
  
  Our project is created. Let’s try to build it!
  
 <h1>Android</h1>
  
  In the case of a physical Android device, it needs to be connected via a USB cable and have USB debugging enabled (see how to do that in the official developer guide).

In the case of an Android emulator, we need to create a virtual device. First, let’s open the AVD manager by either using the icon on the toolbar or pressing Ctrl+Alt+F12 (Cmd+Alt+F12 on macOS) and typing the action name.
  <img src = "READMEResources/img-4.jfif"/>

 <div>Leave default settings on the next screens:</div>
  <img src = "READMEResources/img-5.jfif"/>
  <img src = "READMEResources/img-6.jfif"/>
  
  Creating an AVD is a one-off action. Once created, it will be available until explicitly removed.

Now it’s time to run our app! Choose the desired device or emulator and press Shift+F10 (Ctrl+R on macOS) or use the Run button.
 <img src = "READMEResources/img-7.jfif"/>
 
  
 <h1> iOS</h1>
 <div>In the case of iOS simulator, we first need to open it using the dropdown device menu:</div>
  <img src = "READMEResources/img-8.jfif"/>
  
  The Xcode installer will prompt you to install the missing components (if there are any). After a while, the simulator should appear and become available on the device menu.

Things are a little bit more complicated in the case of a physical iOS device. Assuming that the device is connected via a USB cable and unlocked (keep in mind the additional key prompt after connecting a cable), we first need to open the iOS module in Xcode:
 <img src = "READMEResources/img-9.jfif"/>
 <div>Then go to the Signing & Capabilities settings tab and add a new personal team:</div>
  <img src = "READMEResources/img-10.jfif"/>
  
  Sign in to your Apple ID (create a new one if needed). After closing the Accounts window, provisioning profiles will be generated.

If you get an error which states that the app identifier cannot be registered like this:
  
  <img src = "READMEResources/img-11.jfif"/>
  
  It means that someone is already using your identifier. You need to change the Bundle Identifier value to something else.

After signing is configured, you can try to run the app from Android Studio. The first attempt will fail because the provisioning profile is not trusted on the device. You need to trust it in Profiles & Device Management settings:
 <div><img src = "https://cdn-dppbk.nitrocdn.com/yQqYxSaTIazRSTSDbfxPrqFzJPJOhsTG/assets/static/optimized/rev-9a619c4/wp-content/uploads/2020/02/output.gif"/></div>
  
  Note that at the time of writing this article, it’s impossible to run Flutter apps provisioned using (free of charge) Personal Team provisioning profiles on devices running on iOS 13.3.1. It’s a limitation introduced by Apple. You can watch this issue to be notified about progress.

Once the profile is trusted, you can launch the app from the home screen.
  
 <h1>Launch</h1>
The first launch may take a few minutes because of initializing the emulator/simulator and installing the SDK components. However, it should be almost instant in most cases the next time. Alternatively, you can also use the flutter run  command in the terminal window.

Note that if you are using Linux with kernel 5.5.x, your builds may hang for an infinite period of time due to this Flutter issue: https://github.com/flutter/flutter/issues/49185. This problem is probably caused by another Dart issue: https://github.com/dart-lang/sdk/issues/40589. At the time of writing this article, these are still under investigation.

At this point our app should look like this:
  
<img src = "READMEResources/img-13.jfif"/>
  
  Let’s click on FAB (Floating Action Button) and see that the counter is changing.

Now it’s time to write some code. Let’s go to the line #21 and change the blue color to something else and use the Hot reload option (Ctrl+\ or Alt+\ on macOS) to apply changes immediately. Note that counter value was preserved.
 
 
 <h1> Setting up Firebase Project</h1>

First, log in with your Google account to manage your Firebase projects. From within the Firebase dashboard, select the Create new project button and give it a name:

<img src = "READMEResources/img-14.jfif"/>
 <div>Next, we’re given the option to enable Google Analytics. This tutorial will not require Google Analytics, but you can also choose to add it to your project.</div>

 <img src = "READMEResources/img-15.jfif"/>
 If you choose to use Google Analytics, you will need to review and accept the terms and conditions prior to project creation.

After pressing Continue, your project will be created and resources will be provisioned. You will then be directed to the dashboard for the new project.
 
 <h1>Adding Android support</h1>
 <h2>Registering the App</h2>
 
In order to add Android support to our Flutter application, select the Android logo from the dashboard. This brings us to the following screen:

 <img src = "READMEResources/img-16.jfif"/>

The most important thing here is to match up the <b>Android package name</b> that you choose here with the one inside of our application.

The structure consists of at least two segments. A common pattern is to use a domain name, a company name, and the application name:

 <div>com.example.flutterfirebaseexample</div>
Once you’ve decided on a name, open android/app/build.gradle in your code editor and update the applicationId to match the <b>Android package name:</b>
<div>In android/app/build.gradle file</div>
 <pre>
...
defaultConfig {
    // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
    applicationId 'com.example.flutterfirebaseexample'
    ...
}
...
 </pre>
 
 You can skip the app nickname and debug signing keys at this stage. Select Register app to continue.

 <h2>Downloading the Config File</h2>
The next step is to add the Firebase configuration file into our Flutter project. This is important as it contains the API keys and other critical information for Firebase to use.

 Select Download <b>google-services.json</b> from this page:
 <img src = "READMEResources/img-17.jfif"/>
 Next, move the google-services.json file to the android/app directory within the Flutter project.

 <h2>Adding the Firebase SDK</h2>
We’ll now need to update our Gradle configuration to include the Google Services plugin.

Open android/build.gradle in your code editor and modify it to include the following:
In android/build.gradle
<pre>
 buildscript {
  repositories {
    // Check that you have the following line (if not, add it):
    google()  // Google's Maven repository
  }
  dependencies {
    ...
    // Add this line
    classpath 'com.google.gms:google-services:4.3.6'
  }
}

allprojects {
  ...
  repositories {
    // Check that you have the following line (if not, add it):
    google()  // Google's Maven repository
    ...
  }
}
 </pre>
 Finally, update the app level file at android/app/build.gradle to include the following:
 In android/app/build.gradle
 <pre>
  apply plugin: 'com.android.application'
// Add this line
apply plugin: 'com.google.gms.google-services'

dependencies {
  // Import the Firebase BoM
  implementation platform('com.google.firebase:firebase-bom:28.0.0')

  // Add the dependencies for any other desired Firebase products
  // https://firebase.google.com/docs/android/setup#available-libraries
}
 </pre>
 With this update, we’re essentially applying the Google Services plugin as well as looking at how other Flutter Firebase plugins can be activated such as Analytics.

From here, run your application on an Android device or simulator. If everything has worked correctly, you should get the following message in the dashboard:
<img src = "READMEResources/img-18.png"/>
 
 Next up, let’s add iOS support!

 <h2>Adding iOS Support</h2>
In order to add Firebase support for iOS, we have to follow a similar set of instructions.

Head back over to the dashboard and select Add app and then iOS icon to be navigated to the setup process.

 <h2>Registering an App</h2>
Once again, we’ll need to add an “iOS Bundle ID”. It is possible to use the “Android package name” for consistency:
 <img src = "READMEResources/img-19.png"/>
 You’ll then need to make sure this matches up by opening the iOS project up in Xcode at ios/Runner/Runner.xcodeproj and changing the <b>Bundle identifier</b> under General:
 <img src = "READMEResources/img-20.png"/>
 Click <b>Register app</b> to move to the next screen.

 <b>Downloading the Config File</b>
In this step, we’ll need to download the configuration file and add this to our Xcode project
 <img src = "READMEResources/img-21.png"/>
 <b>Download</b> GoogleService-Info.plist and move this into the root of your Xcode project within Runner:
 <img src = "READMEResources/img-22.png"/>
 Be sure to move this file within Xcode to create the proper file references.

There are additional steps for installing the Firebase SDK and adding initialization code, but they are not necessary for this tutorial.

That’s it!
