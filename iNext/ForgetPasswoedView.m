//
//  ForgetPasswoedView.m
//  iNext
//
//  Created by mithun ravi on 08/08/13.
//  Copyright (c) 2013 mithun ravi. All rights reserved.
//

#import "ForgetPasswoedView.h"

@interface ForgetPasswoedView ()

@end

@implementation ForgetPasswoedView

@synthesize back;
@synthesize emailid;


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
    forgotDefault=[NSUserDefaults standardUserDefaults];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)ClickOnBackButton:(id)sender
{
    [self.navigationController popViewControllerAnimated:true];

}

-(IBAction)keyBoardGone:(id)sender
{
    [emailid resignFirstResponder];
}
-(IBAction)submitButton:(id)sender
{
    [self forgotPasswordRequest];
}

#pragma mark - web service request and response
-(void)forgotPasswordRequest
{
    WebServiceHelper *helper=[[WebServiceHelper alloc] init];
    helper.delegate=self;
NSString *postString=[NSString stringWithFormat:@"http://iphonewebservices.pssoftweb.com/Webservices/Service1.svc/forgetpassword/?email=%@",emailid.text];
    [helper forgotPassword:postString];
}
-(void)forgotPassword:(NSString *)response
{
    NSLog(@"%@",response);
}

@end
