import Orion
import notificationtestC

class NotificationTestClass {
    static let shared = NotificationTestClass()
    @objc static func fireTestNotification() {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue:"com.midnightchips.testNotif"), object: nil)
    }
}