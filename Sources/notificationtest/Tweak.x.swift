import notificationtestC
import Orion

class SBHomeScreenViewHook: ClassHook<SBHomeScreenView> {
    @Property(.nonatomic) var addedSwiftObserver: Bool = false

    func layoutSubviews() {
        orig.layoutSubviews()
        if !addedSwiftObserver {
            NotificationCenter.default.addObserver(self, selector: #selector(methodOfReceivedNotification(notification:)), name: Notification.Name("com.midnightchips.testNotif"), object: nil)
            addedSwiftObserver = true
        }
    }

    // orion:new
    @objc func methodOfReceivedNotification(notification _: Notification) {
        NSLog("HELLO FROM SWIFT");
    }
}
