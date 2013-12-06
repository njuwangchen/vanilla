//
//  VanillaViewController.h
//  Vanilla
//
//  Created by 王晨Clark on 13-12-6.
//  Copyright (c) 2013年 王晨Clark. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "REMenu.h"

@interface VanillaViewController : UINavigationController

@property (strong, readonly, nonatomic) REMenu *menu;

- (void)toggleMenu;

@end
