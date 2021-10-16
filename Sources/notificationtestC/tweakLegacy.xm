
#import "./include/Tweak.h"
%hook SBHomeScreenView
%property (assign,nonatomic) BOOL addedObserver;

- (void)layoutSubviews {
    %orig;
    if (!self.addedObserver) {
		NSLog(@"Running in Legacy, adding observer");
        [[NSNotificationCenter defaultCenter] addObserver:self 
                selector:@selector(handleNotification:) 
                name:@"com.midnightchips.testNotif" object:nil];

        self.addedObserver = TRUE;
    }
}

%new
-(void)handleNotification:(NSNotification *) notification {
    NSLog(@"Got the Notification, running the update, OBJC");
    [self callMe];
}


%end