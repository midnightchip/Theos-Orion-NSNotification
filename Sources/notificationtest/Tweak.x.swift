import notificationtestC
import Orion
import os 

class SBHomeScreenViewHook: ClassHook<SBHomeScreenView> {
    @Property(.nonatomic) var addedSwiftObserver: Bool = false
    let logger = Logger(subsystem: "NotificationTest", category: "Tweak");

    func layoutSubviews() {
        orig.layoutSubviews()
        if !addedSwiftObserver {
            callMe()
            NotificationCenter.default.addObserver(self, selector: #selector(methodOfReceivedNotification(notification:)), name: Notification.Name("com.midnightchips.testNotif"), object: nil)
            addedSwiftObserver = true
        }
    }

    // orion:new
    @objc func methodOfReceivedNotification(notification _: Notification) {
        logger.log("Hello from swift")
    }

    // orion:new
    @objc func callMe() {
        logger.log("Oh Hi Mark, - SWIFT");
    }
}
