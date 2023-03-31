import Foundation
import UIKit

public class ToastMessage {
    private let CHANNEL = "samples.flutter.dev/toastMessage"

    public static func register() {
        let channel = FlutterMethodChannel(name: CHANNEL, binaryMessenger: FlutterViewController().binaryMessenger)
        channel.setMethodCallHandler { (call: FlutterMethodCall, result: FlutterResult) in
            if (call.method == "toastMessage") {
                toastMessage()
            } else {
                result(FlutterMethodNotImplemented)
            }
        }
    }

    private static func toastMessage() {
        let message = "Hello from iOS!"
        if let rootViewController = UIApplication.shared.windows.first?.rootViewController {
            let toast = UIAlertController(title: nil, message: message, preferredStyle: .alert)
            rootViewController.present(toast, animated: true, completion: nil)
            let duration: Double = 2.0
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + duration) {
                toast.dismiss(animated: true, completion: nil)
            }
        }
    }
}
