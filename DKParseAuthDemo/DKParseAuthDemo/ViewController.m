//
//  ViewController.m
//  DKParseAuthDemo
//
//  Created by Daniel Khamsing on 9/30/15.
//  Copyright © 2015 Daniel Khamsing. All rights reserved.
//

#import "ViewController.h"

#import "DKParseAuth.h"
#import "DkparseauthdemoKeys.h"
#import "MyHud.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *authButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    DkparseauthdemoKeys *keys = [[DkparseauthdemoKeys alloc] init];
    [[DKParseAuth sharedInstance] configureWithParseClientId:keys.parseClientId parseClientKey:keys.parseClientKey];
    [[DKParseAuth sharedInstance] configureWithTwitterConsumerKey:keys.twitterConsumerKey twitterConsumerSecret:keys.twitterConsumerSecret]; // optional
    
    UIColor *color = [UIColor colorWithRed:273/255.f green:12/255.f blue:91/255.f alpha:.7];
    [[UIButton appearance] setTitleColor:color forState:UIControlStateNormal];
    [[UIBarButtonItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:color} forState:UIControlStateNormal];
    [DKParseAuth sharedInstance].cellBackgroundColor = [color colorWithAlphaComponent:.1];
    
    [self updateButton];
}

- (IBAction)actionParseAuth:(UIButton *)sender {
    if ([sender.titleLabel.text isEqualToString:@"Sign Out"]) {
        [[DKParseAuth sharedInstance] logout];
        
        [self updateButton];
        
        return;
    }
    
    // Vendored hud
    // MyHud *hud = [[MyHud alloc] init];
    
    // DKParseAuth hud
    id<DKHudProtocol> hud = [DKParseAuth sharedInstance].hud;
    
    UIViewController *controller = [[DKParseAuth sharedInstance] authViewControllerWithPasswordLength:8 hud:hud successBlock:^(id user, BOOL signup) {
        [self updateButton];
        NSLog(@"success 😎 %@ with user %@", signup?@"signup":@"login", user);
        
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:@"You are signed in" preferredStyle:UIAlertControllerStyleAlert];
        [alertController addAction:[UIAlertAction actionWithTitle:@"😎" style:UIAlertActionStyleDefault handler:nil]];
        
        [self presentViewController:alertController animated:YES completion:nil];
    }];
    
    [self presentViewController:controller animated:YES completion:nil];
}

- (void)updateButton {
    [self.authButton setTitle:[DKParseAuth sharedInstance].authenticated?@"Sign Out":@"Parse Auth" forState:UIControlStateNormal];
}

@end
