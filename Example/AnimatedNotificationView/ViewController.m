#import "ViewController.h"
#import "UIViewController+JFAnimatedNotificationView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIButton *trigger = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    trigger.frame = CGRectMake(0, 50, self.view.bounds.size.width, 40);
    [trigger setTitle:@"trigger notification popup" forState:UIControlStateNormal];
    [trigger addTarget:self action:@selector(triggerPopup:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:trigger];
    
    UIButton *trigger2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    trigger2.frame = CGRectMake(0, 150, self.view.bounds.size.width, 40);
    [trigger2 setTitle:@"trigger a different message" forState:UIControlStateNormal];
    [trigger2 addTarget:self action:@selector(triggerPopup2:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:trigger2];
}

- (void)triggerPopup:(id)sender
{
    [self showNotificationWithMessage:@"Hello world!"];
}

- (void)triggerPopup2:(id)sender
{
    [self showNotificationWithMessage:@"Another message."];
}

@end
