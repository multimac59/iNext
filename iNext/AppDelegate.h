//
//  AppDelegate.h
//  iNext
//
//  Created by mithun ravi on 06/08/13.
//  Copyright (c) 2013 mithun ravi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyCustomeClass.h"
#import "Reachability.h"
#import "Constant.h"


@class ViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate,UINavigationControllerDelegate,UITabBarControllerDelegate>

{
    NSUserDefaults *appDelegatDefault;
    int iPhoneScreenSize,tabSelectedIndex;

}
@property(strong,nonatomic)UIView *viewBotBar;

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) ViewController *viewController;

@property(nonatomic,strong)UINavigationController *navigationcontroller;

@property (nonatomic, strong) Reachability *netReachability,*hostReachability;
@property(nonatomic,strong)UIButton *btnDwn;
@property (nonatomic, strong) NSString *whichUserLoginString;



////
@property (nonatomic, strong) UITabBarController *tabBarController;
@property (nonatomic, strong) UIButton *btn1;
@property (nonatomic, strong) UIButton *btn2;
@property (nonatomic, strong) UIButton *btn3;
@property (nonatomic, strong) UIButton *btn4;
@property (nonatomic, strong) UIButton *btn5;

- (void)customTabbarController;
-(void)customTabbarControllerWithDefaultLook;

-(void)tabBarHide;
-(void)tabBarShow;



@end
