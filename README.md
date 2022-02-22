# FoodFast
<div>IIITB Canteen  App</div>
<h1>Setting up Project</h1>
It’s all about (the) IDE
The next step in your Flutter application development is to install an IDE (Integrated Development Environment). In theory, IDE is not needed and you can use only the SDK and any text editor for development. However, IDEs provide features like syntax highlighting, code completion, and debugger which are very helpful during the development process. In this tutorial, we will use Android Studio.

Flutter also provides official plugins for IntelliJ and Visual Studio Code. In case of Android Studio and IntelliJ, don’t forget to restart the IDE to activate the newly installed plugins (this is not needed for VS Code). Note that only stable versions of IDEs are supported, the Flutter plugin may not function properly on Beta, Canary, or EAP (Early Access Preview) builds.

Now it’s time to create a new project. On the welcome screen, choose Start a new Flutter Project and select Flutter Application on the next screen.

<img src = "https://cdn-dppbk.nitrocdn.com/yQqYxSaTIazRSTSDbfxPrqFzJPJOhsTG/assets/static/optimized/rev-9a619c4/wp-content/uploads/2020/02/image4-555x334.png"/>

On a next screen you’ll need to provide the Flutter SDK path and basic project details.

<img src = "https://cdn-dppbk.nitrocdn.com/yQqYxSaTIazRSTSDbfxPrqFzJPJOhsTG/assets/static/optimized/rev-9a619c4/wp-content/uploads/2020/02/image14-555x309.png"/>

Finally, set your domain name for the package. It’s important for package name to be unique (for signing and publishing purposes). If you don’t own a domain, use com.github.<your login> . Leave the other options set to default values and confirm by clicking Finish.
 
 <img src = "https://cdn-dppbk.nitrocdn.com/yQqYxSaTIazRSTSDbfxPrqFzJPJOhsTG/assets/static/optimized/rev-9a619c4/wp-content/uploads/2020/02/image6-555x311.png"/>
  
  Our project is created. Let’s try to build it!
  
 <h1>Android</h1>
  
  In the case of a physical Android device, it needs to be connected via a USB cable and have USB debugging enabled (see how to do that in the official developer guide).

In the case of an Android emulator, we need to create a virtual device. First, let’s open the AVD manager by either using the icon on the toolbar or pressing Ctrl+Alt+F12 (Cmd+Alt+F12 on macOS) and typing the action name.
 <img src = "https://cdn-dppbk.nitrocdn.com/yQqYxSaTIazRSTSDbfxPrqFzJPJOhsTG/assets/static/optimized/rev-9a619c4/wp-content/uploads/2020/02/image7-555x149.png"/>
  
 <div>Leave default settings on the next screens:</div>
  <img src = "https://cdn-dppbk.nitrocdn.com/yQqYxSaTIazRSTSDbfxPrqFzJPJOhsTG/assets/static/optimized/rev-9a619c4/wp-content/uploads/2020/02/image1-555x251.png"/>
  <img src = "https://cdn-dppbk.nitrocdn.com/yQqYxSaTIazRSTSDbfxPrqFzJPJOhsTG/assets/static/optimized/rev-9a619c4/wp-content/uploads/2020/02/image2-555x167.png"/>
  
  Creating an AVD is a one-off action. Once created, it will be available until explicitly removed.

Now it’s time to run our app! Choose the desired device or emulator and press Shift+F10 (Ctrl+R on macOS) or use the Run button.
 <img src = "https://cdn-dppbk.nitrocdn.com/yQqYxSaTIazRSTSDbfxPrqFzJPJOhsTG/assets/static/optimized/rev-9a619c4/wp-content/uploads/2020/02/image9-555x71.png"/>
 
  
 <h1> iOS</h1>
 <div>In the case of iOS simulator, we first need to open it using the dropdown device menu:</div>
  <img src = "https://cdn-dppbk.nitrocdn.com/yQqYxSaTIazRSTSDbfxPrqFzJPJOhsTG/assets/static/optimized/rev-9a619c4/wp-content/uploads/2020/02/image8.png.webp"/>
  
  The Xcode installer will prompt you to install the missing components (if there are any). After a while, the simulator should appear and become available on the device menu.

Things are a little bit more complicated in the case of a physical iOS device. Assuming that the device is connected via a USB cable and unlocked (keep in mind the additional key prompt after connecting a cable), we first need to open the iOS module in Xcode:
 <img src = "https://cdn-dppbk.nitrocdn.com/yQqYxSaTIazRSTSDbfxPrqFzJPJOhsTG/assets/static/optimized/rev-9a619c4/wp-content/uploads/2020/02/image15-555x239.png"/>
 <div>Then go to the Signing & Capabilities settings tab and add a new personal team:</div>
  <img src = "https://cdn-dppbk.nitrocdn.com/yQqYxSaTIazRSTSDbfxPrqFzJPJOhsTG/assets/static/optimized/rev-9a619c4/wp-content/uploads/2020/02/image11-555x215.png"/>
  
  Sign in to your Apple ID (create a new one if needed). After closing the Accounts window, provisioning profiles will be generated.

If you get an error which states that the app identifier cannot be registered like this:
  
  <img src = "https://cdn-dppbk.nitrocdn.com/yQqYxSaTIazRSTSDbfxPrqFzJPJOhsTG/assets/static/optimized/rev-9a619c4/wp-content/uploads/2020/02/image13.png.webp"/>
  
  It means that someone is already using your identifier. You need to change the Bundle Identifier value to something else.

After signing is configured, you can try to run the app from Android Studio. The first attempt will fail because the provisioning profile is not trusted on the device. You need to trust it in Profiles & Device Management settings:
 <div><img src = "https://cdn-dppbk.nitrocdn.com/yQqYxSaTIazRSTSDbfxPrqFzJPJOhsTG/assets/static/optimized/rev-9a619c4/wp-content/uploads/2020/02/output.gif"/></div>
  
  Note that at the time of writing this article, it’s impossible to run Flutter apps provisioned using (free of charge) Personal Team provisioning profiles on devices running on iOS 13.3.1. It’s a limitation introduced by Apple. You can watch this issue to be notified about progress.

Once the profile is trusted, you can launch the app from the home screen.
  
 <h1>Launch</h1>
The first launch may take a few minutes because of initializing the emulator/simulator and installing the SDK components. However, it should be almost instant in most cases the next time. Alternatively, you can also use the flutter run  command in the terminal window.

Note that if you are using Linux with kernel 5.5.x, your builds may hang for an infinite period of time due to this Flutter issue: https://github.com/flutter/flutter/issues/49185. This problem is probably caused by another Dart issue: https://github.com/dart-lang/sdk/issues/40589. At the time of writing this article, these are still under investigation.

At this point our app should look like this:
  
<img src = "https://cdn-dppbk.nitrocdn.com/yQqYxSaTIazRSTSDbfxPrqFzJPJOhsTG/assets/static/optimized/rev-9a619c4/wp-content/uploads/2020/02/image3-298x530.png"/>
  
  Let’s click on FAB (Floating Action Button) and see that the counter is changing.

Now it’s time to write some code. Let’s go to the line #21 and change the blue color to something else and use the Hot reload option (Ctrl+\ or Alt+\ on macOS) to apply changes immediately. Note that counter value was preserved.
