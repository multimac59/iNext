//
//  ChangePassViewController.m
//  iNext
//
//  Created by mithun ravi on 06/08/13.
//  Copyright (c) 2013 mithun ravi. All rights reserved.
//

#import "ChangePassViewController.h"

@interface ChangePassViewController ()

@end

@implementation ChangePassViewController

@synthesize oldPassTextfield;
@synthesize changePassTextfield;
@synthesize rePassTextfield;

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
    passwordDefault=[NSUserDefaults standardUserDefaults];
    // Do any additional setup after loading the view from its nib.
}

-(IBAction)clickOnbackBtn:(id)sender
{
    
    [self.navigationController popViewControllerAnimated:YES];

}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)keyBoardGone:(id)sender
{
    [oldPassTextfield resignFirstResponder];
    [changePassTextfield resignFirstResponder];
    [rePassTextfield resignFirstResponder];
}

-(IBAction)clickOnSubmitButton:(id)sender
{
    
    [MyCustomeClass SVProgressMessageShowOnWhenNeed:@"changeing..."];
    if(oldPassTextfield.text==nil || [oldPassTextfield.text length]<=0)
        
    {
        [oldPassTextfield becomeFirstResponder];
        [MyCustomeClass SVProgressMessageDismissWithError:@"Please enter Old Password." :1.0];
    }
    else if(changePassTextfield.text==nil || [changePassTextfield.text length]<=0)
    {
        [changePassTextfield becomeFirstResponder];
        [MyCustomeClass SVProgressMessageDismissWithError:@"Please enter Change Password." :1.0];
    }
    else if(rePassTextfield.text==nil || [rePassTextfield.text length]<=0)
    {
        [rePassTextfield becomeFirstResponder];
        [MyCustomeClass SVProgressMessageDismissWithError:@"Please enter Re-Change Password." :1.0];
    }
    
    else
    {
        if(![changePassTextfield.text isEqualToString:rePassTextfield.text])
        {
            [changePassTextfield becomeFirstResponder];
            [MyCustomeClass SVProgressMessageDismissWithError:@"does not match password." :1.0];
        }
        else
        {
            
            WebServiceHelper *helper=[[WebServiceHelper alloc] init];
            helper.delegate=self;
            NSString *postString=[NSString stringWithFormat:@"Change_pass/%@/%@/%@",[[[passwordDefault objectForKey:@"UserInfo"] objectAtIndex:0] objectForKey:@"username"],oldPassTextfield.text,changePassTextfield.text];
            
            [helper changePassword:postString];
        }

    
   
    }
}


#pragma mark - response method list

-(void)changePassword:(NSString *)response
{
    NSLog(@"%@",response);
    NSMutableDictionary *dicData=[MyCustomeClass jsonDictionary:response];
    if ([[dicData objectForKey:@"Change_passResult"] isEqualToString:@"Please try again."])
    {
        [MyCustomeClass SVProgressMessageDismissWithError:@"Please try again." :2.0];
    }
    else
    {
        [MyCustomeClass SVProgressMessageDismissWithSuccess:@"Successfully changed" :2.0];
        oldPassTextfield.text=nil;
        rePassTextfield.text=nil;
        changePassTextfield.text=nil;
    }
}
-(void)gettingFail:(NSString *)error
{
    NSLog(@"%@",error);
}


@end
