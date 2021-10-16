
#import "./include/Tweak.h"
%hook SBHomeScreenView
%property (assign,nonatomic) BOOL addedObserver;

- (void)layoutSubviews {
    %orig;
    if (!self.addedObserver) {
        @try {
        dispatch_time_t delay = dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_SEC * 2);
        dispatch_after(delay, dispatch_get_main_queue(), ^(void){
			NSLog(@"Running in Legacy, adding observer");
            [[NSNotificationCenter defaultCenter] addObserver:self 
                selector:@selector(handleNotification:) 
                name:@"com.midnightchips.testNotif" object:nil];

                self.addedObserver = TRUE;
		});
        }
        @catch (NSException *err) {
            NSLog(@"Failed to post %@", err.reason);
        }
    }
}

%new
-(void)handleNotification:(NSNotification *) notification {
    NSLog(@"Got the Notification, running the update, OBJC");
}


%end