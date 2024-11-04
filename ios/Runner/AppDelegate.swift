import UIKit
import Flutter
// import Firebase
// import FirebaseMessaging
import GoogleMaps

@main
@objc class AppDelegate: FlutterAppDelegate {
    
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        // FirebaseApp.configure()
        GMSServices.provideAPIKey("AIzaSyDEU0SDALQ9C0PBycbw9j9eNPbTlaaN2Ic") // Replace "YOUR_GOOGLE_MAPS_API_KEY" with your actual Google Maps API key
        GeneratedPluginRegistrant.register(with: self)
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
  //   func application(application: UIApplication,
  //                   didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
  //      Messaging.messaging().apnsToken = deviceToken
  //  }
    // override func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any]) {
    //     Messaging.messaging().appDidReceiveMessage(userInfo)
    //     print("Received message: \(userInfo)")
    // }
    
    // override func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any],
    //                           fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
    //     Messaging.messaging().appDidReceiveMessage(userInfo)
    //     print("Received message: \(userInfo)")
    //     completionHandler(UIBackgroundFetchResult.newData)
    // }
}
