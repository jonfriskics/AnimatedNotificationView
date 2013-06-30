#import "UIViewController+JFAnimatedNotificationView.h"

#define kViewAnimationStartSpeed     0.5
#define kViewAnimationOnscreenLength 1.0
#define kViewAnimationStopSpeed      0.2
#define kPopupViewColor              [UIColor grayColor]
#define kPopupLabelFont              @"Avenir-Heavy"
#define kPopupLabelColor             [UIColor whiteColor]
#define kViewAnimationCurve          UIViewAnimationCurveEaseOut

@implementation UIViewController (JFAnimatedNotificationView)

/**
 * This UIViewController instance method creates a UIView and animates it moving down from the top of the main view.
 * @param message an NSString that represents the message you want to display in the UIView.
 */
- (void)showNotificationWithMessage:(NSString *)message;
{
    UIView *popupView = [[UIView alloc] initWithFrame:CGRectMake(0, -20, self.view.bounds.size.width, 20)];
    popupView.backgroundColor = kPopupViewColor;
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(popupView.bounds.origin.x,
                                                               popupView.bounds.origin.y,
                                                               popupView.bounds.size.width,
                                                               popupView.bounds.size.height+1)];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont fontWithName:kPopupLabelFont
                                 size:15.0];
    label.backgroundColor = [UIColor clearColor];
    label.textColor = kPopupLabelColor;
    label.text = message;
    [popupView addSubview:label];
    
    [self.view addSubview:popupView];
    
    [UIView setAnimationCurve:kViewAnimationCurve];
    [UIView animateWithDuration:kViewAnimationStartSpeed
                     animations:^{
                         popupView.frame = CGRectMake(popupView.bounds.origin.x,
                                                      0,
                                                      popupView.bounds.size.width,
                                                      popupView.bounds.size.height);
                     }
                     completion:^(BOOL finished) {
                         [self performSelector:@selector(hideNotification:)
                                    withObject:popupView
                                    afterDelay:kViewAnimationOnscreenLength];
                     }];
}

/**
 * This private instance method is triggered in the showNotificationWithMessage: animation block completion callback.
 * @param popupView The UIView notification popup that is currently on screen
 */
- (void)hideNotification:(UIView *)popupView
{
    [UIView animateWithDuration:kViewAnimationStopSpeed
                     animations:^{
                         popupView.frame = CGRectMake(popupView.bounds.origin.x,
                                                      -20,
                                                      popupView.bounds.size.width,
                                                      popupView.bounds.size.height);
                     }
                     completion:^(BOOL finished) {
                         [popupView removeFromSuperview];
                     }];
}


@end
