//
//  ClientRegisterView.m
//  iNext
//
//  Created by mithun ravi on 08/08/13.
//  Copyright (c) 2013 mithun ravi. All rights reserved.
//

#import "ClientRegisterView.h"

@interface ClientRegisterView ()

@end

@implementation ClientRegisterView

@synthesize submit;
@synthesize Back;
@synthesize name;
@synthesize birthday;
@synthesize phoneno;
@synthesize email;
@synthesize password;

@synthesize scrollview;

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
    scrollview.frame=CGRectMake(0, 55, 320, 491);
    scrollview.contentSize=CGSizeMake(320, 600);
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)clickonsubmitbutton:(id)sender;
{
    
    [MyCustomeClass SVProgressMessageShowOnWhenNeed:@"Login......"];
    if([name.text length]<=0)
        
    {
        [name becomeFirstResponder];
        [MyCustomeClass SVProgressMessageDismissWithError:@"Please enter Name..." :1.0];
    }
    
    else if([birthday.text length]<=0)
    {
        [birthday becomeFirstResponder];
        [MyCustomeClass SVProgressMessageDismissWithError:@"Please enter Birthday..." :1.0];
    }
    
    else if([phoneno.text length]<=0)
    {
        [phoneno becomeFirstResponder];
        [MyCustomeClass SVProgressMessageDismissWithError:@"Please enter Phone No..." :1.0];
    }
    else if([email.text length]<=0)
    {
        [email becomeFirstResponder];
        [MyCustomeClass SVProgressMessageDismissWithError:@"Please enter Email..." :1.0];
    }
    else if([password.text length]<=0)
    {
        [password becomeFirstResponder];
        [MyCustomeClass SVProgressMessageDismissWithError:@"Please enter Password..." :1.0];
    }
    else
    {
        [MyCustomeClass SVProgressMessageDismissWithError:@"Registration sucessesfully" :3.0];
        
        [self.navigationController popToRootViewControllerAnimated:true];
    }
}
-(IBAction)ClickOnBackButton:(id)sender;
    {
    [self.navigationController popToRootViewControllerAnimated:true];
}


-(IBAction)keyBoardGone:(id)sender
{
    [name resignFirstResponder];
    [birthday resignFirstResponder];
    [email resignFirstResponder];
    [password resignFirstResponder];
    [phoneno resignFirstResponder];
}

@end
