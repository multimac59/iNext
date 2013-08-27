//
//  AppDelegate.m
//  iNext
//
//  Created by mithun ravi on 06/08/13.
//  Copyright (c) 2013 mithun ravi. All rights reserved.
//

#import "AppDelegate.h"

#import "ViewController.h"

@implementation AppDelegate

@synthesize navigationcontroller;
@synthesize viewBotBar;
@synthesize btnDwn;
@synthesize netReachability;
@synthesize hostReachability;
@synthesize btn1,btn2,btn3,btn4,btn5;
@synthesize whichUserLoginString;

@synthesize tabBarController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    netReachability=[Reachability reachabilityForInternetConnection];
    [netReachability startNotifier];
    hostReachability = [Reachability reachabilityWithHostName: @"www.apple.com"];
    [hostReachability startNotifier];

    // Override point for customization after application launch.
    self.viewController = [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil] ;
    navigationcontroller = [[UINavigationController alloc]initWithRootViewController:self.viewController];
    
    navigationcontroller.navigationBar.barStyle = UIBarStyleBlack;
    self.window.rootViewController=self.navigationcontroller;
    self.navigationcontroller.navigationBarHidden=YES;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


-(void)customTabbarControllerWithDefaultLook
{
    PersonalViewController *personal=[[PersonalViewController alloc] initWithNibName:@"PersonalViewController" bundle:[NSBundle mainBundle]];
    
    UINavigationController *navigationLatest = [[UINavigationController alloc] initWithRootViewController:personal];
    navigationLatest.navigationBarHidden=TRUE;
    
    
    OffersViewController *menuView= [[OffersViewController alloc] initWithNibName:@"OffersViewController" bundle:[NSBundle mainBundle]];
    UINavigationController *navigationTopVideo = [[UINavigationController alloc] initWithRootViewController:menuView];
    navigationTopVideo.navigationBarHidden=TRUE;
    
    
    
    OrderStatusViewController *loyaltyView = [[OrderStatusViewController alloc] initWithNibName:@"OrderStatusViewController" bundle:[NSBundle mainBundle]];
    
    UINavigationController *navigationCameraCapture= [[UINavigationController alloc] initWithRootViewController:loyaltyView];
    navigationCameraCapture.navigationBarHidden=TRUE;
    
    
    
    WishlistViewController *albumView = [[WishlistViewController alloc] initWithNibName:@"WishlistViewController" bundle:[NSBundle mainBundle]];
    UINavigationController *navigationUserSales = [[UINavigationController alloc] initWithRootViewController:albumView];
    navigationUserSales.navigationBarHidden=TRUE;
    
    
    MyPointsViewController *locationView = [[MyPointsViewController alloc] initWithNibName:@"MyPointsViewController" bundle:[NSBundle mainBundle]];
    UINavigationController *navigationSettings = [[UINavigationController alloc] initWithRootViewController:locationView];
    navigationSettings.navigationBarHidden=TRUE;
    
   // MyDeviceViewController *device = [[MyDeviceViewController alloc] initWithNibName:@"MyDeviceViewController" bundle:[NSBundle mainBundle]];
   // UINavigationController *deviceNavigation = [[UINavigationController alloc] initWithRootViewController:device];
    navigationSettings.navigationBarHidden=TRUE;
    
    
    
    NSArray *tabArray1 = [[NSArray alloc] initWithObjects:navigationLatest,navigationTopVideo,navigationCameraCapture,navigationUserSales,navigationSettings, nil];
    
    self.tabBarController = [[UITabBarController alloc] init];
    self.tabBarController.viewControllers = tabArray1;
    [[self.tabBarController.tabBar.items objectAtIndex:0] setImage:[UIImage imageNamed:@"man logo-1.png"]];
    [[self.tabBarController.tabBar.items objectAtIndex:1] setImage:[UIImage imageNamed:@"Nearby.png"]];
    [[self.tabBarController.tabBar.items objectAtIndex:2] setImage:[UIImage imageNamed:@"notification.png"]];
    [[self.tabBarController.tabBar.items objectAtIndex:3] setImage:[UIImage imageNamed:@"calendar_icon.png"]];
    [[self.tabBarController.tabBar.items objectAtIndex:4] setImage:[UIImage imageNamed:@"donate_icon.png"]];
    //[[self.tabBarController.tabBar.items objectAtIndex:5] setImage:[UIImage imageNamed:@"setting.png"]];
    self.window.rootViewController = self.tabBarController;
    
}
#pragma mark - custome tabbar
- (void)customTabbarController
{
    PersonalViewController *personal=[[PersonalViewController alloc] initWithNibName:@"PersonalViewController" bundle:[NSBundle mainBundle]];
    
    UINavigationController *navigationLatest = [[UINavigationController alloc] initWithRootViewController:personal];
    navigationLatest.navigationBarHidden=TRUE;
    
    
    OffersViewController *menuView= [[OffersViewController alloc] initWithNibName:@"OffersViewController" bundle:[NSBundle mainBundle]];
    UINavigationController *navigationTopVideo = [[UINavigationController alloc] initWithRootViewController:menuView];
    navigationTopVideo.navigationBarHidden=TRUE;
    
    
    
    OrderStatusViewController *loyaltyView = [[OrderStatusViewController alloc] initWithNibName:@"OrderStatusViewController" bundle:[NSBundle mainBundle]];
    
    UINavigationController *navigationCameraCapture= [[UINavigationController alloc] initWithRootViewController:loyaltyView];
    navigationCameraCapture.navigationBarHidden=TRUE;
    
    
    
    WishlistViewController *albumView = [[WishlistViewController alloc] initWithNibName:@"WishlistViewController" bundle:[NSBundle mainBundle]];
    UINavigationController *navigationUserSales = [[UINavigationController alloc] initWithRootViewController:albumView];
    navigationUserSales.navigationBarHidden=TRUE;
    
    
    MyPointsViewController *locationView = [[MyPointsViewController alloc] initWithNibName:@"MyPointsViewController" bundle:[NSBundle mainBundle]];
    UINavigationController *navigationSettings = [[UINavigationController alloc] initWithRootViewController:locationView];
    navigationSettings.navigationBarHidden=TRUE;
    
    
    
    NSArray *tabArray1 = [[NSArray alloc] initWithObjects:navigationLatest,navigationTopVideo,navigationCameraCapture,navigationUserSales,navigationSettings, nil];
    
    tabBarController = [[UITabBarController alloc] init];
    tabBarController.delegate=self;
    tabBarController.viewControllers=tabArray1;
    
    
    tabBarController.customizableViewControllers = nil;
    tabBarController.moreNavigationController.navigationBar.topItem.rightBarButtonItem.enabled = false;
    [navigationcontroller pushViewController:tabBarController animated:YES];
    self.tabBarController.tabBar.hidden=YES;
    
    
    
    [self.window addSubview:navigationcontroller.view];
    
    if (IS_IPHONE5)
    {
        iPhoneScreenSize=88;
    }
    else
    {
        iPhoneScreenSize=0;
    }
	
    
	self.btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
	btn1.frame = CGRectMake(0, 431+iPhoneScreenSize, 64, 49);
	[btn1 setBackgroundImage:[UIImage imageNamed:@"tab1unselected.png"] forState:UIControlStateNormal];
	[btn1 setBackgroundImage:[UIImage imageNamed:@"Tab1selected.png"] forState:UIControlStateSelected];
	[btn1 setTag:0];
	
	self.btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
	btn2.frame = CGRectMake(64, 431+iPhoneScreenSize, 64, 49);
	[btn2 setBackgroundImage:[UIImage imageNamed:@"tab1unselected.png"] forState:UIControlStateNormal];
	[btn2 setBackgroundImage:[UIImage imageNamed:@"Tab1selected.png"] forState:UIControlStateSelected];
	[btn2 setTag:1];
	
	self.btn3 = [UIButton buttonWithType:UIButtonTypeCustom];
	btn3.frame = CGRectMake(128, 431+iPhoneScreenSize, 64, 49);
	[btn3 setBackgroundImage:[UIImage imageNamed:@"tab1unselected.png"] forState:UIControlStateNormal];
	[btn3 setBackgroundImage:[UIImage imageNamed:@"Tab1selected.png"] forState:UIControlStateSelected];
	[btn3 setTag:2];
	
	self.btn4 = [UIButton buttonWithType:UIButtonTypeCustom];
	btn4.frame = CGRectMake(192, 431+iPhoneScreenSize, 64, 49);
	[btn4 setBackgroundImage:[UIImage imageNamed:@"tab1unselected.png"] forState:UIControlStateNormal];
	[btn4 setBackgroundImage:[UIImage imageNamed:@"Tab1selected.png"] forState:UIControlStateSelected];
	[btn4 setTag:3];
    
	self.btn5 = [UIButton buttonWithType:UIButtonTypeCustom];
	btn5.frame = CGRectMake(256, 431+iPhoneScreenSize, 64, 49);
	[btn5 setBackgroundImage:[UIImage imageNamed:@"tab1unselected.png"] forState:UIControlStateNormal];
	[btn5 setBackgroundImage:[UIImage imageNamed:@"Tab1selected.png"] forState:UIControlStateSelected];
	[btn5 setTag:4];
	
	// Add my new buttons to the view
	[self.window addSubview:btn1];
	[self.window addSubview:btn2];
	[self.window addSubview:btn3];
	[self.window addSubview:btn4];
    [self.window addSubview:btn5];
    
    [btn1 addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
	[btn2 addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
	[btn3 addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
	[btn4 addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [btn5 addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    
    self.tabBarController.selectedIndex = tabSelectedIndex;
    
    if (tabSelectedIndex==0)
    {
        [btn1 setSelected:true];
        
    }
    else if (tabSelectedIndex==1)
    {
        [btn2 setSelected:true];
        
    }
    else if (tabSelectedIndex==2)
    {
        [btn3 setSelected:true];
        
    }
    else if (tabSelectedIndex==3)
    {
        [btn4 setSelected:true];
        
    }
    else
    {
        [btn5 setSelected:true];
        
    }
    [SVProgressHUD dismiss];
    
}
//Pk: i need this method
-(void)tabBarHide
{
    // NSLog(@"tab bar hide method called");
    btn1.hidden=YES;
    btn2.hidden=YES;
    btn3.hidden=YES;
    btn4.hidden=YES;
    btn5.hidden=YES;
    self.tabBarController.tabBar.hidden=YES;
}
-(void)tabBarShow
{
    //NSLog(@"show tab bar method called");
    btn1.hidden=NO;
    btn2.hidden=NO;
    btn3.hidden=NO;
    btn4.hidden=NO;
    btn5.hidden=NO;
    self.tabBarController.tabBar.hidden=NO;
}



- (void)buttonClicked:(id)sender
{
	int tagNum = [sender tag];
	[self selectTab:tagNum];
    
}
-(void)hideNavBar
{
    // NSLog(@"hide nav bar");
    
    navigationcontroller.navigationBarHidden = YES;
}
-(void)showNavBar
{
    // NSLog(@"show nav bar");
    [navigationcontroller.navigationBar setBarStyle:UIBarStyleBlackTranslucent];
    navigationcontroller.navigationBarHidden = NO;
    
}

- (void)selectTab:(int)tabID
{
    NSArray *buttonArray = [[NSArray alloc] initWithObjects:btn1,btn2,btn3,btn4,btn5,nil];
    for(int i = 0; i < 5; i++)
    {
        [(UIButton *)[buttonArray objectAtIndex:i] setSelected:(tabID == i ? true : false)];
    }
    [self.tabBarController setSelectedIndex:tabID];
}


@end
