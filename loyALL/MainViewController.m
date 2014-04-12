//
//  MainViewController.m
//  Slide Drawer
//
//  Created by Isuru Nanayakkara on 3/20/14.
//  Copyright (c) 2014 OSMiUM. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

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
    
    NSInteger statusBarHeight = [UIApplication sharedApplication].statusBarFrame.size.height;
    self.menuDrawerWidth = self.view.frame.size.width * 0.75;
    self.menuDrawerX = self.view.frame.origin.x - self.menuDrawerWidth;
    
    self.menuDrawer = [[UIView alloc] initWithFrame:CGRectMake(self.menuDrawerX, self.view.frame.origin.y + statusBarHeight, self.menuDrawerWidth, self.view.frame.size.height - statusBarHeight)];
    
    self.menuDrawer.backgroundColor = [UIColor redColor];
    
    self.swipeCloseGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipes:)];
    self.swipeCloseGesture.direction = UISwipeGestureRecognizerDirectionLeft;
    self.swipeOpenGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipes:)];
    self.swipeOpenGesture.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:self.swipeCloseGesture];
    [self.view addGestureRecognizer:self.swipeOpenGesture];
    
    [self.view addSubview:self.menuDrawer];
}

- (void)handleSwipes:(UISwipeGestureRecognizer *)sender
{
    [self drawerAnimation];
}

- (void)drawerAnimation
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDuration:-5];
    
    CGFloat newX = 0;
    if (self.menuDrawer.frame.origin.x < self.view.frame.origin.x) {
        newX = self.menuDrawer.frame.origin.x + self.menuDrawerWidth;
    } else {
        newX = self.menuDrawer.frame.origin.x - self.menuDrawerWidth;
    }
    self.menuDrawer.frame = CGRectMake(newX, self.menuDrawer.frame.origin.y, self.menuDrawer.frame.size.width, self.menuDrawer.frame.size.height);
    
    [UIView commitAnimations];
}

- (IBAction)menuButtonPressed:(UIButton *)sender
{
    [self drawerAnimation];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
