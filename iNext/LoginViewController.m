//
//  LoginViewController.m
//  iNext
//
//  Created by mithun ravi on 06/08/13.
//  Copyright (c) 2013 mithun ravi. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

@synthesize tabbarController;
@synthesize username;
@synthesize password;
@synthesize forgetPass;
@synthesize whichUserLoginString;
@synthesize registerButton,backButton;
@synthesize remainingURL;
@synthesize usernameString,passworString;
@synthesize dataArray;


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
    appDelegate=(AppDelegate *)[[UIApplication sharedApplication ] delegate];
    dataArray=[[NSArray alloc]init];

    loginDefault =[NSUserDefaults standardUserDefaults];
    [loginDefault setValue:whichUserLoginString forKey:@"UserLogin"];
    username.text=usernameString;
    password.text=passworString;
    if (IS_IPHONE5)
    {
        
    }
    else
    {
        
    }
    if ([whichUserLoginString isEqualToString:@"Client"] )
    {
        registerButton.hidden=NO;

    }
    else
    {
        registerButton.hidden=YES;
    }
    // Do any additional setup after loading the view from its nib.
   
}


-(IBAction)clickOnLoginBtn:(id)sender
{
    [MyCustomeClass SVProgressMessageShowOnWhenNeed:@"Login......"];
    if(username.text==nil || [username.text length]<=0)
        
    {
        [username becomeFirstResponder];
        [MyCustomeClass SVProgressMessageDismissWithError:@"Please enter Email Id." :1.0];
    }
    else if(password.text==nil || [password.text length]<=0)
    {
        [password becomeFirstResponder];
        [MyCustomeClass SVProgressMessageDismissWithError:@"Please enter Password." :1.0];
    }
    else
    {
        if ([MyCustomeClass validateEmail:username.text]==true)
        {
            if ([MyCustomeClass checkInternetConnection])
            {
                WebServiceHelper *helpper=[[WebServiceHelper alloc] init];
                helpper.delegate=self;
                NSString *postData=[NSString stringWithFormat:@"%@/?email=%@&password=%@",remainingURL,username.text,password.text];
                NSLog(@"%@",postData);
                [helpper login:postData];
            }
            else
            {
                [MyCustomeClass SVProgressMessageDismissWithError:@"Internet connection is not available" :1.0];
            }
        }
        else
        {
            [MyCustomeClass SVProgressMessageDismissWithError:@"Please enter valid email id" :2.0];
        }
        
        
        
    }
}


-(IBAction)clickOnregisterBtn:(id)sender
{
    
    RegisterViewController *reg=[[RegisterViewController alloc]initWithNibName:@"RegisterViewController" bundle:nil];
    [reg setTitleString:@"Registration"];
    [self.navigationController pushViewController:reg animated:YES];
    
}
-(IBAction)clickOnforgetPassBtn:(id)sender
{
    ForgetPasswoedView *chnage=[[ForgetPasswoedView alloc]initWithNibName:@"ForgetPasswoedView" bundle:nil];
    
    [self.navigationController pushViewController:chnage animated:YES];
       
}

-(IBAction)clickonbackbutton:(id)sender
{
    [self.navigationController popToRootViewControllerAnimated:true];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)keyBoardGone:(id)sender
{
    [username resignFirstResponder];
    [password resignFirstResponder];
}


#pragma mark - responce method
-(void)loginSuccess:(NSString *)response
{
    NSLog(@"%@",response);
    NSMutableDictionary *dataDic=[MyCustomeClass jsonDictionary:response];
    NSLog(@"%@",dataDic);
    if ([[dataDic objectForKey:@"Clinet_LoginResult"] count]>0)
    {
       
        dataArray=[dataDic objectForKey:@"Clinet_LoginResult"];
        if ([[[dataArray objectAtIndex:0] objectForKey:@"login"] isEqualToString:@"0"])
        {
            [MyCustomeClass SVProgressMessageDismissWithError:@"email and password does not match, Please try again" :2.0];
        }
        else
        {
            [loginDefault setValue:[[dataArray objectAtIndex:0] objectForKey:@"dob"] forKey:@"dob"];
            [loginDefault setValue:[[dataArray objectAtIndex:0] objectForKey:@"email"] forKey:@"email"];
            [loginDefault setValue:[[dataArray objectAtIndex:0] objectForKey:@"f_name"] forKey:@"f_name"];
            [loginDefault setValue:[[dataArray objectAtIndex:0] objectForKey:@"imgpath"] forKey:@"imgpath"];
            [loginDefault setValue:[[dataArray objectAtIndex:0] objectForKey:@"l_name"] forKey:@"l_name"];
            [loginDefault setValue:[[dataArray objectAtIndex:0] objectForKey:@"mobile"] forKey:@"mobile"];
            [loginDefault setValue:[[dataArray objectAtIndex:0] objectForKey:@"password"] forKey:@"password"];
            [loginDefault setValue:[[dataArray objectAtIndex:0] objectForKey:@"username"] forKey:@"username"];

            
            [loginDefault setValue:[[dataArray objectAtIndex:0] objectForKey:@"phone"] forKey:@"phone"];
            [loginDefault setValue:[[dataArray objectAtIndex:0] objectForKey:@"webstoreid"] forKey:@"webstoreid"];
            [loginDefault setValue:[[dataArray objectAtIndex:0] objectForKey:@"work_hours"] forKey:@"work_hours"];

            [loginDefault setValue:[[dataArray objectAtIndex:0] objectForKey:@"webstorename"] forKey:@"webstorename"];


            [MyCustomeClass SVProgressMessageDismissWithSuccess:@"Successfully login." :2.0];
            [appDelegate customTabbarControllerWithDefaultLook];
        }
        
    }
    else if ([[dataDic objectForKey:@"Admin_loginResult"] count]>0)
    {
        dataArray=[dataDic objectForKey:@"Admin_loginResult"];
        if ([[[dataArray objectAtIndex:0] objectForKey:@"login"] isEqualToString:@"0"])
        {
            [MyCustomeClass SVProgressMessageDismissWithError:@"email and password does not match, Please try again" :2.0];
        }
        else
        {
            [loginDefault setValue:[[dataArray objectAtIndex:0] objectForKey:@"dob"] forKey:@"dob"];
            [loginDefault setValue:[[dataArray objectAtIndex:0] objectForKey:@"email"] forKey:@"email"];
            [loginDefault setValue:[[dataArray objectAtIndex:0] objectForKey:@"f_name"] forKey:@"f_name"];
            [loginDefault setValue:[[dataArray objectAtIndex:0] objectForKey:@"imgpath"] forKey:@"imgpath"];
            [loginDefault setValue:[[dataArray objectAtIndex:0] objectForKey:@"l_name"] forKey:@"l_name"];
            [loginDefault setValue:[[dataArray objectAtIndex:0] objectForKey:@"mobile"] forKey:@"mobile"];
            [loginDefault setValue:[[dataArray objectAtIndex:0] objectForKey:@"password"] forKey:@"password"];
            [loginDefault setValue:[[dataArray objectAtIndex:0] objectForKey:@"username"] forKey:@"username"];

            [loginDefault setValue:[[dataArray objectAtIndex:0] objectForKey:@"phone"] forKey:@"phone"];
            [loginDefault setValue:[[dataArray objectAtIndex:0] objectForKey:@"webstoreid"] forKey:@"webstoreid"];
            [loginDefault setValue:[[dataArray objectAtIndex:0] objectForKey:@"work_hours"] forKey:@"work_hours"];
            
            [loginDefault setValue:[[dataArray objectAtIndex:0] objectForKey:@"webstorename"] forKey:@"webstorename"];            [MyCustomeClass SVProgressMessageDismissWithSuccess:@"Successfully login." :2.0];
            [appDelegate customTabbarControllerWithDefaultLook];
        }
    }

    else if ([[dataDic objectForKey:@"Sale_loginResult"] count]>0)
    {
        dataArray=[dataDic objectForKey:@"Sale_loginResult"];
        if ([[[dataArray objectAtIndex:0] objectForKey:@"login"] isEqualToString:@"0"])
        {
            [MyCustomeClass SVProgressMessageDismissWithError:@"email and password does not match, Please try again" :2.0];
        }
        else
        {
            [loginDefault setValue:[[dataArray objectAtIndex:0] objectForKey:@"dob"] forKey:@"dob"];
            [loginDefault setValue:[[dataArray objectAtIndex:0] objectForKey:@"email"] forKey:@"email"];
            [loginDefault setValue:[[dataArray objectAtIndex:0] objectForKey:@"f_name"] forKey:@"f_name"];
            [loginDefault setValue:[[dataArray objectAtIndex:0] objectForKey:@"imgpath"] forKey:@"imgpath"];
            [loginDefault setValue:[[dataArray objectAtIndex:0] objectForKey:@"l_name"] forKey:@"l_name"];
            [loginDefault setValue:[[dataArray objectAtIndex:0] objectForKey:@"mobile"] forKey:@"mobile"];
            [loginDefault setValue:[[dataArray objectAtIndex:0] objectForKey:@"password"] forKey:@"password"];
            [loginDefault setValue:[[dataArray objectAtIndex:0] objectForKey:@"username"] forKey:@"username"];

            [loginDefault setValue:[[dataArray objectAtIndex:0] objectForKey:@"phone"] forKey:@"phone"];
            [loginDefault setValue:[[dataArray objectAtIndex:0] objectForKey:@"webstoreid"] forKey:@"webstoreid"];
            [loginDefault setValue:[[dataArray objectAtIndex:0] objectForKey:@"work_hours"] forKey:@"work_hours"];
            
            [loginDefault setValue:[[dataArray objectAtIndex:0] objectForKey:@"webstorename"] forKey:@"webstorename"];            [MyCustomeClass SVProgressMessageDismissWithSuccess:@"Successfully login." :2.0];
            [appDelegate customTabbarControllerWithDefaultLook];
        }
    }
    else if ([[dataDic objectForKey:@"technical_loginResult"] count]>0)
    {
        dataArray=[dataDic objectForKey:@"technical_loginResult"];
        if ([[[dataArray objectAtIndex:0] objectForKey:@"login"] isEqualToString:@"0"])
        {
            [MyCustomeClass SVProgressMessageDismissWithError:@"email and password does not match, Please try again" :2.0];
        }
        else
        {
            [loginDefault setValue:[[dataArray objectAtIndex:0] objectForKey:@"dob"] forKey:@"dob"];
            [loginDefault setValue:[[dataArray objectAtIndex:0] objectForKey:@"email"] forKey:@"email"];
            [loginDefault setValue:[[dataArray objectAtIndex:0] objectForKey:@"f_name"] forKey:@"f_name"];
            [loginDefault setValue:[[dataArray objectAtIndex:0] objectForKey:@"imgpath"] forKey:@"imgpath"];
            [loginDefault setValue:[[dataArray objectAtIndex:0] objectForKey:@"l_name"] forKey:@"l_name"];
            [loginDefault setValue:[[dataArray objectAtIndex:0] objectForKey:@"mobile"] forKey:@"mobile"];
            [loginDefault setValue:[[dataArray objectAtIndex:0] objectForKey:@"password"] forKey:@"password"];
            [loginDefault setValue:[[dataArray objectAtIndex:0] objectForKey:@"username"] forKey:@"username"];

            [loginDefault setValue:[[dataArray objectAtIndex:0] objectForKey:@"phone"] forKey:@"phone"];
            [loginDefault setValue:[[dataArray objectAtIndex:0] objectForKey:@"webstoreid"] forKey:@"webstoreid"];
            [loginDefault setValue:[[dataArray objectAtIndex:0] objectForKey:@"work_hours"] forKey:@"work_hours"];
            
            [loginDefault setValue:[[dataArray objectAtIndex:0] objectForKey:@"webstorename"] forKey:@"webstorename"];            NSLog(@"%@",[loginDefault objectForKey:@"UserInfo"]);

            [MyCustomeClass SVProgressMessageDismissWithSuccess:@"Successfully login." :2.0];
            [appDelegate customTabbarControllerWithDefaultLook];
        }
        NSLog(@"%@",dataArray);
        

    }
    else
    {
        [MyCustomeClass SVProgressMessageDismissWithError:@"Please try again" :2.0];

    }

    NSLog(@"%@",[loginDefault objectForKey:@"UserInfo"]);


}
-(void)gettingFail:(NSString *)error
{
    NSLog(@"%@",error);
    [MyCustomeClass SVProgressMessageDismissWithError:@"Please try again" :2.0];
}










@end
