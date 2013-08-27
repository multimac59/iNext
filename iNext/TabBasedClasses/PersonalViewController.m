//
//  PersonalViewController.m
//  iNext
//
//  Created by mithun ravi on 09/08/13.
//  Copyright (c) 2013 mithun ravi. All rights reserved.
//

#import "PersonalViewController.h"

@interface PersonalViewController ()

@end

@implementation PersonalViewController

@synthesize scrollView;

@synthesize dobTextfield,mobileTextfield,emailTextfield,storeTextfield,workhourTextfield;
@synthesize changePasswordButton,salesManButton,supportmanButton,clientButton;
@synthesize nameLabel;
@synthesize editUpdatButton;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title=@"Profile";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    personalDefault=[NSUserDefaults standardUserDefaults];
    appDelegate=(AppDelegate *) [[UIApplication sharedApplication] delegate];
    // Do any additional setup after loading the view from its nib.
    [self editNotDone];
    if(IS_IPHONE5)
    {
        scrollView.frame=CGRectMake(0,45,320, 500);
        scrollView.contentSize=CGSizeMake(320,700);
    
    }
    else
    {
        scrollView.frame=CGRectMake(0 ,145,320,450);
        scrollView.contentSize=CGSizeMake(320, 470);
    
    
    
    }
    if ([[personalDefault objectForKey:@"UserLogin"] isEqualToString:@"Admin"] )
    {
            
    }
    else
    {
        clientButton.hidden=YES;
        supportmanButton.hidden=YES;
        salesManButton.hidden=YES;
    }
    editUpdateString=@"Edit";
}
-(IBAction)clickOnChangePassButton:(id)sender
{
    
    ChangePassViewController *change=[[ChangePassViewController alloc] initWithNibName:@"ChangePassViewController" bundle:nil];
    [self.navigationController pushViewController:change animated:YES];

}

#pragma mark -
#pragma mark UITextFieldDelegate

#pragma mark -
#pragma mark UITextFieldDelegate
- (void) scrollViewAdaptToStartEditingTextField:(UITextField*)textField
{
    CGPoint point = CGPointMake(0, textField.frame.origin.y - 1.5 * textField.frame.size.height);
    [scrollView setContentOffset:point animated:YES];
}

- (void) scrollVievEditingFinished:(UITextField*)textField
{
    CGPoint point = CGPointMake(0, 0);
    [scrollView setContentOffset:point animated:YES];
}

- (BOOL) textFieldShouldBeginEditing:(UITextField *)textField
{
    [self scrollViewAdaptToStartEditingTextField:textField];
    return YES;
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    [self scrollVievEditingFinished:textField];
    return YES;
}


-(IBAction)keyboardGone:(id)sender
{
    [dobTextfield resignFirstResponder];
    [mobileTextfield resignFirstResponder];
    [emailTextfield resignFirstResponder];
    [storeTextfield resignFirstResponder];
    [workhourTextfield resignFirstResponder];


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)clickOnClientButton:(id)sender
{
    ClientSaleViewController *clientsale=[[ClientSaleViewController alloc]initWithNibName:@"ClientSaleViewController" bundle:nil];
    [clientsale setTitleString:@"Client"];
    [clientsale setRegisterServicName:@"CreateUser_by_Admin"];
    [clientsale setServiceName:@"Client"];

    [self.navigationController pushViewController:clientsale animated:YES];

}
-(IBAction)clickOnSupportButton:(id)sender
{
    ClientSaleViewController *clientsale=[[ClientSaleViewController alloc]initWithNibName:@"ClientSaleViewController" bundle:nil];
    [clientsale setTitleString:@"Technical man"];
    [clientsale setRegisterServicName:@"Createtechnical"];
    [clientsale setServiceName:@"Technical"];


    [self.navigationController pushViewController:clientsale animated:YES];


}
-(IBAction)clickOnSalesManButton:(id)sender
{
    ClientSaleViewController *clientsale=[[ClientSaleViewController alloc]initWithNibName:@"ClientSaleViewController" bundle:nil];
    [clientsale setTitleString:@"Sales man"];
    [clientsale setServiceName:@"Sales"];
    [clientsale setRegisterServicName:@"Createsalesman"];

    [self.navigationController pushViewController:clientsale animated:YES];

}

-(IBAction)clickOnEditButton:(id)sender
{
    //[MyCustomeClass SVProgressMessageShowOnWhenNeed:@"Editing..."];
    if ([editUpdateString isEqualToString:@"Edit"])
    {
         [self editYesDone];
        editUpdateString=@"Update";
        
    }
    else
    {
        [self editNotDone];
        editUpdateString=@"Edit";
        [MyCustomeClass SVProgressMessageShowOnWhenNeed:@"Updating..."];
    

        
    }
    [editUpdatButton setTitle:editUpdateString forState:UIControlStateNormal];
   
    
    
}
-(IBAction)clickoNLogoutButton:(id)sender
{
    [appDelegate application:nil didFinishLaunchingWithOptions:nil];
}
-(void)editNotDone
{
    dobTextfield.text=[personalDefault objectForKey:@"dob"];
    mobileTextfield.text=[personalDefault  objectForKey:@"phone"];
    emailTextfield.text=[personalDefault  objectForKey:@"email"];
    workhourTextfield.text=[personalDefault  objectForKey:@"work_hours"];
    storeTextfield.text=[personalDefault  objectForKey:@"webstorename"];
     nameLabel.text=[NSString stringWithFormat:@"%@ %@",[personalDefault  objectForKey:@"f_name"],[personalDefault objectForKey:@"l_name"]];
    
    [emailTextfield setEnabled:NO];
    [mobileTextfield setEnabled:NO];
    [storeTextfield setEnabled:NO];
    [workhourTextfield setEnabled:NO];
    [dobTextfield setEnabled:NO];
    
}
-(void)editYesDone
{
    [emailTextfield setEnabled:YES];
    [mobileTextfield setEnabled:YES];
    [storeTextfield setEnabled:YES];
    [workhourTextfield setEnabled:YES];
    [dobTextfield setEnabled:YES];
    
}

-(void)editTextField:(id)sender
{
   
}

-(IBAction)clickOnsalesButton:(id)sender
{
    SalesViewController *salesview=[[SalesViewController alloc]initWithNibName:@"SalesViewController" bundle:nil];
    [self.navigationController pushViewController:salesview animated:YES];
}

#pragma mark - Service Request and Response Method list
#pragma mark - Service Requset
-(void) updateUserProfilefRequest
{
    WebServiceHelper *helper=[[WebServiceHelper alloc] init];
    helper.delegate=self;
    NSString *postString=[NSString stringWithFormat:@""];
    [helper editProfile:postString];
}

#pragma mark - Service Response
-(void)editProfile:(NSString *)response
{
    NSLog(@"%@",response);
    [MyCustomeClass SVProgressMessageDismissWithError: @"Successfully updatee." :1.5];
}
-(void)gettingFail:(NSString *)error
{
    [MyCustomeClass SVProgressMessageDismissWithError:@"Please Try again." :1.5];
    NSLog(@"%@",error);
}


@end
