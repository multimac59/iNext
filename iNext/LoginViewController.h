//
//  LoginViewController.h
//  iNext
//
//  Created by mithun ravi on 06/08/13.
//  Copyright (c) 2013 mithun ravi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChangePassViewController.h"
#import "RegistrationView.h"
#import "MyCustomeClass.h"
#import "ForgetPasswoedView.h"
#import "ClientRegisterView.h"

#import "RegisterViewController.h"



@interface LoginViewController : UIViewController<UITabBarControllerDelegate,WebServiceHelperDelegate>
{
    //CustomTabbarViewController *customtabar;
    AppDelegate *appDelegate;
    NSUserDefaults *loginDefault;
}
@property(nonatomic,strong)IBOutlet UITabBarController *tabbarController;

@property(nonatomic, strong)IBOutlet UIButton *registerButton, *backButton;
@property(nonatomic, strong)IBOutlet UITextField *username, *password;
@property(nonatomic, strong)IBOutlet UIButton *forgetPass;

@property (nonatomic, strong) IBOutlet NSString *whichUserLoginString,*remainingURL,*usernameString,*passworString;
@property (nonatomic,strong) NSArray *dataArray;



-(IBAction)clickOnLoginBtn:(id)sender;
-(IBAction)clickOnregisterBtn:(id)sender;
-(IBAction)clickOnforgetPassBtn:(id)sender;


@end
