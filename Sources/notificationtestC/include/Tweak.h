#include <Foundation/Foundation.h>
#include <UIKit/UIKit.h>

@interface SBHomeScreenView : UIView
@property (assign,nonatomic) BOOL addedObserver;
-(void)handleNotification:(NSNotification *) notification;
-(void)callMe;
@end