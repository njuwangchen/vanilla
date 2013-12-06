//
//  VanillaViewController.m
//  Vanilla
//
//  Created by 王晨Clark on 13-12-6.
//  Copyright (c) 2013年 王晨Clark. All rights reserved.
//

#import "VanillaViewController.h"
#import "HomeViewController.h"
#import "TravelManagementViewController.h"
#import "ProfileViewController.h"

@interface VanillaViewController ()

@property (strong, readwrite, nonatomic) REMenu *menu;

@end

@implementation VanillaViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    if (REUIKitIsFlatMode()) {
        [self.navigationBar performSelector:@selector(setBarTintColor:) withObject:[UIColor colorWithRed:209/255.0 green:112/255.0 blue:95/255.0 alpha:1]];
        self.navigationBar.tintColor = [UIColor whiteColor];
    } else {
        self.navigationBar.tintColor = [UIColor colorWithRed:0 green:179/255.0 blue:134/255.0 alpha:1];
    }
    
    __typeof (self) __weak weakSelf = self;
    REMenuItem *homeItem = [[REMenuItem alloc] initWithTitle:@"主页"
                                                    subtitle:@"返回主界面"
                                                       image:[UIImage imageNamed:@"Icon_Home"]
                                            highlightedImage:nil
                                                      action:^(REMenuItem *item) {
                                                          NSLog(@"Item: %@", item);
                                                          HomeViewController *controller = [[HomeViewController alloc] init];
                                                          [weakSelf setViewControllers:@[controller] animated:NO];
                                                      }];
    
    REMenuItem *travelManagementItem = [[REMenuItem alloc] initWithTitle:@"旅行管理"
                                                       subtitle:@"管理您的旅行记录"
                                                          image:[UIImage imageNamed:@"Icon_Explore"]
                                               highlightedImage:nil
                                                         action:^(REMenuItem *item) {
                                                             NSLog(@"Item: %@", item);
                                                             TravelManagementViewController *controller = [[TravelManagementViewController alloc] init];
                                                             [weakSelf setViewControllers:@[controller] animated:NO];
                                                         }];
    
    REMenuItem *profileItem = [[REMenuItem alloc] initWithTitle:@"个人资料"
                                                          image:[UIImage imageNamed:@"Icon_Profile"]
                                               highlightedImage:nil
                                                         action:^(REMenuItem *item) {
                                                             NSLog(@"Item: %@", item);
                                                             ProfileViewController *controller = [[ProfileViewController alloc] init];
                                                             [weakSelf setViewControllers:@[controller] animated:NO];
                                                         }];
    
    homeItem.tag = 0;
    travelManagementItem.tag = 1;
    profileItem.tag = 2;
    
    self.menu = [[REMenu alloc] initWithItems:@[homeItem,travelManagementItem,profileItem]];
    
    if (!REUIKitIsFlatMode()) {
        self.menu.cornerRadius = 4;
        self.menu.shadowRadius = 4;
        self.menu.shadowColor = [UIColor blackColor];
        self.menu.shadowOffset = CGSizeMake(0, 1);
        self.menu.shadowOpacity = 1;
    }
    
    // Blurred background in iOS 7
    self.menu.liveBlur = YES;
    self.menu.liveBlurBackgroundStyle = REMenuLiveBackgroundStyleDark;
    self.menu.liveBlurTintColor = [UIColor colorWithRed:209/255.0 green:112/255.0 blue:95/255.0 alpha:1];
    
    self.menu.imageOffset = CGSizeMake(5, -1);
    self.menu.waitUntilAnimationIsComplete = NO;
    self.menu.badgeLabelConfigurationBlock = ^(UILabel *badgeLabel, REMenuItem *item) {
        badgeLabel.backgroundColor = [UIColor colorWithRed:0 green:179/255.0 blue:134/255.0 alpha:1];
        badgeLabel.layer.borderColor = [UIColor colorWithRed:0.000 green:0.648 blue:0.507 alpha:1.000].CGColor;
    };
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)toggleMenu
{
    if (self.menu.isOpen)
        return [self.menu close];
    
    [self.menu showFromNavigationController:self];
}

@end
