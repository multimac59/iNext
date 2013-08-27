//
//  ViewController.m
//  iNext
//
//  Created by mithun ravi on 06/08/13.
//  Copyright (c) 2013 mithun ravi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize client;
@synthesize sales;
@synthesize adminButton;
@synthesize supportman;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

-(IBAction)clickOnadminButton:(id)sender
{
    LoginViewController *login=[[LoginViewController alloc]initWithNibName:@"LoginViewController" bundle:nil];
    [login setWhichUserLoginString:@"Admin"];
    [login setRemainingURL:@"Admin_login"];
    [login setUsernameString:@"info@dharmeshsharma.com"];
    [login setPassworString:@"admin"];
    [self.navigationController pushViewController:login animated:YES];

}
-(IBAction)clickOnclientButton:(id)sender;
{
    LoginViewController *login=[[LoginViewController alloc]initWithNibName:@"LoginViewController" bundle:nil];
    [login setRemainingURL:@"Clinet_Login"];
    [login setUsernameString:@"mithunkumarraviios@gmail.com"];
    [login setPassworString:@"mithun"];
    
    [login setWhichUserLoginString:@"Client"];

    [self.navigationController pushViewController:login animated:YES];
    
}
-(IBAction)clickOnsalesButton:(id)sender;
{
    LoginViewController *login=[[LoginViewController alloc]initWithNibName:@"LoginViewController" bundle:nil];
    [login setWhichUserLoginString:@"Salesman"];
    [login setRemainingURL:@"Sale_login"];
    [login setUsernameString:@"mithun@mithun.com"];
    [login setPassworString:@"mithun"];
    [self.navigationController pushViewController:login animated:YES];
    
}
-(IBAction)clickOnsupportmanButton:(id)sender;
{
    LoginViewController *login=[[LoginViewController alloc]initWithNibName:@"LoginViewController" bundle:nil];
    [login setWhichUserLoginString:@"Supportman"];
    [login setRemainingURL:@"technical_login"];
    [login setUsernameString:@"mithun@gmail.com"];
    [login setPassworString:@"mithun"];
    [self.navigationController pushViewController:login animated:YES];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
