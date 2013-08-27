//
//  PersonalViewController.h
//  iNext
//
//  Created by mithun ravi on 09/08/13.
//  Copyright (c) 2013 mithun ravi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChangePassViewController.h"
#import "MyCustomeClass.h"
#import "ClientSaleViewController.h"
#import "AppDelegate.h"
#import "SalesViewController.h"

@class AppDelegate;
@interface PersonalViewController : UIViewController<UIScrollViewDelegate,UITextFieldDelegate,WebServiceHelperDelegate>
{

    NSUserDefaults *personalDefault;
    AppDelegate *appDelegate;
    NSString *editUpdateString;

}
@property(nonatomic,strong)IBOutlet UIScrollView *scrollView;

@property(nonatomic,strong)IBOutlet UITextField *dobTextfield,*mobileTextfield,*emailTextfield,*storeTextfield,*workhourTextfield;

@property (nonatomic, strong) IBOutlet UIButton *clientButton,*supportmanButton,*salesManButton,*changePasswordButton,*editUpdatButton;
@property (nonatomic,strong) IBOutlet UILabel *nameLabel;

-(IBAction)clickOnChangePassButton:(id)sender;

-(IBAction)clickOnClientButton:(id)sender;
-(IBAction)clickOnSupportButton:(id)sender;
-(IBAction)clickoNTechnicalButton:(id)sender;

-(IBAction)clickOnEditButton:(id)sender;

@end
