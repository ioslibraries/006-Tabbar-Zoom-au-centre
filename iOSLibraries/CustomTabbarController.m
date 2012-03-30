//
//  CustomTabbarController.m
//  iOSLibraries
//
//  Created by jeremy Templier on 27/03/12.
//  Copyright (c) 2012 particulier. All rights reserved.
//

#import "CustomTabbarController.h"
#import "CustomViewController.h"

@implementation CustomTabbarController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CustomViewController* viewController1 = [[CustomViewController alloc] initWithNibName:@"CustomViewController" bundle:nil];
    viewController1.title = @"view controller 1";    
    viewController1.tabBarItem = [[UITabBarItem alloc] initWithTitle:viewController1.title 
                                                               image:[UIImage imageNamed:@"tab_feed_profile.png"] tag:0];
    
    CustomViewController* viewController2 = [[CustomViewController alloc] initWithNibName:@"CustomViewController" bundle:nil];
    viewController2.title = @"view controller 2";
    viewController2.tabBarItem = [[UITabBarItem alloc] initWithTitle:viewController2.title 
                                                               image:[UIImage imageNamed:@"tab_feed.png.png"] tag:1];
    
    CustomViewController* viewController3 = [[CustomViewController alloc] initWithNibName:@"CustomViewController" bundle:nil];
    viewController3.title = @"view controller 3";
    viewController3.tabBarItem = [[UITabBarItem alloc] initWithTitle:nil 
                                                               image:nil tag:2];
    
    CustomViewController* viewController4 = [[CustomViewController alloc] initWithNibName:@"CustomViewController" bundle:nil];
    viewController4.title = @"view controller 4";
    viewController4.tabBarItem = [[UITabBarItem alloc] initWithTitle:viewController4.title 
                                                               image:[UIImage imageNamed:@"tab_live.png"] tag:3];
    
    CustomViewController* viewController5 = [[CustomViewController alloc] initWithNibName:@"CustomViewController" bundle:nil];
    viewController5.title = @"view controller 5";
    viewController5.tabBarItem = [[UITabBarItem alloc] initWithTitle:viewController5.title 
                                                               image:[UIImage imageNamed:@"tab_messages.png"] tag:4];
    
    
    self.viewControllers = [NSArray arrayWithObjects: 
                            viewController1,
                            viewController2,
                            viewController3,
                            viewController4,
                            viewController5, nil];
    
    
    [self addCenterButtonWithImage:[UIImage imageNamed:@"camera_button_take.png"] highlightImage:[UIImage imageNamed:@"tabBar_cameraButton_ready_matte.png"]];
}


// Create a custom UIButton and add it to the center of our tab bar
-(void) addCenterButtonWithImage:(UIImage*)buttonImage highlightImage:(UIImage*)highlightImage
{
    UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleTopMargin;
    button.frame = CGRectMake(0.0, 0.0, buttonImage.size.width, buttonImage.size.height);
    [button setBackgroundImage:buttonImage forState:UIControlStateNormal];
    [button setBackgroundImage:highlightImage forState:UIControlStateHighlighted];
    
    CGFloat heightDifference = buttonImage.size.height - self.tabBar.frame.size.height;
    if (heightDifference < 0)
        button.center = self.tabBar.center;
    else
    {
        CGPoint center = self.tabBar.center;
        center.y = center.y - heightDifference/2.0;
        button.center = center;
    }
    
    [self.view addSubview:button];
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

@end
