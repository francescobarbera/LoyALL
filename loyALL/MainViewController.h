//
//  MainViewController.h
//  Slide Drawer
//
//  Created by Isuru Nanayakkara on 3/20/14.
//  Copyright (c) 2014 OSMiUM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController

@property (strong, nonatomic) UIView *menuDrawer;
@property (strong, nonatomic) UISwipeGestureRecognizer *swipeOpenGesture, *swipeCloseGesture;
@property (assign, nonatomic) NSInteger menuDrawerX, menuDrawerWidth;

- (void)handleSwipes:(UISwipeGestureRecognizer *)sender;
- (void)drawerAnimation;

- (IBAction)menuButtonPressed:(UIButton *)sender;

@end
