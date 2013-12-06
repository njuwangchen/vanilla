//
//  HomeViewController.m
//  Vanilla
//
//  Created by 王晨Clark on 13-12-6.
//  Copyright (c) 2013年 王晨Clark. All rights reserved.
//

#import "HomeViewController.h"
#import "VanillaViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.title=@"主页";
    self.view.backgroundColor = [UIColor colorWithWhite:0.902 alpha:1.000];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"菜单" style:UIBarButtonItemStyleBordered target:self.navigationController action:@selector(toggleMenu)];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
