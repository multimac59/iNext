//
//  ForgetPasswoedView.h
//  iNext
//
//  Created by mithun ravi on 08/08/13.
//  Copyright (c) 2013 mithun ravi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyCustomerViewController.h"
#import "WebServiceHelper.h"
@interface ForgetPasswoedView : UIViewController<WebServiceHelperDelegate>
{
    NSUserDefaults *forgotDefault;
}

@property(nonatomic, strong)IBOutlet UIButton *back;
@property(nonatomic, strong)IBOutlet UITextField *emailid;


-(IBAction)ClickOnBackButton:(id)sender;


@end
