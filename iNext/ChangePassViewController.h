//
//  ChangePassViewController.h
//  iNext
//
//  Created by mithun ravi on 06/08/13.
//  Copyright (c) 2013 mithun ravi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyCustomeClass.h"
#import "WebServiceHelper.h"

@interface ChangePassViewController : UIViewController<WebServiceHelperDelegate>
{
    NSUserDefaults *passwordDefault;
}
@property(nonatomic,strong)IBOutlet UIButton *backBtn;
@property(nonatomic,strong)IBOutlet UITextField *oldPassTextfield,*changePassTextfield,*rePassTextfield;

-(IBAction)clickOnbackBtn:(id)sender;

-(IBAction)keyBoardGone:(id)sender;

@end
